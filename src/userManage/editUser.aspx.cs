using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_userManage_editUser : System.Web.UI.Page
{
    public static string s; //记录修改前用户名
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../logon/index.aspx");
        Users m = (Users)Session["user"];
        if(m.username!="admin")
            Response.Redirect("../logon/manage.aspx");
        if (!this.Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"].ToString();
                Users u = Users.getUid(id);
                s = u.username;
                TextBox1.Text = u.username;
                TextBox2.Text = u.password;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Users u = new Users();
        u.username = TextBox1.Text;
        u.password = TextBox2.Text;
        u.uid = Convert.ToInt32(Request.QueryString["id"].ToString());
        string sql="select count(*) from [user] where username='"+u.username+"'";
        if (Class1.excuint(sql) == 0 ||u.username==s) //数据库无已有用户名，或用户名未改变
        {
            if (Users.editUser(u))
                Response.Write("<script>alert('修改成功')</script>");
            else
                Response.Write("<script>alert('修改失败')</script>");
        }
        else
            Response.Write("<script>alert('用户名已存在')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}