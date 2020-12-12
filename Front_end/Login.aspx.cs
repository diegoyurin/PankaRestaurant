using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Login : System.Web.UI.Page
    {
        //Llamar al OMR
        private BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            alerta.Visible = false;
            alertapass.Visible = false;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(exampleInputEmail.Text) && !String.IsNullOrEmpty(exampleInputPassword.Text))
            {
                alerta.Visible = false;
                string Usuario = exampleInputEmail.Text.Trim();
                string Contrasena = exampleInputPassword.Text.Trim();
                var resultado = from C in BDRestaurante.spLogin(Usuario, Contrasena)
                                select C;
                byte codError = 0;
                string mensaje = string.Empty;
                foreach (var X in resultado)
                {
                    codError = Convert.ToByte(X.CodError);
                    mensaje = X.Mensaje;
                }
                if (codError == 0)
                {
                    Session["username"] = Usuario;
                    string tipoUsuario = string.Empty;
                    var consulta = from P in BDRestaurante.TUsuario
                                   where P.Correo == Usuario
                                   select new { P.TipoUsuario};
                    foreach (var X in consulta)
                    {
                        tipoUsuario = Convert.ToString(X.TipoUsuario);
                    }
                    if (tipoUsuario.Equals("CLIENTE"))
                    {
                        Response.Redirect("Inicio.aspx");
                    }
                    else
                    {
                        Response.Redirect("Index.aspx");
                    }
                    
                }
                else
                {
                    alertapass.Visible = true;
                }
            }
            else
            {
                alerta.Visible = true;
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}