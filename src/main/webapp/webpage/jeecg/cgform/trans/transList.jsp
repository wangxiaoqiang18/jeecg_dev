<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools"></t:base>
<div class="easyui-layout" fit="true">
<div region="center" style="padding:0px;border:0px">
	<script type="text/javascript">$(function(){  storage=$.localStorage;if(!storage)storage=$.cookieStorage;$('#transList').datagrid({idField: 'id',title: '智能表单配置',url:'cgformTransController.do?datagrid&field=id,',fit:true,rownumbers: true,queryParams:{},loadMsg: '数据加载中...',pageSize: 10,pagination:false,pageList:[10,20,30],sortName:'id',sortOrder:'desc',rownumbers:true,singleSelect:false,fitColumns:false,striped:true,showFooter:true,frozenColumns:[[{field:'ck',checkbox:'true'},]],columns:[[{field:'id',title:'表名',width:300,sortable:true}]],onLoadSuccess:function(data){$("#transList").datagrid("clearChecked");$("#transList").datagrid("clearSelections");if(!false){if(data.total && data.rows.length==0) {var grid = $('#transList');var curr = grid.datagrid('getPager').data("pagination").options.pageNumber;grid.datagrid({pageNumber:(curr-1)});}} try{loadAjaxDict(data);}catch(e){}},onClickRow:function(rowIndex,rowData){rowid=rowData.id;gridname='transList';}});$('#transList').datagrid('getPager').pagination({beforePageText:'',afterPageText:'/{pages}',displayMsg:'{from}-{to}共 {total}条',showPageList:true,showRefresh:true});$('#transList').datagrid('getPager').pagination({onBeforeRefresh:function(pageNumber, pageSize){ $(this).pagination('loading');$(this).pagination('loaded'); }});try{restoreheader();}catch(ex){}});function reloadTable(){try{	$('#'+gridname).datagrid('reload');	$('#'+gridname).treegrid('reload');}catch(ex){}}function reloadtransList(){$('#transList').datagrid('reload');}function gettransListSelected(field){return getSelected(field);}function getSelected(field){var row = $('#'+gridname).datagrid('getSelected');if(row!=null){value= row[field];}else{value='';}return value;}function gettransListSelections(field){var ids = [];var rows = $('#transList').datagrid('getSelections');for(var i=0;i<rows.length;i++){ids.push(rows[i][field]);}ids.join(',');return ids};function getSelectRows(){	return $('#transList').datagrid('getChecked');} function saveHeader(){ var columnsFields =null;var easyextends=false;try{columnsFields = $('#transList').datagrid('getColumns');easyextends=true;}catch(e){columnsFields =$('#transList').datagrid('getColumnFields');}	var cols = storage.get( 'transListhiddenColumns');var init=true;	if(cols){init =false;} var hiddencolumns = [];for(var i=0;i< columnsFields.length;i++) {if(easyextends){hiddencolumns.push({field:columnsFields[i].field,hidden:columnsFields[i].hidden});}else{ var columsDetail = $('#transList').datagrid("getColumnOption", columnsFields[i]); if(init){hiddencolumns.push({field:columsDetail.field,hidden:columsDetail.hidden,visible:(columsDetail.hidden==true?false:true)});}else{for(var j=0;j<cols.length;j++){		if(cols[j].field==columsDetail.field){					hiddencolumns.push({field:columsDetail.field,hidden:columsDetail.hidden,visible:cols[j].visible});		}}}} }storage.set( 'transListhiddenColumns',JSON.stringify(hiddencolumns));} function isShowBut(){	  var isShowSearchId = $('#isShowSearchId').val();	  if(isShowSearchId == "true"){		  $("#searchColums").hide();	  	  $('#isShowSearchId').val("false");	  	  $('#columsShow').remove("src");	  	  $('#columsShow').attr("src","plug-in/easyui/themes/default/images/accordion_expand.png");	  } else{		  $("#searchColums").show();	  	  $('#isShowSearchId').val("true");	  	  $('#columsShow').remove("src");	  	  $('#columsShow').attr("src","plug-in/easyui/themes/default/images/accordion_collapse.png");	  }}function restoreheader(){var cols = storage.get( 'transListhiddenColumns');if(!cols)return;for(var i=0;i<cols.length;i++){	try{if(cols.visible!=false)$('#transList').datagrid((cols[i].hidden==true?'hideColumn':'showColumn'),cols[i].field);}catch(e){}}}function resetheader(){var cols = storage.get( 'transListhiddenColumns');if(!cols)return;for(var i=0;i<cols.length;i++){	try{  $('#transList').datagrid((cols.visible==false?'hideColumn':'showColumn'),cols[i].field);}catch(e){}}}function transListsearch(){try { if(! $("#transListForm").Validform({tiptype:3}).check()){return false;} } catch (e){}if(true){var queryParams=$('#transList').datagrid('options').queryParams;$('#transListtb').find('*').each(function(){queryParams[$(this).attr('name')]=$(this).val();});$('#transList').datagrid({url:'cgformTransController.do?datagrid&field=id,',pageNumber:1});}}function dosearch(params){var jsonparams=$.parseJSON(params);$('#transList').datagrid({url:'cgformTransController.do?datagrid&field=id,',queryParams:jsonparams});}function transListsearchbox(value,name){var queryParams=$('#transList').datagrid('options').queryParams;queryParams[name]=value;queryParams.searchfield=name;$('#transList').datagrid('reload');}$('#transListsearchbox').searchbox({searcher:function(value,name){transListsearchbox(value,name);},menu:'#transListmm',prompt:'请输入查询关键字'});function EnterPress(e){var e = e || window.event;if(e.keyCode == 13){ transListsearch();}}function searchReset(name){ $("#"+name+"tb").find(":input").val("");var queryParams=$('#transList').datagrid('options').queryParams;$('#transListtb').find('*').each(function(){queryParams[$(this).attr('name')]=$(this).val();});$('#transListtb').find("input[type='checkbox']").each(function(){$(this).attr('checked',false);});$('#transListtb').find("input[type='radio']").each(function(){$(this).attr('checked',false);});$('#transList').datagrid({url:'cgformTransController.do?datagrid&field=id,',pageNumber:1});}</script><table width="100%"   id="transList" toolbar="#transListtb"></table><div id="transListtb" style="padding:3px; height: auto"><input  id="_complexSqlbuilder" name="complexSqlbuilder"   type="hidden" /><div name="searchColums" id="searchColums" ><input  id="isShowSearchId" type="hidden" value="false"/><input  id="_sqlbuilder" name="sqlbuilder"   type="hidden" /><form onkeydown='if(event.keyCode==13){transListsearch();return false;}' id='transListForm'><span style="max-width: 79%;display: inline-block;"><span><img style="margin-top:-3px;vertical-align:middle;" src="plug-in/easyui/themes/icons/ti.png"  title="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！" alt="提示：模糊查询通配符: *，多个关键字用半角逗号 ',' 隔开！" /></span><span style="display:-moz-inline-box;display:inline-block;margin-bottom:2px;text-align:justify;"><span style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width:74px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; " title="表名">&nbsp;&nbsp;&nbsp;表名：&nbsp;&nbsp;&nbsp;</span><input onkeypress="EnterPress(event)" onkeydown="EnterPress()"  type="text" name="id"  style="width: 120px" class="inuptxt"  /></span></span><span><span style="float:right;"><a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="transListsearch()">查询</a><a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="searchReset('transList')">重 置</a></span></span></form></div><div style="border-bottom-width:0;" class="datagrid-toolbar"><span style="float:left;" ><a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"  id="generateForm" onclick="dataEditor('生成表单','cgformTransController.do?transEditor','transList',null,null)">生成表单</a></span><div style="clear:both"></div></div>
