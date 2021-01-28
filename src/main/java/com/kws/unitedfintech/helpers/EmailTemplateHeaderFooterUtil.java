package com.kws.unitedfintech.helpers;

public class EmailTemplateHeaderFooterUtil {


		public static  String getStaticEmailHeaderContent() {
			return "   <!DOCTYPE html>\r\n" + 
					"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					"  <head>\r\n" + 
					"    <meta charset=\"ISO-8859-1\">\r\n" + 
					"    <title></title>\r\n" + 
					"<style>\r\n" + 
					".footer {"
					+ "\r\n" + 
					"background:  #09093d"+
					"  width: 100%;\r\n" + 
					"  height: 100%;\r\n" +
					"  padding-top: 15px;\r\n" + 
					"  padding-bottom: 15px"
				 + 
					"#card{\r\n" + 
					"  width:100%;\r\n" + 
					"height: 100%;\r\n" + 
					"background-color:#edf7f7;\r\n" + 
					"}\r\n" +
					"#car{\r\n" + 
					"  width:100%;\r\n" + 
					"height: 100%;\r\n" + 
					"background-color: #edf7f7;\r\n" + 
					"}\r\n" +
					"#color{\r\n" + 
					"  background: #09093d;\r\n" + 
					"  color: white;\r\n" + 
					"  padding-top: 9px;\r\n" + 
					"  padding-bottom: 9px;\r\n" + 
					"}\r\n" + 
					"#see{\r\n" + 
					"\r\n" + 
					"  color:#071270;\r\n" + 
					"  text-align: left;\r\n" + 
					"  margin-bottom: 20px;\r\n" + 
					"\r\n" + 
					"}\r\n" + 
					"\r\n" + 
					"p{\r\n" + 
					"  color: grey;\r\n" + 
					"  font-size: 8px\r\n" + 
					"  text-align:left;\r\n" + 
					"\r\n" + 
					"}\r\n" + 
					"</style>\r\n" +
					"</head>";		
			}
		public static  String getStaticEmailBodyStartContent() {
			return "  <body>\r\n" + 
					"    <div class=\"container\">\r\n" + 
					"    <div class=\"row\" >\r\n" + 
					"\r\n" + 
					"    <div class=\"col-sm-2 col-md-2 col-lg-2\">\r\n" + 
					"      <div class=\"card\" id=\"car\">\r\n" + 
					"        <div class=\"card-body\">\r\n" + 
					"        </div>\r\n" + 
					"      </div>\r\n" + 
					"\r\n" + 
					"    </div>\r\n" + 
					"    <div class=\"col-lg-8 col-sm-8 col-md-8\">\r\n" + 
					"      <h3 id=\"color\" style=\"text-align:left\">\r\n" + 
					"      <img src=\"resources/images/logo.png\" width=\"15%;\" height=\"60px;\" style=\"padding-top:15px\"  >  </img>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"      <h3 id=\"see\"> </h3>" 
					;
		}
		public static  String getStaticEmailBodyEndsContent() {
			return "    </div>\r\n" + 
					"      <div class=\"col-lg-2 col-md-2 col-sm-2\" >\r\n" + 
					"\r\n" + 
					"      <div class=\"card\" id=\"card\" >\r\n" + 
					"        <div class=\"card-body\">\r\n" + 
					"\r\n" + 
					"    </div>\r\n" + 
					"    </div>\r\n" + 
					"\r\n" + 
					"  </div><!--row-->\r\n" + 
					"\r\n" + 
					"</div><!--container-->\r\n" + 
					"";
		}
		public static String getStaticEmailFooterContent() {
			return "<div class=\"row\" >\r\n" + 
					"  <div class=\"container\">\r\n" + 
					"    <div class=\"row\">\r\n" + 
					"      <div class=\"col-lg-2 col-md-2 col-sm-2\">\r\n" + 
					"      </div>\r\n" + 
					"    <div class=\"col-lg-8 col-md-8 col-sm-8\" style=\"text-align:center; padding-top:10px;\" >\r\n" + 
					"      <p style=\"color:black;\" class=\"footer\"> 151 Sheffield Road\r\n" + 
					"    Woodhouse Mill Sheffield South Yorkshire,S13 9ZB<br>\r\n" + 
					"    <i class=\"fa fa-phone\"></i>\r\n" + 
					"     +44 1143216310 &nbsp\r\n" + 
					"       <i class=\"fa fa-whatsapp\"></i>   +447459926167</p>\r\n" + 
					"    </div>\r\n" + 
					"    <div class=\"col-lg-2 col-md-2 col-sm-2\"></div>\r\n" + 
					"  </div>\r\n" + 
					"  </div>\r\n" + 
					"</div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"  </body>\r\n" + 
					"</html>"; 
		}					
	}



