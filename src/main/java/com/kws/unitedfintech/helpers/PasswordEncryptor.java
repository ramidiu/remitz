package com.kws.unitedfintech.helpers;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class PasswordEncryptor {
	
	public static final String key1 = "Bar12345Bar12345";
	public static final String key2 = "tHIsisasECReTKeT";
	
	public static String encrypt(String key1, String key2, String value) {
        try {
            IvParameterSpec iv = new IvParameterSpec(key2.getBytes("UTF-8"));
            SecretKeySpec skeySpec = new SecretKeySpec(key1.getBytes("UTF-8"),"AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
            byte[] encrypted = cipher.doFinal(value.getBytes());
           // System.out.println("encrypted string:"+ Base64.encodeBase64String(encrypted));
            return Base64.getEncoder().encodeToString(encrypted).trim();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
  public static void main(String[] args) {
    	String key1 = "Bar12345Bar12345"; // 128 bit key
        String key2 = "tHIsisasECReTKeT";
        System.out.println(encrypt(key1, key2, "umesh"));
    }
}
