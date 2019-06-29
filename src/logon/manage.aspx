<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="src_logon_manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理</title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1186863_2cc0d37veos.css">
    <link href="../css/Style.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
        <div id="manage_header">
            <div style="float:left">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
        
            <div style="float:right;text-align:center;" id="manage_right">
                <i class="iconfont icon-wode"></i>
                <br />
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="修改密码" />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="退出系统" />
            </div>
        </div>
        <div id="tools">
            <asp:Button ID="Button2" runat="server" Text="发布新闻" onclick="Button2_Click" />
        &nbsp;<asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="栏目管理" />
&nbsp;<asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="用户管理" />
        </div>
        <div id="main">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="666px" AllowPaging="True" 
                PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="newsId" HeaderText="编号">
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="newsId" 
                        DataNavigateUrlFormatString="../showNews.aspx?id={0}" DataTextField="newsName" 
                        HeaderText="新闻名" Target="_blank">
                    <ItemStyle HorizontalAlign="Center" Width="200px" CssClass="mlength"/>
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="username" HeaderText="编写人">
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="time" DataFormatString="{0:yyyy-MM-dd}" 
                        HeaderText="发布时间">
                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="lanName" HeaderText="栏目名">
                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="hitCount" HeaderText="点击量">
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">编辑</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">删除</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="120px" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <div id="manage_footer">
              版权所有© Copyright wsq
        </div>
    </div>
    </form>
</body>
</html>
