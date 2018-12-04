package object;

public class MovieReview {
	private String reviewText;
	private String name;
	private int rating;
	
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public String getName() {
		return name;
	}
	public void setName(String firstName) {
		this.name = firstName;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
}
