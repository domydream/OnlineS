using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
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
            u = (User)Session["user"];

            funame.Text = u.FullName;
            
            try
            {
                countMessage.Text = new MessageModel().getByUserID(u.UserID.ToString(), u.Phone, true).Rows.Count.ToString();
                countSMSService.Text = new UserServiceModel().getByUserService(u.UserID.ToString()).Rows[0]["quantity"].ToString();
            }
            catch (Exception)
            {
                countMessage.Text = "0";
                countSMSService.Text = "0";
            }


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
}

