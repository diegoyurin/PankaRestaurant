using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Front_end
{
    public partial class Inicio : System.Web.UI.Page
    {
        BDRestauranteDataContext BDRestaurante = new BDRestauranteDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnPedir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pedido.aspx");
        }
    }
}