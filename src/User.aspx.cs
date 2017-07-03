using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(User.Identity.IsAuthenticated)
        {
            Response.Write("Authorized");
            Label1.Text = User.Identity.Name;
        }
        else
        {
            Response.Redirect("login.aspx");
        }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("login.aspx");
    }
}