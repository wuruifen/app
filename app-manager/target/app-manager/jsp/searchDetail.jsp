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

<input name="keyword" id="keyword" value="${keyword}">
<input type="button" value="搜一下" onclick="search()">
<br>

<div>
	<c:choose>
		<c:when test="${ empty list}">
			<h5>没找到相关试题，请尝试输入其他词搜索！</h5>
		</c:when>
		<c:otherwise>
			<h5>为您找到相关结果${count}个</h5>
			<c:forEach items="${list}" var="obj">
				<h1>${obj.question}</h1>
				</br>
				<h5>${obj.answer}</h5>
				</br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
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