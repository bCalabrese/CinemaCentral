package dao;

import java.util.ArrayList;
import java.util.Random;

import object.Movie;
import object.MovieReview;

public class MovieDao extends AbstractDao {
	//public static ArrayList<Integer> featuredMovies = new ArrayList<Integer>();
	
	public static Movie getMovieByID(int movieID) {
		Movie movie = null;
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie " + "WHERE movie.movieID = ?");
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
		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
					+ "FROM movie " + "WHERE movie.movieTitle LIKE ?");

			String preparedTitle = "%" + title + "%";
			preparedStatement.setString(1, preparedTitle);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
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
		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
					+ "FROM movie " + "INNER JOIN "
					+ "movieperson ON movie.movieID = movieperson.movieID AND movieperson.actor = 1 " + "INNER JOIN "
					+ "person ON movieperson.personID = person.personID  AND (person.personFirstName LIKE ? OR person.personLastName LIKE ?)");

			String preparedActor = "%" + actor + "%";

			preparedStatement.setString(1, preparedActor);
			preparedStatement.setString(2, preparedActor);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
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
		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
			while (resultSet.next()) {
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
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return movies;
	}

	public static boolean isMovieCheckedOut(int memberID, int movieID) {
		boolean checkedOut = false;
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement(
					"SELECT * FROM checkedout WHERE checkedout.memberID = ? AND checkedout.movieID = ?");

			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			resultSet = preparedStatement.executeQuery();

			checkedOut = resultSet.next();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
			close();
			if (!MovieDao.hasUserViewedMovie(memberID, movieID)) {
				connect = getConnection();
				preparedStatement = connect
						.prepareStatement("INSERT INTO viewedmovies (memberID, movieID) VALUES (?, ?)");
				preparedStatement.setInt(1, memberID);
				preparedStatement.setInt(2, movieID);
				preparedStatement.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}

	public static void returnMovie(int memberID, int movieID) {
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement(
					"DELETE FROM checkedout WHERE checkedout.memberID = ? AND checkedout.movieID = ?");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}

	public static int numCheckedOutMovies(int memberID) {
		int count = 0;
		try {
			connect = getConnection();

			preparedStatement = connect
					.prepareStatement("SELECT COUNT(*) FROM checkedout WHERE checkedout.memberID = ?");
			preparedStatement.setInt(1, memberID);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return count;
	}

	public static ArrayList<Movie> getMoviesFromFavorites(int memberId) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie " 
					+ "LEFT JOIN favorite ON favorite.movieID = movie.movieID "
					+ "WHERE favorite.memberID = ?");

			preparedStatement.setInt(1, memberId);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
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
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return movies;
	}

	public static String getDirectorByID(int movieID) {
		String director = "";
		try {
			connect = getConnection();

			preparedStatement = connect
					.prepareStatement("SELECT person.personFirstName, person.personLastName FROM movieperson "
							+ "INNER JOIN person ON movieperson.personID = person.personID "
							+ "WHERE movieperson.movieID = ? AND movieperson.director = 1;");
			preparedStatement.setInt(1, movieID);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				director = resultSet.getString(1) + " " + resultSet.getString(2);
			} else {
				director = "Unknown";
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return director;
	}

	public static ArrayList<Movie> getMoviesFromQueue(int memberId) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie " 
					+ "LEFT JOIN queue ON queue.movieID = movie.movieID "
					+ "WHERE queue.memberID = ?"
					+ " ORDER BY queue.queueSequence");

			preparedStatement.setInt(1, memberId);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
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
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return movies;
	}

	public static ArrayList<MovieReview> getReviewsByMovie(int movieID) {
		ArrayList<MovieReview> reviews = new ArrayList<MovieReview>();
		try {
			connect = getConnection();
			preparedStatement = connect
					.prepareStatement("SELECT member.userName, moviereview.rating, moviereview.reviewText "
							+ "FROM moviereview " + "INNER JOIN member ON member.memberID = moviereview.memberID "
							+ "WHERE moviereview.movieID = ?;");
			preparedStatement.setInt(1, movieID);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				MovieReview review = new MovieReview();
				review.setReviewText(resultSet.getString(3));
				review.setRating(resultSet.getInt(2));
				review.setName(resultSet.getString(1));
				reviews.add(review);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return reviews;
	}

	public static String getActorsByID(int movieID) {
		String actors = "";
		try {
			connect = getConnection();

			preparedStatement = connect
					.prepareStatement("SELECT person.personFirstName, person.personLastName FROM movieperson "
							+ "INNER JOIN person ON movieperson.personID = person.personID "
							+ "WHERE movieperson.movieID = ? AND movieperson.actor = 1;");
			preparedStatement.setInt(1, movieID);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				actors = resultSet.getString(1) + " " + resultSet.getString(2);
			} else {
				actors = "Unknown";
			}

			while (resultSet.next()) {
				actors += ", " + resultSet.getString(1) + " " + resultSet.getString(2);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return actors;
	}

	public static boolean hasUserViewedMovie(int memberID, int movieID) {
		boolean hasViewed = false;
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement(
					"SELECT * FROM viewedmovies WHERE viewedmovies.memberID = ? AND viewedmovies.movieID = ?");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				hasViewed = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return hasViewed;
	}

	public static ArrayList<Movie> getFeaturedMovies() {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		Movie m = new Movie();
		m.setFeaturedMovies(11, 43, 51, 2, 4);

		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased,"
					+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie WHERE movie.movieID = " + m.getFeaturedMovies().get(0)  + " OR movie.movieID = " 
					+ m.getFeaturedMovies().get(1) + " OR movie.movieID = " + m.getFeaturedMovies().get(2) + " OR movie.movieID = "
					+ m.getFeaturedMovies().get(3) + " OR movie.movieID = " + m.getFeaturedMovies().get(4)  + " ;");		
			
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
	
	public static ArrayList<Movie> getRecommendedMovies() {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		Movie m = new Movie();
		m.setRecommendedMovies(1, 14, 40, 27, 34);
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT "
			+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased,"
			+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
			+ "FROM movie WHERE movie.movieID = " + m.getRecommenedMovies().get(0)  + " OR movie.movieID = " 
			+ m.getRecommenedMovies().get(1) + " OR movie.movieID = " + m.getRecommenedMovies().get(2) + " OR movie.movieID = "
			+ m.getRecommenedMovies().get(3) + " OR movie.movieID = " + m.getRecommenedMovies().get(4)  + " ;");		
			
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
	
	public static boolean isMovieinQueue(int memberID, int movieID) {
		boolean inQueue = false;
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement(
					"SELECT * FROM queue WHERE queue.memberID = ? AND queue.movieID = ?");

			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			resultSet = preparedStatement.executeQuery();

			inQueue = resultSet.next();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return inQueue;
	}
	
	public static void addToQueue(int memberID, int movieID, String moviename) {
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("INSERT INTO `queue` (`memberID`,`movieID`,`movieTitle`) VALUES (?,?,?)");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.setString(3, moviename);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}

	public static void removeFromQueue(int memberID, int movieID) {
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement(
					"DELETE FROM queue WHERE queue.memberID = ? AND queue.movieID = ?");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}
	
	public static boolean isMovieinFavorites(int memberID, int movieID) {
		boolean inFavorites = false;
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement(
					"SELECT * FROM favorite WHERE favorite.memberID = ? AND favorite.movieID = ?");

			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			resultSet = preparedStatement.executeQuery();

			inFavorites = resultSet.next();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return inFavorites;
	}
	
	public static void addToFavorites(int memberID, int movieID) {
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("INSERT INTO `favorite` (`memberID`,`movieID`) VALUES (?,?)");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}

	public static void removeFromFavorites(int memberID, int movieID) {
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement(
					"DELETE FROM favorite WHERE favorite.memberID = ? AND favorite.movieID = ?");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}
	public static ArrayList<Movie> getMoviesFromCheckout(int memberId) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("SELECT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, "
					+ "movie.movieYearReleased, movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie " 
					+ "LEFT JOIN checkedout ON checkedout.movieID = movie.movieID "
					+ "WHERE checkedout.memberID = ?");

			preparedStatement.setInt(1, memberId);
			
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
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
	
	public static ArrayList<Movie> advancedMovieSearch(String title, String actor, int year, String[] genres, String order) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			StringBuilder statement = new StringBuilder("SELECT DISTINCT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased, "
					+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie "
					+ "LEFT JOIN movieperson ON movie.movieID=movieperson.movieID AND movieperson.actor=1 "
					+ "LEFT JOIN person ON movieperson.personID=person.personID "
					+ "WHERE movie.movieTitle LIKE ? ");
			
			if (actor != null && !actor.isEmpty()) {
				statement.append("AND (person.personFirstName LIKE ? OR person.personLastName LIKE ?) ");
			}
			
			if (year != 0) {
				statement.append("AND movie.movieYearReleased = ? ");
			}
			
			if (genres != null && genres.length != 0) {
				statement.append("AND (");
				boolean first = true;
				for (String genre : genres) {
					if (first) {
						statement.append("movie.movieGenre LIKE ? ");
						first = false;
					}
					else {
						statement.append(" OR movie.movieGenre LIKE ? ");
					}
				}
				statement.append(") ");
			}
			
			if (order != null) {
				statement.append("ORDER BY " + order + " ASC");
			}
			statement.append(";");
			
			
			connect = getConnection();
			preparedStatement = connect.prepareStatement(statement.toString());
			
			int index = 1;
			preparedStatement.setString(index, "%"+title+"%");
			index++;
			
			if (actor != null && !actor.isEmpty()) {
				preparedStatement.setString(index, "%"+actor+"%");
				index++;
				preparedStatement.setString(index, "%"+actor+"%");
				index++;
			}
			
			if (year != 0) {
				preparedStatement.setInt(index, year);
				index++;
			}
			
			if (genres != null && genres.length != 0) {
				for (String genre : genres) {
					preparedStatement.setString(index, genre);
					index++;
				}
			}
			
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
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
}