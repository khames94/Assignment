<%-- 
    Document   : addmovie
    Created on : Jan 27, 2018, 8:46:05 PM
    Author     : khamis
--%>

<%@page import="beans.Actor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="height: 100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Movie</title>
        <script type="text/javascript">
            function onMouseOver(id)
            {
                document.getElementById(id).style.background = 'rgba(0,0,0,0.4)';
            }
            function onMouseOut(id)
            {
                document.getElementById(id).style.background = 'rgba(0,0,0,0.0)';
            }
            function movies()
            {
                document.getElementById("INSERT").setAttribute("type", "submit");
                document.getElementById("Form").action = "WebService.jsp";
            }
        </script>
    </head>
    <body style="background: url(background.jpg) no-repeat center center fixed; background-size: cover; padding: 0px; margin: 0px; height: 100%;">
        <form id="Form" method=POST action="" target="_self" style="height: 100%;">
            <table style="background: rgba(0,0,0,0.4); height: 100%; width: 100%;">
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="text" id="ID" name="ID" placeholder="Movie ID" style="text-align: center; padding-left: 5px; padding-right: 5px; background: rgba(0,0,0,0); width: 300px; height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="text" id="NAME" name="NAME" placeholder="Movie Name" style="text-align: center; padding-left: 5px; padding-right: 5px; background: rgba(0,0,0,0); width: 300px; height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="text" id="RATE" name="RATE" placeholder="Movie Rating" style="text-align: center; padding-left: 5px; padding-right: 5px; background: rgba(0,0,0,0); width: 300px; height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="date" name="DATE" id="DATE" placeholder="Release Date : mm/dd/yyyy" style="text-align: center; padding-left: 17px; background: rgba(0,0,0,0); height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="text" id="DIRECTORID" name="DIRECTORID" placeholder="Director ID" style="text-align: center; padding-left: 5px; padding-right: 5px; background: rgba(0,0,0,0); width: 300px; height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 100%;">
                            <c:forEach items="${sessionScope.Actors}" var="actor">
                                <tr>
                                    <td align="right" valign="middle" style="width: 50%;">
                                        <input type="checkbox" id="${actor.actorId}" name="ACTORSID" value="${actor.actorId}" style="background: rgba(0,0,0,0); border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                                    </td>
                                    <td align="left" valign="middle" style="width: 50%;">
                                        <h3 style="color: white; font-family: 'Andalus'; font-size: large; font-weight: 600;"><c:out value="${actor.name}"/></h3>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
                <tr align="center">
                    <td align="center" valign="top" style="height: 25%;">
                        <input type="button" id="INSERT" name="ACTION" value="INSERT" onclick="movies();" onmouseover="document.getElementById('INSERT').style.background = 'rgba(0,0,0,0.4)';" onmouseout="document.getElementById('INSERT').style.background = 'rgba(0,0,0,0)';" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
