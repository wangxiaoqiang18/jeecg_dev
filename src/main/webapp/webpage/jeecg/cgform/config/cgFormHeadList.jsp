<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,autocomplete"></t:base>

<script type="text/javascript">
	$(function() {
		//增加表单树型列表
		$('#formtree').tree({
			animate : true,
			url : 'systemController.do?formTree&typegroupCode=bdfl',
			onClick : function(node) {
				if ($('#formtree').tree('isLeaf', node.target)) {
					loadFormByType(node.id);
				} else {
					$('#formtree').tree('expand', node.target);

					loadFormByType("");

				}
			}
		});
	});
	
	//根据分类动态加载online表单
	function loadFormByType(jformCategory){
		var url = 'cgFormHeadController.do?datagrid';
		$("#tablePropertyList").datagrid('reload',{jformCategory:jformCategory});
	}
</script>
<!--add-begin--Author:luobaoli  Date:20150607 for：增加表单树型列表-->
<div class="easyui-layout" fit="true">
<%--<div region="west" style="width: 150px;" title="表单分类" split="true" collapsed="true">
	<div class="easyui-panel" style="padding:0px;border:0px" fit="true" border="false">
		<ul id="formtree"></ul>
	</div>
</div>--%>
	<div region="center" style="padding:0px;border:0px">

		<link rel="stylesheet" href="${basepath}plug-in/Validform/css/style.css" type="text/css">
		<link rel="stylesheet" href="${basepath}plug-in/Validform/css/tablefrom.css" type="text/css">
		<script type="text/javascript" src="${basepath}plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
		<script type="text/javascript" src="${basepath}plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
		<script type="text/javascript" src="${basepath}plug-in/Validform/js/datatype_zh-cn.js"></script>
		<link rel="stylesheet" href="${basepath}plug-in/bootstrap/css/bootstrap-btn.css" type="text/css"></link>
		<script type="text/javascript">$(function () {
            storage = $.localStorage;
            if (!storage) storage = $.cookieStorage;
            $('#tablePropertyList').datagrid({
                idField: 'id',
                title: '智能表单配置',
                url: 'cgFormHeadController.do?datagrid&field=id,hasPeizhi,jformType,tableName,jformCategory,content,jformVersion,isTree,isPagination,isDbSynch,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,',
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
                columns: [[{field: 'id', title: '编号', hidden: true, sortable: true}, {
                    field: 'hasPeizhi',
                    title: 'hasPeizhi',
                    hidden: true,
                    sortable: true
                }, {
                    field: 'jformType',
                    title: '表类型',
                    width: 60,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == '1') {
                                    checkboxValue = checkboxValue + '单表' + ',';
                                }
                                if (valArray[k] == '2') {
                                    checkboxValue = checkboxValue + '主表' + ',';
                                }
                                if (valArray[k] == '3') {
                                    checkboxValue = checkboxValue + '附表' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == '1') {
                                return '单表';
                            }
                            if (value == '2') {
                                return '主表';
                            }
                            if (value == '3') {
                                return '附表';
                            } else {
                                return value;
                            }
                        }
                    }
                }, {field: 'tableName', title: '表名', width: 150, sortable: true}, {
                    field: 'jformCategory',
                    title: '表单分类',
                    width: 80,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == 'bdfl_include') {
                                    checkboxValue = checkboxValue + '导入表单' + ',';
                                }
                                if (valArray[k] == 'bdfl_ptbd') {
                                    checkboxValue = checkboxValue + '普通表单' + ',';
                                }
                                if (valArray[k] == 'bdfl_fzbd') {
                                    checkboxValue = checkboxValue + '复杂表单' + ',';
                                }
                                if (valArray[k] == 'bdfl_vipbd') {
                                    checkboxValue = checkboxValue + 'VIP表单' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == 'bdfl_include') {
                                return '导入表单';
                            }
                            if (value == 'bdfl_ptbd') {
                                return '普通表单';
                            }
                            if (value == 'bdfl_fzbd') {
                                return '复杂表单';
                            }
                            if (value == 'bdfl_vipbd') {
                                return 'VIP表单';
                            } else {
                                return value;
                            }
                        }
                    }
                }, {field: 'content', title: '表描述', width: 150, sortable: true}, {
                    field: 'jformVersion',
                    title: '版本',
                    width: 50,
                    sortable: true
                }, {
                    field: 'isTree',
                    title: '是否树',
                    width: 60,
                    hidden: true,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == 'Y') {
                                    checkboxValue = checkboxValue + '是' + ',';
                                }
                                if (valArray[k] == 'N') {
                                    checkboxValue = checkboxValue + '否' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == 'Y') {
                                return '是';
                            }
                            if (value == 'N') {
                                return '否';
                            } else {
                                return value;
                            }
                        }
                    }
                }, {
                    field: 'isPagination',
                    title: '是否分页',
                    width: 60,
                    hidden: true,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == 'Y') {
                                    checkboxValue = checkboxValue + '是' + ',';
                                }
                                if (valArray[k] == 'N') {
                                    checkboxValue = checkboxValue + '否' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == 'Y') {
                                return '是';
                            }
                            if (value == 'N') {
                                return '否';
                            } else {
                                return value;
                            }
                        }
                    }
                }, {
                    field: 'isDbSynch',
                    title: '同步数据库',
                    width: 80,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == 'Y') {
                                    checkboxValue = checkboxValue + '已同步' + ',';
                                }
                                if (valArray[k] == 'N') {
                                    checkboxValue = checkboxValue + '未同步' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == 'Y') {
                                return '已同步';
                            }
                            if (value == 'N') {
                                return '未同步';
                            } else {
                                return value;
                            }
                        }
                    },
                    styler: function (value, rec, index) {
                        if (value == 'N') {
                            return 'background:red;'
                        }
                    }
                }, {
                    field: 'isCheckbox',
                    title: '显示复选框',
                    width: 60,
                    hidden: true,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == 'Y') {
                                    checkboxValue = checkboxValue + '是' + ',';
                                }
                                if (valArray[k] == 'N') {
                                    checkboxValue = checkboxValue + '否' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == 'Y') {
                                return '是';
                            }
                            if (value == 'N') {
                                return '否';
                            } else {
                                return value;
                            }
                        }
                    }
                }, {field: 'querymode', title: '查询模式', width: 100, hidden: true, sortable: true}, {
                    field: 'createBy',
                    title: '创建人',
                    hidden: true,
                    sortable: true
                }, {
                    field: 'createDate',
                    title: '创建时间',
                    hidden: true,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        return new Date().format('yyyy/MM/dd', value);
                    }
                }, {field: 'updateBy', title: '修改人', hidden: true, sortable: true}, {
                    field: 'updateDate',
                    title: '修改时间',
                    hidden: true,
                    sortable: true,
                    formatter: function (value, rec, index) {
                        return new Date().format('yyyy/MM/dd', value);
                    }
                }, {
                    field: 'opt', title: '操作', width: 500, formatter: function (value, rec, index) {
                        if (!rec.id) {
                            return '';
                        }
                        var href = '';
                        href += "<a href='#'   class='ace_button'  onclick=delCgForm('" + rec.id + "','" + rec.tableName + "','" + index + "') style='background-color:#ec4758;' >  <i class=' fa fa-trash-o'></i>";
                        href += "删除</a>&nbsp;";
                        href += "<a href='#'   class='ace_button'  onclick=remCgForm('" + rec.id + "','" + index + "') style='background-color:#FFA500;' >  <i class=' fa fa-remove'></i>";
                        href += "移除</a>&nbsp;";
                        if ($.inArray(rec.isDbSynch, ['N']) >= 0) {
                            href += "<a href='#'   class='ace_button'  onclick=doDbsynch('" + rec.id + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-database'></i>";
                            href += "同步数据库</a>&nbsp;";
                        }
                        // if ($.inArray(rec.isDbSynch, ['Y']) >= 0) {
                        //     if ($.inArray(rec.jformType, ['3']) < 0) {
                        //         href += "<a href='#'   class='ace_button'  onclick=addbytab('" + rec.id + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-cog'></i>";
                        //         href += "模板配置</a>&nbsp;";
                        //     }
                        // }
                        if ($.inArray(rec.isDbSynch, ['Y']) >= 0) {
                            if ($.inArray(rec.jformType, ['3']) < 0) {
                                href += "<a href='#'   class='ace_button'  onclick=addlisttab('" + rec.tableName + "','" + rec.content + "','" + index + "') style='background-color:#18a689;' >  <i class=' fa fa-gavel'></i>";
                                href += "功能测试</a>&nbsp;";
                            }
                        }
                        if ($.inArray(rec.isDbSynch, ['Y']) >= 0) {
                            if ($.inArray(rec.jformType, ['3']) < 0) {
                                href += "<a href='#'   class='ace_button'  onclick=popMenuLink('" + rec.tableName + "','" + rec.content + "','" + index + "') style='background-color:#1a7bb9;' >  <i class=' fa fa-cog'></i>";
                                href += "配置地址</a>&nbsp;";
                            }
                        }
                        href += "<a href='#'   class='ace_button'  onclick=copyOnline('" + rec.id + "','" + index + "')>  <i class=' fa fa-copy'></i>";
                        href += "复制表单</a>&nbsp;";
                        // if ($.inArray(rec.hasPeizhi, ['0']) < 0) {
                        //     href += "<a href='#'   class='ace_button'  onclick=propertyTable('" + rec.id + "','" + index + "')>  <i class=' fa fa-cog'></i>";
                        //     href += "配置表</a>&nbsp;";
                        // }
                        return href;
                    }
                }]],
                onLoadSuccess: function (data) {
                    $("#tablePropertyList").datagrid("clearChecked");
                    $("#tablePropertyList").datagrid("clearSelections");
                    if (!false) {
                        if (data.total && data.rows.length == 0) {
                            var grid = $('#tablePropertyList');
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
                    gridname = 'tablePropertyList';
                }
            });
            $('#tablePropertyList').datagrid('getPager').pagination({
                beforePageText: '',
                afterPageText: '/{pages}',
                displayMsg: '{from}-{to}共 {total}条',
                showPageList: true,
                showRefresh: true
            });
            $('#tablePropertyList').datagrid('getPager').pagination({
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

        function reloadtablePropertyList() {
            $('#tablePropertyList').datagrid('reload');
        }

        function gettablePropertyListSelected(field) {
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

        function gettablePropertyListSelections(field) {
            var ids = [];
            var rows = $('#tablePropertyList').datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i][field]);
            }
            ids.join(',');
            return ids
        };

        function getSelectRows() {
            return $('#tablePropertyList').datagrid('getChecked');
        }

        function saveHeader() {
            var columnsFields = null;
            var easyextends = false;
            try {
                columnsFields = $('#tablePropertyList').datagrid('getColumns');
                easyextends = true;
            } catch (e) {
                columnsFields = $('#tablePropertyList').datagrid('getColumnFields');
            }
            var cols = storage.get('tablePropertyListhiddenColumns');
            var init = true;
            if (cols) {
                init = false;
            }
            var hiddencolumns = [];
            for (var i = 0; i < columnsFields.length; i++) {
                if (easyextends) {
                    hiddencolumns.push({field: columnsFields[i].field, hidden: columnsFields[i].hidden});
                } else {
                    var columsDetail = $('#tablePropertyList').datagrid("getColumnOption", columnsFields[i]);
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
            storage.set('tablePropertyListhiddenColumns', JSON.stringify(hiddencolumns));
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
            var cols = storage.get('tablePropertyListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    if (cols.visible != false) $('#tablePropertyList').datagrid((cols[i].hidden == true ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function resetheader() {
            var cols = storage.get('tablePropertyListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    $('#tablePropertyList').datagrid((cols.visible == false ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function tablePropertyListsearch() {
            try {
                if (!$("#tablePropertyListForm").Validform({tiptype: 3}).check()) {
                    return false;
                }
            } catch (e) {
            }
            if (true) {
                var queryParams = $('#tablePropertyList').datagrid('options').queryParams;
                $('#tablePropertyListtb').find('*').each(function () {
                    queryParams[$(this).attr('name')] = $(this).val();
                });
                $('#tablePropertyList').datagrid({
                    url: 'cgFormHeadController.do?datagrid&field=id,hasPeizhi,jformType,tableName,jformCategory,content,jformVersion,isTree,isPagination,isDbSynch,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,',
                    pageNumber: 1
                });
            }
        }

        function dosearch(params) {
            var jsonparams = $.parseJSON(params);
            $('#tablePropertyList').datagrid({
                url: 'cgFormHeadController.do?datagrid&field=id,hasPeizhi,jformType,tableName,jformCategory,content,jformVersion,isTree,isPagination,isDbSynch,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,',
                queryParams: jsonparams
            });
        }

        function tablePropertyListsearchbox(value, name) {
            var queryParams = $('#tablePropertyList').datagrid('options').queryParams;
            queryParams[name] = value;
            queryParams.searchfield = name;
            $('#tablePropertyList').datagrid('reload');
        }

        $('#tablePropertyListsearchbox').searchbox({
            searcher: function (value, name) {
                tablePropertyListsearchbox(value, name);
            }, menu: '#tablePropertyListmm', prompt: '请输入查询关键字'
        });

        function EnterPress(e) {
            var e = e || window.event;
            if (e.keyCode == 13) {
                tablePropertyListsearch();
            }
        }

        function searchReset(name) {
            $("#" + name + "tb").find(":input").val("");
            var queryParams = $('#tablePropertyList').datagrid('options').queryParams;
            $('#tablePropertyListtb').find('*').each(function () {
                queryParams[$(this).attr('name')] = $(this).val();
            });
            $('#tablePropertyListtb').find("input[type='checkbox']").each(function () {
                $(this).attr('checked', false);
            });
            $('#tablePropertyListtb').find("input[type='radio']").each(function () {
                $(this).attr('checked', false);
            });
            $('#tablePropertyList').datagrid({
                url: 'cgFormHeadController.do?datagrid&field=id,hasPeizhi,jformType,tableName,jformCategory,content,jformVersion,isTree,isPagination,isDbSynch,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,',
                pageNumber: 1
            });
        }</script>
		<table width="100%" id="tablePropertyList" toolbar="#tablePropertyListtb"></table>
		<div id="tablePropertyListtb" style="padding:3px; height: auto"><input id="_complexSqlbuilder"
																			   name="complexSqlbuilder" type="hidden"/>
			<div name="searchColums" id="searchColums"><input id="isShowSearchId" type="hidden" value="false"/><input
					id="_sqlbuilder" name="sqlbuilder" type="hidden"/>
				<form onkeydown='if(event.keyCode==13){tablePropertyListsearch();return false;}'
					  id='tablePropertyListForm'><span style="max-width: 79%;display: inline-block;"><span><img
						style="margin-top:-3px;vertical-align:middle;" src="plug-in/easyui/themes/icons/ti.png"
						title="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！" alt="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！"/></span><span
						style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
						style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width:74px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
						title="表类型">&nbsp;&nbsp;&nbsp;表类型：&nbsp;&nbsp;&nbsp;</span><select name="jformType"
																						   style="width: 120px"> <option
						value="">  </option><option value="1">单表</option><option value="2">主表</option><option value="3">附表</option></select></span><span
						style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
						style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
						title="表名">表名：</span><script type="text/javascript">$(document).ready(function () {
                    $("#CgFormHeadEntity_tableName").autocomplete("commonController.do?getAutoList", {
                        max: 5,
                        minChars: 2,
                        width: 200,
                        scrollHeight: 100,
                        matchContains: true,
                        autoFill: false,
                        extraParams: {
                            featureClass: "P",
                            style: "full",
                            maxRows: 10,
                            labelField: "tableName",
                            valueField: "tableName",
                            searchField: "tableName",
                            entityName: "CgFormHeadEntity",
                            trem: function () {
                                return $("#CgFormHeadEntity_tableName").val();
                            }
                        },
                        parse: function (data) {
                            return jeecgAutoParse.call(this, data);
                        },
                        formatItem: function (row, i, max) {
                            return row['tableName'];
                        }
                    }).result(function (event, row, formatted) {
                        $("#CgFormHeadEntity_tableName").val(row['tableName']);
                    });
                });</script><input class="inuptxt" type="text" id="CgFormHeadEntity_tableName" name="tableName"
								   nullmsg="" errormsg="输入错误"/></span><span
						style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
						style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
						title="同步数据库">同步数据库：</span><select name="isDbSynch" style="width: 120px"> <option
						value="">  </option><option value="Y">已同步</option><option value="N">未同步</option></select></span></span><span><span
						style="float:right;"><button class="btn btn-info btn-xs" type="button"
													 onclick="tablePropertyListsearch()"><i
						class="fa fa-search"></i><span class="bigger-110 no-text-shadow">查询</span></button><button
						class="btn btn-info btn-xs" type="button" onclick="searchReset('tablePropertyList')"><i
						class="fa fa-refresh"></i><span
						class="bigger-110 no-text-shadow">重 置</span></button></span></span></form>
			</div>
			<div style="border-bottom-width:0;" class="datagrid-toolbar"><span style="float:left;">
				<%--<button
					class="btn btn-default btn-xs"
					onclick="addForm('创建表单','cgFormHeadController.do?addorupdate','tablePropertyList','100%','100%')"><i
					class="fa fa-plus"></i><span class="bigger-110 no-text-shadow">创建表单</span>
				</button>
				<button
					class="btn btn-default btn-xs"
					onclick="updateForm('编辑表单','cgFormHeadController.do?addorupdate','tablePropertyList','100%','100%')"><i
					class="fa fa-edit"></i><span class="bigger-110 no-text-shadow">编辑表单</span>
				</button>
				<button
					class="btn btn-default btn-xs"
					onclick="cgFormButton('自定义按钮','cgformButtonController.do?cgformButton','tablePropertyList',null,null)"><i
					class="fa fa-bars"></i><span class="bigger-110 no-text-shadow">自定义按钮</span>
				</button>--%>
				<%--<button
					class="btn btn-default btn-xs"
					onclick="enhanceJs('js增强','cgformEnhanceJsController.do?addorupdate','tablePropertyList',null,null)"><i
					class="fa fa-strikethrough"></i><span class="bigger-110 no-text-shadow">js增强</span></button><button
					class="btn btn-default btn-xs"
					onclick="cgFormButtonSql('sql增强','cgformButtonSqlController.do?addorupdate','tablePropertyList',null,null)"><i
					class="fa fa-filter"></i><span class="bigger-110 no-text-shadow">sql增强</span></button><button
					class="btn btn-default btn-xs"
					onclick="javaEnhance('java增强','cgformEnhanceJavaController.do?addorupdate','tablePropertyList',null,null)"><i
					class="fa fa-wrench"></i><span class="bigger-110 no-text-shadow">java增强</span></button>--%>
				<button
					class="btn btn-default btn-xs"
					onclick="doMigrateOut('表单导出','cgformSqlController.do?doMigrateOut','tablePropertyList',null,null)"><i
					class="fa fa-download"></i><span class="bigger-110 no-text-shadow">表单导出</span></button><button
					class="btn btn-default btn-xs"
					onclick="toCgformMigrate('表单导入','cgformSqlController.do?inSqlFile','tablePropertyList',null,null)"><i
					class="fa fa-upload"></i><span class="bigger-110 no-text-shadow">表单导入</span></button>
				<%--<button
					class="btn btn-default btn-xs"
					onclick="generate('代码生成','generateController.do?gogenerate','tablePropertyList',null,null)"><i
					class="fa fa-spinner"></i><span class="bigger-110 no-text-shadow">代码生成</span></button>--%>
				<button
					class="btn btn-default btn-xs"
					onclick="addToData('数据库导入表单','cgformTransController.do?trans','tablePropertyList',null,null)"><i
					class="fa fa-database"></i><span class="bigger-110 no-text-shadow">数据库导入表单</span></button></span>
				<div style="clear:both"></div>
			</div>
		</div>
</div>
</div>
</div>

<script type="text/javascript">
	function addbytab(id,content) {
		addOneTab('<t:mutiLang langKey="form.template"/>['+content+']' , "cgformFtlController.do?cgformFtl2&formid="+id);
	}

	//数据库表生成表单
	function addToData(title,url,id,a,b){
  		$.dialog({
			content: "url:"+url,
			lock : true,
			title: title,
			opacity : 0.3,
			width:400,
			height:500,
			cache:false,
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: true,
            drag:false,max:false,min:false
		});
	}
	function delCgForm(id,name){

		$.dialog.confirm('<t:mutiLang langKey="confirm.online.delete.record"/>', function(){
			checkIsExit(id,name);
		}, function(){
		}).zindex();

	}
	//检查这个表是否已经存在了
	function checkIsExit(id,name){
		$.post("cgFormHeadController.do?checkIsExit&&name="+name,function(data){
			var d = $.parseJSON(data);
			if (d.success) {
				$.dialog.confirm('<t:mutiLang langKey="table.exit.in.db.confirm"/>', function(){
					delThis(id);
				}, function(){
				}).zindex();
			}else{
				delThis(id);
			}
		});
	}
	//删除这个配置
	function delThis(id){
		doSubmit("cgFormHeadController.do?del&id="+id,"tablePropertyList");
	}

	function remCgForm(id){
		$.dialog.confirm('<t:mutiLang langKey="confirm.delete.record"/>', function(){
			removeThis(id);
		}, function(){
		}).zindex();
	}
	
	function removeThis(id){
		doSubmit("cgFormHeadController.do?rem&id="+id,"tablePropertyList");
	}

	function addlisttab(tableName,content){
        var curWwwPath=window.document.location.href;
        //获取主机地址之后的目次，如： uimcardprj/share/meun.jsp
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8083
        var localhostPaht=curWwwPath.substring(0,pos);
        //获取带"/"的项目名，如：/uimcardprj
        var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
	    window.open(localhostPaht + projectName + "/cgAutoListController.do?list&id="+tableName);
		<%--addOneTab( '<t:mutiLang langKey="form.datalist"/>' + "["+content+"]", "cgAutoListController.do?list&id="+tableName);--%>
	}
	
	//加校验参数，校验必填
	function addForm(title,url,id,width,height){
		gridname=id;
		createwindow(title,url,width,height);
	}
	function updateForm(title,url,id,width,height){
		gridname=id;
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		createwindow(title,url + '&id='+rowsData[0].id,width,height);
	}
	function jsPlugin(title,url,id){
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		url += '&id='+rowsData[0].id;
  		$.dialog({
			content: "url:"+url,
			lock : true,
			title:'<t:mutiLang langKey="js.enhance"/>' + "["+rowData.content+"]",
			opacity : 0.3,
			width:900,
			height:500,
			cache:false,
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
		    	iframe.goForm();
				return false;
		    },
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: true /*为true等价于function(){}*/
		});
	}
	
	/**
	*	弹出菜单链接
	*/
	function popMenuLink(tableName,content){
        var curWwwPath=window.document.location.href;
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        var localhostPaht=curWwwPath.substring(0,pos);
        var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
        content = localhostPaht + projectName + "/";
        $.dialog({
			content: "url:cgFormHeadController.do?popmenulink&url= " + content + "cgAutoListController.do?list&title="+tableName,
			drag :false,
			lock : true,
			title:'<t:mutiLang langKey="common.menu.link"/>' + '['+content+']',
			opacity : 0.3,
			width:400,
			height:80,drag:false,min:false,max:false
		}).zindex();
	}

	//自定义按钮
	function cgFormButton(title,url,id){
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		url += '&formId='+rowsData[0].id+"&tableName="+rowsData[0].tableName;
        var curWwwPath=window.document.location.href;
        //获取主机地址之后的目次，如： uimcardprj/share/meun.jsp
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8083
        var localhostPaht=curWwwPath.substring(0,pos);
        //获取带"/"的项目名，如：/uimcardprj
        var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
        window.open(localhostPaht + projectName + "/" + url);
		<%--addOneTab('<t:mutiLang langKey="custom.button"/>', url);--%>
	}

	//sql增强
	function cgFormButtonSql(title,url,id){
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		url += '&formId='+rowsData[0].id+"&tableName="+rowsData[0].tableName;
		//addOneTab("按钮sql增强", url);
		$.dialog({
			content: "url:"+url,
			lock : true,
			title: '<t:mutiLang langKey="sql.enhance"/>' + "["+rowsData[0].content+"]",
			opacity : 0.3,
			width:1000,
			height:500,
			cache:false,
		    ok: function(){
				iframe = this.iframe.contentWindow;
				saveObj();
				return false;
		    },
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: true /*为true等价于function(){}*/
		});
	}

	
	//js增强
	function enhanceJs(title,url,id){
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		url += '&formId='+rowsData[0].id+"&tableName="+rowsData[0].tableName;
		$.dialog({
			content: "url:"+url,
			lock : true,
			title: '<t:mutiLang langKey="js.enhance"/>' + "["+rowsData[0].content+"]",
			opacity : 0.3,
			width:1000,
			height:500,
			cache:false,
		    ok: function(){
				iframe = this.iframe.contentWindow;
				saveObj();
				return false;
		    },
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: true /*为true等价于function(){}*/
		});
	}
	
	//java增强
	function javaEnhance(title,url,id){
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		url += '&formId='+rowsData[0].id+"&tableName="+rowsData[0].tableName;
		$.dialog({
			content: "url:"+url,
			lock : true,
			title: '<t:mutiLang langKey="java.enhance"/>' + "["+rowsData[0].content+"]",
			opacity : 0.3,
			width:500,
			height:300,
			cache:false,
		    ok: function(){
				iframe = this.iframe.contentWindow;
				saveObj();
				return false;
		    },
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: true /*为true等价于function(){}*/
		});
	}

	//表单 sql导出
	function doMigrateOut(title,url,id){
		var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		url += '&ids='+ getListSelections();
		window.location.href= url;
	}

	//表单  sql导入
	function toCgformMigrate(){
		openuploadwin('<t:mutiLang langKey="form.sqlimport"/>', 'cgformSqlController.do?toCgformMigrate', "tablePropertyList");
	}
	//代码生成
	function generate(title,url,id){
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
			return;
		}
		if (rowsData.length>1) {
			tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
			return;
		}
		//附表不能生成代码
		if("3" == rowsData[0].jformType){
			tip('<t:mutiLang langKey="slave.table.can.not.generate.code"/>');
			return;
		}

		//未激活的表，不允许生成代码
		if("N" == rowsData[0].isDbSynch){
			tip('<t:mutiLang langKey="please.syncdb"/>');
			return;
		}
		url += '&id='+rowsData[0].id;
		$.dialog({
			content: "url:"+url,
			lock : true,
			title: '<t:mutiLang langKey="code.generate"/>' + " ["+rowsData[0].content+"]",
			opacity : 0.3,
			width:1250,
			zIndex: getzIndex(),
			height:500,
			cache:false,
		    ok: function(){
				iframe = this.iframe.contentWindow;
				saveObj();
				return false;
		    },
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: true /*为true等价于function(){}*/
		});
	}

	/**
	 * 获取列表中选中行的数据（多行）
	 * @param field 数据中字段名-不传此参数则获取全部数据
	 * @return 选中行的给定字段值，以逗号分隔
	 */
	function getListSelections(){
		var ids = '';
		var rows = $("#tablePropertyList").datagrid("getSelections");
		for(var i=0;i<rows.length;i++){
			ids+=rows[i].id;
			ids+=',';
		}
		ids = ids.substring(0,ids.length-1);
		return ids;
	}	
	
	/**
	 * 以多种方式同步数据库
	 * @param id 表单id
	 */
	function doDbsynch(id,content){
		var url = "url:cgFormHeadController.do?goCgFormSynChoice";
		$.dialog({
			content: url,
			drag :false,
			lock : true,
			title: '<t:mutiLang langKey="sync.db"/>' + '['+content+']',
			opacity : 0.3,
			width:400,
			height:100,
			cache:false,
		    cancelVal: '<t:mutiLang langKey="common.close"/>',
		    cancel: function(){},
		    button : [{
		    	id : "okBtn",
		    	name : '<t:mutiLang langKey="common.confirm"/>',
		    	callback : function () {
		    		iframe = this.iframe.contentWindow;
		    		var synchoice = iframe.getSynChoice();
		    		if(synchoice){
						var submitUrl = 'cgFormHeadController.do?doDbSynch&id='+id+'&synMethod='+synchoice;
						doSubmit(submitUrl,'tablePropertyList');
				    }else{
						alert('<t:mutiLang langKey="please.select.sync.method"/>');
						return false;
					}
		    	}
		    }]
		}).zindex();
	}
	
	function importFields(id,content) {
		openuploadwin('【'+content+'】Excel导入Online字段', 'cgFormHeadController.do?upload&id='+id, "tablePropertyList");
	}
	
	//表单复制功能,一个物理表配置多个配置表
	function copyOnline(id){
		$.dialog.confirm('<t:mutiLang langKey="confirm.copy.form"/>', function(){
			$.post("cgFormHeadController.do?copyOnline",
					{id : id},	
					function(data){
					var d = $.parseJSON(data);
					if (d.success) {
						tip(d.msg);

						reloadTable();

					}else{
						tip(d.msg);
					}
				});
		}, function(){
		}).zindex();
	}
	
	function propertyTable(id){
		$.post("cgFormHeadController.do?getConfigId",
				{id : id},	
				function(data){
				var d = $.parseJSON(data);
				if (d.success) {
                    var curWwwPath=window.document.location.href;
                    //获取主机地址之后的目次，如： uimcardprj/share/meun.jsp
                    var pathName=window.document.location.pathname;
                    var pos=curWwwPath.indexOf(pathName);
                    //获取主机地址，如： http://localhost:8083
                    var localhostPaht=curWwwPath.substring(0,pos);
                    //获取带"/"的项目名，如：/uimcardprj
                    var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
                    window.open(localhostPaht + projectName + "/cgFormHeadController.do?cgFormHeadConfigList&id="+d.obj);
                    // addOneTab( 'Online配置表单开发', "cgFormHeadController.do?cgFormHeadConfigList&id="+d.obj);
				}else{
					tip(d.msg);
				}
			});
	}
</script>
