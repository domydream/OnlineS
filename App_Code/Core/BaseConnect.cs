﻿using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Data.SqlClient;

using System.Data;
using System.Configuration;



/// <summary>

/// Summary description for BaseConnect

/// </summary>

public class BaseConnect
{

    string conn;



    static SqlConnection connection = new SqlConnection();

    static SqlCommand command;

    static SqlDataAdapter adapter = new SqlDataAdapter();



    // Hàm khởi tạo và truyền thông tin của DataBase Server.
    
    public BaseConnect(string conn)
    {

        this.conn = conn;

    }

    // Hàm ket noi

    public void Connect()
    {

        try
        {

            // Tạo Connection thông qua Url

            connection = new SqlConnection(this.conn);

        }

        // Nếu không thành công ném lỗi ra ngoài.

        catch (SqlException ex)
        {

            System.Web.HttpContext.Current.Response.Write("Kết nối thất bại !lỗi:" + ex.Message);

        }

    }

    public void DisConnect()
    {

        // Nếu adapter chưa đóng. Đóng adapter

        if (adapter != null)
        {

            adapter.Dispose();

            adapter = null;

        }

        // Nếu statement chưa đóng. Đóng statement.

        if (command != null)
        {

            command.Dispose();

            command = null;

        }

        // Nếu connection chưa đóng. Đóng connection.

        if (connection != null)
        {

            connection.Close();

            connection = null;

        }

    }

    // Hàm thực thi câu lệnh Select lấy dữ liệu từ CSDL

    public DataTable excuteQuery(string Query, Dictionary<string, Object> Condition)
    {

        //nếu kết nối chưa đóng thì phải mở kết nối

        if (connection.State == ConnectionState.Closed)

            connection.Open();

        command = new SqlCommand(Query, connection);

        if (Condition != null)
        {

            foreach (string key in Condition.Keys)
            {

                Object valuekey = null;

                Condition.TryGetValue(key, out valuekey);

                command.Parameters.AddWithValue("@" + key, valuekey.ToString());

            }

        }

        adapter = new SqlDataAdapter(command);

        DataSet dataset = new DataSet();

        adapter.Fill(dataset);

        DisConnect();

        return dataset.Tables[0];

    }



    // Thức thi các câu lệnh Inser, Update, Delete

    //cau truy van dieu khien vd: update, insert

    public int executeNonQuery(string Query, Dictionary<string, Object> ColumnValues, Dictionary<string, Object> Condition)
    {

        if (connection.State == ConnectionState.Closed)

            connection.Open();

        command = new SqlCommand(Query, connection);

        if (ColumnValues != null)
        {

            foreach (string key in ColumnValues.Keys)
            {

                Object valuekey;

                ColumnValues.TryGetValue(key, out valuekey);

                command.Parameters.AddWithValue("@" + key, valuekey.ToString());

            }

        }

        if (Condition != null)
        {

            foreach (string key in Condition.Keys)
            {

                Object valuekey;

                Condition.TryGetValue(key, out valuekey);

                command.Parameters.AddWithValue("@" + key, valuekey.ToString());

            }



        }

        int count = command.ExecuteNonQuery();

        DisConnect();

        return count;

    }




}




