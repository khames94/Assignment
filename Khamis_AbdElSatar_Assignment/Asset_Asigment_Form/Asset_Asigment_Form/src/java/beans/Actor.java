package beans;

public class Actor
{
    private int actorId;
    private String name;

    public Actor()
    {

    }

    public Actor(int actorId, String name)
    {
        this.actorId = actorId;
        this.name = name;
    }

    public int getActorId()
    {
        return actorId;
    }

    public void setActorId(int actorId)
    {
        this.actorId = actorId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }
}
