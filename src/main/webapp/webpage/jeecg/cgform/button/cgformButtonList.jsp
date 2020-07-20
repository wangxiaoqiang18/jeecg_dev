<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">
        <script type="text/javascript">
            $(function () {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                var formId = "";
                for (var i =0; i < vars.length; i++) {
                    if (vars[i].split('=')[0] === 'formId') {
                        formId = vars[i].split('=')[1];
                    }
                }
            storage = $.localStorage;
            if (!storage) storage = $.cookieStorage;
            $('#cgformButtonList').datagrid({
                idField: 'id',
                title: '自定义按钮',
                url: 'cgformButtonController.do?datagrid&formId=' + formId + '&field=id,buttonCode,buttonName,buttonStyle,optType,orderNum,buttonIcon,exp,buttonStatus,',
                fit: true,
                rownumbers: true,
                loadMsg: '数据加载中...',
                pageSize: 10,
                pagination: true,
                pageList: [10, 20, 30],
                sortOrder: 'desc',
                rownumbers: true,
                singleSelect: true,
                fitColumns: true,
                striped: true,
                showFooter: true,
                frozenColumns: [[]],
                columns: [[{field: 'id', title: '编号', hidden: true, sortable: true}, {
                    field: 'buttonCode',
                    title: '按钮编码',
                    sortable: true
                }, {field: 'buttonName', title: '按钮名称', sortable: true}, {
                    field: 'buttonStyle',
                    title: '按钮样式',
                    sortable: true
                }, {field: 'optType', title: '动作类型', sortable: true}, {
                    field: 'orderNum',
                    title: '显示顺序',
                    sortable: true
                }, {field: 'buttonIcon', title: '显示图标样式', sortable: true}, {
                    field: 'exp',
                    title: '显示表达式',
                    sortable: true
                }, {
                    field: 'buttonStatus', title: '状态', sortable: true, formatter: function (value, rec, index) {
                        if (value == undefined) return '';
                        var valArray = value.split(',');
                        if (valArray.length > 1) {
                            var checkboxValue = '';
                            for (var k = 0; k < valArray.length; k++) {
                                if (valArray[k] == '1') {
                                    checkboxValue = checkboxValue + '激活' + ',';
                                }
                                if (valArray[k] == '0') {
                                    checkboxValue = checkboxValue + '未激活' + ',';
                                }
                            }
                            return checkboxValue.substring(0, checkboxValue.length - 1);
                        } else {
                            if (value == '1') {
                                return '激活';
                            }
                            if (value == '0') {
                                return '未激活';
                            } else {
                                return value;
                            }
                        }
                    }
                }, {
                    field: 'opt', title: '操作', width: 100, formatter: function (value, rec, index) {
                        if (!rec.id) {
                            return '';
                        }
                        var href = '';
                        href += "<a href='#'   class='ace_button'  onclick=delObj('cgformButtonController.do?del&id=" + rec.id + "&formId=402881e4534c0aea01534c0cfca50012','cgformButtonList')>  <i class=' fa fa-trash-o'></i> ";
                        href += "删除</a>&nbsp;";
                        return href;
                    }
                }]],
                onLoadSuccess: function (data) {
                    $("#cgformButtonList").datagrid("clearChecked");
                    $("#cgformButtonList").datagrid("clearSelections");
                    if (!false) {
                        if (data.total && data.rows.length == 0) {
                            var grid = $('#cgformButtonList');
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
                    gridname = 'cgformButtonList';
                }
            });
            $('#cgformButtonList').datagrid('getPager').pagination({
                beforePageText: '',
                afterPageText: '/{pages}',
                displayMsg: '{from}-{to}共 {total}条',
                showPageList: true,
                showRefresh: true
            });
            $('#cgformButtonList').datagrid('getPager').pagination({
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

        function reloadcgformButtonList() {
            $('#cgformButtonList').datagrid('reload');
        }

        function getcgformButtonListSelected(field) {
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

        function getcgformButtonListSelections(field) {
            var ids = [];
            var rows = $('#cgformButtonList').datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i][field]);
            }
            ids.join(',');
            return ids
        };

        function getSelectRows() {
            return $('#cgformButtonList').datagrid('getChecked');
        }

        function saveHeader() {
            var columnsFields = null;
            var easyextends = false;
            try {
                columnsFields = $('#cgformButtonList').datagrid('getColumns');
                easyextends = true;
            } catch (e) {
                columnsFields = $('#cgformButtonList').datagrid('getColumnFields');
            }
            var cols = storage.get('cgformButtonListhiddenColumns');
            var init = true;
            if (cols) {
                init = false;
            }
            var hiddencolumns = [];
            for (var i = 0; i < columnsFields.length; i++) {
                if (easyextends) {
                    hiddencolumns.push({field: columnsFields[i].field, hidden: columnsFields[i].hidden});
                } else {
                    var columsDetail = $('#cgformButtonList').datagrid("getColumnOption", columnsFields[i]);
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
            storage.set('cgformButtonListhiddenColumns', JSON.stringify(hiddencolumns));
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
            var cols = storage.get('cgformButtonListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    if (cols.visible != false) $('#cgformButtonList').datagrid((cols[i].hidden == true ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function resetheader() {
            var cols = storage.get('cgformButtonListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    $('#cgformButtonList').datagrid((cols.visible == false ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function cgformButtonListsearch() {
            try {
                if (!$("#cgformButtonListForm").Validform({tiptype: 3}).check()) {
                    return false;
                }
            } catch (e) {
            }
            if (true) {
                var queryParams = $('#cgformButtonList').datagrid('options').queryParams;
                $('#cgformButtonListtb').find('*').each(function () {
                    queryParams[$(this).attr('name')] = $(this).val();
                });
                $('#cgformButtonList').datagrid({
                    url: 'cgformButtonController.do?datagrid&formId=402881e4534c0aea01534c0cfca50012&field=id,buttonCode,buttonName,buttonStyle,optType,orderNum,buttonIcon,exp,buttonStatus,',
                    pageNumber: 1
                });
            }
        }

        function dosearch(params) {
            var jsonparams = $.parseJSON(params);
            $('#cgformButtonList').datagrid({
                url: 'cgformButtonController.do?datagrid&formId=402881e4534c0aea01534c0cfca50012&field=id,buttonCode,buttonName,buttonStyle,optType,orderNum,buttonIcon,exp,buttonStatus,',
                queryParams: jsonparams
            });
        }

        function cgformButtonListsearchbox(value, name) {
            var queryParams = $('#cgformButtonList').datagrid('options').queryParams;
            queryParams[name] = value;
            queryParams.searchfield = name;
            $('#cgformButtonList').datagrid('reload');
        }

        $('#cgformButtonListsearchbox').searchbox({
            searcher: function (value, name) {
                cgformButtonListsearchbox(value, name);
            }, menu: '#cgformButtonListmm', prompt: '请输入查询关键字'
        });

        function EnterPress(e) {
            var e = e || window.event;
            if (e.keyCode == 13) {
                cgformButtonListsearch();
            }
        }

        function searchReset(name) {
            $("#" + name + "tb").find(":input").val("");
            var queryParams = $('#cgformButtonList').datagrid('options').queryParams;
            $('#cgformButtonListtb').find('*').each(function () {
                queryParams[$(this).attr('name')] = $(this).val();
            });
            $('#cgformButtonListtb').find("input[type='checkbox']").each(function () {
                $(this).attr('checked', false);
            });
            $('#cgformButtonListtb').find("input[type='radio']").each(function () {
                $(this).attr('checked', false);
            });
            $('#cgformButtonList').datagrid({
                url: 'cgformButtonController.do?datagrid&formId=402881e4534c0aea01534c0cfca50012&field=id,buttonCode,buttonName,buttonStyle,optType,orderNum,buttonIcon,exp,buttonStatus,',
                pageNumber: 1
            });
        }</script>
        <table width="100%" id="cgformButtonList" toolbar="#cgformButtonListtb"></table>
        <div id="cgformButtonListtb" style="padding:3px; height: auto">
            <input id="_complexSqlbuilder"  name="complexSqlbuilder" type="hidden"/>
            <div style="border-bottom-width:0;" class="datagrid-toolbar"><span style="float:left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="add('录入','cgformButtonController.do?addorupdate&formId=${formId}','cgformButtonList',null,null)">录入</a>
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="update('编辑','cgformButtonController.do?addorupdate','cgformButtonList',null,null)">编辑</a>
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-search" onclick="detail('查看','cgformButtonController.do?addorupdate','cgformButtonList',null,null)">查看</a>
            </span>
                <div style="clear:both"></div>
            </div>
        </div>
        <%--<t:datagrid name="cgformButtonList" title="custom.button" actionUrl="cgformButtonController.do?datagrid&formId=${formId}" idField="id" fit="true">
            <t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
            <t:dgCol title="button.code" field="buttonCode"></t:dgCol>
            <t:dgCol title="button.name" field="buttonName"></t:dgCol>
            <t:dgCol title="button.style" field="buttonStyle"></t:dgCol>
            <t:dgCol title="action.type" field="optType"></t:dgCol>
            <t:dgCol title="common.show.sequence" field="orderNum"></t:dgCol>
            <t:dgCol title="common.show.icon.style" field="buttonIcon"></t:dgCol>
            <t:dgCol title="common.show.expression" field="exp"></t:dgCol>
            <t:dgCol title="common.status" field="buttonStatus" replace="common.active_1,common.inactive_0"></t:dgCol>
            <t:dgCol title="common.operation" field="opt" width="100"></t:dgCol>
            <t:dgDelOpt title="common.delete" url="cgformButtonController.do?del&id={id}&formId=${formId}" urlclass="ace_button"  urlfont="fa-trash-o" />
            <t:dgToolBar title="common.add" icon="icon-add" url="cgformButtonController.do?addorupdate&formId=${formId}" funname="add"></t:dgToolBar>
            <t:dgToolBar title="common.edit" icon="icon-edit" url="cgformButtonController.do?addorupdate" funname="update"></t:dgToolBar>
            <t:dgToolBar title="common.view" icon="icon-search" url="cgformButtonController.do?addorupdate" funname="detail"></t:dgToolBar>
        </t:datagrid>--%>
    </div>
</div>