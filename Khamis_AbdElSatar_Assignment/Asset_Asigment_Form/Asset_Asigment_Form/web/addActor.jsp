<%-- 
    Document   : addmovie
    Created on : Jan 27, 2018, 8:46:05 PM
    Author     : khamis
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            function actor()
            {
                document.getElementById("INSERT").setAttribute("type", "submit");
                document.getElementById("Form").action = "WebService.jsp";
            }
        </script>
    </head>
    <body style="background: url(background.jpg) no-repeat center center fixed; background-size: cover; padding: 0px; margin: 0px; height: 100%;">
        <form id="Form" method=POST action="" target="_self" style="height: 100%;">
            <table style="background: rgba(0,0,0,0.4); height: 100%; width: 100%;">
                <tr align="lift">
                    <td align="lift" valign="middle" style="width: 25%; height: 5%; color: white; font-size: larger; font-weight: 600; font-family: 'Andalus';">
                        <input type="button" id="HOME" name="HOME" value="HOME" onclick="window.location = 'index.jsp';" onmouseover="onMouseOver('HOME')" onmouseout="onMouseOut('HOME')" style="background: rgba(0,0,0,0); width: 130px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td> 
                </tr>
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="text" id="ACTRORID" name="ACTORID" placeholder="ACTOR ID" style="text-align: center; padding-left: 5px; padding-right: 5px; background: rgba(0,0,0,0); width: 300px; height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" align="center"  style="color: white; font-family: 'Andalus'; font-size: x-large; font-weight: 600;">
                        <input type="text" id="NAME" name="NAME" placeholder="Actor Name" style="text-align: center; padding-left: 5px; padding-right: 5px; background: rgba(0,0,0,0); width: 300px; height: 50px; border-radius: 30px; border-style: solid; border-color: white; color: white; font-family: 'Andalus'; font-size: medium; font-weight: 600; outline: none;">
                    </td>
                </tr>
                <tr align="center">
                    <td align="center" valign="top" style="height: 25%;">
                        <input type="button" id="INSERT" name="ACTION" value="INSERT_ACTOR" onclick="actor();" onmouseover="document.getElementById('INSERT').style.background = 'rgba(0,0,0,0.4)';" onmouseout="document.getElementById('INSERT').style.background = 'rgba(0,0,0,0)';" style="background: rgba(0,0,0,0); width: 150px; height: 50px; border-radius: 30px; border-style: solid; border-color: greenyellow; color: white; font-family: 'Andalus'; font-size: large; font-weight: 600; outline: none;">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
