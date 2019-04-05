<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflPrincipal.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">Nuevos productos</h3>
                        <%--<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
									<li><a data-toggle="tab" href="#tab1">Smartphones</a></li>
									<li><a data-toggle="tab" href="#tab1">Cameras</a></li>
									<li><a data-toggle="tab" href="#tab1">Accessories</a></li>
								</ul>
							</div>--%>
                    </div>
                </div>
                <!-- /section title -->

                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <%
                                Session["Busc"] = "";
                                clsClase obj = new clsClase();
                                List<string[]> dat = obj.buscarProducto(Session["Busc"].ToString(), 0, Application["cnn"].ToString());

                                if (dat.Count == 0)
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
                                        prod += "<img src='" + row[7] + "' alt = '' >";
                                        prod += "</div>";
                                        prod += "<div class='product-body'>";
                                        prod += "<p class='product-category'>" + row[8] + "</p>";
                                        prod += "<h3 class='product-name'><a href='dflProducto.aspx?ID=" + row[1] + "'>" + row[2] + "</a></h3>";
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
                    </div>

                </div>

                <!-- Products tab & slick -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
</asp:Content>

