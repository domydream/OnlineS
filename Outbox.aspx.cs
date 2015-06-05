using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Outbox : System.Web.UI.Page
{
    User u = new User();
    Message outBox = new Message();
    protected void Page_Load(object sender, EventArgs e)
    {
        ((MyMasterPage)Master).active = "outbox";
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
            this.u = (User)Session["user"];

            mynumber.Text = u.Phone;
            myID.Text = u.UserID.ToString();
        }

    }
}