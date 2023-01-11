package com.shinsegae.ssgssag.common.util;

import java.security.MessageDigest;

public class EncyrptionUtils {
	public static String encryptSHA256(String pwd) {
		return encrypt(pwd, "SHA-256");
	}
	
	public static String encrypt(String pwd, String messageDigest) {
		try {
			MessageDigest md = MessageDigest.getInstance(messageDigest);
			byte[] pwdBytes = pwd.getBytes();
			md.reset();
			byte[] digested = md.digest(pwdBytes);
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < digested.length; i++)
				sb.append(Integer.toString((digested[i]&0xff) + 0x100, 16).substring(1));
			return sb.toString();
		} catch (Exception e) {
			return pwd;
		}
	}
}
