using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_userManage_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../logon/index.aspx");
        Users u = (Users)Session["user"];
        Label1.Text = "欢迎你，" + u.username;
        if(u.username!="admin")     //防止非admin用户进入用户管理界面
            Response.Redirect("../logon/manage.aspx");
        GridView1.DataSource = Class1.excuDatSet("select * from [user] where username<>'admin' order by uid");
        GridView1.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        string id = gvr.Cells[0].Text;
        Response.Redirect("editUser.aspx?id=" + id);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        string id = gvr.Cells[0].Text;
        if (Users.deleteUser(id))
        {
            Response.Write("<script>alert('删除成功')</script>");
            GridView1.DataSource = Class1.excuDatSet("select * from [user] where username<>'admin' order by uid");
            GridView1.DataBind();
        }
        else
            Response.Write("<script>alert('删除失败')</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("addUser.aspx");
    }
}