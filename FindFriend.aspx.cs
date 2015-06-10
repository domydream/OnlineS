using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FindFriend : System.Web.UI.Page
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
        }
        try
        {
            u = new UserModel().getByUserName(Request["key"]);
            Fullname.Text = u.FullName;
            lblEmail.Text = u.Email;
            lblPhone.Text = u.Phone;
            lblUsername.Text = u.UserName;
            imgUser.ImageUrl = u.Image;
        }
        catch (Exception)
        {

            info.Text = "Username doesn't exists";
            info.CssClass = "label-warning";
        }
      
    }
    protected void Requestbutton_Click(object sender, EventArgs e)
    {
        try
        {
            Contact con = new Contact();
            con.FriendName = u.FullName;
            con.FriendNumber = u.Phone;
            con.Status = 0;              
            con.UserID = u.UserID;
            new ContactModel().InsertContact(con);
            con.UserID = new UserModel().getByUserName(Request.Cookies["user"].Value).UserID;
            new ContactModel().InsertContact(con);
            Response.Redirect("~/FriendRequest.aspx");
        }
        catch (Exception)
        {                        
           
        }
        
    }
}