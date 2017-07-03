using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

public partial class chat : System.Web.UI.Page
{
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

        if(!User.Identity.IsAuthenticated)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            CurrentSender.Text = Server.HtmlEncode(User.Identity.Name);

            if(!IsPostBack)
            {
                LoadChatList();
                MSGTextBox.Focus();
                LoadingImage.Attributes.CssStyle.Add("opacity", "0");

            }

            int x = checkNewMessage();
            UnreadMsgCountLabel.Text = x.ToString();
            if(x != 0)
            {
                 LoadChatList();
                this.Title = x.ToString()+" new messages";
                 ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "javascript:playSound()", true);
            }
            else
            {
                this.Title = "chat";
            }


        }

    }


    protected void UsernameLabel_Click(object sender, EventArgs e)
    {
        CurrentRecevier.Text = Server.HtmlEncode(((LinkButton)sender).Text);
        LoadChatList();
        MsgPanel.Visible = true;
    }

    int checkNewMessage()
    {
        sqlconn.Open();

        string StrCmd = "Select COUNT(*) from  MsgTable where RecevierSeen = 0 and MsgReceiver = @receiver";
        SqlCommand sqlcmd = new SqlCommand(StrCmd, sqlconn);
        sqlcmd.Parameters.AddWithValue("@receiver", Server.HtmlEncode(CurrentSender.Text));
        int x = 0;
        x = Convert.ToInt32(sqlcmd.ExecuteScalar());
        sqlconn.Close();

        return x;
    }

    void LoadChatList()
    {
        DataSet ds = new DataSet();
       // DataTable FromTable = new DataTable();
        string StrCmd = "select Msgsender,chatmsg from msgtable where (MsgSender = @sender and msgReceiver = @receiver) or (MsgSender = @ViseSender and msgReceiver = @ViseReceiver) order by Id";
        SqlCommand sqlcmd = new SqlCommand(StrCmd, sqlconn);
        sqlcmd.Parameters.AddWithValue("@sender", Server.HtmlEncode(CurrentSender.Text));
        sqlcmd.Parameters.AddWithValue("@receiver", Server.HtmlEncode (CurrentRecevier.Text));
        sqlcmd.Parameters.AddWithValue("@ViseSender", Server.HtmlEncode(CurrentRecevier.Text));
        sqlcmd.Parameters.AddWithValue("@ViseReceiver", Server.HtmlEncode (CurrentSender.Text));
        sqlconn.Open();

        SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcmd);
        sqlDA.Fill(ds);

        DataList2.DataSource = ds.Tables[0];
        /*
        foreach (DataRow row in ds.Tables[0].Rows)
        {
           if(string.Equals(row["MsgSender"].ToString() ,CurrentSender.Text,StringComparison.OrdinalIgnoreCase))
            {
                //row["MsgSender"] = "<span style='color:blue; float: right'>You</span>";
                //row["ChatMsg"] = "<span style='color:blue; float: right'>"+row["ChatMsg"].ToString()+"</span>";
                DataList2. = false;
            }
           else
            {
                // row["MsgSender"] = "<span style='color:orange; float:left'>"+ row["MsgSender"].ToString()+"</span>";
                DataList2.Visible = true;
            }


        }
        ds.AcceptChanges();
        */

        DataList2.DataBind();

        sqlconn.Close();


        seenAllMsg();
    }

    void seenAllMsg()
    {
        sqlconn.Open();

        string StrCmd = "update MsgTable set RecevierSeen = 1 where MsgReceiver = @MsgRec and MsgSender = @MsgSen";
        SqlCommand sqlcmd = new SqlCommand(StrCmd, sqlconn);
        sqlcmd.Parameters.AddWithValue("@MsgRec", Server.HtmlEncode(CurrentSender.Text));
        sqlcmd.Parameters.AddWithValue("@MsgSen", Server.HtmlEncode(CurrentRecevier.Text));
        sqlcmd.ExecuteNonQuery();
        sqlconn.Close();
    }

    protected void sendBTN_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(Server.HtmlEncode(MSGTextBox.Text)))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Enter Message'); ", true);
            return;
        }
        if (string.IsNullOrWhiteSpace(Server.HtmlEncode(CurrentRecevier.Text)))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Select Recevier'); ", true);
            return;
        }

        string StrCmd = "AddMsgToTable @msg , @SenderName, @ReciverName";
        SqlCommand sqlcmd = new SqlCommand(StrCmd, sqlconn);
        sqlcmd.Parameters.AddWithValue("@msg", Server.HtmlEncode(MSGTextBox.Text));
        sqlcmd.Parameters.AddWithValue("@SenderName", Server.HtmlEncode(CurrentSender.Text));
        sqlcmd.Parameters.AddWithValue("@ReciverName", Server.HtmlEncode(CurrentRecevier.Text));
        sqlconn.Open();
        sqlcmd.ExecuteNonQuery();
        sqlconn.Close();

        MSGTextBox.Text = "";
        MSGTextBox.Focus();

        LoadChatList();
        LoadingImage.Attributes.CssStyle.Add("opacity", "0");

    }

    protected void logout_Click(object sender, EventArgs e)
    {
        string OnlineStatusStr = "update UserDatabase set OnlineStatus = 0 where Username = @user";

        SqlCommand comm1 = new SqlCommand(OnlineStatusStr, sqlconn);
        comm1.Parameters.AddWithValue("@user", Server.HtmlEncode(CurrentSender.Text));
        sqlconn.Open();
        comm1.ExecuteNonQuery();
        sqlconn.Close();
        FormsAuthentication.SignOut();
        Response.Redirect("login.aspx");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DataList1.DataBind();
        DataList3.DataBind();
        DataList4.DataBind();

    }

    protected string GetStyleForMsgList(string str)
    {
       if(string.Equals(Server.HtmlEncode(str), Server.HtmlEncode(CurrentSender.Text),StringComparison.OrdinalIgnoreCase))
       {
            return "SenderClass";
       }
        return "ReceiverClass";
    }
    protected string GetPerfactName(string str)
    {
        if (string.Equals(Server.HtmlEncode(str), Server.HtmlEncode(CurrentSender.Text), StringComparison.OrdinalIgnoreCase))
        {
            return "<span style='color:#efdab5'>You :</sapn>";
        }
        return "<span style='color:#efdab5'>" + Server.HtmlEncode(str)+" : </span>";
    }

    protected string GetWelcomeBanner(string str)
    {
        if (String.IsNullOrWhiteSpace(Server.HtmlEncode(str)))
            return "Hi, lets start chatting...";

        return str;
    }


}