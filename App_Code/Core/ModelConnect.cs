using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Text;

using System.Data;



/// <summary>

/// Summary description for ModelConnect

/// </summary>

public class ModelConnect
{



    //Biến kết nối cơ bản

    private BaseConnect connect;



    // SELECT * FORM TableName WHERE Condition ORDER BY OrderBy;

    public DataTable Select(string TableName, Dictionary<string, Object> Condition, string OrderBy)
    {

        // Khai báo biến StringBuilder để tạo chuỗi Select.

        StringBuilder query = new StringBuilder("SELECT * FROM " + TableName);

        // Đưa câu lệnh điều kiện vào trong câu query

        this.AddCondition(query, Condition);

        // Đưa câu lệnh Order vào câu query

        this.AddOrderBy(query, OrderBy);

        // Chèn ký tự ';' vào cuối dòng lệnh của để cách các câu lệnh.

        query.Append(";");

        // Thực thi câu query và trả kết quả ra ngoài

        return this.connect.excuteQuery(query.ToString(), Condition);



    }

    // Hàm over load Select giảm OdrderBy parameter

    public DataTable Select(string TableName, Dictionary<string, Object> Condition)
    {

        return this.Select(TableName, Condition, null);

    }

    // Hàm over load Select giảm Condition paramter

    public DataTable Select(string TableName)
    {

        return this.Select(TableName, null);

    }



    //Select so dong nhat dinh

    public DataTable Selecttop(string TableName, Dictionary<string, Object> Condition, string OrderBy, int sodong)
    {



        StringBuilder query = new StringBuilder("SELECT top " + sodong + " * FROM " + TableName);

        // Đưa câu lệnh điều kiện vào trong câu query

        this.AddCondition(query, Condition);

        // Đưa câu lệnh Order vào câu query

        this.AddOrderBy(query, OrderBy);

        // Chèn ký tự ';' vào cuối dòng lệnh của để cách các câu lệnh.

        query.Append(";");

        // Thực thi câu query và trả kết quả ra ngoài

        return this.connect.excuteQuery(query.ToString(), Condition);



    }



    //Select mot so cot nhat dinh

    public DataTable Selectcustom(string TableName, List<string> Columns, Dictionary<string, Object> Condition, string OrderBy)
    {

        StringBuilder query = new StringBuilder("");

        //Đưa câu select vào trong cau query

        this.AddTableInfo(query, Columns, TableName);

        // Đưa câu lệnh điều kiện vào trong câu query

        this.AddCondition(query, Condition);

        // Đưa câu lệnh Order vào câu query

        this.AddOrderBy(query, OrderBy);

        // Chèn ký tự ';' vào cuối dòng lệnh của để cách các câu lệnh.

        query.Append(";");

        // Thực thi câu query và trả kết quả ra ngoài

        return this.connect.excuteQuery(query.ToString(), Condition);



    }

    //overide selectcustom

    public DataTable Selectcustom(string TableName, List<string> Columns, Dictionary<string, Object> Condition)
    {

        return this.Selectcustom(TableName, Columns, Condition, null);

    }

    //overide selectcustom

    public DataTable Selectcustom(string TableName, List<string> Columns)
    {

        return this.Selectcustom(TableName, Columns, null, null);

    }



    // Hàm thêm điều kiện vào query

    private void AddCondition(StringBuilder query, Dictionary<string, Object> Condition)
    {

        // Kiểm tra nếu condiotn khác null

        if (Condition != null)
        {

            query.Append(" WHERE ");

            foreach (string key in Condition.Keys)
            {

                query.Append(" " + key + "=@" + key + " AND");

            }

            //xoa chu AND o cuoi chuoi

            query = query.Remove(query.Length - 3, 3);

        }

    }

    // Hàm thêm điều kiện vào query

    private void AddTableInfo(StringBuilder query, List<string> Columns, string TableNm)
    {

        if (Columns != null)
        {

            query.Append("SELECT ");

            foreach (string key in Columns)
            {

                query.Append(" " + key + " ,");

            }

            //xoa chu AND o cuoi chuoi

            query = query.Remove(query.Length - 1, 1);

            //Add them cau from

            query.Append(" FROM " + TableNm);

        }

    }

