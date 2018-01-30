package controllers;

import beans.Actor;
import beans.ActorMovie;
import beans.Director;
import beans.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseManger
{
    private Connection connection;
    private Statement statement;

    // singleton implementation
    private static class Loader
    {
        static DatabaseManger INSTANCE = new DatabaseManger();
    }

    public static DatabaseManger getInstance()
    {
        return DatabaseManger.Loader.INSTANCE;
    }

    private DatabaseManger()
    {

    }

    //
    //  ================================================================ //
    //
    // conction manager implementation
    private void connect()
    {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TASK_IMPORT", "TASK_IMPORT");
            connection.setAutoCommit(true);
            statement = connection.createStatement();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseManger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void disconnect()
    {
        try {
            statement.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //
    //  ================================================================ //
    //
    // movies table access implementation
    ArrayList<Movie> selectMovies()
    {
        ArrayList<Movie> movies = new ArrayList();
        try {
            connect();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM MOVIES");
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setMovieId(resultSet.getInt("MOVIEID"));
                movie.setName(resultSet.getString("NAME"));
                movie.setRating(resultSet.getString("RATING"));
                movie.setReleaseDate(resultSet.getDate("RELEASEDATE"));
                movie.setDirectorId(resultSet.getInt("DIRECTORID"));
                movies.add(movie);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return movies;
    }

    ArrayList<Movie> selectMoviesByName(String movieName)
    {
        ArrayList<Movie> movies = new ArrayList();
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM MOVIES WHERE NAME = ?");
            preparedStatement.setString(1, movieName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setMovieId(resultSet.getInt("MOVIEID"));
                movie.setName(resultSet.getString("NAME"));
                movie.setRating(resultSet.getString("RATING"));
                movie.setReleaseDate(resultSet.getDate("RELEASEDATE"));
                movie.setDirectorId(resultSet.getInt("DIRECTORID"));
                movies.add(movie);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return movies;
    }

    boolean insertMovie(Movie movie, String[] actorsIds)
    {
        try {
            connect();
            // insert Movie in Movies Table
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO MOVIES (MOVIEID, NAME, RATING, RELEASEDATE, DIRECTORID) VALUES (?, ?, ?, ?, ?)");
            preparedStatement.setInt(1, movie.getMovieId());
            preparedStatement.setString(2, movie.getName());
            preparedStatement.setString(3, movie.getRating());
            preparedStatement.setDate(4, movie.getReleaseDate());
            preparedStatement.setInt(5, movie.getDirectorId());
            preparedStatement.executeUpdate();
            insertMovieActors(actorsIds, movie.getMovieId());
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    boolean UpdateMovie(int movieId, String movieName, int movieRating)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE MOVIES SET NAME = ? WHERE MOVIEID = ?");
            preparedStatement.setString(1, movieName);
            preparedStatement.setInt(2, movieId);
            preparedStatement.executeUpdate();
            preparedStatement = connection.prepareStatement("UPDATE MOVIES SET RATING = ? WHERE MOVIEID = ?");
            preparedStatement.setInt(1, movieRating);
            preparedStatement.setInt(2, movieId);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    boolean deleteMovie(int movieId)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM MOVIES WHERE MOVIEID = ?");
            preparedStatement.setInt(1, movieId);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    //
    //  ================================================================ //
    //
    // directors table access implementation
    ArrayList<Director> selectDirectors()
    {
        ArrayList<Director> directors = new ArrayList();
        try {
            connect();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM DIRECTORS");
            while (resultSet.next()) {
                Director director = new Director();
                director.setDirectorId(resultSet.getInt("DIRECTORID"));
                director.setName(resultSet.getString("NAME"));
                directors.add(director);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return directors;
    }

    Director selectDirector(int directorId)
    {
        Director director = new Director();
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM DIRECTORS WHERE DIRECTORID = ?");
            preparedStatement.setInt(1, directorId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                director.setDirectorId(resultSet.getInt("DIRECTORID"));
                director.setName(resultSet.getString("NAME"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return director;
    }

    boolean insertDirector(Director director)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO DIRECTORS (DIRECTORID, NAME) VALUES (?, ?)");
            preparedStatement.setInt(1, director.getDirectorId());
            preparedStatement.setString(2, director.getName());
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    boolean deleteDirector(int directorId)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM DIRECTORS WHERE DIRECTORID = ?");
            preparedStatement.setInt(1, directorId);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    //
    //  ================================================================ //
    //
    // actors table access implementation
    ArrayList<Actor> selectActors()
    {
        ArrayList<Actor> actors = new ArrayList();
        try {
            connect();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM ACTORS");
            while (resultSet.next()) {
                Actor actor = new Actor();
                actor.setActorId(resultSet.getInt("ACTORID"));
                actor.setName(resultSet.getString("NAME"));
                actors.add(actor);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return actors;
    }

    boolean insertActor(Actor actor)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO ACTORS (ACTORID, NAME) VALUES (?, ?)");
            preparedStatement.setInt(1, actor.getActorId());
            preparedStatement.setString(2, actor.getName());
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    boolean deleteActor(int actorId)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM ACTORS WHERE ACTORID = ?");
            preparedStatement.setInt(1, actorId);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    //
    //  ================================================================ //
    //
    // actor movies table access implementation
    ArrayList<ActorMovie> selectMovieActors(int movieId)
    {
        ArrayList<ActorMovie> actors = new ArrayList();
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM ACTORMOVIES WHERE MOVIE_MOVIEID = ?");
            preparedStatement.setInt(1, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ActorMovie actor = new ActorMovie();
                actor.setActorId(resultSet.getInt("ACTOR_ACTORID"));
                actor.setMovieId(resultSet.getInt("MOVIE_MOVIEID"));
                actors.add(actor);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return actors;
    }

    boolean insertMovieActors(String[] actorsIds, int movieId)
    {
        try {
            connect();
            for (int i = 0; i < actorsIds.length; i++) {
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO ACTORMOVIES (ACTOR_ACTORID, MOVIE_MOVIEID) VALUES (?, ?)");
                preparedStatement.setInt(1, Integer.parseInt(actorsIds[i]));
                preparedStatement.setInt(2, movieId);
                preparedStatement.executeUpdate();
            }
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }

    boolean deleteMovieActors(int movieId)
    {
        try {
            connect();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM ACTORMOVIES WHERE MOVIE_MOVIEID = ?");
            preparedStatement.setInt(1, movieId);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
    }
}
