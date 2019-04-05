<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflProducto.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%
                            string Id = Request.QueryString["ID"];
                            string[] row;
                            clsClase obj = new clsClase();
                            List<string[]> dat = obj.buscarProducto(Id, 1, Application["cnn"].ToString());

                            if (dat.Count == 0)
                            {
                                Response.Write("<div class='container'> <h1>No hay resultados</h1></div>");
                                row = new string[9];
                            }
                            else
                            {
                                row=dat.ElementAt(0);
                            }

                %>
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- Product main img -->
                <div class="col-md-5 col-md-push-1">
                    <div id="product-main-img" class="slick-initialized slick-slider">
                        <div class="slick-list draggable">
                            <div class="slick-track" style="opacity: 1; width: 1832px;">
                                <div class="product-preview" style="width: 458px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1; overflow: hidden;" tabindex="0">
                                    <img src="<%Response.Write(row[7]);%>" alt=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Product main img -->


                
                <!-- Product details -->
                <div class="col-md-5 col-md-push-2">
                    <div class="product-details">
                        
                        <h2 class="product-name"><%Response.Write(row[2]);%></h2>

                        <div>
                            <h3 class="product-price">$<%Response.Write(row[6]);%>.00 <small>Existencias: <%Response.Write(row[5]);%></small></h3>
                            <span class="product-available">In Stock</span>
                        </div>
                        <p><%Response.Write(row[4]);%></p>


                        <div class="add-to-cart">
                            <div class="qty-label">
                                Qty
								
                                <div class="input-number">
                                    <asp:TextBox ID="txtCantidad" runat="server" type="number" Text="1"></asp:TextBox>
                                    <asp:Button ID="btnMas" runat="server" Text="+" CssClass="qty-up" />
                                    <asp:Button ID="btnMenos" runat="server" Text="-" CssClass="qty-down" />
                                </div>
                            </div>
                            <br/><br/>
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar al carrito" CssClass="add-to-cart-btn" OnClick="btnAgregar_Click" />
                        </div>

                        <ul class="product-links">
                            <li>Share:</li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                        </ul>

                    </div>
                </div>
                <!-- /Product details -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
</asp:Content>

