using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Contact
/// </summary>
public class Contact
{

	public Contact()
	{
		
	}
    public int ContactID { get; set; }
    public int UserID { get; set; }
    public int FriendID { get; set; }
    public string FriendName { get; set; }
    public string FriendNumber { get; set; }
    public int Status { get; set; }
}