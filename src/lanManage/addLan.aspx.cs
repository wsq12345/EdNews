using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_lanManage_addLan : System.Web.UI.Page
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
        LanMenu lan = new LanMenu();
        lan.lanName = TextBox1.Text;
        string sql = "select count(*) from lanMenu where lanName='" + lan.lanName + "'";
        if (Class1.excuint(sql) == 0)  
        {
            if (LanMenu.addLan(lan))
                Response.Write("<script>alert('创建成功')</script>");
            else
                Response.Write("<script>alert('创建失败')</script>");
        }
        else
            Response.Write("<script>alert('栏目名已存在')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}