<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="src_logon_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录</title>
    <link href="../css/Style.css" type="text/css" rel="Stylesheet" />
</head>
<body id="logon_box">
    <form id="form1" runat="server">
    <div id="userlogon">
        <table>
            <tr>
                <td>用户名：</td>
                <td>
    <asp:TextBox ID="TextBox1" runat="server" Width="126px" ForeColor="#CCCCCC"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="124px" ForeColor="#CCCCCC"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    
                    <asp:TextBox ID="TextBox3" runat="server" Width="116px" ForeColor="#CCCCCC"></asp:TextBox>
                    
                    <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#999999" 
                        Font-Bold="True" Font-Italic="True" ForeColor="#0033CC" Width="50px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="登录" 
                        BackColor="#0066FF" ForeColor="White" Width="87px" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
