using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Configuration;



/// <summary>

/// Summary description for DAL

/// </summary>

public class DAL
{



    public static ModelConnect getDAL()
    {

        string Conn = ConfigurationManager.ConnectionStrings["OnlineSMS"].ConnectionString;

        return new ModelConnect(Conn);

    }



}

