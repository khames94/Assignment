package servlets;

import beans.Actor;
import beans.Director;
import beans.Movie;
import controllers.DataController;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebService extends HttpServlet
{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String action = req.getParameter("ACTION");
        HttpSession session = req.getSession();

        if (action.equalsIgnoreCase("SEARCH")) {
            String movieName = req.getParameter("QUERY");
            ArrayList<Movie> movies = DataController.getInstance().searchMovies(movieName);
            session.setAttribute("Movies", movies);
            resp.sendRedirect("movies.jsp");
        } else if (action.equalsIgnoreCase("TOP RATED MOVIES")) {
            ArrayList<Movie> movies = DataController.getInstance().getMovies();
            session.setAttribute("Movies", movies);
            resp.sendRedirect("movies.jsp");
        } else if (action.equalsIgnoreCase("ADD MOVIE")) {
            ArrayList<Actor> actors = DataController.getInstance().getActors();
            session.setAttribute("Actors", actors);
            resp.sendRedirect("addmovie.jsp");
        } else if (action.equalsIgnoreCase("INSERT")) {
            String id = req.getParameter("ID");
            String name = req.getParameter("NAME");
            String rating = req.getParameter("RATE");
            String[] date = req.getParameter("DATE").split("-");
            String day = date[2];
            String month = date[1];
            String year = date[0];
            String directorId = req.getParameter("DIRECTORID");
            String[] actorsIds = req.getParameterValues("ACTORSID");
            DataController.getInstance().addMovie(Integer.parseInt(id), name, rating, new Date(Integer.parseInt(year) - 1900, Integer.parseInt(month), Integer.parseInt(day)), Integer.parseInt(directorId), actorsIds);
            resp.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("INSERT_ACTOR")) {
            String id = req.getParameter("ACTORID");
            String name = req.getParameter("NAME");
            DataController.getInstance().addActor(Integer.parseInt(id), name);
            resp.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("INSERT_DIRECTOR")) {
            String id = req.getParameter("DIRECTORID");
            String name = req.getParameter("NAME");
            DataController.getInstance().addDirector(Integer.parseInt(id), name);
            resp.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("UPDATE")) {
            Movie movie = (Movie) session.getAttribute("Movie");
            String newName = req.getParameter("NAME");
            String newRating = req.getParameter("RATE");
            DataController.getInstance().modifyMovie(movie.getMovieId(), newName, Integer.parseInt(newRating));
            resp.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("DELETE")) {
            Movie movie = (Movie) session.getAttribute("Movie");
            DataController.getInstance().removeMovie(movie.getMovieId());
            resp.sendRedirect("index.jsp");
        } else {
            int movieId = Integer.parseInt(action);
            Movie movie = new Movie();
            Director director = new Director();
            ArrayList<Movie> movies = DataController.getInstance().getMovies();
            ArrayList<Actor> actors = DataController.getInstance().getMovieActors(movieId);
            for (int i = 0; i < movies.size(); i++) {
                if (movies.get(i).getMovieId() == movieId) {
                    movie = movies.get(i);
                    System.out.println(movieId);
                    director = DataController.getInstance().getMovieDirector(movie.getDirectorId());
                    break;
                }
            }
            session.setAttribute("Movie", movie);
            session.setAttribute("Director", director);
            session.setAttribute("Actors", actors);
            resp.sendRedirect("movie.jsp");
        }
    }
}
