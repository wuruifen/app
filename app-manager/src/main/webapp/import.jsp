<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String syspath = request.getContextPath();
%>
<html>
<head>
	<style type="text/css">
		/* grid可以被复制选中的样式 */
		.x-selectable, .x-selectable * {
			user-select: text! important;
			-o-user-select: text! important;
			-moz-user-select: text! important;
			-khtml-user-select: text! important;
			-webkit-user-select: text! important;
		}

		/* grid单选radio样式 */
		.x-grid-radio-custom .x-grid3-row-checker, .x-grid-radio-custom .x-grid3-hd-checker {
			background-image:url(ext-3.2.1/resources/images/default/grid/row-radio-sprite.gif);
		}

		/* grid 列中样式 */
		.columnCSS{
			table-layout:fixed;
			word-wrap:break-word;
			word-break:break-all;
			padding: 3px 2px 3px 2px;
		}

		.row-color-yellow{
			color:blue;
		}

		.Myfont{
			font-size: 13px;
			font: 宋体;
		}

		/* 自定义弹出窗 */
		.windowDiv{
			font-size: 13px;
			font: 宋体;
			background-color: white;
			height: 1000px;
			padding: 28px;
		}
		.windowDiv table tr{
			height: 30px;
		}
		.windowDiv table td{
			min-width: 60px;
		}
		.windowDiv table input{
			padding: 3px;
			width:300px;
		}

		.Mytable{
			padding:5px;
			border: 0;
			width: 100%;
		}

		.Mytable tr{
			font-size: 13px;
			font: 宋体;
			height : 40px;
		}

		.infotable{
			border:1px solid #99bbe8;
			border-collapse:collapse;
			width:60%;
			margin-left: 5px;
		}
		.infotable td {
			border:1px solid #99bbe8;
			text-align: center;
		}
		.infotable th {
			border:1px solid #99bbe8;
			background-color: #ECECFF;
			text-align: center;
		}
		.infotable tr{
			font-size: 13px;
			font: 宋体;
			height : 25px;
		}

		.Mytext{
			padding: 3px;
			width:250px;
		}

		.Mybotton{
			padding: 2px 3px 2px 3px;
			margin: 2px 2px 2px 5px;
		}

		select{
			margin-right: 20px;
		}

		.buttonsearch {
			background-color: #4682B4;
			border: none;
			color: white;
			padding: 8px 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			cursor: pointer;

		}
	</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title></title>

	<!-- EXT -->
	<link rel="stylesheet" type="text/css" href="<%=syspath%>/ext-3.2.1/resources/css/ext-all.css" />
	<script type="text/javascript" src="<%=syspath%>/ext-3.2.1/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="<%=syspath%>/ext-3.2.1/ext-all.js"></script>
	<script type="text/javascript" src="<%=syspath%>/ext-3.2.1/ext-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=syspath%>/ext-3.2.1/ext-copy.js"></script>

	<script type="text/javascript" src="<%=syspath%>/utils/custom.js"></script>
	<script type="text/javascript" src="<%=syspath%>/utils/myUtil.js"></script>
	<script type="text/javascript" src="<%=syspath%>/utils/validatorRegex.js"></script>

	<script type="text/javascript">
        var syspath = '<%=syspath%>';
        var PAGESIZE = 20;

        //图片服务器地址
        var IMAGEURL = '${IMAGEURL}';

        //当前用户对权限
        var PRIS = '${CurrentLoginUser.priUrls}';

        //判断是否有操作权限
        function isHavePRI(url) {
            if (_isNull(PRIS)) {
                return false;
            }
            PRIS = PRIS.replace('[', '').replace(']', '');
            return contains(PRIS.split(','), url);
        }

        //数组是否包含元素
        function contains(arr, obj) {
            if (arr == null) {
                return false;
            }
            var i = arr.length;
            while (i--) {
                if (arr[i].trim() == obj.trim()) {
                    return true;
                }
            }
            return false;
        }

        //生成按钮
        function genButton(value, func) {
            return '<input type="button" value="'+value+'" class="Mybotton" onclick="'+func+'">';
        }
	</script>
</head>
</html>