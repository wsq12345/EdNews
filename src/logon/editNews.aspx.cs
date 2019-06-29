using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_logon_editNews : System.Web.UI.Page
{
    Users u;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("index.aspx");
        u = (Users)Session["user"];
        if (!this.Page.IsPostBack)
        {
            DropDownList1.DataSource = Class1.excuDatSet("select * from lanMenu");
            DropDownList1.DataTextField = "lanName";
            DropDownList1.DataValueField = "lanId";
            DropDownList1.DataBind();
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"].ToString();
                news n = news.getNewsId(id);
                TextBox1.Text = n.newsName;
                content1.Value = n.contents;
                TextBox2.Text = n.img;
                foreach (ListItem x in DropDownList1.Items)
                {
                    if (x.Value == n.lanId.ToString())
                        x.Selected = true;
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        news n = new news();
        n.newsName = TextBox1.Text;
        n.contents = content1.Value;
        n.lanId = Convert.ToInt32(DropDownList1.SelectedValue.Trim());
        n.newsId = Convert.ToInt32(Request.QueryString["id"].ToString());
        n.img = TextBox2.Text;
        if(news.editNews(n))
             Response.Write("<script>alert('修改成功')</script>");
        else
            Response.Write("<script>alert('修改失败')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("manage.aspx");
    }
}