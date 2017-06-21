Ext.onReady(function(){
    this.searchFunc=function(){
        gridStore.setBaseParam("key", document.getElementById("key").value);
        gridStore.setBaseParam("title", document.getElementById("title").value);
        gridStore.setBaseParam("flag", document.getElementById("flag").value);
        gridStore.load();
    };

    this.importFunc=function(){
        location.href = "initShitiUp.do";
    };

    var menuWindow = new com.custom.Window({
        width : 550,
        height : 500,
        contentEl : 'menuWindow',
        buttons : [{
            text : '关闭',
            handler : function(){
                menuWindow.hide();
            }
        }]
    });

    this.showWindow = function(bt,id) {
        var q = "";
        var a = "";
        gridStore.each(function(rec){
            if(rec.data.id == id){
                q = rec.data.question;
                a = rec.data.answer;

                return;
            }
        });
        document.getElementById("questionShow").innerHTML=q;
        document.getElementById("answerShow").innerHTML=a;

        menuWindow.setTitle("查看试题");
        menuWindow.show(bt);
    }



    //列表数据
    var gridStore = new Ext.data.JsonStore({
        url : 'searchShiti.do',
        root : 'resultList',
        remoteSort: false,
        totalProperty:'total',
        fields: [
            {name:'id'},
            {name:'numb'},
            {name:'flag'},
            {name:'question'},
            {name:'answer'},
            {name:'pic'},
            {name:'title'}
        ],
        baseParams : {
            limit : 50,
            name :''
        }
    });

    var grid = new com.custom.GridPanel({
        store : gridStore,
        region : 'center',
        frame : false,
        border : false,
        autoHeight:true,
        columns: [
            {width:3,header:'试卷', align:'left',sortable:false, dataIndex:'title'},
            {width:1,header:'题号', align:'left',sortable:false, dataIndex:'numb'},
            {width:1,header:'题型', align:'left',sortable:false, dataIndex:'flag',renderer:function(val, meta){
                if(val == 1){
                    return "判断题";
                }else  if(val == 2){
                    return "填空题";
                }else if(val == 3){
                    return "选择题";
                }else if(val == 4){
                    return "解答题";
                }else{
                    return "其他";
                }
            }},

            {width:7,header:'题目', align:'left',sortable:false, dataIndex:'question'},
            {width:4,header:'答案', align:'left',sortable:false, dataIndex:'answer'}
            ,
            {width:1,header:'操作', align:'left',sortable:false, dataIndex:'id',renderer:function(val,cell,record){
                return '<input type="button" value="查看" class="Mybotton" onclick="showWindow(this,'+val+')">';

            }}
        ]
    });

    new Ext.Viewport({
        layout : 'border',
        items : [{
            region : 'north',
            title :  "试题管理",
            border : false,
            height : 75,
            keys : {
                key : Ext.EventObject.ENTER,
                fn : function(){
                    searchFunc();
                }
            },
            contentEl : 'search_div_id'
        },{
            region : 'center',
            frame : false,
            border : true,
            autoScroll : true,
            items : [grid],
            tbar : ['->',new Ext.PagingToolbar({
                pageSize: 50,
                store: gridStore,
                style : {'border' : 0},
                displayInfo: true
            })]
        }]
    });

    searchFunc();
});