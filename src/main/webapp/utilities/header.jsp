<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
</head>

<body>
 <style> 
	header{
	background-color: #FFFF;
	padding: 0px 0;
	color: #990E3C;
	}
	  body {
            margin: 0;
            padding: 0;
        }
       form {
            text-align: center;
        }

        input[type="text"] {
            padding: 10px;
            width: 600px;
            border: 2px solid #990E3C;
            border-radius: 25px;
            outline: none;
        }

        button {
            padding: 10px 10px;
            background-color: #990E3C;
            color: #fff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
           
        }

        button:hover {
            background-color: #6F1C38;
        }

</style>
<header>
<div>
<!--  Facciamo una tabella perchè non abbiamo fatto css e quindi non possiamo farlo diversamente -->

 <table width=100%>
        <tr>
            <td align="left"> <!-- qui ci va il logo-->
                 <h3 style="font-family: 'Brush Script MT', cursive; font-size: 50px;"> &nbsp; Symposium</h3>
            </td>
            <td align="center"> <!-- Barra di ricerca -->
                <form action="" method="get">
                    <input type="text" name="q" placeholder="Cerca...">
                    <button type="submit">Cerca</button>
                </form>
            </td>
            <td align="right"> <!-- img di cart e accesso-->
                <span><h2>ACCEDI  &nbsp; CART &nbsp; </h2></span>
                 
            </td>
        </tr>
    </table>
</div>
</header>

<%@ include file="navbar.jsp"%>

</body>
</html>