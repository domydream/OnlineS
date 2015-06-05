using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactList : System.Web.UI.Page
{
    ContactModel cm = new ContactModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        ((MyMasterPage)Master).active = "contact";
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

            myID.Text = ((User)Session["user"]).UserID.ToString();

        }

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        Contact ct = new Contact();
        ct.FriendName = name.Text;
        ct.FriendNumber = number.Text;
        ct.UserID =int.Parse( myID.Text);
        ct.Status = 1;
        new ContactModel().InsertContact(ct);
        Response.Redirect(Request.RawUrl);
    }
}