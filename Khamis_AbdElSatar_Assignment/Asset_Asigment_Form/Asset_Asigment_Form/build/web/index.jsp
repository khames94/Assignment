<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <script type="text/javascript">
            function movies()
            {
                document.getElementById("SELECT_MOVIES").setAttribute("type", "submit");
                document.getElementById("AllMoviesForm").action = "WebService.jsp";
            }
            function addMovies()
            {
                document.getElementById("ADD_MOVIE").setAttribute("type", "submit");
                document.getElementById("AllMoviesForm").action = "WebService.jsp";
            }
        </script>
    </head>
    <body style="background: url(background.jpg) no-repeat center center fixed; background-size: cover; padding: 0px; margin: 0px; height: 100%;">
        <form id="AllMoviesForm" method=POST action="" target="_self" style="height: 100%;">
            <table style="background: rgba(0,0,0,0.4); height: 100%; width: 100%;">
                <tr align="center">
                    <td colspan="2" align="center" valign="center" style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <h1 style="font-size: 75px">Welcome To Our Web Store "MyMovies"</h1>
                    </td>
                </tr>
                <tr align="center" style="height: 10%;">
                    <td align="center" valign="top">
                        <input type="button" id="SELECT_MOVIES" name="ACTION" value="TOP RATED MOVIES" onclick="movies()" onmouseover="document.getElementById('SELECT_MOVIES').style.background = 'rgba(0,0,0,0.4)';" onmouseout="document.getElementById('SELECT_MOVIES').style.background = 'rgba(0,0,0,0)';" style="background: rgba(0,0,0,0); width: 190px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center" style="height: 10%;">
                    <td align="center" valign="top">
                        <input type="button" id="ADD_MOVIE" name="ACTION" value="ADD MOVIE" onclick="addMovies()" onmouseover="document.getElementById('ADD_MOVIE').style.background = 'rgba(0,0,0,0.4)';" onmouseout="document.getElementById('ADD_MOVIE').style.background = 'rgba(0,0,0,0)';" style="background: rgba(0,0,0,0); width: 180px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center" style="height: 10%;">
                    <td align="center" valign="top">
                        <input type="button" id="ADD_DIRECTOR" name="ACTION" value="ADD DIRECTOR" onclick="window.location = 'addDirector.jsp';" onmouseover="document.getElementById('ADD_DIRECTOR').style.background = 'rgba(0,0,0,0.4)';" onmouseout="document.getElementById('ADD_DIRECTOR').style.background = 'rgba(0,0,0,0)';" style="background: rgba(0,0,0,0); width: 180px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center" style="height: 10%;">
                    <td align="center" valign="top">
                        <input type="button" id="ADD_ACTOR" name="ACTION" value="ADD ACTOR" onclick="window.location = 'addActor.jsp';" onmouseover="document.getElementById('ADD_ACTOR').style.background = 'rgba(0,0,0,0.4)';" onmouseout="document.getElementById('ADD_ACTOR').style.background = 'rgba(0,0,0,0)';" style="background: rgba(0,0,0,0); width: 180px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
