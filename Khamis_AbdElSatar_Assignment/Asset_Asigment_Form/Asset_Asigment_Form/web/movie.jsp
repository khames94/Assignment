<%@page import="beans.Movie"%>
<%@page import="beans.Actor"%>
<%@page import="beans.Director"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="height: 100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
        <script type="text/javascript">
            function onMouseOver(id)
            {
                document.getElementById(id).style.background = 'rgba(0,0,0,0.4)';
            }
            function onMouseOut(id)
            {
                document.getElementById(id).style.background = 'rgba(0,0,0,0.0)';
            }
            function onFocus(id)
            {
                if (document.getElementById(id).value === " (!) missing")
                {
                    document.getElementById(id).style.color = "rgba(0,0,0,0.6)";
                    document.getElementById(id).value = "";
                }
            }
            function updateMovie()
            {
                if (document.getElementById("NAME").value === "" || document.getElementById("NAME").value === " (!) missing")
                {
                    document.getElementById("NAME").style.color = "red";
                    document.getElementById("NAME").value = " (!) missing";
                    return;
                }
                if (document.getElementById("RATE").value === "" || document.getElementById("RATE").value === " (!) missing")
                {
                    document.getElementById("RATE").style.color = "red";
                    document.getElementById("RATE").value = " (!) missing";
                    return;
                }
                document.getElementById("UPDATE").setAttribute("type", "submit");
                document.getElementById("Form").action = "WebService.jsp";
            }
            function deleteMovie()
            {
                document.getElementById("DELETE").setAttribute("type", "submit");
                document.getElementById("Form").action = "WebService.jsp";
            }
        </script>
    </head>
    <body style="background: url(background.jpg) no-repeat center center fixed; background-size: cover; padding: 0px; margin: 0px; height: 100%;">
        <form id="Form" method=POST action="" target="_self" style="height: 100%;">
            <table style="background: rgba(0,0,0,0.4); height: 100%; width: 100%; color: white; font-size: larger; font-weight: 600; font-family: 'Andalus';">
                <tr style="height: 20%;">
                    <td align="center" valign="middle"/>
                    <td align="center" valign="middle">
                        <input type="button" id="UPDATE" name="ACTION" value="UPDATE" onclick="updateMovie()" onmouseover="onMouseOver('UPDATE')" onmouseout="onMouseOut('UPDATE')" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                    <td align="center" valign="middle">
                        <input type="button" id="HOME" name="HOME" value="HOME" onclick="window.location = 'index.jsp';" onmouseover="onMouseOver('HOME')" onmouseout="onMouseOut('HOME')" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                    <td align="center" valign="middle">
                        <input type="button" id="DELETE" name="ACTION" value="DELETE" onclick="deleteMovie()" onmouseover="onMouseOver('DELETE')" onmouseout="onMouseOut('DELETE')" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                    <td align="center" valign="middle"/>
                </tr>
                <tr style="height: 10%;">
                    <td align="center" valign="middle">
                        <h3>ID</h3>
                    </td>
                    <td align="center" valign="middle">
                        <h3>Movie</h3>
                    </td>
                    <td align="center" valign="middle">
                        <h3>Rate</h3>
                    </td>
                    <td align="center" valign="middle">
                        <h3>Date</h3>
                    </td>
                    <td align="center" valign="middle">
                        <h3>Director</h3>
                    </td>
                </tr>
                <tr  style="height: 10%;">
                    <td align="center" valign="middle">
                        <h3><c:out value="${sessionScope.Movie.movieId}"/></h3>
                    </td>
                    <td align="center" valign="middle">
                        <input type="text" id="NAME" name="NAME" placeholder="Name" value="${sessionScope.Movie.name}" onfocus="onFocus('NAME')" autocomplete="off" style="text-align: center; padding: 5px; width: 30%; height: 40px; border-radius: 30px; border-style: solid; background-color: rgba(200,200,200,0.2); color: white; font-size: medium; font-weight: 600; font-family: 'Andalus';">
                    </td>
                    <td align="center" valign="middle">
                        <input type="text" id="RATE" name="RATE" placeholder="Rate" value="${sessionScope.Movie.rating}" onfocus="onFocus('RATE')" autocomplete="off" style="text-align: center; padding: 5px; width: 30%; height: 40px; border-radius: 30px; border-style: solid; background-color: rgba(200,200,200,0.2); color: white; font-size: medium; font-weight: 600; font-family: 'Andalus';">
                    </td>
                    <td align="center" valign="middle">
                        <h3><c:out value="${sessionScope.Movie.releaseDate.toString()}"/></h3>
                    </td>
                    <td align="center" valign="middle">
                        <h3><c:out value="${sessionScope.Director.name}"/></h3>
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="middle" colspan="5">
                        <table style="width: 100%;">
                            <c:forEach items="${sessionScope.Actors}" var="actor">
                                <tr>
                                    <td align="right" valign="middle" style="width: 50%;">
                                        <h3>Actor : </h3>
                                    </td>
                                    <td align="left" valign="middle" style="width: 50%;">
                                        <h3><c:out value="${actor.name}"/></h3>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>