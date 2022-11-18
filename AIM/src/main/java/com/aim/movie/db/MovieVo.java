package com.aim.movie.db;

public class MovieVo {
	private String title;
	private double percent;
	private String image;
	
	public MovieVo() {}

	public MovieVo(String title, double percent, String image) {
		super();
		this.title = title;
		this.percent = percent;
		this.image = image;
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
