<%@ Page Title="" Language="C#" MasterPageFile="~/mpAdmin.master" AutoEventWireup="true" CodeFile="dflMensaje.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
            
        <div class="col-lg-offset-4">
            <div class="col-sm-7">

            <div class="col-lg-10"">
                <h2>Mensaje</h2>
                <h3><asp:Label ID="txtNombre" runat="server" Text="Nombre"></asp:Label></h3>
                <h3><asp:Label ID="txtTel" runat="server" Text="Teléfono"></asp:Label></h3>

            </div>

            <div class="col-lg-10"">
                <asp:Image ID="imgFoto" runat="server" ImageUrl="~/img/product08.png" Width="200px" />
            </div>

            <div class="col-lg-10"">
                <asp:TextBox ID="txtMensaje" placeHolder="Mensaje" runat="server" CssClass="input"></asp:TextBox>
            </div>

            <div class="col-lg-10"">         
            <br />
                <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar"  CssClass="primary-btn" OnClick="btnSeleccionar_Click"/>
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar"  CssClass="primary-btn" OnClick="btnEnviar_Click"/>
            </div>

            </div>
        </div>
        </div>
        <br />
</asp:Content>

