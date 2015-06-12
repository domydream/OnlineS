using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;               
public partial class Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((MyMasterPage)Master).active = "service";
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
           
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (new UserModel().Login(((User)Session["user"]).UserName, pass.Text))
        {
            Session["checkService"] = true;
            if (((User)Session["user"]).UserName.Equals("admin"))
            {
                Response.Redirect("~/ServicesControl.aspx");
            }
            else
            {
                Response.Redirect("~/MyService.aspx");
            }
        }
    }
}