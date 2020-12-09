using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class SiteMaster : MasterPage
    {
        private BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["username"] != null)
                {
                    string correo= Session["username"].ToString();
                    var consulta = (from U in BDRestaurante.TUsuario
                                   where U.Correo == correo
                                   select new { 
                                        Usuario = U.Nombre + " " +U.Apellido
                                   }).FirstOrDefault();
                    nombreUsuario.Text = consulta.Usuario;
                    nombreUsuario.Visible = true;
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void CerrarSesion(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}