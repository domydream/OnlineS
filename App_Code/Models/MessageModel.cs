using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

/// <summary>
/// Summary description for MessageModel
/// </summary>
public class MessageModel
{
    ModelConnect connect;
	public MessageModel()
	{
        this.connect = DAL.getDAL();
	}

    public DataTable getMessage(Dictionary<string,object> condition,string orderBy) {
        return this.connect.Select("SMSData", condition, orderBy);
    }
    public DataTable getMessage(Dictionary<string, object> condition)
    {
        return getMessage(condition, null);
    }
    public DataTable getMessage()
    {
        return getMessage(null);
    }

    public DataTable getMessageCustom(List<string> Columns, Dictionary<string, Object> Condition, string OrderBy) {
        DataTable datatable = this.connect.Selectcustom("SMSData", Columns, Condition, OrderBy);

        if (datatable.Rows.Count > 0)       
        {
            return datatable;
        }

        else
        {
            return null;
        }
    }

    public DataTable getMessageCustom(List<string> Columns, Dictionary<string, Object> Condition) {
        return getMessageCustom(Columns, Condition, null);
    }
   
    public DataTable getMessageCustom(List<string> Columns)
    {
        return getMessageCustom(Columns, null);
    }

    public DataTable getByUserID(string id,string number, bool inbox)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("UserID", id);
        if (inbox)
        {
            condition.Add("ToPhoneNumber", number);
            condition.Add("status", 0);
        }
        else condition.Add("FromPhoneNumber", number);
        return getMessage(condition); 
     
    }

    public void InsertMessage(Message Message)
    {
        Dictionary<String, Object> map = new Dictionary<String, Object>();
        map.Add("UserID",Message.UserID);
        map.Add("FromPhoneNumber", Message.FromPhoneNumber);
        map.Add("ToPhoneNumber", Message.ToPhoneNumber);
        map.Add("contents", Message.Content);
        map.Add("create_at", Message.CreateAt);
        map.Add("status", Message.Status);
       
        this.connect.Insert("SMSData", map);
    }

    //public void UpdateMessage(Message Message)
    //{
    //    Dictionary<String, Object> condition = new Dictionary<String, Object>();
    //    condition.Add("MessageID",Message.SmsID );
    //    condition.Add("UserID", Message.UserID);
    //    Dictionary<String, Object> map = new Dictionary<String, Object>();
    //    map.Add("FromPhoneNumber", Message.FromPhoneNumber);
    //    map.Add("ToPhoneNumber", Message.ToPhoneNumber);
    //    map.Add("contents", Message.Content);
    //    map.Add("create_at", Message.CreateAt);
    //    map.Add("status", Message.Status);
    //    this.connect.Update("SMSData", map, condition); 
    //}

    public void DeleteMessage(Message Message)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("MessageID", Message.SmsID);
        this.connect.Delete("SMSData", condition);
    }


    //public DataTable getInbox(string userPhone)
    //{
    //     Dictionary<string, object> condition = new Dictionary<string, object>();
    //    condition.Add("ToPhoneNumber", userPhone);
    //    return getMessage(condition);
    //}
    //  public DataTable getOutBox(string userPhone)
    //{
    //     Dictionary<string, object> condition = new Dictionary<string, object>();
    //    condition.Add("FromPhoneNumber", userPhone);
    //    return getMessage(condition);
    //}

}