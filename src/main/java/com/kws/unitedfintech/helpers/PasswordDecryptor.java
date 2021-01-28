package com.kws.unitedfintech.helpers;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class PasswordDecryptor {
	
	public static final String key1 = "Bar12345Bar12345";
	public static final String key2 = "tHIsisasECReTKeT";
	

	public static String decrypt(String key1, String key2, String encrypted) {
        try {
            IvParameterSpec iv = new IvParameterSpec(key2.getBytes("UTF-8"));

            SecretKeySpec skeySpec = new SecretKeySpec(key1.getBytes("UTF-8"),"AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            byte[] original = cipher.doFinal(Base64.getDecoder().decode(encrypted));

            return new String(original).trim();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
//    	String key1 = "Bar12345Bar12345"; // 128 bit key
//        String key2 = "tHIsisasECReTKeT";
//        System.out.println(decrypt(key1, key2,"v7v3h3N7TjDKQoY6XqRung=="));
    }
}
