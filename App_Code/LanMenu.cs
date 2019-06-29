using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
///LanMenu 的摘要说明
/// </summary>
public class LanMenu
{
	public LanMenu()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public int lanId;
    public string lanName;

    public static void getLan(ref string Id, ref string Name, ref string lanid, ref string lanname)
    {
        string sql = "select top 5 lanId,lanName from lanMenu order by lanId";
        SqlConnection con = Class1.create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            Id += "showlist.aspx?id=" + sdr[0].ToString() + "\",\"";
            Name += sdr[1].ToString() + "\",\"";
            lanid += sdr[0].ToString() + ",";
            lanname += sdr[1].ToString() + ",";
        }
        Id = Id.Substring(0, Id.Length - 3);
        Name = Name.Substring(0, Name.Length - 3);
        lanid = lanid.Substring(0, lanid.Length - 1);
        lanname = lanname.Substring(0, lanname.Length - 1);
    }
    public static LanMenu getLanId(string id)
    {
        LanMenu show = new LanMenu();
        string sqlString = "select * from lanMenu where lanId=" + id;
        SqlConnection con = Class1.create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlString, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            show.lanId = Convert.ToInt32(sdr[0]);
            show.lanName = Convert.ToString(sdr[1]);
        }
        con.Close();
        return show;
    }
    public static bool deleteLan(string id)
    {
        string sql = "delete from [news] where lanId=" + id + ";delete from lanMenu where lanId="+id;
        return Class1.excubool(sql);
    }
    public static bool editLan(LanMenu lan)
    {
        string sql = "update lanMenu set lanName='" +lan.lanName+ "' where lanId=" + lan.lanId + "";
        return Class1.excubool(sql);
    }
    public static bool addLan(LanMenu lan)
    {
        string sql = "insert into lanMenu (lanName) values('" + lan.lanName+"')";
        return Class1.excubool(sql);
    }
}