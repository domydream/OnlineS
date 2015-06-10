using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FindFriend : System.Web.UI.Page
{   //store my detail
    User user = new User();
    //store friend detail
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
            user = new UserModel().getByUserName(Request.Cookies["user"].Value);
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
        {   //Save a request to my contact with friend detail and status=0: PENDDING;
            Contact con = new Contact();
            con.FriendName = Fullname.Text;
            con.FriendNumber = lblPhone.Text;
            con.Status = 2;              
            con.UserID = user.UserID;    
            new ContactModel().InsertContact(con);
            //Save a request to friend contact with my detail and status =0 :WAIT ACCEPT
            con.FriendName = user.FullName;
            con.FriendNumber = user.Phone;
            con.Status = 0;
            con.UserID = u.UserID;
            new ContactModel().InsertContact(con);
            Response.Redirect("~/FriendRequest.aspx");
        }
        catch (Exception)
        {                        
           
        }
        
    }
}