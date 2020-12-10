package com.ishang.doki.utils;

import java.io.UnsupportedEncodingException;

public class EncodingTool {
	public static String encodeStr(String str) {
		try {
			return new String(str.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
