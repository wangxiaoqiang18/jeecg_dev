<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<t:base type="jquery,easyui,tools,autocomplete"></t:base>
<!--add-start--Author:luobaoli Date:20150607 for：增加表单树型列表-->
<script type="text/javascript">$(function () {
    storage = $.localStorage;
    if (!storage) storage = $.cookieStorage;
    $('#tablePropertyList').datagrid({
        idField: 'id',
        title: '智能表单配置',
        url: 'cgFormHeadController.do?configDatagrid&id=402881e4534c0aea01534c0cfca50012&field=id,jformType,tableName,jformCategory,content,tableVersion,isTree,isPagination,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,physiceId,',
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
        fitColumns: false,
        striped: true,
        showFooter: true,
        frozenColumns: [[{field: 'ck', checkbox: 'true'},]],
        columns: [[{field: 'id', title: '编号', hidden: true, sortable: true}, {
            field: 'jformType',
            title: '表类型',
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
        }, {field: 'tableName', title: '表名', sortable: true}, {
            field: 'jformCategory',
            title: '表单分类',
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
        }, {field: 'content', title: '表描述', sortable: true}, {
            field: 'tableVersion',
            title: '版本1',
            sortable: true
        }, {
            field: 'isTree', title: '是否树', hidden: true, sortable: true, formatter: function (value, rec, index) {
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
            field: 'isCheckbox', title: '显示复选框', hidden: true, sortable: true, formatter: function (value, rec, index) {
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
        }, {field: 'querymode', title: '查询模式', hidden: true, sortable: true}, {
            field: 'createBy',
            title: '创建人',
            hidden: true,
            sortable: true
        }, {
            field: 'createDate', title: '创建时间', hidden: true, sortable: true, formatter: function (value, rec, index) {
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
        }, {field: 'physiceId', title: '配置表版本', hidden: true, sortable: true}, {
            field: 'opt',
            title: '操作',
            formatter: function (value, rec, index) {
                if (!rec.id) {
                    return '';
                }
                var href = '';
                href += "<a href='#'   class='ace_button'  onclick=remCgForm('" + rec.id + "','" + index + "')>  <i class=' fa fa-remove'></i>";
                href += "移除</a>&nbsp;";
                href += "<a href='#'   class='ace_button'  onclick=importFields('" + rec.id + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-download'></i>";
                href += "导入字段</a>&nbsp;";
                href += "<a href='#'   class='ace_button'  onclick=addbytab('" + rec.id + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-plus'></i>";
                href += "模板配置</a>&nbsp;";
                href += "<a href='#'   class='ace_button'  onclick=addlisttab('" + rec.tableName + "','" + rec.content + "','" + rec.id + "','" + index + "')>  <i class=' fa fa-gavel'></i>";
                href += "功能测试</a>&nbsp;";
                href += "<a href='#'   class='ace_button'  onclick=popMenuLink('" + rec.tableName + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-cog'></i>";
                href += "配置地址</a>&nbsp;";
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
            url: 'cgFormHeadController.do?configDatagrid&id=402881e4534c0aea01534c0cfca50012&field=id,jformType,tableName,jformCategory,content,tableVersion,isTree,isPagination,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,physiceId,',
            pageNumber: 1
        });
    }
}

function dosearch(params) {
    var jsonparams = $.parseJSON(params);
    $('#tablePropertyList').datagrid({
        url: 'cgFormHeadController.do?configDatagrid&id=402881e4534c0aea01534c0cfca50012&field=id,jformType,tableName,jformCategory,content,tableVersion,isTree,isPagination,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,physiceId,',
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
        url: 'cgFormHeadController.do?configDatagrid&id=402881e4534c0aea01534c0cfca50012&field=id,jformType,tableName,jformCategory,content,tableVersion,isTree,isPagination,isCheckbox,querymode,createBy,createDate,updateBy,updateDate,physiceId,',
        pageNumber: 1
    });
}</script>
<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">
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
                                   nullmsg="" errormsg="输入错误"/></span></span><span><span style="float:right;"><a
                        href="#" class="easyui-linkbutton" iconCls="icon-search"
                        onclick="tablePropertyListsearch()">查询</a><a href="#" class="easyui-linkbutton"
                                                                     iconCls="icon-reload"
                                                                     onclick="searchReset('tablePropertyList')">重 置</a></span></span>
                </form>
            </div>
            <div style="border-bottom-width:0;" class="datagrid-toolbar"><span style="float:left;"><a href="#"
                                                                                                      class="easyui-linkbutton"
                                                                                                      plain="true"
                                                                                                      icon="icon-edit"
                                                                                                      onclick="updateForm('编辑表单','cgFormHeadController.do?addorupdate','tablePropertyList',900,600)">编辑表单</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
                    onclick="cgFormButton('自定义按钮','cgformButtonController.do?cgformButton','tablePropertyList',null,null)">自定义按钮</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
                    onclick="enhanceJs('js增强','cgformEnhanceJsController.do?addorupdate','tablePropertyList',null,null)">js增强</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
                    onclick="cgFormButtonSql('sql增强','cgformButtonSqlController.do?addorupdate','tablePropertyList',null,null)">sql增强</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
                    onclick="javaEnhance('java增强','cgformEnhanceJavaController.do?addorupdate','tablePropertyList',null,null)">java增强</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-putout"
                    onclick="doMigrateOut('表单导出','cgformSqlController.do?doMigrateOut','tablePropertyList',null,null)">表单导出</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-put"
                    onclick="toCgformMigrate('表单导入','cgformSqlController.do?inSqlFile','tablePropertyList',null,null)">表单导入</a></span>
                <div style="clear:both"></div>
            </div>
            <%--<t:datagrid sortName="createDate" sortOrder="desc" name="tablePropertyList" title="smart.form.config"
                        fitColumns="false" actionUrl="cgFormHeadController.do?configDatagrid&id=${physiceId}" idField="id" fit="true"
                        queryMode="group" checkbox="true" >
                <t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
                <t:dgCol title="table.type" field="jformType" replace="single.table_1,master.table_2,slave.table_3" query="true"></t:dgCol>
                <t:dgCol title="table.name" field="tableName"  query="true" autocomplete="true" />
                <t:dgCol title="form.category" field="jformCategory" dictionary="bdfl"></t:dgCol>
                <t:dgCol title="table.description" field="content"></t:dgCol>
                <t:dgCol title="版本1" field="tableVersion" ></t:dgCol>
                <t:dgCol title="is.tree" field="isTree" hidden="true" replace="common.yes_Y,common.no_N"></t:dgCol>
                <t:dgCol title="is.page" field="isPagination" hidden="true" replace="common.yes_Y,common.no_N"></t:dgCol>
                <t:dgCol title="show.checkbox" field="isCheckbox" hidden="true" replace="common.yes_Y,common.no_N"></t:dgCol>
                <t:dgCol title="common.query.module" field="querymode" hidden="true"></t:dgCol>
                <t:dgCol title="common.createby" field="createBy" hidden="true"></t:dgCol>
                <t:dgCol title="common.createtime" field="createDate" formatter="yyyy/MM/dd" hidden="true"></t:dgCol>
                <t:dgCol title="common.updateby" field="updateBy" hidden="true"></t:dgCol>
                <t:dgCol title="common.updatetime" field="updateDate" formatter="yyyy/MM/dd" hidden="true"></t:dgCol>
                <t:dgCol title="配置表版本" field="physiceId" hidden="true"></t:dgCol>
                <t:dgCol title="common.operation" field="opt"></t:dgCol>
                <t:dgFunOpt funname="remCgForm(id)" title="common.remove"  urlclass="ace_button"  urlfont="fa-remove"></t:dgFunOpt>
                <t:dgFunOpt funname="importFields(id,content)" title="导入字段"  urlclass="ace_button"  urlfont="fa-download"></t:dgFunOpt>
                <t:dgFunOpt funname="addbytab(id,content)" title="form.template"  urlclass="ace_button"  urlfont="fa-plus"></t:dgFunOpt>
                <t:dgFunOpt funname="addlisttab(tableName,content,id)" title="function.test"  urlclass="ace_button"  urlfont="fa-gavel"></t:dgFunOpt>
                <t:dgFunOpt funname="popMenuLink(tableName,content)" title="config.place"  urlclass="ace_button"  urlfont="fa-cog"></t:dgFunOpt>
                <t:dgToolBar title="edit.form" icon="icon-edit" width="900" height="600" url="cgFormHeadController.do?addorupdate" funname="updateForm"></t:dgToolBar>
                <t:dgToolBar title="custom.button" icon="icon-edit" url="cgformButtonController.do?cgformButton" funname="cgFormButton"></t:dgToolBar>
                <t:dgToolBar title="js.enhance" icon="icon-edit" url="cgformEnhanceJsController.do?addorupdate" funname="enhanceJs"></t:dgToolBar>
                <t:dgToolBar title="sql.enhance" icon="icon-edit" url="cgformButtonSqlController.do?addorupdate" funname="cgFormButtonSql"></t:dgToolBar>
                <t:dgToolBar title="java.enhance" icon="icon-edit" url="cgformEnhanceJavaController.do?addorupdate" funname="javaEnhance"></t:dgToolBar>
                <t:dgToolBar title="form.export" icon="icon-putout" url="cgformSqlController.do?doMigrateOut" funname="doMigrateOut"></t:dgToolBar>
                <t:dgToolBar title="form.import" icon="icon-put" url="cgformSqlController.do?inSqlFile" funname="toCgformMigrate"></t:dgToolBar>
                <!--update-begin--Author:gj_shaojc  Date:20180410 for：TASK #2618 【体验问题】复制表单代码生成器功能禁用提醒-->
                &lt;%&ndash; <t:dgToolBar title="code.generate" icon="icon-add" url="generateController.do?gogenerate" funname="generate"></t:dgToolBar> &ndash;%&gt;
                &lt;%&ndash; <t:dgToolBar title="form.generate" icon="icon-add" url="cgformTransController.do?trans" funname="addToData"></t:dgToolBar> &ndash;%&gt;
                <!--update-end--Author:gj_shaojc  Date:20180410 for：TASK #2618 【体验问题】复制表单代码生成器功能禁用提醒-->
            </t:datagrid>--%>
        </div>
    </div>

    <script type="text/javascript">
        function addbytab(id, content) {
            var curWwwPath=window.document.location.href;
            //获取主机地址之后的目次，如： uimcardprj/share/meun.jsp
            var pathName=window.document.location.pathname;
            var pos=curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht=curWwwPath.substring(0,pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
            window.open(localhostPaht + projectName + "/cgformFtlController.do?cgformFtl2&formid="+id);
            <%--addOneTab('<t:mutiLang langKey="form.template"/>[' + content + ']', "cgformFtlController.do?cgformFtl2&formid=" + id);--%>
        }

        //数据库表生成表单
        function addToData(title, url, id, a, b) {
            $.dialog({
                content: "url:" + url,
                lock: true,
                title: title,
                opacity: 0.3,
                width: 400,
                height: 500,
                cache: false,
                cancelVal: '<t:mutiLang langKey="common.close"/>',
                cancel: true,
                drag: false, max: false, min: false
            });
        }

        function delCgForm(id, name) {
            $.dialog.confirm('<t:mutiLang langKey="confirm.delete.record"/>', function () {
                checkIsExit(id, name);
            }, function () {
            }).zindex();
        }

        //检查这个表是否已经存在了
        function checkIsExit(id, name) {
            $.post("cgFormHeadController.do?checkIsExit&&name=" + name, function (data) {
                var d = $.parseJSON(data);
                if (d.success) {
                    $.dialog.confirm('<t:mutiLang langKey="table.exit.in.db.confirm"/>', function () {
                        delThis(id);
                    }, function () {
                    }).zindex();
                } else {
                    delThis(id);
                }
            });
        }

        //删除这个配置
        function delThis(id) {
            doSubmit("cgFormHeadController.do?del&id=" + id, "tablePropertyList");
        }

        function remCgForm(id) {
            $.dialog.confirm('<t:mutiLang langKey="confirm.delete.record"/>', function () {
                removeThis(id);
            }, function () {
            }).zindex();
        }

        function removeThis(id) {
            doSubmit("cgFormHeadController.do?rem&id=" + id, "tablePropertyList");
        }

        //修改痕迹
        function addlisttab(tableName, content, id) {
            var curWwwPath=window.document.location.href;
            //获取主机地址之后的目次，如： uimcardprj/share/meun.jsp
            var pathName=window.document.location.pathname;
            var pos=curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht=curWwwPath.substring(0,pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName=pathName.substring(0,pathName.substr(1).indexOf("/")+1);
            window.open(localhostPaht + projectName + "/cgAutoListController.do?list&id="+tableName);
            <%--addOneTab('<t:mutiLang langKey="form.datalist"/>' + "[" + content + "]", "cgAutoListController.do?list&id=" + tableName);--%>
        }

        function addForm(title, url, id) {
            gridname = id;
            createwindow(title, url, 900, 520);
        }

        function updateForm(title, url, id) {
            gridname = id;
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            createwindow(title, url + '&id=' + rowsData[0].id, 900, 520);

        }

        function jsPlugin(title, url, id) {
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            url += '&id=' + rowsData[0].id;
            $.dialog({
                content: "url:" + url,
                lock: true,
                title: '<t:mutiLang langKey="js.enhance"/>' + "[" + rowData.content + "]",
                opacity: 0.3,
                width: 900,
                height: 500,
                cache: false,
                ok: function () {
                    iframe = this.iframe.contentWindow;
                    iframe.goForm();
                    return false;
                },
                cancelVal: '<t:mutiLang langKey="common.close"/>',
                cancel: true /*为true等价于function(){}*/
            });
        }

        /**
         *    弹出菜单链接
         */
        function popMenuLink(tableName, content) {
            $.dialog({
                content: "url:cgFormHeadController.do?popmenulink&url=cgAutoListController.do?list&title=" + tableName,
                drag: false,
                lock: true,
                title: '<t:mutiLang langKey="common.menu.link"/>' + '[' + content + ']',
                opacity: 0.3,
                width: 400,
                height: 80, drag: false, min: false, max: false
            }).zindex();
        }

        //自定义按钮
        function cgFormButton(title, url, id) {
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            url += '&formId=' + rowsData[0].id + "&tableName=" + rowsData[0].tableName;
            addOneTab('<t:mutiLang langKey="custom.button"/>', url);
        }

        //sql增强
        function cgFormButtonSql(title, url, id) {
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            url += '&formId=' + rowsData[0].id + "&tableName=" + rowsData[0].tableName;
            //addOneTab("按钮sql增强", url);
            $.dialog({
                content: "url:" + url,
                lock: true,
                title: '<t:mutiLang langKey="sql.enhance"/>' + "[" + rowsData[0].content + "]",
                opacity: 0.3,
                width: 900,
                height: 500,
                cache: false,
                ok: function () {
                    iframe = this.iframe.contentWindow;
                    saveObj();
                    return false;
                },
                cancelVal: '<t:mutiLang langKey="common.close"/>',
                cancel: true /*为true等价于function(){}*/
            });
        }


        //js增强
        function enhanceJs(title, url, id) {
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            url += '&formId=' + rowsData[0].id + "&tableName=" + rowsData[0].tableName;
            $.dialog({
                content: "url:" + url,
                lock: true,
                title: '<t:mutiLang langKey="js.enhance"/>' + "[" + rowsData[0].content + "]",
                opacity: 0.3,
                width: 900,
                height: 500,
                cache: false,
                ok: function () {
                    iframe = this.iframe.contentWindow;
                    saveObj();
                    return false;
                },
                cancelVal: '<t:mutiLang langKey="common.close"/>',
                cancel: true /*为true等价于function(){}*/
            });
        }

        //java增强
        function javaEnhance(title, url, id) {
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            url += '&formId=' + rowsData[0].id + "&tableName=" + rowsData[0].tableName;
            $.dialog({
                content: "url:" + url,
                lock: true,
                title: '<t:mutiLang langKey="java.enhance"/>' + "[" + rowsData[0].content + "]",
                opacity: 0.3,
                width: 500,
                height: 300,
                cache: false,
                ok: function () {
                    iframe = this.iframe.contentWindow;
                    saveObj();
                    return false;
                },
                cancelVal: '<t:mutiLang langKey="common.close"/>',
                cancel: true /*为true等价于function(){}*/
            });
        }

        //表单 sql导出
        function doMigrateOut(title, url, id) {
            var rowData = $('#' + id).datagrid('getSelected');
            if (!rowData) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            url += '&ids=' + getListSelections();
            window.location.href = url;
        }

        //表单  sql导入
        function toCgformMigrate() {
            openuploadwin('<t:mutiLang langKey="form.sqlimport"/>', 'cgformSqlController.do?toCgformMigrate', "tablePropertyList");
        }

        //代码生成
        function generate(title, url, id) {
            var rowsData = $('#' + id).datagrid('getSelections');
            if (!rowsData || rowsData.length == 0) {
                tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
                return;
            }
            if (rowsData.length > 1) {
                tip('<t:mutiLang langKey="common.please.select.one.record.to.edit"/>');
                return;
            }
            //附表不能生成代码
            if ("3" == rowsData[0].jformType) {
                tip('<t:mutiLang langKey="slave.table.can.not.generate.code"/>');
                return;
            }

            //未激活的表，不允许生成代码
            if ("N" == rowsData[0].isDbSynch) {
                tip('<t:mutiLang langKey="please.syncdb"/>');
                return;
            }


            url += '&id=' + rowsData[0].id;
            $.dialog({
                content: "url:" + url,
                lock: true,
                title: '<t:mutiLang langKey="code.generate"/>' + " [" + rowsData[0].content + "]",
                opacity: 0.3,
                width: 1100,
                height: 500,
                cache: false,
                ok: function () {
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
        function getListSelections() {
            var ids = '';
            var rows = $("#tablePropertyList").datagrid("getSelections");
            for (var i = 0; i < rows.length; i++) {
                ids += rows[i].id;
                ids += ',';
            }
            ids = ids.substring(0, ids.length - 1);
            return ids;
        }

        /**
         * 以多种方式同步数据库
         * @param id 表单id
         */
        function doDbsynch(id, content) {
            var url = "url:cgFormHeadController.do?goCgFormSynChoice";
            $.dialog({
                content: url,
                drag: false,
                lock: true,
                title: '<t:mutiLang langKey="sync.db"/>' + '[' + content + ']',
                opacity: 0.3,
                width: 400,
                height: 100,
                cache: false,
                cancelVal: '<t:mutiLang langKey="common.close"/>',
                cancel: function () {
                },
                button: [{
                    id: "okBtn",
                    name: '<t:mutiLang langKey="common.confirm"/>',
                    callback: function () {
                        iframe = this.iframe.contentWindow;
                        var synchoice = iframe.getSynChoice();
                        if (synchoice) {
                            var submitUrl = 'cgFormHeadController.do?doDbSynch&id=' + id + '&synMethod=' + synchoice;
                            doSubmit(submitUrl, 'tablePropertyList');
                        } else {
                            alert('<t:mutiLang langKey="please.select.sync.method"/>');
                            return false;
                        }
                    }
                }]
            }).zindex();
        }

        function importFields(id, content) {
            openuploadwin('【' + content + '】Excel导入Online字段', 'cgFormHeadController.do?upload&id=' + id, "tablePropertyList");
        }

        function copyOnline(id) {
            $.post("cgFormHeadController.do?copyOnline", function (data) {
                var d = $.parseJSON(data);
                if (d.success) {
                    addOneTab('智能表单配置表配置', "cgFormHeadController.do?copyList&id=" + d.obj);
                } else {
                    tip(d.mag);
                }
            });
        }

    </script>
