<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
</head>
<style>
   footer h1{
   font-family: 'Brush Script MT', cursive; 
   text-align: left;
   padding: 0px 0;
   font-size: 50px;
   color: #FFF;
   }
    footer p{
   
   color: #FFF;
   }
   footer a{
   text-decoration: none;
   color: #FFF;
   }
   footer a:hover{
   color: #6F1C38;
   }
   footer form{
   text-align: left;
   }
	footer{
	 background-color: #990E3C;;
     text-align: center;
    padding: 1em;
    margin-top: auto;
    color: #FFF;
    display: flex; /* Utilizza Flexbox per il layout */
    justify-content: center; /* Allinea i figli al centro rispetto all'asse principale (orizzontalmente) */
   
	}
	.footer-item {
    margin: 0 10px; /* Margine tra gli elementi all'interno del footer */
}
	.footer-item2 {
    margin: 0 350px; /* Margine tra gli elementi all'interno del footer */
}
	  footer input[type="text"] {
            padding: 10px;
            width: 300px;
          
            border-radius: 25px;
            outline: none;
        }
         button {
            padding: 10px 15px;
            background-color: #FFF;
            color: #990E3C;
            border: none;
            border-radius: 25px;
            cursor: pointer;
           
        }
        footer h3{
      font-family: Arial, sans-serif; /* Utilizza il font "Cursive" come prima scelta */
    }
    }
        }
	html{
	height: 100%;
	}
	body {
            margin: 0;
            padding: 0;
            min-height: 100%;
            display: flex;
            flex-direction: column;
        }

</style>
<body>

<footer>    

<div class="footer-item" style="align-items: center;"> 
 <h1 style="margin-top: 0px;">Symposium</h1>
<form action="" method="get" >
	<p text-align= "left">Iscriviti alla Newsletter</p>
                    <input type="text" name="q" placeholder="">
                    <button type="submit">Invia</button>
                </form></div>
  <div class="footer-item2">
        <h3 >ABOUT US</h3>
        <p><a href="privacy.html"> Informativa sulla privacy</a> </p>
        <p><a href="contatti.html">Contatti </a></p>
        <p text-align= "center">&copy;2024 Symposium</p> 
         
    </div>   
    
</footer>
</body>
</html>
