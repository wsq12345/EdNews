using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

/// <summary>
///news 的摘要说明
/// </summary>
public class news
{
	public news()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public int newsId;
    public string newsName;
    public string time;
    public int hitCount;
    public int uid;
    public string contents;
    public int lanId;
    public string img;

    public static void getImgs(ref string pics,ref string texts,ref string links)
    {
        string sql = "select top 5 newsId,newsName,img from [news] where img<>'' order by hitcount";
        SqlConnection con = Class1.create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            pics += sdr[2].ToString() + "\",\"";
            texts += sdr[1].ToString() + "\",\"";
            links += "showNews.aspx?id=" + sdr[0].ToString() + "\",\"";
        }
        pics = pics.Substring(0, pics.Length - 3);
        texts = texts.Substring(0, texts.Length - 3);
        links = links.Substring(0, links.Length - 3);
    }
    public static news getNewsId(string id)
    {
        news show = new news();
        string sqlString = "select * from news where newsId="+id;
        SqlConnection con = Class1.create();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlString,con);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            show.newsId = Convert.ToInt32(sdr[0]);
            show.newsName = Convert.ToString(sdr[1]);
            show.time = Convert.ToString(sdr[2]);
            show.hitCount = Convert.ToInt32(sdr[3]);
            show.uid = Convert.ToInt32(sdr[4]);
            show.contents = Convert.ToString(sdr[5]);
            show.lanId = Convert.ToInt32(sdr[6]);
            show.img = Convert.ToString(sdr[7]);
        }
        con.Close();
        return show;
    }
    public static void addClick(string id)
    {
        string sql = "update [news] set hitCount=hitCount+1 where newsId=" + id;
        Class1.excuteSql(sql);
    }

    public static bool addNews(news n)
    {
        string sql = "insert into [news] (lanId,newsName,time,hitCount,uid,contents,img) values("
            + n.lanId + ",'" + n.newsName + "','" + n.time + "'," + n.hitCount + "," + n.uid + ",'"+n.contents+"','"+n.img+"')";
        return Class1.excubool(sql);
    }
    public static bool editNews(news n)
    {
        string sql = "update [news] set newsName='" + n.newsName + "', contents='" + n.contents +"',img='"+n.img+"', lanId=" + n.lanId
            +" where newsId="+n.newsId;
        return Class1.excubool(sql);
    }
    public static bool deleteNews(string id)
    {
        string sql = "delete from news where newsId=" + id;
        return Class1.excubool(sql);
    }
}