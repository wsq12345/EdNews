<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="src_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻主页</title>
    <link href="css/Style.css" type="text/css" rel="Stylesheet" />
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <script type="text/jscript" language="javascript">
             $(document).ready(function () {
                 var img = ["<%=pics%>"];
                 var k = 0;
                 var title = ["<%=texts%>"];
                 var links = ["<%=links%>"];
                 var Id = ["<%=Id%>"];
                 var Name = ["<%=Name%>"];
                 for (var i = 0; i < Id.length; i++)
                     $("#menu>ul").append("<a href=\"" + Id[i] + "\" target=\"_blank\"><li>" + Name[i] + "</li></a>");
                 for (var i = 0; i < title.length; i++)
                     $("#dot>ul").append("<li>●</li>");
                 function init() {
                     $("#pic").attr("src", img[k]);
                     $("#text").text(title[k]);
                     $("#imgLink").attr("href", links[k]);
                     $("#dots>li").css("color", "#ccc");
                     $("#dots>li").eq(k).css("color", "#fff");
                 }
                 init();
                 var timer = setInterval(change, 3000);
                 function showImg() {
                     init();
                     $("#pic").css("display", "none");
                     $("#pic1").attr("src", $("pic").attr("src"));
                     $("#pic").fadeIn(1000);
                 }
                 function change() {
                     k++;
                     k %= title.length;
                     showImg();
                 }
                 $("#picNews").mouseover(function () {
                     clearInterval(timer);
                 })
                 $("#picNews").mouseout(function () {
                     timer = setInterval(change, 3000);
                 })
                 $("#dots>li").click(function () {
                     k = $("#dots>li").index(this);
                     showImg();
                 })
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
    <div id="picNews">
			<img src="" id="pic">
            <img src="" id="pic1">
			<div id="dot">
				<ul id="dots">
				</ul>
                <a href="#" id="imgLink">          
                <div id="text"></div>
                </a>  
			</div>
    </div>
    <div id="divNews">
        <p>新闻公告</p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px"
            AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="div_News">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="newsId" 
                        DataNavigateUrlFormatString="showNews.aspx?id={0}" DataTextField="newsName" 
                        HeaderText="新闻名" Target="_blank">
                    <ItemStyle HorizontalAlign="Center" Width="200px" CssClass="mlength"/>
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="time" HeaderText="发布时间" 
                        DataFormatString="{0:yyyy-MM-dd}">
                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="username" HeaderText="编写人">
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
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
        <div id="divLeft">
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#FF3300" 
                Font-Bold="True"></asp:Label>
            <asp:GridView ID="GridView2"
                runat="server" AutoGenerateColumns="False" Width="395px" GridLines="None" CssClass="div_News" 
                BackColor="#CCCCCC">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="newsId" 
                        DataNavigateUrlFormatString="showNews.aspx?id={0}" DataTextField="newsName" 
                        HeaderText="新闻名">
                    <ItemStyle HorizontalAlign="Center" CssClass="mlength"/>
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="time" DataFormatString="{0:yyyy-MM-dd}" 
                        HeaderText="发布时间" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="hitCount" HeaderText="点击量" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="divMiddle">
            <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="#FF3300" 
                Font-Bold="True"></asp:Label>
            <asp:GridView ID="GridView3"
                runat="server" AutoGenerateColumns="False" Width="394px" GridLines="None" CssClass="div_News" 
                BackColor="#CCCCCC">
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
                    <asp:BoundField DataField="hitCount" HeaderText="点击量" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="divRight">
            <asp:Label ID="Label3" runat="server" Text="Label" ForeColor="#FF3300" 
                Font-Bold="True"></asp:Label>
            <asp:GridView ID="GridView4"
                runat="server" AutoGenerateColumns="False" Width="395px" GridLines="None" CssClass="div_News" 
                BackColor="#CCCCCC">
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
                    <asp:BoundField DataField="hitCount" HeaderText="点击量" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="divLinks">
            <div class="foot">
				<p>关于我们</p>     
                <ul>
                    <li><a href="###">企业简介</a></li>
                    <li><a href="###">企业文化</a></li>
                    <li><a href="###">发展历程</a></li>
                    <li><a href="###">诚聘英才</a></li>
                    <li><a href="###">联系我们</a></li>
                </ul>
			</div>
			<div class="foot">
				<p>新闻中心</p>
                <ul>
					<li><a href="###">公司新闻</a></li>
					<li><a href="###">行业新闻</a></li>
                </ul>
			</div>
			<div class="foot">
				<p>产品及解决方案</p>
                <ul>
					<li><a href="###">产品系列</a></li>
					<li><a href="###">解决方案</a></li>
                </ul>
			</div>
			<div class="foot">
				<p>研发与创新</p>
                <ul>
					<li><a href="###">核心技术</a></li>
					<li><a href="###">技术创新</a></li>
                </ul>
			</div>
			<div class="foot">
				<p>经典案例</p>
                <ul>
					<li><a href="###">智慧城市</a></li>
					<li><a href="###">智慧高速</a></li>
					<li><a href="###">智慧家居</a></li>
					<li><a href="###">智慧网络</a></li>
                </ul>
			</div>
			<div class="foot">
				<p>服务支持</p>
                <ul>
					<li><a href="###">技术支持</a></li>
					<li><a href="###">服务网络</a></li>
					<li><a href="###">资料下载</a></li>
					<li><a href="###">公司理念</a></li>
                </ul>
			</div>
            <div class="foot">
				<p>社交媒体</p>
                <a href="###"><img src="imges/sina_weibo.png" height="50" width="50"/></a>
                <a href="###"><img src="imges/tweibo.png" height="50" width="50"/></a><br />
                <a href="###"><img src="imges/weixin.png" height="80" width="80"/>
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
