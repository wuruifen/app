<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布局页</title>
</head>
<script type="text/javascript">
	Ext.onReady(function() {
		new Ext.Viewport({
			layout : 'border',
			items : [{
				region : 'north',
				height:40,
				width:600,
				html:'<table style="width:100%;margin:auto;font-size:12px;color:#15428b;">'
						+'<tr>'
							+'<td style="width:40px">'
								+'<img src="" style="max-width:50px;max-height:30px;">'
							+'</td>'
							+'<td>'
								+'<b style="margin-top:20px;">答案搜索工具</b>'
							+'</td>'
							+'<td align="right">'
								+'<img src="imgs/person.ico" style="margin-right:8px;"/>'
								+'欢迎登录，${CurrentLoginUser.showName}(${CurrentLoginUser.name})'
								+'<a href="quitSystem.do" title="退出系统" style="text-decoration: none;color: red;margin:0 30px 0 30px;"><b>退出</b> </a>'
							+'</td>'
						+'</tr>'
					+'</table>'
			},{
						region : 'west',
						id : 'west-ssh',
						title : '系统菜单',
						split : false,
						border : true,
						width : 155,
	 					collapsible : true,
						collapseMode : 'mini',
						margins : '1 1 1 1',
						html : "<iframe src='left.jsp' id='layout_page_left' name='layout_page_left' width=100% height=100% scrolling='no' frameborder='0'></iframe>"
					},{
						region : 'center',
						id : 'center-ssh',
						border : true,
						margins : '1 1 1 7',
						html : "<iframe src='' id='layout_page_right' name='layout_page_right' width=100% height=100% scrolling='no' frameborder='0'></iframe>"
					}]
		});
	});
	
</script>
<body>
</body>
</html>