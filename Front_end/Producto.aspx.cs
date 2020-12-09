using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Producto : System.Web.UI.Page
    {
        CultureInfo ci = (CultureInfo)CultureInfo.CurrentCulture.Clone();
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from P in BDRestaurante.TProducto
                            join C in BDRestaurante.TCategoria on P.IdCategoria equals C.IdCategoria
                            where P.EstadoProducto == "ACTIVO"
                            select new
                            {
                                P.IdProducto,
                                P.Nombre,
                                P.Stock,
                                P.UnidadMedida,
                                P.CostoUnitario,
                                FechaRegistro = (P.FechaRegistro.Day + "/" + P.FechaRegistro.Month + "/" + P.FechaRegistro.Year),
                                P.ControlProducto,
                                Categoria = (P.IdCategoria + "-" + C.Nombre)
                            };
            gvProducto.DataSource = consulta;
            gvProducto.DataBind();
        }
        private void CargarCategorias()
        {
            var consulta = from C in BDRestaurante.TCategoria
                           select new
                           {
                               Categoria= (C.IdCategoria + "-" + C.Nombre)
                           };
            ddlCategoriaAgregar.DataSource = consulta;
            ddlCategoriaAgregar.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
                CargarCategorias();
                alerta.Visible = false;
            }

        }

        protected void btnAgregarModal_Click(object sender, EventArgs e)
        {
            ci.NumberFormat.CurrencyDecimalSeparator = ".";
            if (!String.IsNullOrEmpty(inpNombre.Text) && 
                !String.IsNullOrEmpty(inpStock.Text) && 
                !String.IsNullOrEmpty(inpUnidadMedida.Text) &&
                !String.IsNullOrEmpty(inpCostoUnitario.Text) && 
                !String.IsNullOrEmpty(inpControlProducto.Text) && 
                !(ddlCategoriaAgregar.SelectedValue.Equals("SNVAL")))
            {
                alerta.Visible = false;
                string Nombres = inpNombre.Text.Trim();
                Double Stock = Double.Parse(inpStock.Text.Trim(), NumberStyles.Any, ci);
                string UnidadMedida = inpUnidadMedida.Text.Trim();
                Double CostoUnitario = Double.Parse(inpCostoUnitario.Text.Trim(), NumberStyles.Any, ci);
                //Response.Write("<script>alert('" + CostoUnitario + "')</script>");
                string ControlProducto = inpControlProducto.Text.Trim();
                string Categoria = ddlCategoriaAgregar.SelectedValue;
                string idCategoria = Categoria.Substring(0, 5);
                var resultado = from P in BDRestaurante.spCrearProducto(Nombres, Stock, UnidadMedida, CostoUnitario, ControlProducto, idCategoria)
                                select P;
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
                    inpStock.Text = "";
                    inpUnidadMedida.Text = "";
                    inpCostoUnitario.Text = "";
                    inpControlProducto.Text = "";
                    ddlCategoriaAgregar.SelectedIndex = 0;
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

        protected void gvProducto_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducto.EditIndex = e.NewEditIndex;
            Listar();
        }

        protected void gvProducto_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducto.EditIndex = -1;
            Listar();
        }

        protected void gvProducto_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ci.NumberFormat.CurrencyDecimalSeparator = ".";
            string IdProducto = (gvProducto.Rows[e.RowIndex].FindControl("txtIdProducto") as TextBox).Text.Trim();
            string Nombre = (gvProducto.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text.Trim();
            Double Stock = Double.Parse((gvProducto.Rows[e.RowIndex].FindControl("txtStock") as TextBox).Text.Trim(), NumberStyles.Any, ci);
            //Response.Write("<script>alert('" + Stock + "')</script>");
            string UnidadMedida = (gvProducto.Rows[e.RowIndex].FindControl("txtUnidadMedida") as TextBox).Text.Trim();
            Double CostoUnitario = Double.Parse((gvProducto.Rows[e.RowIndex].FindControl("txtCostoUnitario") as TextBox).Text.Trim(), NumberStyles.Any, ci);
            //Response.Write("<script>alert('" + CostoUnitario + "')</script>");
            string ControlProducto = (gvProducto.Rows[e.RowIndex].FindControl("txtControlProducto") as TextBox).Text.Trim();
            string Categoria= ((DropDownList)gvProducto.Rows[e.RowIndex].FindControl("ddlCategoria")).SelectedValue;
            string IdCategoria = Categoria.Substring(0, 5);
            var consulta = (from P in BDRestaurante.TProducto where P.IdProducto == IdProducto select P).FirstOrDefault();
            consulta.Nombre = Nombre;
            consulta.Stock = Stock;
            consulta.UnidadMedida = UnidadMedida;
            consulta.CostoUnitario = CostoUnitario;
            consulta.ControlProducto = ControlProducto;
            consulta.IdCategoria = IdCategoria;
            BDRestaurante.SubmitChanges();
            gvProducto.EditIndex = -1;
            Listar();
        }

        protected void gvProducto_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdProducto = gvProducto.DataKeys[e.RowIndex].Value.ToString();
            var resultado = from U in BDRestaurante.spEliminarProducto1(IdProducto)
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
                gvProducto.EditIndex = -1;
                Listar();
            }
            else
            {
                Response.Write(mensaje);
            }
        }

        protected void gvProducto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            var t = e.Row.RowType;

            if (t == DataControlRowType.DataRow)
            {
                if (this.gvProducto.EditIndex >= 0 && e.Row.RowIndex == this.gvProducto.EditIndex)
                {
                    HiddenField hdnCategoria = (HiddenField)e.Row.FindControl("hdnCategoria");
                    DropDownList d = e.Row.FindControl("ddlCategoria") as DropDownList;
                    var consulta = from C in BDRestaurante.TCategoria
                                   select new
                                   {
                                       Categoria = (C.IdCategoria + "-" + C.Nombre)
                                   };
                    d.DataSource = consulta;
                    d.DataBind();
                    //Response.Write("<script>alert('"+ idCategoria + "')</script>");
                    d.Items.FindByValue(hdnCategoria.Value).Selected = true;
                }
            }
        }
    }
}