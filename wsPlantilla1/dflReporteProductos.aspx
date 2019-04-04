﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dflReporteProductos.aspx.cs" Inherits="dflReporteProductos" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="btnVisualizar" runat="server" OnClick="btnVisualizar_Click" Text="Visualizar" />
        <CR:CrystalReportViewer ID="crvProductos" runat="server" AutoDataBind="true" />
    </form>
</body>
</html>
