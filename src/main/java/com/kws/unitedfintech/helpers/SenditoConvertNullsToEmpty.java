package com.kws.unitedfintech.helpers;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Method;

public class SenditoConvertNullsToEmpty {
	public  final   <T extends Serializable> T convertNullFieldToEmpty(T bean,Class<T> c) {
		T output=null;
		try{
			output=c.newInstance();
			BeanInfo info = Introspector.getBeanInfo(bean.getClass(), Object.class);
		    PropertyDescriptor[] props = info.getPropertyDescriptors();
		    for (PropertyDescriptor pd : props) {
		        //String name = pd.getName();
		        Method getter = pd.getReadMethod();
		        Method setter =pd.getWriteMethod();
		        Class<?> type = pd.getPropertyType();
		        Object value = getter.invoke(bean);
		        if(value==null || value.equals("null")){
		        	if(type.equals(String.class)){
		        		setter.invoke(output, "");
		        	}
		        }else{
		        	setter.invoke(output, value);
		        }
		        //System.out.println(name + " = " + value + "; type = " + type);
		    }
		}catch(Exception e){
			output=null;
			System.out.println("Exception In ConvertNullsToEmpty.convertNullFieldToEmpty()"+e);
		}
		return output;
	}

	
}

