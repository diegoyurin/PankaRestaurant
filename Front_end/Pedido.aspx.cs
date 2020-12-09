using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Pedido : System.Web.UI.Page
    {
        BDRestauranteDataContext Restaurante = new BDRestauranteDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var consulta = from P in Restaurante.TReceta
                               where P.EstadoReceta == "ACTIVO" && P.TipoReceta == "RECETA"
                               select new { P.IdReceta, P.Nombre, P.Descripcion, P.PrecioVenta };
                gvPedido.DataSource = consulta;
                gvPedido.DataBind();
            }
            
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            if (!ValidarGridView()) {
                Response.Write("<script language=javascript>alert('No ha elegido platos');</script>");
                return;
            }

            float total = 0;

            foreach (GridViewRow gr in gvPedido.Rows)
            {
                TextBox txtCantidad = (TextBox)gr.FindControl("IDcantidad");
                string stringcantidad = txtCantidad.Text.ToString();
                int cantidad = int.Parse(stringcantidad);
                float precio = float.Parse(gr.Cells[3].Text);
                if (cantidad > 0)
                {
                    total += cantidad * precio;
                }
            }

            string correo = idCorreo.Text;

            var resultado = from C in Restaurante.spCrearPedido(total,correo) select C;
            byte CodError = 1;
            string idPedido = string.Empty;

            foreach (var X in resultado)
            {
                CodError = Convert.ToByte(X.CodError);
                idPedido = Convert.ToString(X.Mensaje);
            }

            if (CodError==1)
            {
                Response.Write("<script language=javascript>alert('Hubo un error al crear el pedido');</script>");
                return;
            }

            foreach (GridViewRow gr in gvPedido.Rows)
            {
                string idReceta = gr.Cells[0].Text;
                TextBox txtCantidad = (TextBox)gr.FindControl("IDcantidad");
                string stringcantidad = txtCantidad.Text.ToString();
                int cantidad = int.Parse(stringcantidad);
                string preciostr = gr.Cells[3].Text;
                float precio = float.Parse(preciostr);
                if (cantidad > 0)
                {
                    //Agregamos detalles
                    var resultado2 = from C in Restaurante.spCrearItemPedido(precio, cantidad, idPedido, idReceta) select C;
                    string mensaje = String.Empty;
                    foreach (var X in resultado2)
                    {
                        CodError = Convert.ToByte(X.CodError);
                        mensaje = Convert.ToString(X.Mensaje);
                    }
                    if (CodError == 1)
                    {
                        Response.Write("<script language=javascript>alert('Hubo un problema al realizar el pedido');</script>");
                        //alertaError.Visible = true;
                    }
                }
            }
            Response.Write("<script language=javascript>alert('Pedido creado con éxito');window.location='Inicio.aspx';</script>");
        }

        public bool ValidarGridView()
        {
            bool hayProductos = false;
            foreach (GridViewRow gr in gvPedido.Rows)
            {
                TextBox txtCantidad = (TextBox)gr.FindControl("IDcantidad");
                string stringcantidad = txtCantidad.Text.ToString();
                int cantidad = int.Parse(stringcantidad);
                if (cantidad < 0)
                {
                    Response.Write("<script language=javascript>alert('La cantidad no puede ser negativa');</script>");
                    //alertaMenor0.Visible = true;
                    return false;
                }
                else if (cantidad > 0)
                {
                    //alertaMenor0.Visible = false;
                    hayProductos = true;
                }
            }

            return hayProductos;
        }
    }
}