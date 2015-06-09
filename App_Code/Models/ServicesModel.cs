using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

/// <summary>D:\OnlineSMS\OnlineSMS\App_Code\model\ServicesModel.cs
/// Summary description for ServicesModel
/// </summary>
public class ServicesModel
{
    ModelConnect connect;
	public ServicesModel()
	{
        this.connect = DAL.getDAL();
	}

    public DataTable getServices(Dictionary<string,object> condition,string orderBy) {
        return this.connect.Select("[services]", condition, orderBy);
    }
    public DataTable getServices(Dictionary<string, object> condition)
    {
        return getServices(condition, null);
    }
    public DataTable getServices()
    {
        return getServices(null);
    }
    public string getServiceID(string ServiceName)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("Name", ServiceName);
        return getServices(condition).Rows[0]["ServiceID"].ToString(); 
    }
    public DataTable getServicesCustom(List<string> Columns, Dictionary<string, Object> Condition, string OrderBy) {
        DataTable datatable = this.connect.Selectcustom("[services]", Columns, Condition, OrderBy);

        if (datatable.Rows.Count > 0)       
        {
            return datatable;
        }

        else
        {
            return null;
        }
    }

    public DataTable getServicesCustom(List<string> Columns, Dictionary<string, Object> Condition) {
        return getServicesCustom(Columns, Condition, null);
    }
   
    public DataTable getServicesCustom(List<string> Columns)
    {
        return getServicesCustom(Columns, null);
    }

    public DataTable getByID(string id)
    {
        Dictionary<string, object> condition = new Dictionary<string, object>();
        condition.Add("ServiceID", id);
        return getServices(condition); 
     
    }

    public void InsertServices(Service Services)
    {
       
        Dictionary<String, Object> map = new Dictionary<String, Object>();     
        map.Add("Name", Services.Name);
        map.Add("contents", Services.Contents);
        map.Add("price", Services.Price);
        map.Add("state", Services.State);       
        this.connect.Insert("Services", map);
    }

    public void UpdateServices(Service Services)
    {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("ServicesID",Services.ServiceID );
        Dictionary<String, Object> map = new Dictionary<String, Object>();
 
        map.Add("Name", Services.Name);
        map.Add("contents", Services.Contents);
        map.Add("price", Services.Price);
        map.Add("state", Services.State);     
        this.connect.Update("[Services]", map, condition); 
    }

    public void DeleteServices(Service Services) {
        Dictionary<String, Object> condition = new Dictionary<String, Object>();
        condition.Add("ServicesID", Services.ServiceID);
        this.connect.Delete("[Services]", condition);
    }


}