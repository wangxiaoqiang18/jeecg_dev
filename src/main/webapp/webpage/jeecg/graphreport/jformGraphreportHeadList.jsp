<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="jformGraphreportHeadList" checkbox="true" fitColumns="true" title="图表配置" actionUrl="jformGraphreportHeadController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="id"  field="id"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="图表名称"  field="name"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="编码"  field="code"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="查询数据SQL"  field="cgrSql"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="描述"  field="content"    queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="y轴文字"  field="ytext"    queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="x轴数据"  field="categories"    queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="是否显示明细"  field="isShowList"   query="true" queryMode="single" dictionary="sf_yn" width="120"></t:dgCol>
   <t:dgCol title="扩展JS"  field="xpageJs"    queryMode="group"  hidden="true" width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="250"></t:dgCol>
   <t:dgDelOpt title="删除" url="jformGraphreportHeadController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgFunOpt  funname="addlisttab(code,content)" title="function.test" urlclass="ace_button"  urlfont="fa-gavel"></t:dgFunOpt>
   <t:dgFunOpt  funname="popMenuLinkGraph(code,content)" title="config.place" urlclass="ace_button"  urlfont="fa-cog"></t:dgFunOpt>
   <t:dgToolBar title="录入" icon="icon-add" url="jformGraphreportHeadController.do?goAdd" funname="add" width="100%" height="100%"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="jformGraphreportHeadController.do?goUpdate" funname="update" width="100%" height="100%"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="jformGraphreportHeadController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="jformGraphreportHeadController.do?goUpdate" funname="detail"></t:dgToolBar>
    </t:datagrid>
  </div>
 </div>
 <script src = "webpage/jeecg/graphreport/jformGraphreportHeadList.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'jformGraphreportHeadController.do?goImportExcel', "jformGraphreportHeadList");
}

