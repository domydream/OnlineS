using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserModel
/// </summary>
public class UserModel
{
    ModelConnect connect;
	public UserModel()
	{
        this.connect = DAL.getDAL();
	}

    public DataTable getUser(Dictionary<string,object> condition,string orderBy) {
        return this.connect.Select("[User]", condition, orderBy);
    }
    public DataTable getUser(Dictionary<string, object> condition)
    {
        return getUser(condition, null);
    }
    public DataTable getUser()
    {
        return getUser(null);
    }

    public DataTable getUserCustom(List<string> Columns, Dictionary<string, Object> Condition, string OrderBy) {
        DataTable datatable = this.connect.Selectcustom("[User]", Columns, Condition, OrderBy);

        if (datatable.Rows.Count > 0)       
        {
            return datatable;
        }

        else
        {
            return null;
        }
    }

    public DataTable getUserCustom(List<string> Columns, Dictionary<string, Object> Condition) {
        return getUserCustom(Columns, Condition, null);
    }
   
    public DataTable getUserCustom(List<string> Columns)
    {
        return getUserCustom(Columns, null);
    }

    public User getByUserName(string Username)
    {
        User u = new User();
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("UserName", Username);
        DataTable dt= getUser(condition);
        u.UserID = int.Parse( dt.Rows[0]["UserID"].ToString());
        u.UserName = dt.Rows[0]["UserName"].ToString();
        u.Email = dt.Rows[0]["Email"].ToString();
        u.Phone = dt.Rows[0]["phone"].ToString();
        u.FullName = dt.Rows[0]["fullname"].ToString();
        u.Image = dt.Rows[0]["image"].ToString();
        u.CreateAt = dt.Rows[0]["create_at"].ToString();
        u.LastLogin = dt.Rows[0]["last_login"].ToString();
        return u;
     
    }
    public User getByPhoneNum(string Username)
    {
        User u = new User();
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("phone", Username);
        DataTable dt = getUser(condition);
        u.UserID = int.Parse(dt.Rows[0]["UserID"].ToString());
        u.UserName = dt.Rows[0]["UserName"].ToString();
        u.Email = dt.Rows[0]["Email"].ToString();
        u.Phone = dt.Rows[0]["phone"].ToString();
        u.FullName = dt.Rows[0]["fullname"].ToString();
        u.Image = dt.Rows[0]["image"].ToString();
        u.CreateAt = dt.Rows[0]["create_at"].ToString();
        u.LastLogin = dt.Rows[0]["last_login"].ToString();
        return u;

    }

    public void InsertUser(User user)
    {
        Dictionary<String, Object> map = new Dictionary<String, Object>();  
        map.Add("username", user.UserName);
        map.Add("password", user.Password);
        map.Add("email", user.Email);
        map.Add("phone", user.Phone);
        map.Add("fullname", user.FullName);
        map.Add("image", user.Image);
        map.Add("create_at",user.CreateAt);
        map.Add("last_login",user.LastLogin);     
        this.connect.Insert("[User]", map);
    }

    public void UpdateUser(User user)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("userID",user.UserID );
        Dictionary<String, Object> map = new Dictionary<String, Object>();              
        map.Add("email", user.Email);
        map.Add("phone", user.Phone);
        map.Add("fullname", user.FullName);
        map.Add("image", user.Image);             
        this.connect.Update("[user]", map, condition); 
    }
    public void createUserLoginLog(string Username)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("UserName", Username);
        Dictionary<String, Object> map = new Dictionary<String, Object>();
        map.Add("last_login", DateTime.Now.ToString());
        this.connect.Update("[user]", map, condition); 
    }
    public void DeleteUser(User user) {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("userID", user.UserID);
        this.connect.Delete("user", condition);
    }
    public void ChangePassword(int id,string newpass)
    {              
            Dictionary<String, Object> condition = new Dictionary<String, Object>();
            condition.Add("userID", id);
            Dictionary<String, Object> map = new Dictionary<String, Object>();
            map.Add("Password", newpass);
            this.connect.Update("[user]", map, condition);     
    }
    public bool Login(string userName, string password)
    {

        Dictionary<String, Object> condition = new Dictionary<String, Object>();      
        condition.Add("username", userName);
        List<string> Columns = new List<string>();

        Columns.Add("username");

        Columns.Add("password");

        UserModel Userctr = new UserModel();

        DataTable tableUser = Userctr.getUserCustom(Columns, condition);

        if (tableUser.Rows.Count > 0)
        {

            string thePass = tableUser.Rows[0]["password"].ToString();

            if (ValidateMD5HashData(password,thePass))
            {
                return true;
            }

        }

        return false;
    }

    public DataTable GetSentItems(User user)
    {
        MessageModel sms = new MessageModel();
         Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("FromPhoneNumber",user.Phone);
        condition.Add("status", Message.STATUS_APROVED);
        return sms.getMessageCustom(null,condition);
    }
    public DataTable GetReceivedItems(User user)
    {
        MessageModel sms = new MessageModel();
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("ToPhoneNumber", user.Phone);
        condition.Add("status", Message.STATUS_APROVED);
        return sms.getMessageCustom(null, condition);
    }


    public List<User> Search(string key)
    {
        try
        {
            List<User> list = new List<User>();

            SqlConnection con= new SqlConnection( ConfigurationManager.ConnectionStrings["OnlineSMS"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [user] where phone like @Name+'%' or username like @Name+'%'");
            cmd.Parameters.AddWithValue("@Name", key);
            SqlDataAdapter da = new SqlDataAdapter(cmd);    
            DataTable dt = new DataTable();  
            da.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                User u = new User();
                u.UserID = int.Parse(dt.Rows[i]["UserID"].ToString());
                u.UserName = dt.Rows[i]["UserName"].ToString();
                u.Email = dt.Rows[i]["Email"].ToString();
                u.Phone = dt.Rows[i]["phone"].ToString();
                u.FullName = dt.Rows[i]["fullname"].ToString();
                u.Image = dt.Rows[i]["image"].ToString();
                u.CreateAt = dt.Rows[i]["create_at"].ToString();
                u.LastLogin = dt.Rows[i]["last_login"].ToString();
                list.Add(u);
            }
            return list;
        }
        catch (Exception)
        {
            return null;
        }
       
    }


    public string GetMD5HashData(string data)
    {
        //create new instance of md5
        MD5 md5 = MD5.Create();

        //convert the input text to array of bytes
        byte[] hashData = md5.ComputeHash(Encoding.Default.GetBytes(data));

        //create new instance of StringBuilder to save hashed data
        StringBuilder returnValue = new StringBuilder();

        //loop for each byte and add it to StringBuilder
        for (int i = 0; i < hashData.Length; i++)
        {
            returnValue.Append(hashData[i].ToString());
        }

        // return hexadecimal string
        return returnValue.ToString();
    }
    public bool ValidateMD5HashData(string inputData, string storedHashData)
    {
        //hash input text and save it string variable
        string getHashInputData = GetMD5HashData(inputData);

        if (string.Compare(getHashInputData, storedHashData) == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}