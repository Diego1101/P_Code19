<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dflClSesion.aspx.cs" Inherits="dflClSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>En breve sera redirigido a la pagina principal</h1><br />
        <h2>Si no es asi dar <a href="dflPrincipal.aspx">click aqui</a></h2>      
    
    </div>
     <%
         Response.Write("<script language ='javascript'> alert ('Redirigiendo');document.location.href='dflPrincipal.aspx';</script>");
         %>   
    </form>
</body>
</html>
