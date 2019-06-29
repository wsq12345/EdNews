<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="src_userManage_addUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>增加用户</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            用户名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div>
            &nbsp;密码：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确认添加" />
&nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="取消" 
                Width="60px" />
        </div>
    </div>
    </form>
</body>
</html>
