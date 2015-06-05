using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
	public User()
	{		
	}
   
    public int UserID { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string FullName { get; set; }
    public string Image { get; set; }
    public string CreateAt { get; set; }
    
    public string LastLogin { get; set; }


    

}