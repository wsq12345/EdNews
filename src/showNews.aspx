<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showNews.aspx.cs" Inherits="src_showNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻页面</title>
    <link href="css/Style.css" type="text/css" rel="Stylesheet" />
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js" type="text/jscript"></script>
    <script type="text/jscript">
        $(document).ready(function () {
            var Id = ["<%=Id%>"];
            var Name = ["<%=Name%>"];
            for (var i = 0; i < Id.length; i++)
                $("#menu>ul").append("<a href=\"" + Id[i] + "\" target=\"_blank\"><li>" + Name[i] + "</li></a>");
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
         <div id="header"></div>
         <div id="menu">
            <ul>
                <a href="index.aspx"><li>首页</li></a>
            </ul>
            <div id="search"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="搜索" BackColor="#0099FF" 
                     ForeColor="White" Width="50px" onclick="Button1_Click" />
            </div>
        </div>
        <div id="divConter">
            <div id="show_title">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="text-align:center">         
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                &nbsp;
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </div>
             <div>
                 <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
             </div>
         </div>
         <div id="footer">
            <div id="logon">[<a href="logon/index.aspx" target="_blank">后台管理</a>]</div>
            版权所有© Copyright wsq
        </div>
    </div>
    </form>
</body>
</html>
