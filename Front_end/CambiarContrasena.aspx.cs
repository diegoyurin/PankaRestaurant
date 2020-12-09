﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class CambiarContrasena : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            alerta.Visible = false;
            alertapass.Visible = false;
            alertapassdiferentes.Visible = false;
            alertaCorrecto.Visible = false;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(contrasena.Text) && !String.IsNullOrEmpty(contrasenanueva.Text) && !String.IsNullOrEmpty(contrasenarepetir.Text))
            {
                if (contrasenanueva.Text != contrasenarepetir.Text)
                {
                    alertapassdiferentes.Visible = true;
                }
                else
                {
                    string Correo = Session["username"].ToString();
                    string Password = contrasena.Text.Trim();
                    string NewPassword = contrasenanueva.Text.Trim();
                    string NewPassword2 = contrasenarepetir.Text.Trim();
                    var resultado = from U in BDRestaurante.spLogin(Correo, Password)
                                   select U;
                    byte codError = 0;
                    string mensaje = string.Empty;
                    foreach (var X in resultado)
                    {
                        codError = Convert.ToByte(X.CodError);
                        mensaje = X.Mensaje;
                    }
                    if (codError == 0)
                    {
                        var consulta = (from U in BDRestaurante.TUsuario
                                       where U.Correo == Correo
                                       select U).FirstOrDefault();
                        consulta.Contrasena = NewPassword;
                        BDRestaurante.SubmitChanges();
                        alertaCorrecto.Visible = true;
                        contrasena.Text = "";
                        contrasenanueva.Text = "";
                        contrasenarepetir.Text = "";
                    }
                    else
                    {
                        alertapass.Visible = true;
                    }
                }
            }
            else
            {
                alerta.Visible = true;
            }
        }
    }
}