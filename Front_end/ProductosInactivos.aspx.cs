using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class ProductosInactivos : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from P in BDRestaurante.TProducto
                           join C in BDRestaurante.TCategoria on P.IdCategoria equals C.IdCategoria
                           where P.EstadoProducto == "INACTIVO"
                           select new
                           {
                               P.IdProducto,
                               P.Nombre,
                               P.Stock,
                               P.UnidadMedida,
                               P.CostoUnitario,
                               Categoria = (P.IdCategoria + "-" + C.Nombre)
                           };
            gvProducto.DataSource = consulta;
            gvProducto.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
            }
        }

        protected void gvProducto_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdProducto = gvProducto.DataKeys[e.RowIndex].Value.ToString();
            var resultado = (from P in BDRestaurante.TProducto
                             where P.IdProducto == IdProducto
                             select P).FirstOrDefault();
            resultado.EstadoProducto = "ACTIVO";
            BDRestaurante.SubmitChanges();
            Listar();
        }
    }
}