<%--<t:datagrid name="transList" title="smart.form.setting" fitColumns="false" pagination="false" checkbox="true" fit="true" queryMode="group" actionUrl="cgformTransController.do?datagrid" idField="id" sortName="id">
	<t:dgCol title="table.name" field="id" query="true" width="300"></t:dgCol>
	<t:dgToolBar id="generateForm" title="generate.form" icon="icon-edit"  url="cgformTransController.do?transEditor" funname="dataEditor"></t:dgToolBar>
</t:datagrid>--%>
</div>
</div>
<script type="text/javascript">
	function dataEditor(title, url, id, a, b) {

		var formOnclick= $('#generateForm').attr("onclick");
		$('#generateForm').removeAttr('onclick');
		var ids = [];
		var rows = $("#" + id).datagrid('getSelections');
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++)
				ids.push(rows[i].id);
			$.ajax({
						url : url + "&id=" + ids,
						type : 'post',
						cache : false,
						success : function(data) {
							$('#generateForm').attr("onclick",formOnclick);

							var c = $.parseJSON(data);
							if(c.success == false){
								tip(c.msg);
								return;
							}
							var d = "";
							var e = "";
							$.each(c.obj, function(key, value) {
								if (key == "no")
									d = value;
								else
									e = value;
							});
							W.tip('<t:mutiLang langKey="generate.success"/>' + ":" + e);
							W.reloadtablePropertyList();
							windowapi.close();
						}
					});
		} else{
			tip('<t:mutiLang langKey="please.select.generate.item"/>');
		}
	}
</script>