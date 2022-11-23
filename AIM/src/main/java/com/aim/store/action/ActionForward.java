package com.aim.store.action;

public class ActionForward {
	// 이동 티켓! 이동할 때 필요한 경로와 방법을 저장함
	private String path;
	private boolean isRedirect;
	
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
