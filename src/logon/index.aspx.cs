using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_logon_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
            Response.Redirect("manage.aspx");
        if (!this.Page.IsPostBack)   //防止页面执行多次导致验证码失效
            createCode();
        showTips(TextBox1, "请输入用户名");
        showTips(TextBox3, "请输入验证码");
        TextBox2.Attributes.Add("Value", "请输入密码");
        TextBox2.Attributes.Add("OnFocus", "if(this.value == '请输入密码'){this.value = '';this.type='password'}");
        TextBox2.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入密码';this.type='text'}");
    }
    public void showTips(TextBox a,string s)
    {
        a.Attributes.Add("Value", s);
        a.Attributes.Add("OnFocus", "if(this.value=='"+s+"') {this.value=''}");
        a.Attributes.Add("OnBlur", "if(this.value==''){this.value='"+s+"'}");
    }
    public void createCode()
    {
        char[] a = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
					'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        Random x = new Random();
        double m;
        int y;
        Label1.Text = "";
        for (int i = 0; i < 4; i++)
        {
            m = x.Next(36);
            y = (int)Math.Floor(m);
            Label1.Text += a[y];
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "")
        {
            Response.Write("<script>alert('用户名或密码不能为空!')</script>");
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            createCode();
        }
        else
        {
            string sqlString = "select count(*) from [user] where username='" + TextBox1.Text.Trim() +
                "' and password='" + TextBox2.Text.Trim() + "'";  //数据库中user是标识字段最后不要使用，如果一定要用加[]
            if (Class1.excuint(sqlString)!=0)
            {
                if (TextBox3.Text == Label1.Text)
                {
                    Users u = new Users();
                    u.username = TextBox1.Text;
                    u.uid = Users.getUidByName(u.username);
                    Session["user"] = u;
                    System.Web.Security.FormsAuthentication.SetAuthCookie(u.username, false);
                    Response.Redirect("manage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('验证码不正确!')</script>");
                    createCode();
                }
            }
            else
            {
                Response.Write("<script>alert('用户名或密码不正确!')</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                createCode();
            }
        }
     }
}