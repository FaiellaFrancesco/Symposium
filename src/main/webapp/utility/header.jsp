<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>

<body>
<style> 
	header{
	background-color: #990E3C;
	padding: 10px 0;
	color: #fff;
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
            width: 300px;
            border: none;
            border-radius: 25px;
        }

        button {
            padding: 10px 10px;
            background-color: #6F1C38;
            color: #fff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
           
        }

        button:hover {
            background-color: #441D2A;
        }

</style>
<header>
<div>
<!--  Facciamo una tabella perchè non abbiamo fatto css e quindi non possiamo farlo diversamente -->

 <table width=100%>
        <tr>
            <td align="left"> <!-- qui ci va il logo-->
                 LOGO
            </td>
            <td align="center"> <!-- Barra di ricerca -->
                <form action="" method="get">
                    <input type="text" name="q" placeholder="Cerca...">
                    <button type="submit">Cerca</button>
                </form>
            </td>
            <td align="right"> <!-- img di cart e accesso-->
                <span>ACCEDI</span>
                <span> CART</span>
            </td>
        </tr>
    </table>
</div>
</header>

<%@ include file="navbar.jsp"%>
</body>
</html>