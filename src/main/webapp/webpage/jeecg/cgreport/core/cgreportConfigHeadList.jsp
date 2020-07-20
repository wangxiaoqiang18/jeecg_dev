<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools"></t:base>
<div class="easyui-layout" fit="true">
<div region="center" style="padding:0px;border:0px">
	<t:datagrid fitColumns="true" checkbox="true" name="cgreportConfigHeadList" title="dynamic.table.head"
				actionUrl="cgreportConfigHeadController.do?datagrid" idField="id" fit="true" queryMode="group" sortName="createDate" sortOrder="desc" superQuery="true">
		<t:dgCol title="" field="id" hidden="true" queryMode="single" width="120" ></t:dgCol>
		<t:dgCol title="报表名称" field="name" query="true" queryMode="single" width="120"></t:dgCol>
		<t:dgCol title="common.code" field="code" query="true" queryMode="single" width="120"></t:dgCol>
		<t:dgCol title="query.sql" field="cgrSql" query="true" queryMode="single" width="300"></t:dgCol>
		<t:dgCol title="common.dynamic.dbsource" field="dbSource" query="true"   queryMode="single" width="120"></t:dgCol>
		<t:dgCol title="common.createby" field="createBy" hidden="true"></t:dgCol>
		<t:dgCol title="common.createtime" field="createDate" formatter="yyyy-MM-dd" hidden="false"></t:dgCol>
		<t:dgCol title="common.updateby" field="updateBy" hidden="true"></t:dgCol>
		<t:dgCol title="common.updatetime" field="updateDate" formatter="yyyy-MM-dd" hidden="true"></t:dgCol>
		<t:dgCol title="common.description" field="content" query="true" queryMode="single" width="120"></t:dgCol>
		<t:dgCol title="common.operation" field="opt" width="300"></t:dgCol>
		<t:dgDelOpt title="common.delete" url="cgreportConfigHeadController.do?doDel&id={id}"  urlclass="ace_button"  urlfont="fa-trash-o"/>
		<t:dgFunOpt funname="popMenuLink(code,name)" title="配置地址"  urlclass="ace_button"  urlfont="fa-cog"></t:dgFunOpt>
		<t:dgFunOpt  funname="addlisttab(code,name)" title="功能测试" urlclass="ace_button"  urlfont="fa-cog"></t:dgFunOpt>
		<t:dgToolBar title="common.add" icon="icon-add" url="cgreportConfigHeadController.do?goAdd" funname="add" height="450" width="1200"></t:dgToolBar>
		<t:dgToolBar title="common.edit" icon="icon-edit" url="cgreportConfigHeadController.do?goUpdate" funname="update" height="450" width="1200"></t:dgToolBar>
		<t:dgToolBar title="common.batch.delete" icon="icon-remove" url="cgreportConfigHeadController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
		<t:dgToolBar title="common.view" icon="icon-search" url="cgreportConfigHeadController.do?goUpdate" funname="detail" height="450" width="1200"></t:dgToolBar>
	</t:datagrid></div>
</div>
<script src="plug-in/clipboard/ZeroClipboard.js"></script>
<script type="text/javascript">
  /**
	*	弹出菜单链接
	*/
	function popMenuLink(tableName,content){
		$.dialog({
			content: "url:cgreportConfigHeadController.do?popmenulink&url=cgReportController.do?list&title="+tableName,
            drag :false,
            lock : true,
            title:'菜单链接['+content+']',
            opacity : 0.3,
            width:400,
            height:80,drag:false,min:false,max:false
		}).zindex();
	}
	function addlisttab(tableName,content){
		  addOneTab(content, "cgReportController.do?list&id="+tableName);
	}
 </script>

<div id="menu" class="easyui-menu" style="width: 30px; display: none;">
	<div id="btn_More" data-options="iconCls:'icon-remove'" onclick="MoreInfo()">更多</div>
</div>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${basepath}plug-in/mutiLang/zh-cn.js"></script>
<script type="text/javascript" src="${basepath}plug-in/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${basepath}plug-in/jquery/jquery.cookie.js"></script>
<script type="text/javascript"
        src="${basepath}plug-in/jquery-plugs/storage/jquery.storageapi.min.js"></script>
<script type="text/javascript"
        src="${basepath}plug-in/jquery-plugs/i18n/jquery.i18n.properties.js"></script>
<script type="text/javascript" src="${basepath}plug-in/tools/dataformat.js"></script>
<link id="easyuiTheme" rel="stylesheet" href="${basepath}plug-in/easyui/themes/metrole/easyui.css"
      type="text/css"></link>
<link id="easyuiTheme" rel="stylesheet" href="${basepath}plug-in/easyui/themes/metrole/main.css"
      type="text/css"></link>
<link id="easyuiTheme" rel="stylesheet" href="${basepath}plug-in/easyui/themes/metrole/icon.css"
      type="text/css"></link>
<link rel="stylesheet" type="text/css" href="${basepath}plug-in/accordion/css/accordion.css">
<link rel="stylesheet" type="text/css" href="${basepath}plug-in/accordion/css/icons.css">
<script type="text/javascript" src="${basepath}plug-in/easyui/jquery.easyui.min.1.3.2.js"></script>
<script type="text/javascript" src="${basepath}plug-in/easyui/locale/zh-cn.js"></script>
<script type="text/javascript" src="${basepath}plug-in/tools/syUtil.js"></script>
<script type="text/javascript" src="${basepath}plug-in/easyui/extends/datagrid-scrollview.js"></script>
<script type="text/javascript" src="${basepath}plug-in/mutitables/datagrid-filter.js"></script>
<link rel="stylesheet" href="${basepath}plug-in/tools/css/metrole/common.css" type="text/css"></link>
<link rel="stylesheet" href="${basepath}plug-in/ace/css/font-awesome.css" type="text/css"></link>
<script type="text/javascript"
        src="${basepath}plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
