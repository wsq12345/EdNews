using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_logon_manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("index.aspx");
        Users u = (Users)Session["user"];
        Label1.Text = "你好，"+u.username;
        if (u.username == "admin")
        {
            GridView1.DataSource = Class1.excuDatSet("select * from View_News order by time desc");
            Button4.Visible = true;
            Button5.Visible = true;
        }
        else
        {
            GridView1.DataSource = Class1.excuDatSet("select * from View_News where username='"
                + u.username + "'order by time desc");  //用户获取自己的新闻
            Button4.Visible = false;
            Button5.Visible = false;
        }
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)   //退出登录
    {
        Session["user"] = null;
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Write("<script>window.close()</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)   //发布网页
    {
        Response.Redirect("addNews.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)   //修改密码
    {
        Response.Redirect("changePassword.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)   //编辑
    {
        LinkButton btn = (LinkButton)sender;  //点击的按钮
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;//获取所在行
        string id = gvr.Cells[0].Text;
        Response.Redirect("editNews.aspx?id=" + id);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)  //删除
    {
        LinkButton btn = (LinkButton)sender;  
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        string id = gvr.Cells[0].Text;
        if (news.deleteNews(id))
        {
            Response.Write("<script>alert('删除成功')</script>");
            GridView1.DataSource = Class1.excuDatSet("select * from View_News order by time desc");
            GridView1.DataBind();
        }
        else
            Response.Write("<script>alert('删除失败')</script>");
        
    }
    protected void Button4_Click(object sender, EventArgs e)  //栏目管理
    {
        Response.Redirect("../lanManage/Default.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("../userManage/Default.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}