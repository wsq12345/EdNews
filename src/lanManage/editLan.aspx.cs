using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_lanManage_editLan : System.Web.UI.Page
{
    public static string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../logon/index.aspx");
        Users m = (Users)Session["user"];
        if (m.username != "admin")
            Response.Redirect("../logon/manage.aspx");
        if (!this.Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"].ToString();
                LanMenu lan = LanMenu.getLanId(id);
                s = lan.lanName;
                TextBox1.Text = lan.lanName;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        LanMenu lan = new LanMenu();
        lan.lanName = TextBox1.Text;
        lan.lanId = Convert.ToInt32(Request.QueryString["id"].ToString());
        string sql = "select count(*) from lanMenu where lanName='" + lan.lanName + "'";
        if (Class1.excuint(sql) == 0 ||lan.lanName == s) 
        {
            if (LanMenu.editLan(lan))
                Response.Write("<script>alert('修改成功')</script>");
            else
                Response.Write("<script>alert('修改失败')</script>");
        }
        else
            Response.Write("<script>alert('栏目名已存在')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}