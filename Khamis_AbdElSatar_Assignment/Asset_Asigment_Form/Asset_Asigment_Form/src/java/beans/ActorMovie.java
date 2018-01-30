package beans;

public class ActorMovie
{
    private int actorId;
    private int movieId;

    public ActorMovie()
    {

    }

    public ActorMovie(int actorId, int movieId)
    {
        this.actorId = actorId;
        this.movieId = movieId;
    }

    public int getActorId()
    {
        return actorId;
    }

    public void setActorId(int actorId)
    {
        this.actorId = actorId;
    }

    public int getMovieId()
    {
        return movieId;
    }

    public void setMovieId(int movieId)
    {
        this.movieId = movieId;
    }
}
