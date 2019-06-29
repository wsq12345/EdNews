<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="src_search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>搜索</title>
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
        <div id="divhot">
            <p>热点文章</p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                Width="300px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="newsId" 
                        DataNavigateUrlFormatString="showNews.aspx?id={0}" DataTextField="newsName" 
                        HeaderText="新闻名" Target="_blank" >
                    <ItemStyle HorizontalAlign="Center" CssClass="mlength"/>
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="hitCount" HeaderText="点击量" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
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
        <div id="newsList">
            <p>新闻显示列表</p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                Width="900px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="newsId" 
                        DataNavigateUrlFormatString="showNews.aspx?id={0}" DataTextField="newsName" 
                        HeaderText="新闻名" >
                    <ItemStyle HorizontalAlign="Center" CssClass="mlength"/>
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="time" DataFormatString="{0:yyyy-MM-dd}" 
                        HeaderText="发布时间" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="username" HeaderText="发布者" />
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
        <div id="footer">
             <div id="logon">[<a href="logon/index.aspx" target="_blank">后台管理</a>]</div>
              版权所有© Copyright wsq
        </div>
    </div>
    </form>
</body>
</html>
