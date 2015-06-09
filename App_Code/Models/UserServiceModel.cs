using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using OnlineSMS.App_Code.Entities;

/// <summary>
/// Summary description for UserServiceModel
/// </summary>
public class UserServiceModel
{
    ModelConnect connect;
    public UserServiceModel()
    {
        this.connect = DAL.getDAL();
    }

    public DataTable getUserService(Dictionary<string, object> condition, string orderBy)
    {
        return this.connect.Select("UserService", condition, orderBy);
    }
    public DataTable getUserService(Dictionary<string, object> condition)
    {
        return getUserService(condition, null);
    }
    public DataTable getUserService()
    {
        return getUserService(null);
    }

    public DataTable getUserServiceCustom(List<string> Columns, Dictionary<string, Object> Condition, string OrderBy)
    {
        DataTable datatable = this.connect.Selectcustom("UserService", Columns, Condition, OrderBy);

        if (datatable.Rows.Count > 0)
        {
            return datatable;
        }

        else
        {
            return null;
        }
    }

    public DataTable getUserServiceCustom(List<string> Columns, Dictionary<string, Object> Condition)
    {
        return getUserServiceCustom(Columns, Condition, null);
    }

    public DataTable getUserServiceCustom(List<string> Columns)
    {
        return getUserServiceCustom(Columns, null);
    }

    public DataTable getByUserService(string userID)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("UserID", userID);
        condition.Add("ServiceID", "1002");
        return getUserService(condition);
    }

    public void InsertUserService(UserService UserService)
    {
        Dictionary<String, Object> map = new Dictionary<String, Object>();
        map.Add("userID", UserService.UserID);
        map.Add("ServiceID", UserService.ServiceID);
        map.Add("Quantity", UserService.Quantity);
        map.Add("State", UserService.State);
        map.Add("StartDate", UserService.StartDate);
        map.Add("ExpirationDate", UserService.ExpirationDate);

        this.connect.Insert("UserService", map);
    }

    public void UpdateUserService(UserService UserService)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("UserID", UserService.UserID);
        condition.Add("ServiceID", UserService.ServiceID);
        Dictionary<String, Object> map = new Dictionary<String, Object>();
        map.Add("userID", UserService.UserID);
        map.Add("ServiceID", UserService.ServiceID);
        map.Add("Quantity", UserService.Quantity);
        map.Add("State", UserService.State);
        map.Add("StartDate", UserService.StartDate);
        map.Add("ExpirationDate", UserService.ExpirationDate);
        this.connect.Update("UserService", map, condition);
    }
    public void decQuantitySMS(string userID)
    {
        try
        {
            Dictionary<String, Object> condition = new Dictionary<String, Object>();
            condition.Add("UserID", userID);
            condition.Add("ServiceID", new ServicesModel().getServiceID("SMS"));

            int i = int.Parse(this.getUserService(condition).Rows[0]["Quantity"].ToString());
            if (i > 0)
            {
                i = i - 1;
                Dictionary<String, Object> map = new Dictionary<String, Object>();
                map.Add("Quantity", i);
                this.connect.Update("UserService", map, condition);
            }
        }
        catch (Exception)
        {

            throw;
        }



    }
    public void DeleteUserService(UserService UserService)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("UserID", UserService.UserID);
        condition.Add("ServiceID", UserService.ServiceID);
        this.connect.Delete("UserService", condition);
    }




}