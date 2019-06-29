using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_showNews : System.Web.UI.Page
{
    public string Id;
    public string Name;
    public string lanid;
    public string lanname;
    protected void Page_Load(object sender, EventArgs e)
    {
        LanMenu.getLan(ref Id, ref Name, ref lanid, ref lanname);
        TextBox1.Attributes.Add("Value", "请输入关键字");
        TextBox1.Attributes.Add("OnFocus", "if(this.value=='请输入关键字') {this.value=''}");
        TextBox1.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入关键字'}");
        if (Request.QueryString["id"] != null)
        {
            string id = Request.QueryString["id"].ToString();
            news n = news.getNewsId(id);
            news.addClick(id);
            Label1.Text = n.newsName;
            Label2.Text = "发布时间："+n.time.ToString();
            Label3.Text = "点击量："+n.hitCount.ToString();
            Label4.Text = n.contents;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?newsName=" + TextBox1.Text);
    }
}