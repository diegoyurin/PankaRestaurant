using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Web.UI.HtmlControls;
using System.Text;

namespace Front_end
{
    public partial class RecetaIngrediente : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        private void Listar(string IdReceta)
        {
            var consulta = from R in BDRestaurante.TReceta
                           join DR in BDRestaurante.TDetalleReceta on R.IdReceta equals DR.IdReceta
                           join P in BDRestaurante.TProducto on DR.IdProducto equals P.IdProducto
                           join C in BDRestaurante.TCategoria on P.IdCategoria equals C.IdCategoria
                           where P.EstadoProducto == "ACTIVO" && R.IdReceta==IdReceta
                           select new
                           {
                               P.IdProducto,
                               P.Nombre,
                               DR.CantidadProducto,
                               P.UnidadMedida,
                               P.CostoUnitario,
                               DR.CostoEnReceta,
                               FechaRegistro = (P.FechaRegistro.Day + "/" + P.FechaRegistro.Month + "/" + P.FechaRegistro.Year),
                               P.ControlProducto,
                               Categoria = (P.IdCategoria + "-" + C.Nombre)
                           };
            gvProducto.DataSource = consulta;
            gvProducto.DataBind();
        }
        private void CargarRecetas()
        {
            var consulta = from R in BDRestaurante.TReceta
                           select new
                           {
                               Receta = (R.IdReceta + "-" + R.Nombre)
                           };
            ddlRecetaAgregar.DataSource = consulta;
            ddlRecetaAgregar.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarRecetas();
                btnExcel.Visible = false;
                btnPDF.Visible = false;
            }

        }

        protected void ddlRecetaAgregar_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Receta = ddlRecetaAgregar.SelectedValue;
            string IdReceta= Receta.Substring(0, 5);
            //Response.Write("<script>alert('" + IdPReceta + "')</script>");
            var consulta = (from R in BDRestaurante.TReceta
                           where R.IdReceta == IdReceta
                           select new
                           {
                               R.CostoReceta
                           }).FirstOrDefault();
            txtCostoTotal.Text = (consulta.CostoReceta).ToString();
            Listar(IdReceta);
            if(gvProducto.Rows.Count != 0)
            {
                btnExcel.Visible = true;
                btnPDF.Visible = true;
            }
            else
            {
                btnExcel.Visible = false;
                btnPDF.Visible = false;
            }
        }
        DataTable GetDataTable(GridView dtg)
        {
            DataTable dt = new DataTable();

            // add the columns to the datatable            
            if (dtg.HeaderRow != null)
            {

                for (int i = 0; i < dtg.HeaderRow.Cells.Count; i++)
                {
                    dt.Columns.Add(dtg.HeaderRow.Cells[i].Text);
                }
            }

            //  add each of the data rows to the table
            foreach (GridViewRow row in dtg.Rows)
            {
                DataRow dr;
                dr = dt.NewRow();

                for (int i = 0; i < row.Cells.Count; i++)
                {
                    dr[i] = row.Cells[i].Text.Replace(" ", "");
                }
                dt.Rows.Add(dr);
            }
            return dt;
        }


        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Reporte.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvProducto.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
#pragma warning disable CS0612 // Type or member is obsolete  
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
#pragma warning restore CS0612 // Type or member is obsolete  
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            //Response.Write(pdfDoc);
            Response.End();
            gvProducto.AllowPaging = true;
            gvProducto.DataBind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            HttpResponse response = Response;
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page pageToRender = new Page();
            HtmlForm form = new HtmlForm();
            form.Controls.Add(gvProducto);
            pageToRender.Controls.Add(form);
            response.Clear();
            response.Buffer = true;
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=Reporte.xls");
            response.Charset = "UTF-8";
            response.ContentEncoding = Encoding.Default;
            pageToRender.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();
        }
    }
}