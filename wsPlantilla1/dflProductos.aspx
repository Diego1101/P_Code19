<%@ Page Title="" Language="C#" MasterPageFile="~/mpEmpleado.master" AutoEventWireup="true" CodeFile="dflProductos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
						<div class="aside">
							<div class="row">
                                <asp:TextBox ID="txtBuscar" runat="server" CssClass="input" placeHolder="Buscar"></asp:TextBox>
							</div>
						</div>
						<!-- /aside Widget -->


                        <!-- aside Widget -->
						<div class="aside">
							<div class="row">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="primary-btn" OnClick="btnBuscar_Click" />
							    <asp:Button ID="btnTodo" runat="server" Text="Ver todo" CssClass="primary-btn" OnClick="btnTodo_Click" />
							
                            </div>
						</div>
						<!-- /aside Widget -->
					</div>

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								
							</div>
							<ul class="store-grid">
                                <li><a href="dflModProducto.aspx"><i class="fa fa-plus"></i></a></li>
							</ul>
						</div>
						<!-- /store top filter -->

						<!-- store products -->
                        <br />
						<div class="row">
                            <%
                                Session["Busc"] = txtBuscar.Text;
                                clsClase obj = new clsClase();
                                List<string[]> dat = obj.buscarProducto(Session["Busc"].ToString(), 0, Application["cnn"].ToString());

                                if (dat.Count==0)
                                {
                                    Response.Write("<div class='container'> <h1>No hay resultados</h1></div>");
                                }
                                else
                                {
                                    foreach (string[] row in dat)
                                    {
                                        string prod = "<div class='col-md-4 col-xs-6'>";
                                        prod += "<div class='product-widget'>";
                                        prod += "<div class='product-img'>";
                                        prod += "<img src='./img/" + row[7] + "' alt = '' >";
                                        prod += "</div>";
                                        prod += "<div class='product-body'>";
                                        prod += "<p class='product-category'>" + row[8] + "</p>";
                                        prod += "<h3 class='product-name'><a href='dflModProducto.aspx?ID="+row[1]+"'>" + row[2] + "</a></h3>";
                                        //prod += "<h4 class='product-price'>$" + row[6] + ".00 <del class='product-old-price'>$" + (int.Parse(row[6]) + int.Parse(row[6]) * .20).ToString() + "</del></h4>";
                                        prod += "<h4 class='product-price'>$" + row[6] + ".00 <small>Existencias: " + row[5] + "</small></h4>";
                                        prod += "</div>";
                                        prod += "</div>";
                                        prod += "</div>";

                                        Response.Write(prod);
                                    }
                                }

                                %>

						</div>
						<!-- /store products -->

						<%--<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<ul class="store-pagination">
								<li class="active">1</li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- /store bottom filter -->--%>
					</div>
					<!-- /STORE -->

        </div>

</asp:Content>

