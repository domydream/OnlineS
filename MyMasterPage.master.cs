using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyMasterPage : System.Web.UI.MasterPage
{
 
    public User u = new User();
    public string active="";

    protected void Page_Load(object sender, EventArgs e)
    {        
        lastlogin.Text = u.LastLogin;
        avatar.ImageUrl = u.Image;
        fullname.Text = u.FullName;
        myphonenum.Text = u.Phone;
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);  
        Response.Redirect("Default.aspx");
    }

    protected void sendSMS_click(object sender, EventArgs e)
    {   
        Message m = new Message();
        m.UserID = u.UserID;
        m.FromPhoneNumber = u.Phone;
        m.ToPhoneNumber = friendNumber.Text;
        m.Content = content.Text;
        m.CreateAt = DateTime.Now;
        m.Status = 1;

        //insert message for send contact
        new MessageModel().InsertMessage(m);

        //insert message for receive contact
        m.UserID = new UserModel().getByPhoneNum(friendNumber.Text).UserID;
        new MessageModel().InsertMessage(m);
        info.Text = "Your message was sent!";     
        content.Text = "";
        Response.Redirect(Request.RawUrl);
    }

   

}
