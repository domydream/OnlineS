using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyMasterPage : System.Web.UI.MasterPage
{

    public User u = new User();
    public string active = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        lastlogin.Text = u.LastLogin;
        avatar.ImageUrl = u.Image;
        fullname.Text = u.FullName;   
        myID.Text = u.UserID.ToString();
        try
        {
            countRequest.Text = new ContactModel().getRequestContact(u.UserID).Rows.Count.ToString();
            smsremain.Text = "You have " + new UserServiceModel().getByUserService(u.UserID.ToString()).Rows[0]["quantity"].ToString() + " free sms remain";
            friendNumber.Enabled = true;                 
            content.Enabled = true;
            sendSMS.Visible = true;                
        }                                                                 
        catch (Exception)
        {   
            countRequest.Text = "0";
            smsremain.Text = "You can't send a SMS. Go to service to buy more sms";
            friendNumber.Enabled = false;               
            content.Enabled = false;
            sendSMS.Visible = false;
        }

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
        if(friendNumber.Text != "") {
            m.ToPhoneNumber = friendNumber.Text;
        }
        else
        {                                       
            m.ToPhoneNumber = friendNum.SelectedValue.ToString();
        }
         
        m.Content = content.Text;
        m.Status = 2; //for my outbox pending message
        m.CreateAt = DateTime.Now;
        try
        {
           //insert message for send contact
            new MessageModel().InsertMessage(m);     
           //insert message for receive contact
            try
            {
                m.UserID = new UserModel().getByPhoneNum(m.ToPhoneNumber).UserID;
                m.Status = 0;  //for friend inbox not view message
                new MessageModel().InsertMessage(m);
            }
            catch (Exception)
            {
                info.Text = "Error occur! please check your number phone";
                info.CssClass = "label-warning";                   
            }
            new UserServiceModel().decQuantitySMS(u.UserID.ToString());
          
            info.Text = "Your message was sent!";
            content.Text = "";
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception)
        {
            info.Text = "Error occur! please check your message";
            info.CssClass = "label-warning";
        }
      
       
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> ListUser(string prefixText)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineSMS"].ToString());

            con.Open();

            SqlCommand cmd = new SqlCommand("select * from [user] where phone like @Name+'%' or username like @Name+'%'", con);

            cmd.Parameters.AddWithValue("@Name", prefixText);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);
            //    BaseConnect sql = new BaseConnect(ConfigurationManager.ConnectionStrings["OnlineSMS"].ConnectionString);
            //    DataTable dt = sql.excuteQuery("SELECT * FROM [user] WHERE phone LIKE " + prefixText, null);
            //DataTable dt = new UserModel().getUser();

            List<string> Names = new List<string>();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Names.Add(dt.Rows[i]["username"].ToString());
            }

            return Names;
        }
        catch (Exception)
        {

            return null;
        }


    }



    protected void btnAddfriend_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FindFriend.aspx?key=" + findFriend.Text);
    }
}
