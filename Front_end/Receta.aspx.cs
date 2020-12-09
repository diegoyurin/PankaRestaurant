using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Receta : System.Web.UI.Page
    {
        CultureInfo ci = (CultureInfo)CultureInfo.CurrentCulture.Clone();
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from R in BDRestaurante.TReceta
                           where R.EstadoReceta== "ACTIVO"
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
        private void CargarRecetas()
        {
            var consulta = from R in BDRestaurante.TReceta
                           select new
                           {
                               Receta = (R.IdReceta+ "-" + R.Nombre)
                           };
            ddlRecetaAgregar.DataSource = consulta;
            ddlRecetaAgregar.DataBind();
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
                CargarRecetas();
                CargarProductos();
                alerta.Visible = false;
                alert2.Visible = false;
                btnAgregarProducto.Enabled = false;
            }
        }

        protected void gvReceta_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvReceta.EditIndex = e.NewEditIndex;
            Listar();
        }

        protected void gvReceta_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvReceta.EditIndex = -1;
            Listar();
        }

        protected void gvReceta_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdReceta= gvReceta.DataKeys[e.RowIndex].Value.ToString();
            var resultado = (from R in BDRestaurante.TReceta where R.IdReceta == IdReceta
                            select R).FirstOrDefault();
            resultado.EstadoReceta = "INACTIVO";
            BDRestaurante.SubmitChanges();
            Listar();
        }

        protected void gvReceta_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ci.NumberFormat.CurrencyDecimalSeparator = ".";
            string IdReceta = (gvReceta.Rows[e.RowIndex].FindControl("txtIdReceta") as Label).Text.Trim();
            string Nombre = (gvReceta.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text.Trim();
            Double PrecioVenta = Double.Parse((gvReceta.Rows[e.RowIndex].FindControl("txtPrecioVenta") as TextBox).Text.Trim(), NumberStyles.Any, ci);
            string Descripcion = (gvReceta.Rows[e.RowIndex].FindControl("txtDescripcion") as TextBox).Text.Trim();
            int TiempoCoccion= int.Parse((gvReceta.Rows[e.RowIndex].FindControl("txtTiempoCoccion") as TextBox).Text.Trim());
            string TipoReceta = ((DropDownList)gvReceta.Rows[e.RowIndex].FindControl("ddlTipoReceta")).SelectedValue;
            var consulta = (from R in BDRestaurante.TReceta where R.IdReceta == IdReceta select R).FirstOrDefault();
            consulta.Nombre = Nombre;
            consulta.PrecioVenta= PrecioVenta;
            consulta.Descripcion= Descripcion;
            consulta.TiempoCoccion = TiempoCoccion;
            consulta.TipoReceta = TipoReceta;
            BDRestaurante.SubmitChanges();
            gvReceta.EditIndex = -1;
            Listar();
        }

        protected void gvReceta_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            var t = e.Row.RowType;

            if (t == DataControlRowType.DataRow)
            {
                if (this.gvReceta.EditIndex >= 0 && e.Row.RowIndex == this.gvReceta.EditIndex)
                {
                    HiddenField hdnTipoReceta = (HiddenField)e.Row.FindControl("hdnTipoReceta");
                    DropDownList d = e.Row.FindControl("ddlTipoReceta") as DropDownList;
                    d.DataBind();
                    d.Items.FindByValue(hdnTipoReceta.Value).Selected = true;
                }
            }
        }

        protected void btnAgregarModal_Click(object sender, EventArgs e)
        {
            ci.NumberFormat.CurrencyDecimalSeparator = ".";
            if (!String.IsNullOrEmpty(inpNombre.Text) && !String.IsNullOrEmpty(inpPrecioVenta.Text) && !String.IsNullOrEmpty(inpDescripcion.Text) &&
                !String.IsNullOrEmpty(inpTiempoCoccion.Text) && !(ddlTipoReceta.SelectedValue.Equals("SNVAL")))
            {
                alerta.Visible = false;
                string Nombre = inpNombre.Text.Trim();
                float PrecioVenta = float.Parse(inpPrecioVenta.Text.Trim());
                string Descripcion = inpDescripcion.Text.Trim();
                int TiempoCoccion = int.Parse(inpTiempoCoccion.Text.Trim());
                string TipoReceta= ddlTipoReceta.SelectedValue;
                alerta.Visible = false;
                var resultado = from U in BDRestaurante.spCrearReceta(Nombre, PrecioVenta, Descripcion, TiempoCoccion, TipoReceta)
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
                    inpNombre.Text = "";
                    inpPrecioVenta.Text = "";
                    inpDescripcion.Text = "";
                    inpTiempoCoccion.Text = "";
                    ddlTipoReceta.SelectedIndex = 0;
                    Listar();
                }
                else
                {
                    Response.Write(mensaje);
                }
            }
            else
            {
                alerta.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            }
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            btnAgregarProducto.Enabled = true;
            string Producto = ddlProductoAgregar.SelectedValue;
            string IdProducto = Producto.Substring(0, 5);
            var consulta = (from P in BDRestaurante.TProducto
                           where P.IdProducto == IdProducto
                           select new {
                               CostoUnitario = P.CostoUnitario
                           }).FirstOrDefault();
            float CostoUnitario = float.Parse(consulta.CostoUnitario.ToString());
            float Cantidad = float.Parse(inpCantidadProducto.Text.Trim());
            float CostoReceta = CostoUnitario * Cantidad;
            txtCostoProducto.Text = CostoReceta.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal2();", true);
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            if (!(ddlProductoAgregar.SelectedValue.Equals("SNVAL")) &&
                !(ddlRecetaAgregar.SelectedValue.Equals("SNVAL")) &&
                !String.IsNullOrEmpty(inpCantidadProducto.Text))
            {
                alert2.Visible = false;
                float CantidadProducto = float.Parse(inpCantidadProducto.Text.Trim());
                float CostoEnReceta = float.Parse(txtCostoProducto.Text.Trim());
                string Producto = ddlProductoAgregar.SelectedValue;
                string IdProducto = Producto.Substring(0, 5);
                string Receta = ddlRecetaAgregar.SelectedValue;
                string IdReceta = Receta.Substring(0, 5);
                var resultado = from U in BDRestaurante.spCrearDetalleReceta1(IdReceta, CostoEnReceta, IdProducto, "P", CantidadProducto)
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
                    inpNombre.Text = "";
                    txtCostoProducto.Text = "";
                    inpCantidadProducto.Text = "";
                    ddlProductoAgregar.SelectedIndex = 0;
                    ddlRecetaAgregar.SelectedIndex = 0;
                    Listar();
                }
                else
                {
                    Response.Write(mensaje);
                }
            }
            else
            {
                alert2.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal2();", true);
            }
        }

        protected void btnVerProductos_Click(object sender, EventArgs e)
        {

        }
    }
}