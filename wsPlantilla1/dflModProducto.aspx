<%@ Page Title="" Language="C#" MasterPageFile="~/mpEmpleado.master" AutoEventWireup="true" CodeFile="dflModProducto.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="breadcrumb" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="breadcrumb-header">Producto</h3>
                    <ul class="breadcrumb-tree">
                        <li><a href="dflProductos.aspx">Home</a></li>
                        <li class="active">Modificar</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class=" col-lg-offset-2">
            <div class="col-lg-3">
                <small>Codigo: </small>
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="input" placeHolder="Codigo"></asp:TextBox>
            </div>
            <div class="col-lg-7">
                <small>Nombre: </small>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="input" placeHolder="Nombre"></asp:TextBox>
            </div>
            <br />
            <br />
            <br />
            <br />
            <div class="col-lg-3">
                <br />
                <asp:DropDownList ID="dwlTipo" runat="server" CssClass="input-select">
                </asp:DropDownList>
            </div>
            <div class="col-lg-7">
                <small>Marca: </small>
                <asp:TextBox ID="txtMarca" runat="server" CssClass="input" placeHolder="Marca"></asp:TextBox>
            </div>
            <br />
            <br />
            <br />
            <br />


            <div class="col-lg-5">
                <small>Cantidad: </small>
                <asp:TextBox ID="txtUnidades" runat="server" CssClass="input" placeHolder="Cantidad"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <small>Precio: </small>
                <asp:TextBox ID="txtPrecio" runat="server" CssClass="input" placeHolder="Precio"></asp:TextBox>
            </div>
            <br />
            <br />
            <br />
            <br />
            <div class="col-lg-5">
                <small>Descripción: </small>
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" placeHolder="Descripción" Style="resize: none; width: 100%; height: 230px"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <asp:ImageButton Style="margin-left: 25%" ID="imgbImagen" runat="server" Height="200" Width="200" />
            </div>
            <div class="col-lg-5">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Label ID="lblImagen" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class=" col-lg-offset-7">
            <br />
            <br />
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="primary-btn" />
            <asp:Button ID="btnGUardar" runat="server" Text="Guardar" CssClass="primary-btn" />

        </div>
    </div>

    



</asp:Content>

