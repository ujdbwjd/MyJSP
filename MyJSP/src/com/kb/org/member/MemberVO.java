package com.kb.org.member;

public class MemberVO {
	
	private int seq;
	private String id;
	private String name;
	private String pwd;
	private String gender;
	private String joindate;
	
	public MemberVO() {}
	
	public MemberVO(int seq, String id, String name, String pwd, String gender, String joindate) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.gender = gender;
		this.joindate = joindate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "MemberVO [seq=" + seq + ", id=" + id + ", name=" + name + ", pwd=" + pwd + ", gender=" + gender
				+ ", joindate=" + joindate + "]";
	}
	
}
