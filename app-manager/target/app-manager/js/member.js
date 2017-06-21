Ext.onReady(function(){
	
	Ext.QuickTips.init();
	
	var uploadId = 0;

	//-----------------权限相关 start-----------
	var urlEditMemberValid = "initEditMemberValid.do";
	
	//是否有权限
	var isPRISaveMember = isHavePRI("saveMember.do");//新增编辑用户
	var isPRISaveMemberPwd = isHavePRI("saveMemberPwd.do");//修改用户密码
	var isPRISaveMemberImgs = isHavePRI("saveMemberImgs.do");//修改头像
	var isPRIEditMemberValid = isHavePRI(urlEditMemberValid);//启用／禁用用户
	
	//-----------------权限相关 end-----------
	
	this.searchFunc = function() {
		gridStore.load();
	};

	this.updateF = function(id) {
		location.href = "initEditMember.do?id=" + id;
	};
	
	this.updatePWD = function(id) {
		location.href = "initEditMemberPWD.do?id=" + id;
	};
	
	this.updateImgs = function(id) {
		uploadId = id;
		pic.show();
	};
	
	var pic = new FileUpLoadWindow(function(fp, response){
		if(response.result.success){
			var path = response.result.data;
			if(_isNull(path)){
				alert("文件上传失败！");
			}else{
				location.href = 'saveMemberImgs.do?imgs='+path+'&id=' + uploadId;
			}
		}else{
			alert(response.result.msg);
		}
		pic.hide();
	});
	
	this.updateValid = function(id) {
		if (confirm("确定要禁用该账号吗？禁用后该账号将不能登录！")) {
			Ext.Ajax.request({
				url : urlEditMemberValid + '?value=1&id=' + id,
				success : function(response) {
					var resp = Ext.util.JSON.decode(response.responseText);
					if (resp.success) {
						alert("该账号已被禁用！");
						gridStore.reload();
					} else {
						alert("操作失败：" + resp.resultTipMsg);
					}
				}
			});
		}
	};
	
	this.updateValidUN = function(id) {
		if (confirm("确定要取消禁用该账号吗？取消后该账号将能登录系统！")) {
			Ext.Ajax.request({
				url : urlEditMemberValid + '?value=0&id=' + id,
				success : function(response) {
					var resp = Ext.util.JSON.decode(response.responseText);
					if (resp.success) {
						alert("该账号已可用！");
						gridStore.reload();
					} else {
						alert("操作失败：" + resp.resultTipMsg);
					}
				}
			});
		}
	};
	
	//列表数据
	var gridStore = new Ext.data.JsonStore({
	    url : 'searchMembers.do',
	    root : 'resultList',
	    remoteSort: false, 
	    totalProperty:'total',
	    fields: [
	       {name:'id'},
	       {name:'name'},
	       {name:'imgs'},
	       {name:'role'},
	       {name:'valid'},
	       {name:'showName'},
	       {name:'roleName'},
	       {name:'phone'},
	       {name:'email'}
        ],
        baseParams : {
        	limit : PAGESIZE
		}
    });
	
	var grid = new com.custom.GridPanel({
		store : gridStore,
		region : 'center',
		frame : false,
		border : false,
		autoHeight:true,
		columns: [ 
				{width:1,header:'ID', align:'center',sortable:false, dataIndex:'id'},
				{width:1,header:'头像', align:'left',sortable:false, dataIndex:'imgs',renderer:function(val){
					if(val == null || val == ''){
						return '';
					}
					return '<img src="' + (IMAGEURL + val) + '" style="max-width: 133px;max-height:103px;">';
				}},
				{width:1,header:'登录名', align:'left',sortable:false, dataIndex:'name'},
				{width:1,header:'显示名', align:'left',sortable:false, dataIndex:'showName'},
				{width:2,header:'所属角色', align:'left',sortable:false, dataIndex:'roleName'},
				{width:1,header:'电话', align:'left',sortable:false, dataIndex:'phone'},
				{width:1.5,header:'邮箱', align:'left',sortable:false, dataIndex:'email'},
				{width:1,header:'状态', align:'left',sortable:false, dataIndex:'valid',renderer:function(val){
					return val=="0"||val==0 ? '正常' : '<span style="color:red;">禁用</span>';
				}},
				{width:3,header:'操作', align:'center',sortable:false, dataIndex:'id',renderer:function(val,cell,record){
					var str = '';
					if(isPRISaveMember){//权限
						str += genButton("修改",'updateF('+val+')');
					}
					
					if(isPRISaveMemberPwd){//权限
						str += genButton("改密码",'updatePWD('+val+')');
					}
					
					if(isPRISaveMemberImgs){//权限
						str += genButton("上传头像",'updateImgs('+val+')');
					}
					
					if(isPRIEditMemberValid){ //权限
						if(record.data.valid == 0 || record.data.valid == '0'){
							str += genButton("禁用",'updateValid('+val+')');
						}else{
							str += genButton("取消禁用",'updateValidUN('+val+')');
						}
					}
					
					
					
					return str;
				}}
		]
	}); 
	
	new Ext.Viewport({
		layout : 'border',
		items : [{
			title:'用户管理',
	        region : 'center',
			frame : false,
			border : true,
			autoScroll : true,
			items : [grid],
			tbar : [{
						text : '新增',
						id:'bt_add',
						handler : function(b,e){
							location.href = "initEditMember.do";
						}
					},'->',
					new Ext.PagingToolbar({
			            pageSize: PAGESIZE,
			            store: gridStore,
			            style : {'border' : 0},
			            displayInfo: true
			        })]
		}]
	});
	
	if(!isPRISaveMember){//权限
		Ext.getCmp("bt_add").hide();  
	}
	
	searchFunc();
});