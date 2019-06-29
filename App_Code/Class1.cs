using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Text.RegularExpressions;

/// <summary>
///Class1 的摘要说明
/// </summary>
public class Class1
{
	public Class1()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static void excuteSql(string sqlString)      //执行sql语句
    {
        SqlConnection con = create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlString, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public static SqlConnection create()      //创建数据库
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString);
        return con;
    }
    public static DataSet excuDatSet(string sqlString)   //获取news内容
    {
        SqlConnection con = create();
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sqlString, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        con.Close();
        return ds;
    }
    public static int excuint(string sqlString)      //查询用户名密码
    {
        SqlConnection con = create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlString, con);
        int count = 0;
        count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return count;
    }
    public static bool excubool(string sqlString)       //判断插入是否成功
    {
        SqlConnection con = create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlString, con);
        bool count = true;
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch
        {
            count = false;
        }
        con.Close();
        return count;
    }
}