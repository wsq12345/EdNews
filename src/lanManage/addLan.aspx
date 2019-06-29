<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addLan.aspx.cs" Inherits="src_lanManage_addLan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>增加栏目</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            栏目名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确认添加" />
&nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="返回" 
                Width="71px" />
        </div>
    </div>
    </form>
</body>
</html>
