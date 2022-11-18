package com.aim.movie.db;

public class MovieDTO {
	private String movieCd;      //영화코드
	private String movieNm;      //영화이름
	private String openDt;       //개봉날짜
	private String genreNm;      //장르
	private String directors;    //감독
	private String poster;       //포스터
	private int audiAcc;         //총관람객수
	private double bookRating;      //예매율
	private String watchGradeNm; //관람등급
	private String showTm;       //상영시간
	private String actors;       //배우
	private String contents;     //내용(줄거리)
	private int boxrank;		 //박스오피스순위
	
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getOpenDt() {
		return openDt;
	}
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	public String getGenreNm() {
		return genreNm;
	}
	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}
	public String getDirectors() {
		return directors;
	}
	public void setDirectors(String directors) {
		this.directors = directors;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getAudiAcc() {
		return audiAcc;
	}
	public void setAudiAcc(int audiAcc) {
		this.audiAcc = audiAcc;
	}
	public double getBookRating() {
		return bookRating;
	}
	public void setBookRating(double bookRating) {
		this.bookRating = bookRating;
	}
	public String getWatchGradeNm() {
		return watchGradeNm;
	}
	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}
	public String getShowTm() {
		return showTm;
	}
	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getBoxrank() {
		return boxrank;
	}
	public void setBoxrank(int boxrank) {
		this.boxrank = boxrank;
	}
	@Override
	public String toString() {
		return "MovieDTO [movieCd=" + movieCd + ", movieNm=" + movieNm + ", openDt=" + openDt + ", genreNm=" + genreNm
				+ ", directors=" + directors + ", poster=" + poster + ", audiAcc=" + audiAcc + ", bookRating="
				+ bookRating + ", watchGradeNm=" + watchGradeNm + ", showTm=" + showTm + ", actors=" + actors
				+ ", contents=" + contents + ", boxrank=" + boxrank + "]";
	}
}
