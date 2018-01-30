package controllers;

import beans.Actor;
import beans.ActorMovie;
import beans.Director;
import beans.Movie;
import java.sql.Date;
import java.util.ArrayList;

public class DataController
{
    // singleton implementation
    private static class Loader
    {
        static DataController INSTANCE = new DataController();
    }

    public static DataController getInstance()
    {
        return Loader.INSTANCE;
    }

    private DataController()
    {

    }

    //
    //  ================================================================ //
    //
    // movies controller methods    
    public ArrayList<Movie> getMovies()
    {
        ArrayList<Movie> movies = DatabaseManger.getInstance().selectMovies();
        return movies;
    }

    public ArrayList<Movie> searchMovies(String movieName)
    {
        ArrayList<Movie> movies = DatabaseManger.getInstance().selectMoviesByName(movieName);
        return movies;
    }

    public boolean addMovie(int movieId, String movieName, String movieRating, Date movieDate, int directorId, String[] actorsIds)
    {
        return DatabaseManger.getInstance().insertMovie(new Movie(movieId, movieName, movieRating, movieDate, directorId), actorsIds);
    }

    public boolean modifyMovie(int movieId, String movieName, int movieRating)
    {
        return DatabaseManger.getInstance().UpdateMovie(movieId, movieName, movieRating);
    }

    public boolean removeMovie(int movieId)
    {
        return DatabaseManger.getInstance().deleteMovie(movieId);
    }

    //
    //  ================================================================ //
    //
    // directors controller methods
    public ArrayList<Director> getDirectors()
    {
        ArrayList<Director> directors = DatabaseManger.getInstance().selectDirectors();
        return directors;
    }

    public Director getMovieDirector(int directorId)
    {
        Director director = DatabaseManger.getInstance().selectDirector(directorId);
        return director;
    }

    public boolean addDirector(int directorId, String directorName)
    {
        return DatabaseManger.getInstance().insertDirector(new Director(directorId, directorName));
    }

    public boolean removeDirector(int directorId)
    {
        return DatabaseManger.getInstance().deleteDirector(directorId);
    }

    //
    //  ================================================================ //
    //
    // actors controller methods
    public ArrayList<Actor> getActors()
    {
        ArrayList<Actor> actors = DatabaseManger.getInstance().selectActors();
        return actors;
    }

    public boolean addActor(int actorId, String actorName)
    {
        return DatabaseManger.getInstance().insertActor(new Actor(actorId, actorName));
    }

    public boolean removeActor(int actorId)
    {
        return DatabaseManger.getInstance().deleteActor(actorId);
    }

    //
    //  ================================================================ //
    //
    // movie actors controller methods
    public ArrayList<Actor> getMovieActors(int movieId)
    {
        ArrayList<Actor> actors = new ArrayList();
        ArrayList<Actor> allActors = getActors();
        ArrayList<ActorMovie> movieActors = DatabaseManger.getInstance().selectMovieActors(movieId);
        for (int i = 0; i < allActors.size(); i++) {
            for (int j = 0; j < movieActors.size(); j++) {
                if (allActors.get(i).getActorId() == movieActors.get(j).getActorId()) {
                    actors.add(allActors.get(i));
                    break;
                }
            }
        }
        return actors;
    }

    public boolean removeMovieActors(int movieId)
    {
        return DatabaseManger.getInstance().deleteMovieActors(movieId);
    }

}
