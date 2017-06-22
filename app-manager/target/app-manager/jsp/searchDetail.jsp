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
		试题搜索
	</title>
</head>
<body>

<div style="position: absolute;top:2%;left: 10%;font-size: 14px; width: 800px;" >
	<input name="keyword" id="keyword" value="${keyword}" style="float:left;width:300px; height:30px;border:2px solid #4682B4;padding: 2px;">
	<input type="button" value="搜一下" onclick="search()" class="buttonsearch">

	<div style="margin-top: 10px;">
		<c:choose>
			<c:when test="${ empty list}">
				<span style="color:red;padding: 10px 0px;">没有找到相关试题，请尝试输入其他词搜索！</span>
			</c:when>
			<c:otherwise>
				<span style="color: grey;padding: 10px 0px;">为您找到相关结果${count}个</span>
				<hr>
				<c:forEach items="${list}" var="obj">
					<table style="border:1px solid #99bbe8; border-collapse:collapse;width: 800px;margin-top: 30px;">
						<tr>
							<td style="border-bottom:1px solid #99bbe8; border-collapse:collapse;width: 50px;padding: 8px;"><b>题目：</b></td>
							<td style="border-bottom:1px solid #99bbe8; border-collapse:collapse;padding: 8px;">
									${obj.question}
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid #99bbe8; border-collapse:collapse;width: 50px;padding: 8px;color: red;"><b>答案：</b></td>
							<td style="color: red;padding: 8px;">
									${obj.answer}
							</td>
						</tr>
					</table>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

</div>



</body>
<script type="text/javascript">
    function search() {
        var keyword = document.getElementById("keyword").value;
        location.href = "searchDetail.do?keyword="+keyword;
    }

    document.onkeydown = function(e){
        if(!e){
            e = window.event;
        }
        if((e.keyCode || e.which) == 13){
            search();
        }
        if(e.ctrlKey){
            return false;
        }
    }

    document.oncopy = function(){
        return false;
    }

</script>
</html>