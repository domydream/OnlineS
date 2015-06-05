using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inbox : System.Web.UI.Page
{
    Message m = new Message();
    protected void Page_Load(object sender, EventArgs e)
    {
        ((MyMasterPage)Master).active = "inbox";
        if (Session["user"] == null && Request.Cookies["user"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            if (Session["user"] == null && Request.Cookies["user"] != null)
            {
                Session["user"] = new UserModel().getByUserName(Request.Cookies["user"].Value);
            }
            ((MyMasterPage)Master).u = (User)Session["user"];
            phoneNUM.Text = ((User)Session["user"]).Phone;
            userID.Text = ((User)Session["user"]).UserID.ToString();          
     
        }
    }
}