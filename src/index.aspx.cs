using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_index : System.Web.UI.Page
{
    public string pics;
    public string texts;
    public string links;
    public string Id;
    public string Name;
    public string lanid;
    public string lanname;
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Attributes.Add("Value", "请输入关键字");
        TextBox1.Attributes.Add("OnFocus", "if(this.value=='请输入关键字') {this.value=''}");
        TextBox1.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入关键字'}");
        GridView1.DataSource = Class1.excuDatSet("select * from View_News order by time");
        GridView1.DataBind();
        news.getImgs(ref pics, ref texts, ref links);
        LanMenu.getLan(ref Id, ref Name,ref lanid,ref lanname);
        string[] arry = lanname.Split(',');
        string[] sarry = lanid.Split(',');
        Label1.Text = arry[0]; 
        Label2.Text = arry[1];
        Label3.Text = arry[2];
        GridView2.DataSource = Class1.excuDatSet("select * from [news] where lanId="+sarry[0]);
        GridView2.DataBind();
        GridView3.DataSource = Class1.excuDatSet("select * from [news] where lanId=" + sarry[1]);
        GridView3.DataBind();
        GridView4.DataSource = Class1.excuDatSet("select * from [news] where lanId=" + sarry[2]);
        GridView4.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?newsName="+TextBox1.Text);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}