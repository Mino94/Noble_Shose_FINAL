package com.spring_mvc.project.member.controller;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JDBCEncryptor {
	
	public static void main(String[] args) {
        StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
        enc.setPassword("abcd1234"); //인코딩 키 (application-config.xml에서 설정했음)
        
        System.out.println(enc.encrypt("oracle.jdbc.driver.OracleDriver"));
        System.out.println(enc.encrypt("jdbc:oracle:thin:@localhost:1521:orcl"));
        System.out.println(enc.encrypt("springproj"));//id
        System.out.println(enc.encrypt("1234"));//pw
	}
	
}

