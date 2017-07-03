using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated || !Server.HtmlEncode(User.Identity.Name).Equals("Admin-name",StringComparison.OrdinalIgnoreCase) )
        {
            form1.Visible = false;
            Response.Write("Access Denied!!");
        }
        
    }
}
