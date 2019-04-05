<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflCheckout.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <div class="col-md-7">
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <div class="section-title">
                            <h3 class="title">Dirección de envío</h3>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombre" runat="server" placeHolder="Nombre" CssClass="input"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtCalle" runat="server" placeHolder="Calle" CssClass="input"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtCiudad" runat="server" placeHolder="Ciudad" CssClass="input"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtPais" runat="server" placeHolder="País" CssClass="input"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtZip" runat="server" placeHolder="Codigo Postal" CssClass="input"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" placeHolder="Teléfono" CssClass="input"></asp:TextBox>
                        </div>

                    </div>
                    <!-- /Billing Details -->

                    <!-- Order notes -->
                    <div class="order-notes">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="input" placeHolder="Notas"></asp:TextBox>
                    </div>
                    <!-- /Order notes -->
                </div>


                <!-- Order Details -->
                <div class="col-md-5 order-details">
                    <div class="section-title text-center">
                        <h3 class="title">Mi Carrito</h3>
                    </div>
                    <div class="order-summary">
                        <div class="order-col">
                            <div><strong>PRODUCT</strong></div>
                            <div><strong>TOTAL</strong></div>
                        </div>
                        <div class="order-products">
                            <%
                                clsClase obj = new clsClase();
                                List<string[]> dat = obj.mostrarCarrito(int.Parse(Session["Venta"].ToString()), Application["cnn"].ToString());
                                double subtotal = 0;
                                double iva = 0;
                                double total = 0;

                                if (dat.Count == 0)
                                {
                                    Response.Write("<div class='container'> <h1>No hay resultados</h1></div>");
                                }
                                else
                                {
                                    foreach (string[] row in dat)
                                    {
                                        string prod = "<div class='order-col'>";
                                        prod += "<a class='fa fa-trash' href='#'></a>";
                                        prod += "<div>" + row[1] + "x " + row[0] + "</div>";
                                        prod += "<div>$" + row[2] + ".00</div>";

                                        prod += "</div>";
                                        subtotal += int.Parse(row[2]);

                                        Response.Write(prod);
                                    }
                                    iva = subtotal * 0.16;
                                    total = subtotal + iva;
                                }

                            %>
                        </div>
                        <div class="order-col">
                            <div>Envío</div>
                            <div><strong>FREE</strong></div>
                        </div>
                        <div class="order-col">
                            <div><strong>SUBTOTAL</strong></div>
                            <div>$<%Response.Write(subtotal.ToString()); %>.00</div>
                        </div>
                        <div class="order-col">
                            <div><strong>IVA</strong></div>
                            <div>$<%Response.Write(iva.ToString()); %></div>
                        </div>
                        <div class="order-col">
                            <div><strong>TOTAL</strong></div>
                            <div><strong class="order-total">$<%Response.Write(total.ToString()); %></strong></div>
                        </div>

                    </div>
                    <div class="payment-method">
                        <asp:RadioButton ID="rdbTransf" runat="server" type="radio" name="payment" Text=" Transferencia" GroupName="Pago" />
                        <br />
                        <asp:RadioButton ID="rdbCheque" runat="server" type="radio" name="payment" Text=" Cheque" GroupName="Pago" />
                        <br />
                        <asp:RadioButton ID="rdbPayPal" runat="server" type="radio" name="payment" Text=" PayPal" GroupName="Pago" />
                        <br />


                    </div>
                    <div>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="He leído y acepto los terminos y condiciones" />

                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="primary-btn order-submit" />
                    </div>
                    <div class="col-md-1 col-md-push-7">
                        <asp:Button ID="btnFinalizar" runat="server" Text="Terminar" class="primary-btn order-submit" />
                    </div>


                </div>
                <!-- /Order Details -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>




</asp:Content>

