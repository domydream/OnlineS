using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    User u = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        ((MyMasterPage)Master).active = "home";

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
            u = (User)Session["user"];

            funame.Text = u.FullName;
            
            try
            {
                countMessage.Text = new MessageModel().getByUserID(u.UserID.ToString(), u.Phone, true).Rows.Count.ToString();
                countSMSService.Text = new UserServiceModel().getByUserService(u.UserID.ToString()).Rows[0]["quantity"].ToString();
            }
            catch (Exception)
            {
                countMessage.Text = "0";
                countSMSService.Text = "0";
            }


        }

    }
}

