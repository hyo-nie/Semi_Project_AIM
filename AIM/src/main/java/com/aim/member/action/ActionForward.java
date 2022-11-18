package com.aim.member.action;

public class ActionForward {
	private String path;	
	private boolean isRedirect;		
	
	public ActionForward() {
		System.out.println(" 페이지 이동 준비 (티켓준비)");
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() { 
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

}
