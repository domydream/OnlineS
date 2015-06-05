using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

/// <summary>D:\OnlineSMS\OnlineSMS\App_Code\model\UserProfileModel.cs
/// Summary description for UserProfileModel
/// </summary>
public class UserProfileModel
{
    ModelConnect connect;
	public UserProfileModel()
	{
        this.connect = DAL.getDAL();
	}

    public DataTable getUserProfile(Dictionary<string,object> condition,string orderBy) {
        return this.connect.Select("UserProfile", condition, orderBy);
    }
    public DataTable getUserProfile(Dictionary<string, object> condition)
    {
        return getUserProfile(condition, null);
    }
    public DataTable getUserProfile()
    {
        return getUserProfile(null);
    }

    public DataTable getUserProfileCustom(List<string> Columns, Dictionary<string, Object> Condition, string OrderBy) {
        DataTable datatable = this.connect.Selectcustom("UserProfile", Columns, Condition, OrderBy);

        if (datatable.Rows.Count > 0)       
        {
            return datatable;
        }

        else
        {
            return null;
        }
    }

    public DataTable getUserProfileCustom(List<string> Columns, Dictionary<string, Object> Condition) {
        return getUserProfileCustom(Columns, Condition, null);
    }
   
    public DataTable getUserProfileCustom(List<string> Columns)
    {
        return getUserProfileCustom(Columns, null);
    }
    public DataTable getbyID(string id)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("UserID", id);
        return  getUserProfile(condition);
    }
    public UserProfile getByUserID(string id)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("UserID", id);
        DataTable dt =  getUserProfile(condition);
        UserProfile u = new UserProfile();
        if (dt.Rows.Count > 0)
        {
            u.ProfileID = int.Parse(dt.Rows[0]["ProfileID"].ToString());
            u.UserID = int.Parse(dt.Rows[0]["UserID"].ToString());
            u.DateOfBirth = dt.Rows[0]["DateOfBirth"].ToString();
            u.Gender = int.Parse(dt.Rows[0]["Gender"].ToString());
            u.Qualification = dt.Rows[0]["qualification"].ToString();
            u.School = dt.Rows[0]["school"].ToString();
            u.College = dt.Rows[0]["college"].ToString();
            u.WorkStatus = dt.Rows[0]["workstatus"].ToString();
            u.Organization = dt.Rows[0]["organization"].ToString();
            u.Designation = dt.Rows[0]["designation"].ToString();
            u.Hobbies = dt.Rows[0]["hobbies"].ToString();
            u.Cuisine = dt.Rows[0]["cuisine"].ToString();           
            u.Sport = dt.Rows[0]["sport"].ToString();
        }
        return u;     
    }

    public void InsertUserProfile(UserProfile UserProfile)
    {
       
        Dictionary<String, Object> map = new Dictionary<String, Object>();     
        map.Add("UserID", UserProfile.UserID);
        map.Add("Gender", 0);


        this.connect.Insert("UserProfile", map);
    }

    public void UpdateUserProfile(UserProfile UserProfile)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("ProfileID",UserProfile.ProfileID );
        Dictionary<String, Object> map = new Dictionary<String, Object>();

        map.Add("DateOfBirth", UserProfile.DateOfBirth);
        map.Add("Gender", UserProfile.Gender);
        map.Add("qualification", UserProfile.Qualification);
        map.Add("school", UserProfile.School);
        map.Add("college", UserProfile.College);
        map.Add("workstatus", UserProfile.WorkStatus);
        map.Add("organization", UserProfile.Organization);
        map.Add("designation", UserProfile.Designation);
        map.Add("hobbies", UserProfile.Hobbies);
        map.Add("cuisine", UserProfile.Cuisine);
        map.Add("sport", UserProfile.Sport);       
        this.connect.Update("UserProfile", map, condition); 
    }

    public void DeleteUserProfile(UserProfile UserProfile) {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("UserProfileID", UserProfile.ProfileID);
        this.connect.Delete("UserProfile", condition);
    }


}