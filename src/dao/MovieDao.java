package dao;

import java.util.ArrayList;

import object.Movie;

public class MovieDao extends AbstractDao {
	public static Movie getMovieByID(int movieID) {
		Movie movie = null;
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie "
					+ "WHERE movie.movieID = ?");
			preparedStatement.setInt(1, movieID);
			
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				movie = new Movie();
				movie.setMovieID(resultSet.getInt(1));
				movie.setMovieGenre(resultSet.getString(2));
				movie.setMovieTitle(resultSet.getString(3));
				movie.setMovieDescription(resultSet.getString(4));
				movie.setMovieReleaseYear(resultSet.getInt(5));
				movie.setMovieImage(resultSet.getString(6));
				movie.setMovieTrailer(resultSet.getString(7));
				movie.setMovieReleaseDate(resultSet.getDate(8));
				movie.setMovieRating(resultSet.getString(9));
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return movie;
	}
	
	public static ArrayList<Movie> getMoviesByTitle(String title) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie "
					+ "WHERE movie.movieTitle LIKE ?");
					
			String preparedTitle = "%" + title + "%";
			preparedStatement.setString(1, preparedTitle);
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Movie movie = new Movie();
				movie.setMovieID(resultSet.getInt(1));
				movie.setMovieGenre(resultSet.getString(2));
				movie.setMovieTitle(resultSet.getString(3));
				movie.setMovieDescription(resultSet.getString(4));
				movie.setMovieReleaseYear(resultSet.getInt(5));
				movie.setMovieImage(resultSet.getString(6));
				movie.setMovieTrailer(resultSet.getString(7));
				movie.setMovieReleaseDate(resultSet.getDate(8));
				movie.setMovieRating(resultSet.getString(9));
				movies.add(movie);
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return movies;
	}
	
	public static ArrayList<Movie> getMoviesByActor(String actor) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT DISTINCT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie "
					+ "INNER JOIN "
					+ "movieperson ON movie.movieID = movieperson.movieID AND movieperson.actor = 1 "
					+ "INNER JOIN "
					+ "person ON movieperson.personID = person.personID  AND (person.personFirstName LIKE ? OR person.personLastName LIKE ?)");
			
			String preparedActor = "%" + actor + "%";
			
			preparedStatement.setString(1, preparedActor);
			preparedStatement.setString(2, preparedActor);
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Movie movie = new Movie();
				movie.setMovieID(resultSet.getInt(1));
				movie.setMovieGenre(resultSet.getString(2));
				movie.setMovieTitle(resultSet.getString(3));
				movie.setMovieDescription(resultSet.getString(4));
				movie.setMovieReleaseYear(resultSet.getInt(5));
				movie.setMovieImage(resultSet.getString(6));
				movie.setMovieTrailer(resultSet.getString(7));
				movie.setMovieReleaseDate(resultSet.getDate(8));
				movie.setMovieRating(resultSet.getString(9));
				movies.add(movie);
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return movies;
	}
	
	public static ArrayList<Movie> getMoviesByYear(int year) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT"
					+ " movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription,"
					+ " movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating"
					+ " FROM movie WHERE movie.movieYearReleased = ?");
			
			preparedStatement.setInt(1, year);
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Movie movie = new Movie();
				movie.setMovieID(resultSet.getInt(1));
				movie.setMovieGenre(resultSet.getString(2));
				movie.setMovieTitle(resultSet.getString(3));
				movie.setMovieDescription(resultSet.getString(4));
				movie.setMovieReleaseYear(resultSet.getInt(5));
				movie.setMovieImage(resultSet.getString(6));
				movie.setMovieTrailer(resultSet.getString(7));
				movie.setMovieReleaseDate(resultSet.getDate(8));
				movie.setMovieRating(resultSet.getString(9));
				movies.add(movie);
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return movies;
	}
	
	public static boolean isMovieCheckedOut(int memberID, int movieID) {
		boolean checkedOut = false;
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT * FROM checkedout WHERE checkedout.memberID = ? AND checkedout.movieID = ?");
			
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			resultSet = preparedStatement.executeQuery();
			
			checkedOut = resultSet.next();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return checkedOut;
	}
	
	public static void checkOutMovie(int memberID, int movieID) {
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("INSERT INTO checkedout (memberID, movieID) VALUES (?, ?)");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
	}
	
	public static void returnMovie(int memberID, int movieID) {
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("DELETE FROM checkedout WHERE checkedout.memberID = ? AND checkedout.movieID = ?");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
	}
}
