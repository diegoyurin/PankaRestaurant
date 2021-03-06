﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Front_end.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Panka Restaurant</title>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="GetTemplates.co" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet"/>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css"/>
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css"/>
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css"/>
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css"/>

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css"/>

	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"/>

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="css/owl.theme.default.min.css"/>

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css"/>

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>
    <form id="form1" runat="server">
        <div>
			<div class="gtco-loader"></div>
			<div id="page">
	
			<!-- <div class="page-inner"> -->
			<nav class="gtco-nav" role="navigation">
				<div class="gtco-container">
					<div class="row">
						<div class="col-sm-4 col-xs-12">
							<div id="gtco-logo"><a href="index.aspx">Panka Restaurant<em>.</em></a></div>
						</div>
						<div class="col-xs-8 text-right menu-1">
							<ul>
								<li><a href="Pedido.aspx">Pedidos</a></li>
								<li class="has-dropdown">
									<a href="Nosotros.aspx">Nosotros</a>
								</li>
								<li><a href="contact.aspx">Contáctenos</a></li>
							</ul>	
						</div>
					</div>
				</div>
			</nav>
	
			<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/fondo.jpg)" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="gtco-container">
					<div class="row">
						<div class="col-md-12 col-md-offset-0 text-left">
							<div class="row row-mt-15em">
								<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
									<h1 class="cursive-font">Bienvenido a Panka Restaurant</h1>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
	
			<div class="gtco-section">
		        <div class="gtco-container">
			        <div class="row">
				        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					        <h2 class="cursive-font primary-color">Nuestros platos</h2>
					        <p>Dé un vistazo a algunos de nuestros platos. Estamos seguros de que le gustarán.</p>
				        </div>
			        </div>
			        <div class="row">
				        <div class="col-lg-4 col-md-4 col-sm-6">
					        <a href="images/img_1.jpg" class="fh5co-card-item image-popup">
						        <figure>
							        <div class="overlay"><i class="ti-plus"></i></div>
							        <img src="images/img_1.jpg" alt="Image" class="img-responsive"/>
						        </figure>
						        <div class="fh5co-text">
							        <h2>Causa de Pollo</h2>
							        <p>Es un entrante típico y muy extendido de la gastronomía del Perú que tiene origen precolombino.</p>
							        <p><span class="price cursive-font">S/.35</span></p>
						        </div>
					        </a>
				        </div>
				        <div class="col-lg-4 col-md-4 col-sm-6">
					        <a href="images/img_2.jpg" class="fh5co-card-item image-popup">
						        <figure>
							        <div class="overlay"><i class="ti-plus"></i></div>
							        <img src="images/img_2.jpg" alt="Image" class="img-responsive"/>
						        </figure>
						        <div class="fh5co-text">
							        <h2>Aji de gallina</h2>
							        <p>El ají de gallina es un plato típico de la gastronomía peruana, concretamente de la costa, que consiste en un ají o crema espesa con pechuga de gallina deshilachada.</p>
							        <p><span class="price cursive-font">S/.10</span></p>
						        </div>
					        </a>
				        </div>
				        <div class="col-lg-4 col-md-4 col-sm-6">
					        <a href="images/img_3.jpg" class="fh5co-card-item image-popup">
						        <figure>
							        <div class="overlay"><i class="ti-plus"></i></div>
							        <img src="images/img_3.jpg" alt="Image" class="img-responsive"/>
						        </figure>
						        <div class="fh5co-text">
							        <h2>Lomo Saltado</h2>
							        <p>El lomo saltado es un plato típico de la gastronomía del Perú consistente en carne de res, arroz cocido y papas fritas.</p>
							        <p><span class="price cursive-font">S/.15</span></p>
						        </div>
					        </a>
				        </div>
			        </div>
                    <div class="row">
				        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					        <h2 class="cursive-font primary-color">Realiza tu pedido</h2>
					        <p>Da click en el botón para hacer un pedido.</p>
                            <asp:Button runat="server" Text="Click aquí" ID="btnPedir" OnClick="btnPedir_Click" />
				        </div>
			        </div>
		        </div>
	        </div>
	
			<div id="gtco-features">
		        <div class="gtco-container">
			        <div class="row">
				        <div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
					        <h2 class="cursive-font">Nosotros</h2>
					        <p>El Restaurante Panka cuenta con una sucursal en el distrito de La Molina. Desde hace 7 años, esta cadena de establecimientos se ha 
						        especializado en la preparación de brasas peruanas. Disfruta el auténtico sabor de nuestra cocina en un ambiente acogedor, rodeado de 
						        una atención espectacular.</p>
				        </div>
			        </div>
			        <div class="row">
				        <div class="col-md-4 col-sm-6">
					        <div class="feature-center animate-box" data-animate-effect="fadeIn">
						        <span class="icon">
							        <i class="ti-face-smile"></i>
						        </span>
						        <h3>Buena atención</h3>
						        <p>Queremos que tengas la mejor experiencia con nosotros.</p>
					        </div>
				        </div>
				        <div class="col-md-4 col-sm-6">
					        <div class="feature-center animate-box" data-animate-effect="fadeIn">
						        <span class="icon">
							        <i class="ti-thought"></i>
						        </span>
						        <h3>Cocina novedosa</h3>
						        <p>Nuestros platos destacan por la innovación y creatividad. No te los pierdas.</p>
					        </div>
				        </div>
				        <div class="col-md-4 col-sm-6">
					        <div class="feature-center animate-box" data-animate-effect="fadeIn">
						        <span class="icon">
							        <i class="ti-truck"></i>
						        </span>
						        <h3>Envío de comida</h3>
						        <p>Puedes pedir comida a domicilio desde nuestro menú en línea.</p>
					        </div>
				        </div>
			        </div>
		        </div>
	        </div>

			<footer id="gtco-footer" role="contentinfo" style="background-image: url(images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="gtco-container">
					<div class="row row-pb-md">
						<div class="col-md-12 text-center">
							<div class="gtco-widget">
								<h3>Contáctanos</h3>
								<ul class="gtco-quick-contact">
									<li><a href="#"><i class="icon-phone"></i> +51 981663316</a></li>
									<li><a href="#"><i class="icon-mail2"></i> 017100510c@uandina.edu.pe</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-12 text-center copyright">
							<p><small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
								<small class="block">Designed by <a href="http://gettemplates.co/" target="_blank">GetTemplates.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small></p>
						</div>
					</div>
				</div>
			</footer>
			<!-- </div> -->

			</div>

			<div class="gototop js-top">
				<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
			</div>
	
			<!-- jQuery -->
			<script src="js/jquery.min.js"></script>
			<!-- jQuery Easing -->
			<script src="js/jquery.easing.1.3.js"></script>
			<!-- Bootstrap -->
			<script src="js/bootstrap.min.js"></script>
			<!-- Waypoints -->
			<script src="js/jquery.waypoints.min.js"></script>
			<!-- Carousel -->
			<script src="js/owl.carousel.min.js"></script>
			<!-- countTo -->
			<script src="js/jquery.countTo.js"></script>

			<!-- Stellar Parallax -->
			<script src="js/jquery.stellar.min.js"></script>

			<!-- Magnific Popup -->
			<script src="js/jquery.magnific-popup.min.js"></script>
			<script src="js/magnific-popup-options.js"></script>
	
			<script src="js/moment.min.js"></script>
			<script src="js/bootstrap-datetimepicker.min.js"></script>


			<!-- Main -->
			<script src="js/main.js"></script>

        </div>
    </form>
</body>
</html>
