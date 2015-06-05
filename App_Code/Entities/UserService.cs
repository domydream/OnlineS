using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineSMS.App_Code.Entities
{
    public class UserService
    {
        public int UserID { get; set; }
        public int ServiceID { get; set; }
        public int Quantity { get; set; }
        public int State { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime ExpirationDate { get; set; }
    }

    
}