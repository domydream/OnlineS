using OnlineSMS.App_Code.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyService : System.Web.UI.Page
{
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
            userID.Text = ((User)Session["user"]).UserID.ToString();
           
        }
    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        UserService u = new UserService();
        u.ServiceID = int.Parse(txtService.SelectedValue);
        u.UserID = ((User)Session["user"]).UserID;
        u.Quantity = int.Parse(txtQuantity.Text);
        u.StartDate = txtStartDate.Value;
        u.ExpirationDate = txtExpirationDate.Text;
        u.State = 1;
        new UserServiceModel().InsertUserService(u);
        Response.Redirect(Request.RawUrl);
    }
}