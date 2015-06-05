using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Recaptcha.Web;
using System.Security.Cryptography;
using System.Text;
public partial class _Default : System.Web.UI.Page
{
    UserModel um = new UserModel();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        if (String.IsNullOrEmpty(Recaptcha1.Response))
        {
            lblMessage.Text = "Captcha cannot be empty.";
        }
        else
        {
            RecaptchaVerificationResult result = Recaptcha1.Verify();

            if (result == RecaptchaVerificationResult.Success)
            {
                User u = new User();
                u.UserName = txtUname.Text;
                u.Password = um.GetMD5HashData(txtPass.Text);
                u.Email = txtMail.Text;
                u.Phone = txtPhone.Text;
                u.CreateAt = DateTime.Now.ToString();
                u.LastLogin = u.CreateAt;
                u.FullName=txtFullName.Text;
                u.Image = "assets/img/find_user.png";              
                um.InsertUser(u);
                Session["user"] = new UserModel().getByUserName(u.UserName);
                UserProfile up = new UserProfile();
                up.UserID = ((User)Session["user"]).UserID;                
                new UserProfileModel().InsertUserProfile(up);
                Response.Redirect("~/MyProfile.aspx#setting");      
            }
            if (result == RecaptchaVerificationResult.IncorrectCaptchaSolution)
            {
                lblMessage.Text = "Incorrect captcha response.";
            }
            else
            {
                lblMessage.Text = "Some other problem with captcha.";
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (um.Login(txtUsername.Text, txtPassword.Text))
        {
            Session["user"] = new UserModel().getByUserName(txtUsername.Text);
           
            if (CheckBox1.Checked)
            {
                Response.Cookies["user"].Value = txtUsername.Text;
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(15);
            }
            
            new UserModel().createUserLoginLog(txtUsername.Text);
            Response.Redirect("~/Home.aspx");
        }
    }
}
