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
	<script type="text/javascript" src="<%=syspath%>/js/shiti.js"></script>

</head>
<body>
<div id="search_div_id">
	<table class="Mytable">
		<tr>
			<td class="Myfont">
				关键词：
				<input type="text" name="key" id="key" style="width:200px;">
				试卷:
				<input type="text" name="title" id="title" style="width:200px;">
				题型:
				<!--1 判断题，2 填空题，3 选择题，4 解答题-->
				<select id="flag" name="flag">
					<option value="">所有
					<option value="1">判断题
					<option value="2">填空题
					<option value="3">选择题
					<option value="4">解答题
					<option value="100">其他

				</select>
				<input type="button" value="搜索" class="Mybotton" onclick="searchFunc()">
				<input type="button" value="导入" class="Mybotton" onclick="importFunc()">
			</td>
		</tr>
	</table>
</div>

<!-- 编辑窗 -->
<div id="menuWindow" class="windowDiv">

	<table>
		<tbody>
		<tr>
			<td>题目:</td>
			<td id="questionShow" name="questionShow">

			</td>
		</tr>
		<tr>
			<td colspan="2">
				<hr>
			</td>
		</tr>
		<tr>
			<td>答案:</td>
			<td id="answerShow" name="answerShow">

			</td>
		</tr>

		</tbody>
	</table>
</div>

</body>
</html>