    // Hàm thêm OrderBy vào query

    private void AddOrderBy(StringBuilder query, string OrderBy)
    {

        // Kiểm tra OrderBy khác null

        if (OrderBy != null)

            query.Append(" ORDER BY " + OrderBy);

    }



    // Hàm hỗ trợ Insert xuống CSDL.

    // INSERT INTO TableName (columnName...) VALUES (column Values...);

    public bool Insert(string TableName, Dictionary<string, Object> ColumnValues)
    {
        

        // Khai báo biến stringBuilder để tạo chuỗi Select.
     
        StringBuilder query = new StringBuilder("INSERT INTO " + TableName);

        // Khai báo biến StringBuilder để tạo chuỗi Column Values.

        StringBuilder valueInsert = new StringBuilder();



        query.Append("(");

        // Duyệt và đưa thông tin tên cột và giá trị của cột vào câu query

        foreach (string key in ColumnValues.Keys)
        {

            query.Append(key + ",");

            //Object valuekey = null;

            //ColumnValues.TryGetValue(key, out valuekey);



            valueInsert.Append("@" + key + ",");

        }

        // Cắt bớt ký tự ',' cuối câu

        query = query.Remove(query.ToString().Length - 1, 1);

        valueInsert = valueInsert.Remove(valueInsert.ToString().Length - 1, 1);



        // Đưa giá trị của cột vào câu query

        query.Append(") VALUES(" + valueInsert.ToString() + ")");

        // Chèn ký tự ';' vào cuối dòng lệnh của để cách các câu lệnh.

        query.Append(";");

        // Thực thi câu query và trả kết quả ra ngoài

        return this.connect.executeNonQuery(query.ToString(), ColumnValues, null) > 0;

    }

  

    // Hàm hỗ trợ Update CSDL

    // UPDATE TableName SET ColumnName = ColumnValue WHERE Condition;

    public bool Update(string TableName, Dictionary<string, Object> ColumnValues, Dictionary<string, Object> Condition)
    {

        // Khai báo biến stringBuilder để tạo chuỗi Select.

        StringBuilder query = new StringBuilder("UPDATE " + TableName + " SET ");



        // Duyệt và đưa thông tin tên cột và giá trị của cột vào câu query

        foreach (string key in ColumnValues.Keys)
        {

            query.Append(key + " = @" + key + ",");

        }

        // Cắt bớt ký tự ',' cuối câu

        query = query.Remove(query.ToString().Length - 1, 1);

        // Đưa câu lệnh điều kiện vào trong câu query

        this.AddCondition(query, Condition);

        // Chèn ký tự ';' vào cuối dòng lệnh của để cách các câu lệnh.

        query.Append(";");

        // Thực thi câu query và trả kết quả ra ngoài

        return this.connect.executeNonQuery(query.ToString(), ColumnValues, Condition) > 0;

    }



    // Hàm hỗ trợ DELETE trong CSDL

    // DELETE FROM TableName WHERE Condition.

    public bool Delete(string TableName, Dictionary<string, Object> Condition)
    {

        // Khai báo biến stringBuilder để tạo chuỗi Select.

        StringBuilder query = new StringBuilder("DELETE FROM " + TableName);

        // Đưa câu lệnh điều kiện vào trong câu query

        this.AddCondition(query, Condition);

        // Chèn ký tự ';' vào cuối dòng lệnh của để cách các câu lệnh.

        query.Append(";");

        // Thực thi câu query và trả kết quả ra ngoài

        return this.connect.executeNonQuery(query.ToString(), null, Condition) > 0;

    }



    // Đóng kết nối.

    public void Close()
    {

        this.connect.DisConnect();

    }



    // Hàm khởi tạo với các thông số kết nối DataBase Server.

    public ModelConnect(string conn)
    {

        this.connect = new BaseConnect(conn);

        this.connect.Connect();

    }

  

 

}

