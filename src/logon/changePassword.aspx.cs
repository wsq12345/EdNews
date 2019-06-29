using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_logon_changePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Users u = (Users)Session["user"];
        if (TextBox2.Text != TextBox3.Text)
        {
            Response.Write("<script>alert('两次密码输入不一致!')</script>");
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
        else
        {
            string sqlString = "select count(*) from [user] where username='" + u.username +
                "' and password='" + TextBox1.Text.Trim() + "'";
            if (Class1.excuint(sqlString)!=0)
            {
                string sql = "update [user] set password='" + TextBox2.Text + "' where username='"
                    +u.username+"'";
                Class1.excuteSql(sql);
                Response.Write("<script>alert('修改成功!')</script>");
            }
            else
                Response.Write("<script>alert('原密码错误!')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("manage.aspx");
    }
}