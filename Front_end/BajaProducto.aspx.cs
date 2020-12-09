using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class BajaProducto : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from B in BDRestaurante.TBajaProducto
                            join P in BDRestaurante.TProducto on B.IdProducto equals P.IdProducto
                            where P.Stock > 0
                            select new
                            {
                                P.IdProducto,
                                P.Nombre,
                                B.Motivo,
                                B.Cantidad,
                                P.UnidadMedida,
                                B.Fecha
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
            if (!String.IsNullOrEmpty(inpCantidad.Text) && !String.IsNullOrEmpty(inpMotivo.Text) &&
                !(ddlProductoAgregar.SelectedValue.Equals("SNVAL")))
            {
                string Producto = ddlProductoAgregar.SelectedValue;
                string idProducto = Producto.Substring(0, 5);
                Double cantidad = Double.Parse(inpCantidad.Text.Trim());
                string Motivo = inpMotivo.Text.Trim();
                var resultado = from U in BDRestaurante.spCrearBajaProducto(idProducto, cantidad, Motivo)
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
                    inpCantidad.Text = "";
                    inpMotivo.Text = "";
                    ddlProductoAgregar.SelectedIndex = 0;
                    Listar();
                }
                else
                {
                    Response.Write(mensaje);
                }
            }
        }
    }
}