package beans;

public class Director
{
    private int directorId;
    private String name;

    public Director()
    {

    }

    public Director(int directorId, String name)
    {
        this.directorId = directorId;
        this.name = name;
    }

    public int getDirectorId()
    {
        return directorId;
    }

    public void setDirectorId(int directorId)
    {
        this.directorId = directorId;
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
