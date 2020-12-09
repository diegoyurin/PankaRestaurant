using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class RecetasInactivas : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from R in BDRestaurante.TReceta
                           where R.EstadoReceta == "INACTIVO"
                           select new
                           {
                               R.IdReceta,
                               R.Nombre,
                               R.CostoReceta,
                               R.PrecioVenta,
                               R.Descripcion,
                               R.TiempoCoccion,
                               R.TipoReceta
                           };
            gvReceta.DataSource = consulta;
            gvReceta.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
            }
        }

        protected void gvReceta_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdReceta = gvReceta.DataKeys[e.RowIndex].Value.ToString();
            var resultado = (from R in BDRestaurante.TReceta
                             where R.IdReceta == IdReceta
                             select R).FirstOrDefault();
            resultado.EstadoReceta = "ACTIVO";
            BDRestaurante.SubmitChanges();
            Listar();
        }
    }
}