using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserProfile
/// </summary>
public class UserProfile
{
    public int ProfileID { get; set; }
    public int UserID { get; set; }
    public string DateOfBirth { get; set; }
    public int Gender { get; set; }
    public string Qualification { get; set; }
    public string School { get; set; }
    public string College { get; set; }
    public string WorkStatus { get; set; }
    public string Organization { get; set; }
    public string Designation { get; set; }
    public string Hobbies { get; set; }
    public string Cuisine { get; set; }
    public string Sport { get; set; }

	public UserProfile()
	{
		
	}

}