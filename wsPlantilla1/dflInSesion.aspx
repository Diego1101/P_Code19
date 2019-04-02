<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflInSesion.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section">
        <div class="container">
        <div class="row">
            <div class="col-md-7">
		   <div class="billing-details">
							<div class="section-title">
								<h3 class="title">Iniciar Sesión</h3>
							</div>
							<div class="form-group">
								<asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario" CssClass="input"></asp:TextBox>
                                </div>
							<div class="form-group">
								<asp:TextBox ID="txtContra" runat="server" placeholder="Contraseña" name="Password"  type="password" CssClass="input"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <br/>
								<asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="primary-btn cta-btn" OnClick="btnCancelar_Click"/>
                                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="primary-btn cta-btn" OnClick="btnAceptar_Click"/>
                            </div>
						</div>

        </div>
            </div>
            </div>
        </div> 

</asp:Content>

