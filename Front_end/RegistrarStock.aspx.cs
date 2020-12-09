using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class RegistrarStock : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from P in BDRestaurante.TProducto
                           where P.Stock >= 0
                           select new
                           {
                               P.IdProducto,
                               P.Nombre,
                               P.Stock,
                               P.UnidadMedida,
                               P.CostoUnitario
                           };
            gvProducto.DataSource = consulta;
            gvProducto.DataBind();
        }
        private void CargarProductos()
        {
            var consulta = from P in BDRestaurante.TProducto
                           select new
                           {
                               Producto = (P.IdProducto + "-" + P.Nombre)
                           };
            ddlProductoAgregar.DataSource = consulta;
            ddlProductoAgregar.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
                CargarProductos();
                alerta.Visible = false;
            }

        }

        protected void btnAgregarModal_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(inpStock.Text) &&
                !(ddlProductoAgregar.SelectedValue.Equals("SNVAL")))
            {
                string Producto = ddlProductoAgregar.SelectedValue;
                string idProducto = Producto.Substring(0, 5);
                Double stock = Double.Parse(inpStock.Text.Trim());
                var resultado = from U in BDRestaurante.spRegistrarStock1(idProducto, stock)
                                select U;
                inpStock.Text = "";
                ddlProductoAgregar.SelectedIndex = 0;
                Listar();
            }
        }
    }
}