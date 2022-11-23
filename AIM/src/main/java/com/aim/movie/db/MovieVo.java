package com.aim.movie.db;

public class MovieVo {
	private String title;
	private double percent;
	private String image;
	private String content;
	
	public MovieVo() {}

	public MovieVo(String title, double percent, String image, String content) {
		super();
		this.title = title;
		this.percent = percent;
		this.image = image;
		this.content = content;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
}
