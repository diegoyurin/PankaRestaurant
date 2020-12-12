using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Registro : System.Web.UI.Page
    {
        private BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            alerta.Visible = false;
            alertapass.Visible = false;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())
            {
                alerta.Visible = true;
                return;
            }
            string nombre = txtNombres.Text;
            string apellidos = txtApellidos.Text;
            string direccion = txtDireccion.Text;
            string celular = txtCelular.Text;
            string email = txtEmail.Text;
            string contrasena = txtContrasena.Text;
            string contrasena2 = txtConfirmarContrasena.Text;

            if (!contrasena.Equals(contrasena2))
            {
                alertapass.Visible = true;
                return;
            }

            var resultado = from C in BDRestaurante.spCrearUsuario(nombre, apellidos, 
                direccion, celular, email, contrasena, "CLIENTE") select C;

            byte codError = 0;
            string mensaje = string.Empty;
            foreach (var X in resultado)
            {
                codError = Convert.ToByte(X.CodError);
                mensaje = X.Mensaje;
            }
            if (codError == 0)
            {
                Session["username"] = email;
                Response.Redirect("Inicio.aspx");
            }
        }

        protected bool ValidarCampos()
        {
            if (String.IsNullOrEmpty(txtNombres.Text)) return false;
            if (String.IsNullOrEmpty(txtApellidos.Text)) return false;
            if (String.IsNullOrEmpty(txtDireccion.Text)) return false;
            if (String.IsNullOrEmpty(txtCelular.Text)) return false;
            if (String.IsNullOrEmpty(txtEmail.Text)) return false;
            if (String.IsNullOrEmpty(txtContrasena.Text)) return false;
            if (String.IsNullOrEmpty(txtConfirmarContrasena.Text)) return false;
            return true;
        }
    }
}