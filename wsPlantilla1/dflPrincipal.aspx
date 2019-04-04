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
                        <h3 class="title">New Products</h3>
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
                                        prod += "<img src='./img/" + row[7] + "' alt = '' >";
                                        prod += "</div>";
                                        prod += "<div class='product-body'>";
                                        prod += "<p class='product-category'>" + row[8] + "</p>";
                                        prod += "<h3 class='product-name'><a href='dflModProducto.aspx?ID=" + row[1] + "'>" + row[2] + "</a></h3>";
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

                    <div class="row">
                        <div class="products-tabs">
                            <div class="tab-pane active">
                                <div class="products-slick slick-initialized slick-slider" data-nav="#slick-nav-1">
                                    <div class="product slick-slide" style="width: 263px;">
                                        <div class="product-img">
                                            <img src="../img/product05.png" alt="" />
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">Category</p>
                                            <h3 class="product-name"><a href="#" tabindex="0">product name goes here</a></h3>
                                            <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>

                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn" tabindex="0"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br /><br />
                    <div class="row">
                        <div class="products-tabs">

                            <!-- tab -->
                            <div id="tab1" class="tab-pane active">
                                <div class="products-slick slick-initialized slick-slider" data-nav="#slick-nav-1">
                                    <!-- product -->
                                    <div class="slick-list draggable">
                                        <div class="slick-track" style="opacity: 1; width: 4102px; transform: translate3d(-2344px, 0px, 0px);">
                                            <div class="product slick-slide slick-cloned" data-slick-index="-4" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product02.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">lhkjhlk</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned" data-slick-index="-4" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product02.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">lhkjhlk</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned" data-slick-index="-3" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product03.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="sale">-30%</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="-1"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="-1"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="-1"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned" data-slick-index="-2" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product04.png" alt="" />
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="-1"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="-1"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="-1"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product05.png" alt="" />
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide" data-slick-index="0" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product01.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="sale">-30%</span>
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">.kljhlkjh</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="-1"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="-1"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="-1"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide" data-slick-index="1" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product02.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="-1"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="-1"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="-1"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide" data-slick-index="2" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product03.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="sale">-30%</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="-1"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="-1"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="-1"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide" data-slick-index="3" aria-hidden="true" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product04.png" alt="" />
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="-1">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="-1"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="-1"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="-1"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="-1"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-current slick-active" data-slick-index="4" aria-hidden="false" tabindex="0" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product05.png" alt="" />
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="0">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="0"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned slick-active" data-slick-index="5" aria-hidden="false" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product01.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="sale">-30%</span>
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="0">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="0"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned slick-active" data-slick-index="6" aria-hidden="false" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product02.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="0">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="0"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="0"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="0"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="0"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                            <div class="product slick-slide slick-cloned slick-active" data-slick-index="7" aria-hidden="false" tabindex="-1" style="width: 263px;">
                                                <div class="product-img">
                                                    <img src="../img/product03.png" alt="" />
                                                    <div class="product-label">
                                                        <span class="sale">-30%</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#" tabindex="0">product name goes here</a></h3>
                                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                    <div class="product-rating">
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist" tabindex="0"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare" tabindex="0"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view" tabindex="0"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" tabindex="0"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /product -->

                                    <!-- product -->

                                    <!-- /product -->

                                    <!-- product -->

                                    <!-- /product -->

                                    <!-- product -->

                                    <!-- /product -->

                                    <!-- product -->

                                    <!-- /product -->
                                </div>

                            </div>
                            <!-- /tab -->
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

