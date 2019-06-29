using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_addNews_index : System.Web.UI.Page
{
    Users u;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("index.aspx");
        u = (Users)Session["user"];
        DropDownList1.DataSource=Class1.excuDatSet("select * from lanMenu");
        DropDownList1.DataTextField = "lanName";
        DropDownList1.DataValueField = "lanId";
        DropDownList1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        news n = new news();
        n.newsName = TextBox1.Text;
        n.time = DateTime.Now.ToString("yyyy-MM-dd");
        n.hitCount = 0;
        n.lanId = Convert.ToInt32(DropDownList1.SelectedValue.Trim());
        n.uid = u.uid;
        n.contents = content1.Value;
        n.img = TextBox2.Text;
        if(news.addNews(n))
            Response.Write("<script>alert('发布成功')</script>");
        else
            Response.Write("<script>alert('发布失败')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("manage.aspx");
    }
}