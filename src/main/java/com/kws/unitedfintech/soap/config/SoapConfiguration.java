package com.kws.unitedfintech.soap.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;

@Configuration
public class SoapConfiguration {
	@Bean
	public Jaxb2Marshaller getMarshler(){
		Jaxb2Marshaller jaxb2Marshaller=new Jaxb2Marshaller();
		jaxb2Marshaller.setPackagesToScan("com.kws.unitedfintech.soap.bindings");
		return  jaxb2Marshaller;
	}
}
