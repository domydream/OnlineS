using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfile : System.Web.UI.Page
{
    User u = new User();
    UserProfile up = new UserProfile();
    protected void Page_Load(object sender, EventArgs e)
    {
        ((MyMasterPage)Master).active = "profile";
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
            this.u = (User)Session["user"];
            up = new UserProfileModel().getByUserID(u.UserID.ToString());
            if (!IsPostBack)
            {
                lblFullname.Text = profile_name.Text = u.FullName;
                profile_work.Text = up.WorkStatus;
                Image1.ImageUrl = u.Image;
                ImgPrv.ImageUrl = u.Image;
                lblPhone.Text = u.Phone;
                lblEmail.Text = u.Email;
                lbUsename.Text = u.UserName;
                lblCollege.Text = up.College;
                lblCuisine.Text = up.Cuisine;
                lblDesignation.Text = up.Designation;
                lblDOB.Text = up.DateOfBirth;
                string gender;
                if (up.Gender == 1)
                {
                    male.Checked = true;
                    gender = "male";
                }
                else
                {
                    gender = "female";
                    fmale.Checked = true;
                };
                lblGender.Text = gender;
                lblHobies.Text = up.Hobbies;
                lblOrganization.Text = up.Organization;
                lblQualification.Text = up.Qualification;
                lblSchool.Text = up.School;
                lblSport.Text = up.Sport;
                txtDesignation.Text = up.Designation;
                txtCollege.Text = up.College;
                txtCuisine.Text = up.Cuisine;
                txtDOB.Text = up.DateOfBirth;
                txtEmail.Text = u.Email;
                txtFullname.Text = u.FullName;
                txtHobies.Text = up.Hobbies;
                txtOrganization.Text = up.Organization;
                txtPhone.Text = u.Phone;
                txtQualification.Text = up.Qualification;
                txtSchool.Text = up.School;
                txtSport.Text = up.Sport;
                txtWork.Text = up.WorkStatus;
                if (up.Gender == 1)
                {
                    male.Checked = true;
                }
                else
                {
                    fmale.Checked = true;
                }
            }
        }
    }
    protected void imgUpload_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (flupImage.HasFile)
            {
                string fileURL= u.Image;
                if (File.Exists(@fileURL))
                File.Delete(@fileURL);         
                u.Image = "Images/" + flupImage.PostedFile.FileName;
                new UserModel().UpdateUser(u);
                flupImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + flupImage.PostedFile.FileName);
                Response.Redirect("~/MyProfile.aspx");
            }
        }
    }
    protected void changepass_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

            if (new UserModel().Login(u.UserName, oldpass.Text))
            {

                if (newpass.Text.Equals(retype.Text))
                {
                    string newp = new UserModel().GetMD5HashData(newpass.Text);
                    new UserModel().ChangePassword(u.UserID, newp);
                    Session.Clear();
                    Request.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
                    Response.Redirect("~/Default.aspx");
                }
            }

        }
    }
    protected void editProfile_Click(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            u.FullName = txtFullname.Text;
            u.Email = txtEmail.Text;
            up.College = txtCollege.Text;
            up.Cuisine = txtCuisine.Text;
            up.DateOfBirth = txtDOB.Text;
            up.Designation = txtDesignation.Text;
            if (male.Checked)
            {
                up.Gender = 1;
            }
            else { up.Gender = 0; }
            up.Hobbies = txtHobies.Text;
            up.Organization = txtOrganization.Text;
            up.Qualification = txtQualification.Text;
            up.School = txtSchool.Text;
            up.Sport = txtSport.Text;
            up.WorkStatus = txtWork.Text;
      
            new UserProfileModel().UpdateUserProfile(up);
            new UserModel().UpdateUser(u);
            Session["user"] = u;
            Response.Redirect("~/MyProfile.aspx");
        }
    }
}