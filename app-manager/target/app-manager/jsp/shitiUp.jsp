<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../import.jsp"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
</title>
	<script type="text/javascript">
	Ext.onReady(function(){
		
		new Ext.Viewport({
			layout : 'border',
			items : [{
				region : 'north',
				title :  "试题上传",
				border : false,
				height : 1000,
				width:2000,
				contentEl : 'search_div_id'
			}]
		});
	});
	</script>
</head>
<body>
		<div id="search_div_id">
			<table class="Mytable">
				<tr>
					<td class="Myfont">
						<form method="post" action="upload.do" enctype="multipart/form-data">
							
							<input type="file" name="uploadFile" id="uploadFile"/>
							
							<input type="submit" value="上传" />
						</form>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>