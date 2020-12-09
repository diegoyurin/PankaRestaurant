using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Categoria : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from C in BDRestaurante.TCategoria
                           select new
                           {
                               C.IdCategoria,
                               C.Nombre,
                           };
            gvCategoria.DataSource = consulta;
            gvCategoria.DataBind();
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
                alerta.Visible = false;
            }
        }

        protected void btnAgregarModal_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(inpNombre.Text))
            {
                alerta.Visible = false;
                string nombre = inpNombre.Text.Trim();
                var resultado = from C in BDRestaurante.spCrearCategoria(nombre)
                                select C;
                inpNombre.Text = "";
                Listar();
            }
            else
            {
                alerta.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            }
        }

        protected void gvCategoria_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategoria.EditIndex = e.NewEditIndex;
            Listar();
        }

        protected void gvCategoria_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategoria.EditIndex = -1;
            Listar();
        }

        protected void gvCategoria_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string IdCategoria = (gvCategoria.Rows[e.RowIndex].FindControl("txtIdCategoria") as TextBox).Text.Trim();
            string Nombre = (gvCategoria.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text.Trim();
            var consulta = (from C in BDRestaurante.TCategoria where C.IdCategoria == IdCategoria select C).FirstOrDefault();
            consulta.Nombre = Nombre;
            BDRestaurante.SubmitChanges();
            gvCategoria.EditIndex = -1;
            Listar();
        }

    }
}