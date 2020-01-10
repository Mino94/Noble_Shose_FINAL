package com.spring_mvc.project.member.model;

public class MemberDTO {
	/*
	 * memId, memName, memPassword, memEnabled, memAuthority ,memHp, memZipcode,
	 * memAddress1, memAddress12
	 */

	private String memId;
	private String memName;
	private String memPassword;
	private int memEnabled;
	private String memAuthority;
	private String memHp;
	private String memZipcode;
	private String memAddress1;
	private String memAddress2;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPassword() {
		return memPassword;
	}
	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	public int getMemEnabled() {
		return memEnabled;
	}
	public void setMemEnabled(int memEnabled) {
		this.memEnabled = memEnabled;
	}
	public String getMemAuthority() {
		return memAuthority;
	}
	public void setMemAuthority(String memAuthority) {
		this.memAuthority = memAuthority;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public String getMemZipcode() {
		return memZipcode;
	}
	public void setMemZipcode(String memZipcode) {
		this.memZipcode = memZipcode;
	}
	public String getMemAddress1() {
		return memAddress1;
	}
	public void setMemAddress1(String memAddress1) {
		this.memAddress1 = memAddress1;
	}
	public String getMemAddress2() {
		return memAddress2;
	}
	public void setMemAddress2(String memAddress2) {
		this.memAddress2 = memAddress2;
	}

}
