using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_userManage_addUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../logon/index.aspx");
        Users m = (Users)Session["user"];
        if (m.username != "admin")
            Response.Redirect("../logon/manage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Users u = new Users();
        u.username = TextBox1.Text;
        u.password = TextBox2.Text;
        string sql = "select count(*) from [user] where username='" + u.username + "'";
        if (Class1.excuint(sql) == 0)  //防止创建重复用户
        {
            if (Users.addUser(u))
                Response.Write("<script>alert('创建成功')</script>");
            else
                Response.Write("<script>alert('创建失败')</script>");
        }
        else
            Response.Write("<script>alert('用户名已存在')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}