package beans;

import java.sql.Date;

public class Movie
{
    private int movieId;
    private String name;
    private String rating;
    private Date releaseDate;
    private int directorId;

    public Movie()
    {

    }

    public Movie(int movieId, String name, String rating, Date releaseDate, int directorId)
    {
        this.movieId = movieId;
        this.name = name;
        this.rating = rating;
        this.releaseDate = releaseDate;
        this.directorId = directorId;
    }

    public int getMovieId()
    {
        return movieId;
    }

    public void setMovieId(int movieId)
    {
        this.movieId = movieId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getRating()
    {
        return rating;
    }

    public void setRating(String rating)
    {
        this.rating = rating;
    }

    public Date getReleaseDate()
    {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate)
    {
        this.releaseDate = releaseDate;
    }

    public int getDirectorId()
    {
        return directorId;
    }

    public void setDirectorId(int directorId)
    {
        this.directorId = directorId;
    }
}
