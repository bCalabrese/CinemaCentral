package dao;

import java.util.ArrayList;
import java.util.Random;

import object.Movie;
import object.MovieReview;

public class MovieDao extends AbstractDao {
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

	public static ArrayList<Movie> getMovieSFromFavorites(int memberId) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		ArrayList<Integer> movietemp = new ArrayList<Integer>();

		try {
			connect = getConnection();

			preparedStatement = connect
					.prepareStatement("SELECT" + " favorite.movieID" + " FROM favorite" + " WHERE favorite.memberID=?");

			preparedStatement.setInt(1, memberId);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				movietemp.add(resultSet.getInt(1));
			}
			for (Integer m : movietemp) {
				Movie movie = new Movie();
				movie.setMovieID(m);
				Movie temp = getMovieByID(m);
				movie.setMovieGenre(temp.getMovieGenre());
				movie.setMovieTitle(temp.getMovieTitle());
				movie.setMovieDescription(temp.getMovieDescription());
				movie.setMovieReleaseYear(temp.getMovieReleaseYear());
				movie.setMovieImage(temp.getMovieImage());
				movie.setMovieTrailer(temp.getMovieTrailer());
				movie.setMovieReleaseDate(temp.getMovieReleaseDate());
				movie.setMovieRating(temp.getMovieRating());
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

	public static ArrayList<Movie> getMovieSFromQueue(int memberId) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		ArrayList<Integer> movietemp = new ArrayList<Integer>();

		try {
			connect = getConnection();

			preparedStatement = connect.prepareStatement("SELECT" + " queue.movieID" + " FROM queue"
					+ " WHERE queue.memberID=?" + " ORDER BY queueSequence");

			preparedStatement.setInt(1, memberId);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				movietemp.add(resultSet.getInt(1));
			}
			for (Integer m : movietemp) {
				Movie movie = new Movie();
				movie.setMovieID(m);
				Movie temp = getMovieByID(m);
				movie.setMovieGenre(temp.getMovieGenre());
				movie.setMovieTitle(temp.getMovieTitle());
				movie.setMovieDescription(temp.getMovieDescription());
				movie.setMovieReleaseYear(temp.getMovieReleaseYear());
				movie.setMovieImage(temp.getMovieImage());
				movie.setMovieTrailer(temp.getMovieTrailer());
				movie.setMovieReleaseDate(temp.getMovieReleaseDate());
				movie.setMovieRating(temp.getMovieRating());
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
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT "
			+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased,"
			+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
			+ "FROM movie "
			+ "WHERE movie.movieID = 1 OR movie.movieID = 2 OR movie.movieID = 3 OR movie.movieID = 4 OR movie.movieID = 5; ");			
			
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
		Random rand = new Random();
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT "
			+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased,"
			+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
			+ "FROM movie WHERE movie.movieID = " + rand.nextInt(54)  + " OR movie.movieID = " 
			+ (rand.nextInt(51) + 1) + " OR movie.movieID = " + (rand.nextInt(51) + 1) + " OR movie.movieID = "
			+ (rand.nextInt(51) + 1) + " OR movie.movieID = " + (rand.nextInt(51) + 1)  + " ;");		
			
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
	
	public static ArrayList<Movie> advancedMovieSearch(String title, String actor, int year, String[] genres, String order) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		try {
			StringBuilder statement = new StringBuilder("SELECT DISTINCT "
					+ "movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased, "
					+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating "
					+ "FROM movie "
					+ "INNER JOIN movieperson ON movie.movieID=movieperson.movieID AND movieperson.actor=1 "
					+ "INNER JOIN person ON movieperson.personID=person.personID "
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