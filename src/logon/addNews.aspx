<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addNews.aspx.cs" Inherits="src_addNews_index" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻发布</title>
        <link rel="stylesheet" href="../logon/kde/themes/default/default.css" />
	<link rel="stylesheet" href="../logon/kde/plugins/code/prettify.css" />
	<script charset="utf-8" src="../logon/kde/kindeditor.js"></script>
	<script charset="utf-8" src="../logon/kde/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../logon/kde/plugins/code/prettify.js"></script>
	<script>
	    KindEditor.ready(function (K) {
	        var editor1 = K.create('#content1', {
	            cssPath: '../logon/kde/plugins/code/prettify.css',
	            uploadJson: '../logon/kde/upload_json.ashx',
	            fileManagerJson: '../logon/kde/file_manager_json.ashx',
	            allowFileManager: true,
	            afterCreate: function () {
	                var self = this;
	                K.ctrl(document, 13, function () {
	                    self.sync();
	                    K('form[name=example]')[0].submit();
	                });
	                K.ctrl(self.edit.doc, 13, function () {
	                    self.sync();
	                    K('form[name=example]')[0].submit();
	                });
	            }
	        });
	        prettyPrint();
	    });
	</script>
</head>
<body>
    <form id="example" runat="server">
    <div>
        标题：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    <div>
        栏目：<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        封面图片：
     
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
    <div>
    <textarea id="content1" cols="100" rows="8" style="width:1000px;height:400px;visibility:hidden;" runat="server"></textarea>
        <br />
        <asp:Button ID="Button1" runat="server" Text="提交内容" onclick="Button1_Click" /> &nbsp;<asp:Button 
            ID="Button2" runat="server" onclick="Button2_Click" Text="返回" Width="61px" />
        (提交快捷键: Ctrl + Enter)
    </div>
    </form>
</body>
</html>
