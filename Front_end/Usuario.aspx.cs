using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Usuario : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar()
        {
            var consulta = from U in BDRestaurante.TUsuario where U.Estado=="ACTIVO"
                           select new
                           {
                               U.IdUsuario,
                               U.Nombre,
                               U.Apellido,
                               U.Direccion,
                               U.Celular,
                               U.Correo,
                               U.TipoUsuario
                           };
            gvUsuario.DataSource = consulta;
            gvUsuario.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Listar();
                alerta.Visible = false;
                alertapass.Visible = false;
            }
            
        }

        protected void gvUsuario_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsuario.EditIndex = e.NewEditIndex;
            Listar();
        }

        protected void gvUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdUsuario = gvUsuario.DataKeys[e.RowIndex].Value.ToString();
            var resultado = from U in BDRestaurante.spEliminarUsuario(IdUsuario)
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
                gvUsuario.EditIndex = -1;
                Listar();
            }
            else
            {
                Response.Write(mensaje);
            }
        }

        protected void gvUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string IdUsuario    = (gvUsuario.Rows[e.RowIndex].FindControl("txtIdUsuario") as TextBox).Text.Trim();
            string Nombres      = (gvUsuario.Rows[e.RowIndex].FindControl("txtNombres") as TextBox).Text.Trim();
            string Apellidos    = (gvUsuario.Rows[e.RowIndex].FindControl("txtApellidos") as TextBox).Text.Trim();
            string Direccion    = (gvUsuario.Rows[e.RowIndex].FindControl("txtDireccion") as TextBox).Text.Trim();
            string Celular      = (gvUsuario.Rows[e.RowIndex].FindControl("txtCelular") as TextBox).Text.Trim();
            string Correo       = (gvUsuario.Rows[e.RowIndex].FindControl("txtCorreo") as TextBox).Text.Trim();
            string TipoUsuario  = ((DropDownList)gvUsuario.Rows[e.RowIndex].FindControl("ddlTipoUsuario")).SelectedValue;
            var consulta = (from U in BDRestaurante.TUsuario where U.IdUsuario == IdUsuario select U).FirstOrDefault();
            consulta.Nombre = Nombres;
            consulta.Apellido = Apellidos;
            consulta.Direccion = Direccion;
            consulta.Celular = Celular;
            consulta.Correo = Correo;
            consulta.TipoUsuario = TipoUsuario;
            BDRestaurante.SubmitChanges();
            gvUsuario.EditIndex = -1;
            Listar();
        }

        protected void gvUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsuario.EditIndex = -1;
            Listar();
        }

        protected void gvUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(inpApellidos.Text) && !String.IsNullOrEmpty(inpNombres.Text) && !String.IsNullOrEmpty(inpCelular.Text) &&
                !String.IsNullOrEmpty(inpContrasena.Text) && !String.IsNullOrEmpty(inpContrasena2.Text) && !String.IsNullOrEmpty(inpDireccion.Text)
                && !String.IsNullOrEmpty(inpCorreo.Text) && !(ddlTipoUsuarioAgregar.SelectedValue.Equals("SNVAL")))
            {
                alerta.Visible = false;
                string Nombres = inpNombres.Text.Trim();
                string Apellidos = inpApellidos.Text.Trim();
                string Direccion = inpDireccion.Text.Trim();
                string Celular = inpCelular.Text.Trim();
                string Correo = inpCorreo.Text.Trim();
                string Contrasena = inpContrasena.Text.Trim();
                string Contrasena2 = inpContrasena.Text.Trim();
                string TipoUsuario = ddlTipoUsuarioAgregar.SelectedValue;
                if (!Contrasena.Equals(Contrasena2))
                {
                    alertapass.Visible = true;
                }
                else
                {
                    alertapass.Visible = false;
                    var resultado = from U in BDRestaurante.spCrearUsuario(Nombres, Apellidos, Direccion, Celular, Correo, Contrasena, TipoUsuario)
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
                        inpNombres.Text = "";
                        inpApellidos.Text = "";
                        inpDireccion.Text = "";
                        inpCelular.Text = "";
                        inpCorreo.Text = "";
                        inpContrasena.Text = "";
                        inpContrasena2.Text = "";
                        ddlTipoUsuarioAgregar.SelectedIndex = 0;
                        Listar();
                    }
                    else
                    {
                        Response.Write(mensaje);
                    }
                }
            }
            else
            {
                alerta.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            }
        }
    }
}