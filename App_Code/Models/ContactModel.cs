using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

/// <summary>
/// Summary description for ContactModel
/// </summary>
public class ContactModel
{
    ModelConnect connect;
  
	public ContactModel()
	{
        this.connect = DAL.getDAL();
	}

    public DataTable getContact(Dictionary<string,object> condition,string orderBy) {
        return this.connect.Select("[Contact]", condition, orderBy);
    }
    public DataTable getContact(Dictionary<string, object> condition)
    {
        return getContact(condition, null);
    }
    public DataTable getContact()
    {
        return getContact(null);
    }

    public DataTable getContactCustom(List<string> Columns, Dictionary<string, Object> Condition, string OrderBy) {
        DataTable datatable = this.connect.Selectcustom("[Contact]", Columns, Condition, OrderBy);

        if (datatable.Rows.Count > 0)       
        {
            return datatable;
        }

        else
        {
            return null;
        }
    }

    public DataTable getContactCustom(List<string> Columns, Dictionary<string, Object> Condition) {
        return getContactCustom(Columns, Condition, null);
    }
   
    public DataTable getContactCustom(List<string> Columns)
    {
        return getContactCustom(Columns, null);
    }

    public DataTable getByID(string id)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("ContactID", id);
        return getContact(condition); 
     
    }

    public void InsertContact(Contact Contact)
    {
        Dictionary<String, Object> map = new Dictionary<String, Object>();
     
        map.Add("userID", Contact.UserID);      
        map.Add("friendName", Contact.FriendName);
        map.Add("FriendNumber", Contact.FriendNumber);
        map.Add("status", Contact.Status);
       
        this.connect.Insert("[Contact]", map);
    }

    public void UpdateContact(Contact Contact)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("ContactID",Contact.ContactID );
        Dictionary<String, Object> map = new Dictionary<String, Object>();
        map.Add("contactID", Contact.ContactID);
        map.Add("userID", Contact.UserID);
        map.Add("friendID", Contact.FriendID);
        map.Add("friendName", Contact.FriendName);
        map.Add("FriendNumber", Contact.FriendNumber);
        map.Add("status", Contact.Status);
       
        this.connect.Update("[Contact]", map, condition); 
    }

    public void DeleteContact(Contact Contact) {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("ContactID", Contact.ContactID);
        this.connect.Delete("[Contact]", condition);
    }

    public DataTable getUserContact(int id){
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("userID", id);
        condition.Add("Status",1);
        return getContact(condition); 
    }



}