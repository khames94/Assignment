<%@page import="beans.Movie"%>
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
            function onFocus()
            {
                if (document.getElementById("QUERY").value === " (!) Movie Name is missing")
                {
                    document.getElementById("QUERY").style.color = "rgba(0,0,0,0.6)";
                    document.getElementById("QUERY").value = "";
                }
            }
            function search()
            {
                if (document.getElementById("QUERY").value === "" || document.getElementById("QUERY").value === " (!) Movie Name is missing")
                {
                    document.getElementById("QUERY").style.color = "red";
                    document.getElementById("QUERY").value = " (!) Movie Name is missing";
                    return;
                }
                document.getElementById("SEARCH").setAttribute("type", "submit");
                document.getElementById("Form").action = "WebService.jsp";
            }
            function selectMovie(id)
            {
                document.getElementById(id).setAttribute("type", "submit");
                document.getElementById("Form").action = "WebService.jsp";
            }
        </script>
    </head>
    <body style="background: url(background.jpg) no-repeat center center fixed; background-size: cover; padding: 0px; margin: 0px; height: 100%;">
        <form id="Form" method=POST action="" target="_self" style="height: 100%;">
            <table style="background: rgba(0,0,0,0.4); height: 100%; width: 100%;">
                <tr>
                    <td align="right" valign="middle" style="width: 60%; height: 20%; color: white; font-size: larger; font-weight: 600; font-family: 'Andalus';">
                        <input type="text" id="QUERY" name="QUERY" placeholder="Search" onfocus="onFocus()" autocomplete="off" style="width: 40%; height: 45px; border-radius: 30px; border-style: solid; background: url(search.png) no-repeat scroll 9px 50%; padding-left: 60px; background-color: rgba(200,200,200,0.2); color: white; font-size: medium; font-weight: 600; font-family: 'Andalus';">
                    </td>
                    <td align="left" valign="middle" style="width: 40%; height: 20%; color: white; font-size: larger; font-weight: 600; font-family: 'Andalus';">
                        <input type="button" id="SEARCH" name="ACTION" value="SEARCH" onclick="search()" onmouseover="onMouseOver('SEARCH')" onmouseout="onMouseOut('SEARCH')" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top" colspan="2" style="color: white; font-size: larger; font-weight: 600; font-family: 'Andalus';">
                        <table style="width: 100%;">
                            <tr>
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
                            </tr>
                            <c:forEach items="${sessionScope.Movies}" var="movie">
                                <tr>
                                    <td align="center" valign="middle">
                                        <input type="button" id="${movie.movieId}" name="ACTION" value="${movie.movieId}" onclick="selectMovie(${movie.movieId})" onmouseover="onMouseOver(${movie.movieId})" onmouseout="onMouseOut(${movie.movieId})" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                                    </td>
                                    <td align="center" valign="middle">
                                        <h3><c:out value="${movie.name}"/></h3>
                                    </td>
                                    <td align="center" valign="middle">
                                        <h3><c:out value="${movie.rating}"/></h3>
                                    </td>
                                    <td align="center" valign="middle">
                                        <h3><c:out value="${movie.releaseDate.toString()}"/></h3>
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
