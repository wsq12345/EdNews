using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_search : System.Web.UI.Page
{
    public string Id;
    public string Name;
    public string lanid;
    public string lanname;
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.EmptyDataText = "无结果";
        GridView2.EmptyDataText = "无结果";
        LanMenu.getLan(ref Id, ref Name, ref lanid, ref lanname);
        TextBox1.Attributes.Add("Value", "请输入关键字");
        TextBox1.Attributes.Add("OnFocus", "if(this.value=='请输入关键字') {this.value=''}");
        TextBox1.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入关键字'}");
        if (Request.QueryString["newsName"] != null)
        {
            string newsname = Request.QueryString["newsName"].ToString();
            GridView1.DataSource = Class1.excuDatSet("select top 10 * from [news] order by hitCount desc");
            GridView1.DataBind();
            GridView2.DataSource = Class1.excuDatSet("select * from View_News where newsName like '%" + newsname + "%'");
            GridView2.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?newsName=" + TextBox1.Text);
    }
}