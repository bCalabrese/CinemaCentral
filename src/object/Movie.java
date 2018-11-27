package object;

import java.util.Date;

public class Movie {
	private int movieID;
	private String movieGenre;
	private String movieTitle;
	private String movieDescription;
	private int movieReleaseYear;
	private String movieImage;
	private String movieTrailer;
	private Date movieReleaseDate;
	private String movieRating;
	
	public boolean equals(Object movie) {
		return (this.movieID == ((Movie)movie).movieID);
	}
	
	public int hashCode() {
		int result = 17;
		result = 31 * result + movieID;
		return result;
	}
	
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieDescription() {
		return movieDescription;
	}
	public void setMovieDescription(String movieDescription) {
		this.movieDescription = movieDescription;
	}
	public int getMovieReleaseYear() {
		return movieReleaseYear;
	}
	public void setMovieReleaseYear(int movieReleaseYear) {
		this.movieReleaseYear = movieReleaseYear;
	}
	public String getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}
	public String getMovieTrailer() {
		return movieTrailer;
	}
	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}
	public Date getMovieReleaseDate() {
		return movieReleaseDate;
	}
	public void setMovieReleaseDate(Date movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}
	public String getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}
}
