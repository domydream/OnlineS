using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Services
/// </summary>
public class Service
{
	public Service()
	{
		
	}
    public int ServiceID { get; set; }
    public string Name { get; set; }
    public string Contents { get; set; }
    public float Price { get; set; }
    public int State { get; set; }
}