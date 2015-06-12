using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServicesControl : System.Web.UI.Page
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
            if (Session["checkService"] == null || !(bool)Session["checkService"])
            {
                if (!((User)Session["user"]).UserName.Equals("admin"))
                {
                    Response.Redirect("~/Services.aspx");
                }
            }

        }
    }
    protected void create_Click(object sender, EventArgs e)
    {
        try
        {
            Service s = new Service();
            s.Name = txtName.Text;
            s.Contents = txtContent.Text;
            s.Price = float.Parse(txtprice.Text);
            s.State = int.Parse(txtState.SelectedValue);
            new ServicesModel().InsertServices(s);
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception)
        {   
            error.Text = "Services is exists! Please create another";
        }
      
    }
}