<script type="text/javascript" src="${basepath}plug-in/ace/js/bootstrap-tab.js"></script>
<script type="text/javascript" src="${basepath}plug-in/layer/layer.js"></script>
<script type="text/javascript" src="${basepath}plug-in/tools/curdtools.js"></script>
<script type="text/javascript" src="${basepath}plug-in/tools/easyuiextend.js"></script>
<script type="text/javascript"
        src="${basepath}plug-in/jquery-plugs/hftable/jquery-hftable.js"></script>
<script type="text/javascript" src="${basepath}plug-in/tools/json2.js"></script>
<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">


        <link rel="stylesheet" href="plug-in/Validform/css/style.css" type="text/css">
        <link rel="stylesheet" href="plug-in/Validform/css/tablefrom.css" type="text/css">
        <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
        <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
        <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
        <script type="text/javascript">$(function () {
            storage = $.localStorage;
            if (!storage) storage = $.cookieStorage;
            $('#cgreportConfigHeadList').datagrid({
                idField: 'id',
                title: '动态表头',
                url: 'cgreportConfigHeadController.do?datagrid&field=id,name,code,cgrSql,dbSource,createBy,createDate,updateBy,updateDate,content,',
                fit: true,
                rownumbers: true,
                queryParams: {},
                loadMsg: '数据加载中...',
                pageSize: 10,
                pagination: true,
                pageList: [10, 20, 30],
                sortName: 'createDate',
                sortOrder: 'desc',
                rownumbers: true,
                singleSelect: false,
                fitColumns: true,
                striped: true,
                showFooter: true,
                frozenColumns: [[{field: 'ck', checkbox: 'true'},]],
                columns: [[{field: 'id', title: '', width: 120, hidden: true, sortable: true}, {
                    field: 'name',
                    title: '报表名称',
                    width: 120,
                    sortable: true
                }, {field: 'code', title: '编码', width: 120, sortable: true}, {
                    field: 'cgrSql',
                    title: '查询sql',
                    width: 300,
                    sortable: true
                }, {field: 'dbSource', title: '数据源', width: 120, sortable: true}, {
                    field: 'createBy',
                    title: '创建人',
                    hidden: true,
                    sortable: true
                }, {
                    field: 'createDate', title: '创建时间', sortable: true, formatter: function (value, rec, index) {
                        return new Date().format('yyyy-MM-dd', value);
                    }
                }, {field: 'updateBy', title: '修改人', hidden: true, sortable: true}, {
                    field: 'updateDate',
                    title: '修改时间',
                    hidden: true,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        return new Date().format('yyyy-MM-dd', value);
                    }
                }, {field: 'content', title: '描述', width: 120, sortable: true}, {
                    field: 'opt',
                    title: '操作',
                    width: 300,
                    formatter: function (value, rec, index) {
                        if (!rec.id) {
                            return '';
                        }
                        var href = '';
                        href += "<a href='#'   class='ace_button'  onclick=delObj('cgreportConfigHeadController.do?doDel&id=" + rec.id + "','cgreportConfigHeadList')>  <i class=' fa fa-trash-o'></i> ";
                        href += "删除</a>&nbsp;";
                        href += "<a href='#'   class='ace_button'  onclick=popMenuLink('" + rec.code + "','" + rec.name + "','" + index + "')>  <i class=' fa fa-cog'></i>";
                        href += "配置地址</a>&nbsp;";
                        href += "<a href='#'   class='ace_button'  onclick=addlisttab('" + rec.code + "','" + rec.name + "','" + index + "')>  <i class=' fa fa-cog'></i>";
                        href += "功能测试</a>&nbsp;";
                        return href;
                    }
                }]],
                onLoadSuccess: function (data) {
                    $("#cgreportConfigHeadList").datagrid("clearChecked");
                    $("#cgreportConfigHeadList").datagrid("clearSelections");
                    if (!false) {
                        if (data.total && data.rows.length == 0) {
                            var grid = $('#cgreportConfigHeadList');
                            var curr = grid.datagrid('getPager').data("pagination").options.pageNumber;
                            grid.datagrid({pageNumber: (curr - 1)});
                        }
                    }
                    try {
                        loadAjaxDict(data);
                    } catch (e) {
                    }
                },
                onClickRow: function (rowIndex, rowData) {
                    rowid = rowData.id;
                    gridname = 'cgreportConfigHeadList';
                }
            });
            $('#cgreportConfigHeadList').datagrid('getPager').pagination({
                beforePageText: '',
                afterPageText: '/{pages}',
                displayMsg: '{from}-{to}共 {total}条',
                showPageList: true,
                showRefresh: true
            });
            $('#cgreportConfigHeadList').datagrid('getPager').pagination({
                onBeforeRefresh: function (pageNumber, pageSize) {
                    $(this).pagination('loading');
                    $(this).pagination('loaded');
                }
            });
            try {
                restoreheader();
            } catch (ex) {
            }
        });

        function reloadTable() {
            try {
                $('#' + gridname).datagrid('reload');
                $('#' + gridname).treegrid('reload');
            } catch (ex) {
            }
        }

        function reloadcgreportConfigHeadList() {
            $('#cgreportConfigHeadList').datagrid('reload');
        }

        function getcgreportConfigHeadListSelected(field) {
            return getSelected(field);
        }

        function getSelected(field) {
            var row = $('#' + gridname).datagrid('getSelected');
            if (row != null) {
                value = row[field];
            } else {
                value = '';
            }
            return value;
        }

        function getcgreportConfigHeadListSelections(field) {
            var ids = [];
            var rows = $('#cgreportConfigHeadList').datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i][field]);
            }
            ids.join(',');
            return ids
        };

        function getSelectRows() {
            return $('#cgreportConfigHeadList').datagrid('getChecked');
        }

        function saveHeader() {
            var columnsFields = null;
            var easyextends = false;
            try {
                columnsFields = $('#cgreportConfigHeadList').datagrid('getColumns');
                easyextends = true;
            } catch (e) {
                columnsFields = $('#cgreportConfigHeadList').datagrid('getColumnFields');
            }
            var cols = storage.get('cgreportConfigHeadListhiddenColumns');
            var init = true;
            if (cols) {
                init = false;
            }
            var hiddencolumns = [];
            for (var i = 0; i < columnsFields.length; i++) {
                if (easyextends) {
                    hiddencolumns.push({field: columnsFields[i].field, hidden: columnsFields[i].hidden});
                } else {
                    var columsDetail = $('#cgreportConfigHeadList').datagrid("getColumnOption", columnsFields[i]);
                    if (init) {
                        hiddencolumns.push({
                            field: columsDetail.field,
                            hidden: columsDetail.hidden,
                            visible: (columsDetail.hidden == true ? false : true)
                        });
                    } else {
                        for (var j = 0; j < cols.length; j++) {
                            if (cols[j].field == columsDetail.field) {
                                hiddencolumns.push({
                                    field: columsDetail.field,
                                    hidden: columsDetail.hidden,
                                    visible: cols[j].visible
                                });
                            }
                        }
                    }
                }
            }
            storage.set('cgreportConfigHeadListhiddenColumns', JSON.stringify(hiddencolumns));
        }

        function isShowBut() {
            var isShowSearchId = $('#isShowSearchId').val();
            if (isShowSearchId == "true") {
                $("#searchColums").hide();
                $('#isShowSearchId').val("false");
                $('#columsShow').remove("src");
                $('#columsShow').attr("src", "plug-in/easyui/themes/default/images/accordion_expand.png");
            } else {
                $("#searchColums").show();
                $('#isShowSearchId').val("true");
                $('#columsShow').remove("src");
                $('#columsShow').attr("src", "plug-in/easyui/themes/default/images/accordion_collapse.png");
            }
        }

        function restoreheader() {
            var cols = storage.get('cgreportConfigHeadListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    if (cols.visible != false) $('#cgreportConfigHeadList').datagrid((cols[i].hidden == true ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function resetheader() {
            var cols = storage.get('cgreportConfigHeadListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    $('#cgreportConfigHeadList').datagrid((cols.visible == false ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function cgreportConfigHeadListsearch() {
            try {
                if (!$("#cgreportConfigHeadListForm").Validform({tiptype: 3}).check()) {
                    return false;
                }
            } catch (e) {
            }
            if (true) {
                var queryParams = $('#cgreportConfigHeadList').datagrid('options').queryParams;
                $('#cgreportConfigHeadListtb').find('*').each(function () {
                    queryParams[$(this).attr('name')] = $(this).val();
                });
                $('#cgreportConfigHeadList').datagrid({
                    url: 'cgreportConfigHeadController.do?datagrid&field=id,name,code,cgrSql,dbSource,createBy,createDate,updateBy,updateDate,content,',
                    pageNumber: 1
                });
            }
        }

        function dosearch(params) {
            var jsonparams = $.parseJSON(params);
            $('#cgreportConfigHeadList').datagrid({
                url: 'cgreportConfigHeadController.do?datagrid&field=id,name,code,cgrSql,dbSource,createBy,createDate,updateBy,updateDate,content,',
                queryParams: jsonparams
            });
        }

        function cgreportConfigHeadListsearchbox(value, name) {
            var queryParams = $('#cgreportConfigHeadList').datagrid('options').queryParams;
            queryParams[name] = value;
            queryParams.searchfield = name;
            $('#cgreportConfigHeadList').datagrid('reload');
        }

        $('#cgreportConfigHeadListsearchbox').searchbox({
            searcher: function (value, name) {
                cgreportConfigHeadListsearchbox(value, name);
            }, menu: '#cgreportConfigHeadListmm', prompt: '请输入查询关键字'
        });

        function EnterPress(e) {
            var e = e || window.event;
            if (e.keyCode == 13) {
                cgreportConfigHeadListsearch();
            }
        }

        function searchReset(name) {
            $("#" + name + "tb").find(":input").val("");
            var queryParams = $('#cgreportConfigHeadList').datagrid('options').queryParams;
            $('#cgreportConfigHeadListtb').find('*').each(function () {
                queryParams[$(this).attr('name')] = $(this).val();
            });
            $('#cgreportConfigHeadListtb').find("input[type='checkbox']").each(function () {
                $(this).attr('checked', false);
            });
            $('#cgreportConfigHeadListtb').find("input[type='radio']").each(function () {
                $(this).attr('checked', false);
            });
            $('#cgreportConfigHeadList').datagrid({
                url: 'cgreportConfigHeadController.do?datagrid&field=id,name,code,cgrSql,dbSource,createBy,createDate,updateBy,updateDate,content,',
                pageNumber: 1
            });
        }</script>
        <table width="100%" id="cgreportConfigHeadList" toolbar="#cgreportConfigHeadListtb"></table>
        <div id="cgreportConfigHeadListtb" style="padding:3px; height: auto"><input id="_complexSqlbuilder"
                                                                                    name="complexSqlbuilder"
                                                                                    type="hidden"/>
            <div name="searchColums" id="searchColums"><input id="isShowSearchId" type="hidden" value="false"/><input
                    id="_sqlbuilder" name="sqlbuilder" type="hidden"/>
                <form onkeydown='if(event.keyCode==13){cgreportConfigHeadListsearch();return false;}'
                      id='cgreportConfigHeadListForm'><span style="max-width: 79%;display: inline-block;"><span><img
                        style="margin-top:-3px;vertical-align:middle;" src="plug-in/easyui/themes/icons/ti.png"
                        title="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！" alt="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width:74px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="报表名称">&nbsp;&nbsp;&nbsp;报表名称：</span><input onkeypress="EnterPress(event)"
                                                                          onkeydown="EnterPress()" type="text"
                                                                          name="name" style="width: 120px"
                                                                          class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="编码">编码：</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()" type="text"
                                                    name="code" style="width: 120px" class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="查询sql">查询sql：</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()"
                                                          type="text" name="cgrSql" style="width: 120px"
                                                          class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="数据源">数据源：</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()"
                                                      type="text" name="dbSource" style="width: 120px" class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="描述">描述：</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()" type="text"
                                                    name="content" style="width: 120px"
                                                    class="inuptxt"/></span></span><span><span style="float:right;"><a
                        href="#" class="easyui-linkbutton" iconCls="icon-search"
                        onclick="cgreportConfigHeadListsearch()">查询</a><a href="#" class="easyui-linkbutton"
                                                                          iconCls="icon-reload"
                                                                          onclick="searchReset('cgreportConfigHeadList')">重 置</a><a
                        href="#" class="easyui-linkbutton" iconCls="icon-search"
                        onclick="queryBuilder('')">高级查询</a></span></span></form>
            </div>
            <div style="border-bottom-width:0;" class="datagrid-toolbar"><span style="float:left;"><a href="#"
                                                                                                      class="easyui-linkbutton"
                                                                                                      plain="true"
                                                                                                      icon="icon-add"
                                                                                                      onclick="add('录入','cgreportConfigHeadController.do?goAdd','cgreportConfigHeadList',1200,450)">录入</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
                    onclick="update('编辑','cgreportConfigHeadController.do?goUpdate','cgreportConfigHeadList',1200,450)">编辑</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-remove"
                    onclick="deleteALLSelect('批量删除','cgreportConfigHeadController.do?doBatchDel','cgreportConfigHeadList',null,null)">批量删除</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-search"
                    onclick="detail('查看','cgreportConfigHeadController.do?goUpdate','cgreportConfigHeadList',1200,450)">查看</a></span>
                <div style="clear:both"></div>
            </div>
            <script type="text/javascript" src="plug-in/tools/curdtools.js"></script>
            <style>
                .conditionValue {
                    width: 130px;
                }

                .easyui-linkbutton {
                    position: relative;
                    bottom: 2px;
                }

                .layout-body {
                    border-left: 0px;
                    border-right: 0px;
                }

                .window .window-header {
                    border: 1px solid #dddddd !important;
                }
            </style>
            <div style="position: relative; overflow: auto;">
                <div id="w" class="easyui-window" data-options="closed:true,title:'高级查询构造器'"
                     style="padding :0px;border: 1px solid #7b7b7b4d;width: 780px; height: 370px; padding: 0px">
                    <div class="easyui-layout" data-options="fit:true">
                        <div data-options="region:'east',split:false" style="width: 128px;">
                            <div class="easyui-accordion" style="width: 126px; height: 284px;">
                                <div title="查询历史" data-options="iconCls:'icon-search'"
                                     style="padding: 0px;">
                                    <ul id="tt" class="easyui-tree"
                                        data-options="onClick:function(node){//单击事件
		       			historyQuery( node.id);
		    		},ondbClick: function(node){
						$(this).tree('beginEdit',node.target);
					},onContextMenu: function(e,node){
						e.preventDefault();
						$(this).tree('select',node.target);
						$('#mmTree').menu('show',{
							left: e.pageX,
							top: e.pageY
						});
					},
		         onAfterEdit:function(node){
		            if(node.text!=''){
		            	his[node.id].name=node.text;
		            	saveHistory();
		            }
			}">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div data-options="region:'center'" style="padding: 0px;">
                            <ul id="dsUL">
                                <li id="anyAll" class="conditionType">
					<span class="anyAll">
							过滤条件匹配：
						<select id="anyallSelect" name="mchtyp"
                                style="width: 200px" class="select">
								<option value="and" selected="selected">And(所有条件都要求匹配)</option>
								<option value="or">Or(条件中的任何一个匹配)</option>
						</select>
					</span>
                                </li>
                                <li>
                                    <hr style="border: 1px dotted #036"/>
                                </li>
                                <li class="conditions oop" id="dsLI" style="height: 29px;" data-index="0">
					<span>
												<select class="field" id="field" name="cons[0].fld"
                                                        onchange="setConsModel(this)">
							<option value="">&nbsp;</option>
									<option value="name" data-popup="false" data-dictionary="">报表名称</option>
									<option value="code" data-popup="false" data-dictionary="">编码</option>
									<option value="cgrSql" data-popup="false" data-dictionary="">查询sql</option>
									<option value="dbSource" data-popup="false" data-dictionary="">数据源</option>
									<option value="createDate" data-popup="false" data-dictionary="">创建时间</option>
									<option value="content" data-popup="false" data-dictionary="">描述</option>
									<option value="opt" data-popup="false" data-dictionary="">操作</option>
						</select>
					</span>
                                    <span>
						<select id="condition" name="cons[0].ctyp" class="compareType"
                                style="width: 150px;margin: 1px;">
							<option value="">&nbsp;</option>
							<option value="=">等于</option>
							<option value="!=">不等于</option>
							<option value=">">大于</option>
							<option value=">=">大于等于</option>
							<option value="&lt;">小于</option>
							<option value="&le;">小于等于</option>
							<option value="likeBegin">以...开始</option>
							<option value="likeEnd">以...结束</option>
							<option value="like">包含</option>
							<option value="not like">不包含</option>
							<option value="in">在...中</option>
							<option value="not in">不在...中</option>
						</select>
					</span>
                                    <span style="position: relative; z-index: 2000;" class="conVal">
							<input id="conValue" name="cons[0].val" type="text" class="text conditionValue" title=""
                                   style="width:130px;">
					</span>
                                    <span>
						<a id="add" href="javascript:addULChild()" class="fa fa-plus-square" title="添加一个新的过滤条件"
                           style="margin-left: 3px;"></a>
						<a id="delete" href="javascript:void(0)" onclick="deleteULChild(this)"
                           class="fa fa-minus-square" title="删除此过滤条件" style="margin-left: 23px;"></a>
					</span>
                                </li>
                            </ul>
                        </div>
                        <div data-options="region:'south',border:false"
                             style="text-align: right; padding: 5px 0 0;">
                            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                               onclick="javascript:mySearch()">OK</a>
                            <a href="#" class="easyui-linkbutton" iconCls="icon-reload"
                               onclick="superSearchReset()">重置</a>
                            <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="javascript:void(0)"
                               onclick="saveBySelect()">另存为查询方案</a>
                        </div>
                    </div>
                </div>
            </div>
            <ul id="dsUL_template" style="display:none">
                <li class="conditions oop" style="height: 29px;" data-index="#index#">
					<span>
						<select class="field" id="field" name="cons[#index#].fld" onchange="setConsModel(this)">
							<option value="">&nbsp;</option>
									<option value="name" data-popup="false" data-dictionary="">报表名称</option>
									<option value="code" data-popup="false" data-dictionary="">编码</option>
									<option value="cgrSql" data-popup="false" data-dictionary="">查询sql</option>
									<option value="dbSource" data-popup="false" data-dictionary="">数据源</option>
									<option value="createDate" data-popup="false" data-dictionary="">创建时间</option>
									<option value="content" data-popup="false" data-dictionary="">描述</option>
									<option value="opt" data-popup="false" data-dictionary="">操作</option>
						</select>
					</span>
                    <span>
						<select id="condition" name="cons[#index#].ctyp" class="compareType"
                                style="width: 150px;margin: 1px;">
							<option value="">&nbsp;</option>
							<option value="=">等于</option>
							<option value="!=">不等于</option>
							<option value=">">大于</option>
							<option value=">=">大于等于</option>
							<option value="&lt;">小于</option>
							<option value="&le;">小于等于</option>
							<option value="likeBegin">以...开始</option>
							<option value="likeEnd">以...结束</option>
							<option value="like">包含</option>
							<option value="not like">不包含</option>
							<option value="in">在...中</option>
							<option value="not in">不在...中</option>
						</select>
					</span>
                    <span style="position: relative; z-index: 2000;" class="conVal">
						<input id="conValue1" name="cons[#index#].val" type="text" class="text conditionValue" title=""
                               style="width:130px;">
					</span>
                    <span>
						<a id="add" href="javascript:addULChild()" class="fa fa-plus-square" title="添加一个新的过滤条件"
                           style="margin-left: 3px;"></a>
						<a id="delete" href="javascript:void(0)" onclick="deleteULChild(this)"
                           class="fa fa-minus-square" title="删除此过滤条件" style="margin-left: 23px;"></a>
					</span>
                </li>
            </ul>
            <div id="mmTree" class="easyui-menu" style="width: 100px;">
                <div onclick="editTree()" data-options="iconCls:'icon-edit'">编辑</div>
                <div onclick="deleteTree()" data-options="iconCls:'icon-remove'">删除</div>
            </div>
            <script type="text/javascript" src="plug-in/jquery/jquery.cookie.js"></script>
            <script type="text/javascript" src="plug-in/jquery-plugs/storage/jquery.storageapi.min.js"></script>
            <span style="display:none;">
				<span id="field_id"><input id="conValue1" name="cons[#index#].val" type="text"
                                           class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_name"><input id="conValue1" name="cons[#index#].val" type="text"
                                             class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_code"><input id="conValue1" name="cons[#index#].val" type="text"
                                             class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_cgrSql"><input id="conValue1" name="cons[#index#].val" type="text"
                                               class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_dbSource"><input id="conValue1" name="cons[#index#].val" type="text"
                                                 class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_createBy"><input id="conValue1" name="cons[#index#].val" type="text"
                                                 class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_createDate">
					<input id="conValue1" name="cons[#index#].val" type="text" style="width:130px;"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate text conditionValue" title="">
				</span>
				<span id="field_updateBy"><input id="conValue1" name="cons[#index#].val" type="text"
                                                 class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_updateDate">
					<input id="conValue1" name="cons[#index#].val" type="text" style="width:130px;"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate text conditionValue" title="">
				</span>
				<span id="field_content"><input id="conValue1" name="cons[#index#].val" type="text"
                                                class="text conditionValue" title="" style="width:130px;"></span>
				<span id="field_opt"><input id="conValue1" name="cons[#index#].val" type="text"
                                            class="text conditionValue" title="" style="width:130px;"></span>
</span>
            <script type="text/javascript">

                function setConsModel(field) {
                    $(field).parent().parent().find(".conVal").html($("#field_" + $(field).val()).html());
                    var index = $(field).closest("#dsUL>li").data("index");
                    //获取select选中值的data属性
                    var popup = $(field).find("option:selected").data("popup");
                    var dictionary = $(field).find("option:selected").data("dictionary");
                    if (popup && dictionary.indexOf(',') > 0) {
                        var splitArr = new Array();
                        splitArr = dictionary.split(",");
                        var spanVal = $(field).closest("#dsUL>li").find("span.conVal");
                        //splitArr=dictionary 0为表编码,1为查询字段,2为返回字段
                        //update-begin-author:taoyan date:20180802 for:TASK #3044 【jeecg测试问题-周俊峰】测试问题
                        spanVal.html("<input name=\"cons[" + index + "].val\" type=\"text\" class=\"searchbox-inputtext\" onclick=\"popupClick(this,'" + splitArr[2] + "','val','" + splitArr[0] + "')\"/>");
                        //update-end-author:taoyan date:20180802 for:TASK #3044 【jeecg测试问题-周俊峰】测试问题
                        $("input[name='cons[" + index + "].val']").css({
                            "background": "url(\"plug-in/diy/icons/search.png\") no-repeat 105px",
                            "width": "130px"
                        });
                    }

                    resetTrNum();
                }

                function onContextMenu(e, row) {
                    e.preventDefault();
                    $(this).treegrid('select', row.id);
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }

                var his = new Array();
                var saveAsJson;

                //查询并保存数据
                function mySearch() {
                    //多条件查询
                    //-----------------------
                    var idIndex = 100;
                    //获取页面上And，Or
                    var relation = $("#anyallSelect").val();
                    var dsli = $("#dsLI");
                    var json = new StringBuffer();
                    $("#dsUL li").each(
                        function (i) {
                            idIndex++;
                            if (i <= 1) {
                                return;
                            }
                            var field = $(this).find("select[name='cons[" + (i - 2) + "].fld']").val();
                            var condition = $(this).find("select[name='cons[" + (i - 2) + "].ctyp']").val();
                            var cValue = $(this).find("input[name='cons[" + (i - 2) + "].val'],select[name='cons[" + (i - 2) + "].val']").val();
                            if (field === '' && condition === '' && cValue === '') {
                                return true;
                            }
                            //判断输入的是否为时期格式
                            /*if (CheckDate(cValue)) {
                                if (condition == "=") {
                                    condition = "like";
                                    cValue = "%" + cValue;
                                }
                            }*/
                            //判断condition条件，改变sql查询条件
                            if (condition == "like") {
                                condition = "like";
                                cValue = "%" + cValue + "%";
                            } else if (condition == "not like") {
                                condition = "not like";
                                cValue = "%" + cValue + "%";
                            } else if (condition == "likeBegin") {
                                condition = "like";
                                cValue = cValue + "%";
                            } else if (condition == "likeEnd") {
                                condition = "like";
                                cValue = "%" + cValue;
                            } else if (condition == "in") {
                                condition = "in";
                                cValue = "\(" + cValue + "\)";
                            } else if (condition == "not in") {
                                condition = "not in";
                                cValue = "\(" + cValue + "\)";
                            }
                            if ((i - 2) == 0) {
                                json.append("{\"id\":" + idIndex + ",\"field\":\""
                                    + field + "\",\"condition\":\"" + condition
                                    + "\",\"value\":\"" + cValue
                                    + "\",\"relation\":\"" + relation
                                    + "\",\"state\":\"open\"}");
                            }
                            if ((i - 2) != 0) {
                                json.append("{\"id\":" + idIndex + ",\"field\":\""
                                    + field + "\",\"condition\":\"" + condition
                                    + "\",\"value\":\"" + cValue
                                    + "\",\"relation\":\"" + relation
                                    + "\",\"state\":\"open\"}");
                            }
                        });
                    $("#_sqlbuilder").val(json.toString());
                    saveAsJson = json;
                    /*var isnew = true;
                    //验证右侧是否存在相同的记录
                    for ( var i = 0; i < his.length; i++) {
                        //比较JSON
                        if (his[i] && his[i].json == json.toString()) {
                            isnew = false;
                        }
                    }
                    if (isnew) {
                        his.push({
                            name : 'Query' + his.length,
                            json : json
                        });
                        saveHistory();
                        var name = 'Query' + (his.length - 1);
                        appendTree(his.length - 1, name);
                    }*/
                    //-----------------------
                    cgreportConfigHeadListsearch();
                }

                //添加StringBuffer
                function StringBuffer() {
                    this.strings = new Array;
                }

                StringBuffer.prototype.append = function (str) {
                    this.strings.push(str); //追加指定元素
                };

                StringBuffer.prototype.toString = function () {
                    return "[" + this.strings.join(",") + "]"; //向数组之间的元素插入指定字符串（此处为空字符串），并返回。
                };

                //添加相同的li
                function addULChild() {
                    var dsUL_template = $("#dsUL_template").html();
                    $("#dsUL").append(dsUL_template);
                    resetTrNum();
                }

                //添加模版li
                function addULChild_template(i, value, condition, field) {
                    var dsUL_template = $("#dsUL_template").html();
                    $("#dsUL").append(dsUL_template);
                    resetTrNum();
                    $("#dsUL").find("select[name='cons[" + i + "].fld']").val(field);
                    $("#dsUL").find("select[name='cons[" + i + "].ctyp']").val(condition);
                    $("#dsUL").find("input[name='cons[" + i + "].val']").val(value);
                    var field = $("#dsUL").find("select[name='cons[" + i + "].fld']").find("option:selected");
                    echoField(i, field, value);
                }

                //初始化下标
                function resetTrNum() {
                    $('#dsUL').find('li').each(
                        function (i) {
                            var index = $(this).attr("data-index");
                            if (!!index) {
                                $(this).attr("data-index", i - 2);
                            }
                            $(':input,select', this).each(
                                function () {
                                    var thisli = $(this);
                                    var name = thisli.attr('name');
                                    if (name != null) {
                                        var reg = new RegExp("^cons");
                                        if (reg.test(name)) {
                                            if (name.indexOf("#index#") >= 0) {
                                                thisli.attr("name", name.replace(
                                                    '#index#', i - 2));
                                            } else {
                                                var s = name.indexOf("[");
                                                var e = name.indexOf("]");
                                                var new_name = name.substring(
                                                    s + 1, e);
                                                thisli.attr("name", name.replace(
                                                    new_name, i - 2));
                                            }
                                        }
                                    }
                                });
                        });
                }

                //删除当前li
                function deleteULChild(obj) {
                    var len = $("#dsUL").find("li").length;
                    if (len > 3) {
                        $(obj).parent().parent().remove();
                        resetTrNum();
                    }

                }

                //重置按钮，清空所有
                function superSearchReset() {
                    $("#dsUL").find(".oop:gt(0)").remove();
                    $("#dsLI").find(":input").val("");
                    var spanVal = $("#dsUL>li").find("span.conVal");
                    spanVal.html("<input name='cons[0].val' type='text' style='width:130px;' class='text conditionValue'>");
                    $("#_sqlbuilder").val(null);
                    cgreportConfigHeadListsearch();
                    resetTrNum();
                }

                //判断输入的是否为日期格式
                /*function CheckDate(strInputDate) {
                    if (strInputDate == "")
                        return false;
                    if(strInputDate!="" && strInputDate!=null){
                        strInputDate = strInputDate.replace(/-/g, "/");
                    }
                    var d = new Date(strInputDate);
                    if (isNaN(d))
                        return false;
                    var arr = strInputDate.split("/");
                    return ((parseInt(arr[0], 10) == d.getFullYear())
                            && (parseInt(arr[1], 10) == (d.getMonth() + 1)) && (parseInt(
                            arr[2], 10) == d.getDate()));
                }*/
                //update-begin--Author:xuelin  Date:20171101 for：TASK #2404 【平台UI改造】UI样式改造点---高级查询弹出窗口遮挡----
                //让window居中
                var easyuiPanelOnOpen = function (left, top) {
                    var iframeWidth = $(this).parent().parent().width();

                    var iframeHeight = $(this).parent().parent().height();

                    var windowWidth = $(this).parent().width();
                    var windowHeight = $(this).parent().height();

                    var setWidth = (iframeWidth - windowWidth) / 2;
                    var setHeight = (iframeHeight - windowHeight) / 2;
                    $(this).parent().css({//修正面板位置
                        left: setWidth,
                        top: setHeight
                    });

                    if (iframeHeight < windowHeight) {
                        $(this).parent().css({//修正面板位置
                            left: setWidth,
                            top: 0
                        });
                    }
                    $(".window-shadow").hide();
                };
                $.fn.window.defaults.onOpen = easyuiPanelOnOpen;
                //update-end--Author:xuelin  Date:20171101 for：TASK #2404 【平台UI改造】UI样式改造点---高级查询弹出窗口遮挡----
                $(document).ready(
                    function () {
                        resetTrNum();
                        storage = $.localStorage;
                        if (!storage)
                            storage = $.cookieStorage;
                        var h = storage.get('cgreportConfigHeadList' + 'his');
                        if (h) {
                            his = h;
                            $('#tt li').remove();
                            for (var i = 0; i < his.length; i++) {
                                if (his[i]) {
                                    appendTree(i, his[i].name);
                                }
                            }
                        }
                    });

                //打开高级查询框
                function queryBuilder() {
                    $('#w').window('open');
                }

                //点击历史记录触发事件
                function historyQuery(index) {
                    $("#dsUL").find(".oop:gt(0)").remove();
                    $("#dsLI").find(":input").val("");
                    var queryCons = "[" + his[index].json.strings + "]";
                    var queryCondition = queryCons;
                    var data = JSON.parse(queryCons);
                    var t = $('#dsUL');
                    for (var i = 0; i < data.length; i++) {
                        var v = data[i].value;		//获取value值
                        var begin = v.indexOf("%") == 0;	//表示value是以%开头
                        var end = v.charAt(v.length - 1);//表示value是以%结束
                        var condition = data[i].condition;	//获取条件字段
                        /* 判断'%'以开头还是结束 */
                        if (begin && end != "%") {
                            condition = "likeEnd";
                        } else if (!begin && end == "%") {
                            condition = "likeBegin";
                        }
                        /* 判断Value值是否包含'%','(',')',有则去掉 */
                        if (v != null && v != "") {
                            while (v.indexOf("%") >= 0) {
                                v = v.replace("%", "");
                            }
                            while (v.indexOf("(") > 0 || v.indexOf(")") > 0) {
                                v = v.replace("(", "");
                                v = v.replace(")", "");
                            }
                        }
                        if (i == 0) {
                            $("#dsUL").find("select[name='cons[0].fld']").val(data[i].field);
                            $("#dsUL").find("select[name='cons[0].ctyp']").val(condition);
                            $("#dsUL").find("input[name='cons[0].val']").val(v);
                            $("#anyallSelect").val(data[i].relation);
                            var field = $("#dsUL").find("select[name='cons[0].fld']").find("option:selected");
                            echoField(i, field, v);
                        } else {
                            addULChild_template(i, v, condition, data[i].field);
                        }
                    }
                    $('#_sqlbuilder').val(queryCondition);
                    cgreportConfigHeadListsearch();
                }

                //回显字段类型
                function echoField(i, field, v) {
                    //获取当前field的data属性
                    var popup = $(field).data("popup");
                    var dictionary = $(field).data("dictionary");
                    //sel为字段名称
                    var sel = $(field).val();
                    var spanVal = $(field).closest("#dsUL>li").find("span.conVal");
                    //判断popup是否为TRUE和dictionary是否有逗号
                    var spanHtml = "";
                    if (popup && dictionary.indexOf(',') > 0) {
                        var splitArr = new Array();
                        splitArr = dictionary.split(",");
                        //splitArr=dictionary 0为表编码,1为查询字段,2为返回字段
                        //update-begin-author:taoyan date:20180802 for:TASK #3044 【jeecg测试问题-周俊峰】测试问题
                        spanHtml += "<input name=\"cons[" + i + "].val\" value='" + v + "' type=\"text\" class=\"searchbox-inputtext\" onclick=\"popupClick(this,'" + splitArr[2] + "','val','" + splitArr[0] + "')\"/>";
                        //update-end-author:taoyan date:20180802 for:TASK #3044 【jeecg测试问题-周俊峰】测试问题
                        spanVal.html(spanHtml);
                        $("input[name='cons[" + i + "].val']").css({
                            "background": "url(\"plug-in/diy/icons/search.png\") no-repeat 105px",
                            "width": "130px"
                        });
                    } else {
                        //除了popup通用写法
                        var tempSpan = $("span#field_" + sel).html();
                        spanVal.html(tempSpan);
                        $(spanVal).find("[name='cons[#index#].val']").attr("name", "cons[" + i + "].val").removeAttr("id").val(v);
                    }

                }

                //查询历史操作
                function saveHistory() {
                    var history = new Array();
                    for (var i = 0; i < his.length; i++) {
                        if (his[i]) {
                            history.push(his[i]);
                        }
                    }
                    var tableName = 'cgreportConfigHeadList' + 'his';	//存储数据区分
                    storage.set(tableName, JSON.stringify(history));
                }

                //历史查询记录删除
                function deleteTree() {
                    var node = $('#tt').tree('getSelected');
                    his[node.id] = null;
                    saveHistory();
                    $('#tt').tree('remove', node.target);
                }

                //历史查询记录编辑名称
                function editTree() {
                    var node = $('#tt').tree('getSelected');
                    $('#tt').tree('beginEdit', node.target);
                    his[node.id].name = null;
                    saveHistory();
                }

                //另存为查询记录
                function saveBySelect() {
                    var name = prompt("查询方案名称", "");
                    if (name != null && name != "") {
                        his.push({
                            name: name,
                            json: saveAsJson
                        });
                        saveHistory();
                        appendTree(his.length - 1, name);
                    }
                }

                //添加右侧历史记录
                function appendTree(id, name) {
                    $('#tt').tree('append', {
                        data: [{
                            id: id,
                            text: name,
                            iconCls: "icon-history-search"
                        }]
                    });
                }

            </script>

        </div>
    </div>
    <script src="plug-in/clipboard/ZeroClipboard.js"></script>
    <script type="text/javascript">
        /**
         *    弹出菜单链接
         */
        function popMenuLink(tableName, content) {
            var curWwwPath=window.document.location.href;
            var pathName=window.document.location.pathname;
            var pos=curWwwPath.indexOf(pathName);
            var localhostPaht=curWwwPath.substring(0,pos);
            var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
            content = localhostPaht + projectName + "/";
            $.dialog({
                content: "url:cgreportConfigHeadController.do?popmenulink&url= " + content + "cgReportController.do?list&title=" + tableName,
                drag: false,
                lock: true,
                title: '菜单链接[' + content + ']',
                opacity: 0.3,
                width: 400,
                height: 80, drag: false, min: false, max: false
            }).zindex();
        }

        function addlisttab(tableName, content) {
            var curWwwPath=window.document.location.href;
            //获取主机地址之后的目次，如： uimcardprj/share/meun.jsp
            var pathName=window.document.location.pathname;
            var pos=curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht=curWwwPath.substring(0,pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
            window.open(localhostPaht + projectName + "/cgReportController.do?list&id="+tableName);
            // addOneTab(content, "cgReportController.do?list&id=" + tableName);
        }
    </script>

    <div id="menu" class="easyui-menu" style="width: 30px; display: none;">
        <div id="btn_More" data-options="iconCls:'icon-remove'" onclick="MoreInfo()">更多</div>
    </div>