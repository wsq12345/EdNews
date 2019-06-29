using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
///Users 的摘要说明
/// </summary>
public class Users
{
	public Users()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public int uid;
    public string username;
    public string password;

    public static int getUidByName(string username)
    {
        string sql = "select uid from [user] where username='" + username+"'";
        SqlConnection con = Class1.create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        int uid = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return uid;
    }
    public static Users getUid(string id)
    {
        Users show = new Users();
        string sqlString = "select * from [user] where uid=" + id;
        SqlConnection con = Class1.create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlString, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            show.uid = Convert.ToInt32(sdr[0]);
            show.username = Convert.ToString(sdr[1]);
            show.password = Convert.ToString(sdr[2]);
        }
        con.Close();
        return show;
    }
    public static bool deleteUser(string id)
    {
        string sql = "delete from [news] where uid=" + id + ";delete from [user] where uid="+id;
        return Class1.excubool(sql);
    }
    public static bool editUser(Users u)
    {
        string sql = "update [user] set username='"+u.username+"', password='"+u.password+"' where uid="+u.uid+"";
        return Class1.excubool(sql);
    }
    public static bool addUser(Users u)
    {
        string sql = "insert into [user] (username,password) values('" + u.username + "', '" + u.password + "')";
        return Class1.excubool(sql);
    }
}