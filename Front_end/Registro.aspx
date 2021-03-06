﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Front_end.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Registro</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
</head>
<body class="bg-gradient-primary">
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Registrarse</h1>
                                    </div>
                                    <br />
                                    <form class="user" runat="server" id="formLogin">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" class="form-control form-control-user"
                                                ID="txtNombres" placeholder="Nombres" required autofocus/>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" class="form-control form-control-user"
                                                ID="txtApellidos" placeholder="Apellidos" required />
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" class="form-control form-control-user"
                                                ID="txtDireccion" placeholder="Dirección" required />
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="tel" class="form-control form-control-user"
                                                ID="txtCelular" placeholder="Celular" required />
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="email" CssClass="form-control form-control-user"
                                                ID="txtEmail" aria-describedby="emailHelp"
                                                placeholder="Usuario" required />
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="password" class="form-control form-control-user"
                                                ID="txtContrasena" placeholder="Contraseña" required />
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="password" class="form-control form-control-user"
                                                ID="txtConfirmarContrasena" placeholder="Contraseña" required />
                                        </div>
                                        
                                        <div class="alert alert-danger" role="alert" id="alerta" runat="server">
                                            Rellene todos los campos
                                        </div>
                                        <div class="alert alert-danger" role="alert" id="alertapass" runat="server">
                                            La contraseña no coincide
                                        </div>
                                        <br />
                                        <asp:LinkButton NavigateUrl="Inicio.aspx" runat="server" CssClass="btn btn-primary btn-user btn-block"
                                            Text="Crear cuenta" OnClick="Unnamed1_Click"/>
                                    </form>
                                    <br />
                                    <hr />
                                </div>
                            </div>
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    
</body>
</html>
