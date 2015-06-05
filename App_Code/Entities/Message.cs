using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
	public Message()
	{
		
	}
   public const int STATUS_PENDING = 0;
   public const int STATUS_APROVED = 1;
   public const int STATUS_TRASH = 2;
    public int SmsID { get; set; }
    public int UserID { get; set; }
    public string FromPhoneNumber { get; set; }
    public string ToPhoneNumber { get; set; }
    public string Content { get; set; }
    public DateTime CreateAt { get; set; }
    public int Status { get; set; }
}