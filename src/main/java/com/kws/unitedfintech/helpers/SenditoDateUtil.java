package com.kws.unitedfintech.helpers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class SenditoDateUtil {
	public static final String DAY="DAY";
	public static final String MONTH="MONTH";
	public static final String YEAR="YEAR";
	
	public static void main(String k[]){
		@SuppressWarnings("unused")
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}
	
	public static String timeNow(DateFormat dateFormat,TimeZone timeZone){
		String timeNow=null;
		if(dateFormat!=null && timeZone!=null){
			Date now = new Date();
			dateFormat.setTimeZone(timeZone);
			timeNow = dateFormat.format(now);
		}
		return timeNow;
	}
	
	public static String getDateAfter(String dateFormat,TimeZone timeZone,String dateConst,int amount){
		String date=null;
		
		if(dateFormat!=null && timeZone!=null){
			DateFormat df1=new SimpleDateFormat(dateFormat);
			df1.setTimeZone(timeZone);
			Calendar c=Calendar.getInstance();
			
			if(DAY.equals(dateConst)){
				c.add(Calendar.DAY_OF_MONTH, amount);
			}else if(MONTH.equals(dateConst)){
				c.add(Calendar.MONTH, amount);
			}else if(YEAR.equals(dateConst)){
				c.add(Calendar.YEAR, amount);
			}
			date=df1.format(c.getTime());
		}
		return date;
	}
	
	public static String getDateAfterFromDate(String fromDate, String dateFormat,TimeZone timeZone,String dateConst,int amount){
		String date=null;
		
		if(dateFormat!=null && timeZone!=null){
			DateFormat df1 = new SimpleDateFormat(dateFormat);
			df1.setTimeZone(timeZone);
			
			Calendar c=Calendar.getInstance();
			try {
				c.setTime(df1.parse(fromDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if(DAY.equals(dateConst)){
				c.add(Calendar.DAY_OF_MONTH, amount);
			}else if(MONTH.equals(dateConst)){
				c.add(Calendar.MONTH, amount);
			}else if(YEAR.equals(dateConst)){
				c.add(Calendar.YEAR, amount);
			}
			date=df1.format(c.getTime());
		}
		return date;
	}
	
	public static String[] getThisFinancialYearDate(TimeZone zone){
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		df.setTimeZone(zone);
		String dates[]=new String[2];
		String minDate="";
		String maxDate="";
		
		Calendar c = Calendar.getInstance(zone);
		if(Calendar.MONTH >= Calendar.JANUARY && Calendar.MONTH<Calendar.APRIL){
			c.add(Calendar.YEAR, -1);
		}
		c.set(Calendar.MONTH, Calendar.APRIL);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
		minDate=df.format(c.getTime());
		
		c.add(Calendar.YEAR, 1);
		c.set(Calendar.MONTH, Calendar.MARCH);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		maxDate=df.format(c.getTime());
		
		dates[0] = minDate+" 00:00:00";
		dates[1] = maxDate+" 23:59:59";
		return dates;
	}
	
	/**
	 * @author Aditya Raj
	 * @param date which you want to change in diffrent format
	 * @param currentDateFormat 
	 * @param expectedDateFormat
	 * @return date in expected date format
	 * @throws ParseException
	 */
	public static String convertDateFormat(String date,String currentDateFormat,String expectedDateFormat) throws ParseException{
		String displayDate=null;
		if(date!=null && currentDateFormat!=null && expectedDateFormat!=null){
			DateFormat cdFormat=new SimpleDateFormat(currentDateFormat);
			DateFormat exFormat=new SimpleDateFormat(expectedDateFormat);
			displayDate=exFormat.format(cdFormat.parse(date));
		}
		return displayDate;
	}
	
	public static String[] getThisMonthDate(DateFormat dateFormat,TimeZone zone) 
	{
		String displayDate[]=new String[2];
		Calendar now=Calendar.getInstance();
		now.set(Calendar.DAY_OF_MONTH, now.getActualMinimum(Calendar.DAY_OF_MONTH));
		now.set(Calendar.HOUR_OF_DAY, now.getActualMinimum(Calendar.HOUR_OF_DAY));
		now.set(Calendar.MINUTE, now.getActualMinimum(Calendar.MINUTE));
		now.set(Calendar.SECOND, now.getActualMinimum(Calendar.SECOND));
		displayDate[0]=dateFormat.format(now.getTime());
		displayDate[1]=timeNow(dateFormat, zone);
		return displayDate;
	}
	
	public static boolean isSameDay(String date,String dateFormat,TimeZone zone){
		boolean sameDay=false;
		try{
		DateFormat format=new SimpleDateFormat(dateFormat);
		format.setTimeZone(zone);
		
		Calendar cal1 = Calendar.getInstance(zone);
		Calendar cal2 = Calendar.getInstance(zone);
		cal2.setTime(format.parse(date));
		sameDay = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
		}catch(Exception e){
		}
		return sameDay;
	}
	
	public static boolean isExpired(String date,String dateFormat,TimeZone zone,int validityHour)
	{
		boolean flag=false;
		try{
		DateFormat format=new SimpleDateFormat(dateFormat);
		format.setTimeZone(zone);
		Calendar maxDate=Calendar.getInstance(zone);
			maxDate.add(Calendar.HOUR_OF_DAY, -validityHour);
			//System.out.println(format.format(maxDate.getTime()));
			//System.out.println(date);
			if(format.parse(date).before(maxDate.getTime())){
				flag=true;
			}else{
				flag=false;
			}
		}catch(Exception e){
		}
		return flag;
	}
	
	public static int differenceBetweenTwoDays(String dateFormat, String maxDate, String minDate, TimeZone zone){
		
		SimpleDateFormat sdf1 = new SimpleDateFormat(dateFormat);
		sdf1.setTimeZone(zone);
		Date date1 = null;
		Date date2 = null;
		
		int result = 0 ;
			try {
				date1 = sdf1.parse(maxDate);
				date2 = sdf1.parse(minDate);
				
				result = (int) (( date1.getTime() - date2.getTime() ) / (1000 * 60 * 60 * 24));
				if(( date1.getTime() - date2.getTime() ) % (1000 * 60 * 60 * 24) != 0){
					result = result + 1;
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		
		return result;
	}
	
	@SuppressWarnings("deprecation")
	public static int diffBtwnTwoDays(String maxDate, String minDate, TimeZone zone) {

		int result = 0;
		SimpleDateFormat myFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		myFormat1.setTimeZone(zone);
		SimpleDateFormat myFormat2 = new SimpleDateFormat("HH:mm:ss");
		myFormat2.setTimeZone(zone);
		try {
			Date date1 = myFormat1.parse(minDate.split(" ")[0]);
			Date date2 = myFormat1.parse(maxDate.split(" ")[0]);

			result = (int) ((date2.getTime() - date1.getTime()) / (1000 * 60 * 60 * 24));
	        if(minDate.split(" ")[1]!=null && !minDate.split(" ")[1].trim().equals("")){
	        	Date time1 = myFormat2.parse(minDate.split(" ")[1]);
				Date time2 = myFormat2.parse(maxDate.split(" ")[1]);
				
		        int hoursDiff = time2.getHours()-time1.getHours();
		        if(hoursDiff>0){
		        	result+=1;
		        }
	        }
	        /*System.out.println("Number of Days between dates: "+result);*/
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}

}

