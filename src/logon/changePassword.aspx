<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="src_logon_changePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>修改密码</title>
    <link href="../css/Style.css" type="text/css" rel="Stylesheet" />
</head>
<body id="logon_box">
    <form id="form1" runat="server">
    <div id="userlogon">
    
        <table>
            <tr>
                <td>
                    原密码：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="110px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    新密码：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="110px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    确认密码：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="110px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="Button1" runat="server" Text="确认" onclick="Button1_Click" />
                </td>
                <td align="center">
                    <asp:Button ID="Button2" runat="server" Text="取消" onclick="Button2_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
