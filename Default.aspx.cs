using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Recaptcha.Web;
using System.Security.Cryptography;
using System.Text;
using OnlineSMS.App_Code.Entities;
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
            lblCapcha.Text = "Captcha cannot be empty.";
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
                try
                {
                    um.InsertUser(u);
                    Session["user"] = new UserModel().getByUserName(u.UserName);
                    UserProfile up = new UserProfile();
                    up.UserID = ((User)Session["user"]).UserID;
                    new UserProfileModel().InsertUserProfile(up);
                    UserService us = new UserService();
                    us.ServiceID = int.Parse(new ServicesModel().getServiceID("SMS"));
                    us.UserID = up.UserID;
                    us.Quantity = 5;
                    us.StartDate = DateTime.Now.ToString();
                    us.ExpirationDate = DateTime.Now.AddDays(30).ToString();
                    us.State = 1;
                    new UserServiceModel().InsertUserService(us);
                    Response.Redirect("~/MyProfile.aspx");      
                }
                catch (Exception)
                {
                    if (new UserModel().getByUserName(u.UserName) != null)
                    {
                        msgUser.Text = "UserName is exists! Please use another username";
                    }
                    if (new UserModel().getByPhoneNum(u.Phone) != null)
                    {
                        msgPhone.Text = "The phone number registed! Choose another phone number";
                    }
                }
              
            }                                        
            if (result == RecaptchaVerificationResult.IncorrectCaptchaSolution)
            {
                lblCapcha.Text = "Incorrect captcha response.";
            }
            else
            {
                lblCapcha.Text = "Some other problem with captcha.";
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsPostBack)
            {

            if (um.Login(txtUsername.Text, txtPassword.Text))
            {
                new UserModel().createUserLoginLog(txtUsername.Text);
                Session["user"] = new UserModel().getByUserName(txtUsername.Text);

                if (CheckBox1.Checked)
                {
                    Response.Cookies["user"].Value = txtUsername.Text;
                    Response.Cookies["user"].Expires = DateTime.Now.AddDays(15);
                }

                Response.Redirect("~/Home.aspx");
            }
            else
            {
                validateUser.Text = "Username/Password don't match, Try again!";
                validateUser.CssClass = "label-warning";
            }
            }
        }
        catch (Exception)
        {
            validateUser.Text = "Username/Password don't match, Try again!";
            validateUser.CssClass = "label-warning";
        }
        
    }
}