//导出
function ExportXls() {
	JeecgExcelExport("jformGraphreportHeadController.do?exportXls","jformGraphreportHeadList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("jformGraphreportHeadController.do?exportXlsByT","jformGraphreportHeadList");
}
 function addlisttab(tableName,content){
  addOneTab( '<t:mutiLang langKey="form.datalist"/>' + "["+content+"]", "graphReportController.do?list&id="+tableName);
 }

 </script>
--%>

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
<script type="text/javascript" src="${basepath}plug-in/My97DatePicker/WdatePicker.js"></script>
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
            $('#jformGraphreportHeadList').datagrid({
                idField: 'id',
                title: '图表配置',
                url: 'jformGraphreportHeadController.do?datagrid&field=id,name,code,cgrSql,content,ytext,categories,isShowList,xpageJs,',
                fit: true,
                rownumbers: true,
                queryParams: {},
                loadMsg: '数据加载中...',
                pageSize: 10,
                pagination: true,
                pageList: [10, 20, 30],
                sortOrder: 'desc',
                rownumbers: true,
                singleSelect: false,
                fitColumns: true,
                striped: true,
                showFooter: true,
                frozenColumns: [[{field: 'ck', checkbox: 'true'},]],
                columns: [[{field: 'id', title: 'id', width: 120, hidden: true, sortable: true}, {
                    field: 'name',
                    title: '图表名称',
                    width: 120,
                    sortable: true
                }, {field: 'code', title: '编码', width: 120, sortable: true}, {
                    field: 'cgrSql',
                    title: '查询数据SQL',
                    width: 120,
                    sortable: true
                }, {field: 'content', title: '描述', width: 120, sortable: true}, {
                    field: 'ytext',
                    title: 'y轴文字',
                    width: 120,
                    sortable: true
                }, {field: 'categories', title: 'x轴数据', width: 120, sortable: true}, {
                    field: 'isShowList',
                    title: '是否显示明细',
                    width: 120,
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
                }, {field: 'xpageJs', title: '扩展JS', width: 120, hidden: true, sortable: true}, {
                    field: 'opt',
                    title: '操作',
                    width: 250,
                    formatter: function (value, rec, index) {
                        if (!rec.id) {
                            return '';
                        }
                        var href = '';
                        href += "<a href='#'   class='ace_button'  onclick=delObj('jformGraphreportHeadController.do?doDel&id=" + rec.id + "','jformGraphreportHeadList')>  <i class=' fa fa-trash-o'></i> ";
                        href += "删除</a>&nbsp;";
                        href += "<a href='#'   class='ace_button'  onclick=addlisttab('" + rec.code + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-gavel'></i>";
                        href += "功能测试</a>&nbsp;";
                        href += "<a href='#'   class='ace_button'  onclick=popMenuLinkGraph('" + rec.code + "','" + rec.content + "','" + index + "')>  <i class=' fa fa-cog'></i>";
                        href += "配置地址</a>&nbsp;";
                        return href;
                    }
                }]],
                onLoadSuccess: function (data) {
                    $("#jformGraphreportHeadList").datagrid("clearChecked");
                    $("#jformGraphreportHeadList").datagrid("clearSelections");
                    if (!false) {
                        if (data.total && data.rows.length == 0) {
                            var grid = $('#jformGraphreportHeadList');
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
                    gridname = 'jformGraphreportHeadList';
                }
            });
            $('#jformGraphreportHeadList').datagrid('getPager').pagination({
                beforePageText: '',
                afterPageText: '/{pages}',
                displayMsg: '{from}-{to}共 {total}条',
                showPageList: true,
                showRefresh: true
            });
            $('#jformGraphreportHeadList').datagrid('getPager').pagination({
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

        function reloadjformGraphreportHeadList() {
            $('#jformGraphreportHeadList').datagrid('reload');
        }

        function getjformGraphreportHeadListSelected(field) {
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

        function getjformGraphreportHeadListSelections(field) {
            var ids = [];
            var rows = $('#jformGraphreportHeadList').datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i][field]);
            }
            ids.join(',');
            return ids
        };

        function getSelectRows() {
            return $('#jformGraphreportHeadList').datagrid('getChecked');
        }

        function saveHeader() {
            var columnsFields = null;
            var easyextends = false;
            try {
                columnsFields = $('#jformGraphreportHeadList').datagrid('getColumns');
                easyextends = true;
            } catch (e) {
                columnsFields = $('#jformGraphreportHeadList').datagrid('getColumnFields');
            }
            var cols = storage.get('jformGraphreportHeadListhiddenColumns');
            var init = true;
            if (cols) {
                init = false;
            }
            var hiddencolumns = [];
            for (var i = 0; i < columnsFields.length; i++) {
                if (easyextends) {
                    hiddencolumns.push({field: columnsFields[i].field, hidden: columnsFields[i].hidden});
                } else {
                    var columsDetail = $('#jformGraphreportHeadList').datagrid("getColumnOption", columnsFields[i]);
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
            storage.set('jformGraphreportHeadListhiddenColumns', JSON.stringify(hiddencolumns));
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
            var cols = storage.get('jformGraphreportHeadListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    if (cols.visible != false) $('#jformGraphreportHeadList').datagrid((cols[i].hidden == true ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function resetheader() {
            var cols = storage.get('jformGraphreportHeadListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    $('#jformGraphreportHeadList').datagrid((cols.visible == false ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function jformGraphreportHeadListsearch() {
            try {
                if (!$("#jformGraphreportHeadListForm").Validform({tiptype: 3}).check()) {
                    return false;
                }
            } catch (e) {
            }
            if (true) {
                var queryParams = $('#jformGraphreportHeadList').datagrid('options').queryParams;
                $('#jformGraphreportHeadListtb').find('*').each(function () {
                    queryParams[$(this).attr('name')] = $(this).val();
                });
                $('#jformGraphreportHeadList').datagrid({
                    url: 'jformGraphreportHeadController.do?datagrid&field=id,id_begin,id_end,name,code,cgrSql,content,content_begin,content_end,ytext,ytext_begin,ytext_end,categories,categories_begin,categories_end,isShowList,xpageJs,xpageJs_begin,xpageJs_end,',
                    pageNumber: 1
                });
            }
        }

        function dosearch(params) {
            var jsonparams = $.parseJSON(params);
            $('#jformGraphreportHeadList').datagrid({
                url: 'jformGraphreportHeadController.do?datagrid&field=id,id_begin,id_end,name,code,cgrSql,content,content_begin,content_end,ytext,ytext_begin,ytext_end,categories,categories_begin,categories_end,isShowList,xpageJs,xpageJs_begin,xpageJs_end,',
                queryParams: jsonparams
            });
        }

        function jformGraphreportHeadListsearchbox(value, name) {
            var queryParams = $('#jformGraphreportHeadList').datagrid('options').queryParams;
            queryParams[name] = value;
            queryParams.searchfield = name;
            $('#jformGraphreportHeadList').datagrid('reload');
        }

        $('#jformGraphreportHeadListsearchbox').searchbox({
            searcher: function (value, name) {
                jformGraphreportHeadListsearchbox(value, name);
            }, menu: '#jformGraphreportHeadListmm', prompt: '请输入查询关键字'
        });

        function EnterPress(e) {
            var e = e || window.event;
            if (e.keyCode == 13) {
                jformGraphreportHeadListsearch();
            }
        }

        function searchReset(name) {
            $("#" + name + "tb").find(":input").val("");
            var queryParams = $('#jformGraphreportHeadList').datagrid('options').queryParams;
            $('#jformGraphreportHeadListtb').find('*').each(function () {
                queryParams[$(this).attr('name')] = $(this).val();
            });
            $('#jformGraphreportHeadListtb').find("input[type='checkbox']").each(function () {
                $(this).attr('checked', false);
            });
            $('#jformGraphreportHeadListtb').find("input[type='radio']").each(function () {
                $(this).attr('checked', false);
            });
            $('#jformGraphreportHeadList').datagrid({
                url: 'jformGraphreportHeadController.do?datagrid&field=id,id_begin,id_end,name,code,cgrSql,content,content_begin,content_end,ytext,ytext_begin,ytext_end,categories,categories_begin,categories_end,isShowList,xpageJs,xpageJs_begin,xpageJs_end,',
                pageNumber: 1
            });
        }</script>
        <table width="100%" id="jformGraphreportHeadList" toolbar="#jformGraphreportHeadListtb"></table>
        <div id="jformGraphreportHeadListtb" style="padding:3px; height: auto"><input id="_complexSqlbuilder"
                                                                                      name="complexSqlbuilder"
                                                                                      type="hidden"/>
            <div name="searchColums" id="searchColums"><input id="isShowSearchId" type="hidden" value="false"/><input
                    id="_sqlbuilder" name="sqlbuilder" type="hidden"/>
                <form onkeydown='if(event.keyCode==13){jformGraphreportHeadListsearch();return false;}'
                      id='jformGraphreportHeadListForm'><span style="max-width: 79%;display: inline-block;"><span><img
                        style="margin-top:-3px;vertical-align:middle;" src="plug-in/easyui/themes/icons/ti.png"
                        title="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！" alt="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width:74px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="图表名称">&nbsp;&nbsp;&nbsp;图表名称：</span><input onkeypress="EnterPress(event)"
                                                                          onkeydown="EnterPress()" type="text"
                                                                          name="name" style="width: 120px"
                                                                          class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="编码">编码：</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()" type="text"
                                                    name="code" style="width: 120px" class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="查询数据SQL">查询数据SQL：</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()"
                                                              type="text" name="cgrSql" style="width: 120px"
                                                              class="inuptxt"/></span><span
                        style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span
                        style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 90px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
                        title="是否显示明细">是否显示明细：</span><select name="isShowList" style="width: 120px"> <option
                        value="">  </option> <option value="Y">是 </option> <option value="N">否 </option></select></span></span><span><span
                        style="float:right;"><a href="#" class="easyui-linkbutton" iconCls="icon-search"
                                                onclick="jformGraphreportHeadListsearch()">查询</a><a href="#"
                                                                                                    class="easyui-linkbutton"
                                                                                                    iconCls="icon-reload"
                                                                                                    onclick="searchReset('jformGraphreportHeadList')">重 置</a></span></span>
                </form>
            </div>
            <div style="border-bottom-width:0;" class="datagrid-toolbar"><span style="float:left;"><a href="#"
                                                                                                      class="easyui-linkbutton"
                                                                                                      plain="true"
                                                                                                      icon="icon-add"
                                                                                                      onclick="add('录入','jformGraphreportHeadController.do?goAdd','jformGraphreportHeadList','100%','100%')">录入</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
                    onclick="update('编辑','jformGraphreportHeadController.do?goUpdate','jformGraphreportHeadList','100%','100%')">编辑</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-remove"
                    onclick="deleteALLSelect('批量删除','jformGraphreportHeadController.do?doBatchDel','jformGraphreportHeadList',null,null)">批量删除</a><a
                    href="#" class="easyui-linkbutton" plain="true" icon="icon-search"
                    onclick="detail('查看','jformGraphreportHeadController.do?goUpdate','jformGraphreportHeadList',null,null)">查看</a></span>
                <div style="clear:both"></div>
            </div>
        </div>
    </div>
    <script src="webpage/jeecg/graphreport/jformGraphreportHeadList.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //给时间控件加上样式
        });

        //导入
        function ImportXls() {
            openuploadwin('Excel导入', 'jformGraphreportHeadController.do?goImportExcel', "jformGraphreportHeadList");
        }

        //导出
        function ExportXls() {
            JeecgExcelExport("jformGraphreportHeadController.do?exportXls", "jformGraphreportHeadList");
        }

        //模板下载
        function ExportXlsByT() {
            JeecgExcelExport("jformGraphreportHeadController.do?exportXlsByT", "jformGraphreportHeadList");
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
            window.open(localhostPaht + projectName + "/graphReportController.do?list&id="+tableName);
            // addOneTab('表单数据列表' + "[" + content + "]", "graphReportController.do?list&id=" + tableName);
        }

    </script>
</div>