<%--
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>动态报表配置抬头</title>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script type="text/javascript">
  $(document).ready(function(){
	$('#tt').tabs({
	   onSelect:function(title){
	       $('#tt .panel-body').css('width','auto');
		}
	});
	
	$('#tts').tabs({
		   onSelect:function(title){
		       $('#tts .panel-body').css('width','auto');
			}
		});
  });
 //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select,button,a', this).each(function(){
				var $this = $(this), name = $this.attr('name'),id=$this.attr('id'),onclick_str=$this.attr('onclick'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
				if(id!=null){
					if (id.indexOf("#index#") >= 0){
						$this.attr("id",id.replace('#index#',i));
					}else{
						var s = id.indexOf("[");
						var e = id.indexOf("]");
						var new_id = id.substring(s+1,e);
						$this.attr("id",id.replace(new_id,i));
					}
				}
				if(onclick_str!=null){
					if (onclick_str.indexOf("#index#") >= 0){
						$this.attr("onclick",onclick_str.replace(/#index#/g,i));
					}else{
					}
				}
			});
		});
	}
	function decode(value, id) {//value传入值,id接受值
		var last = value.lastIndexOf("/");
		var filename = value.substring(last + 1, value.length);
		$("#" + id).text(decodeURIComponent(filename));
	}
 </script>
</head>
<body style="overflow-x: hidden;">
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="cgreportConfigHeadController.do?doAdd">
	<input id="id" name="id" type="hidden" value="${cgreportConfigHeadPage.id }">
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="common.code"/>:</label></td>
			<td class="value"><input id="code" name="code" type="text" style="width: 150px" class="inputxt" datatype="w1"> <span class="Validform_checktip"></span></td>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="common.name"/> :</label></td>
			<td class="value"><input id="name" name="name" type="text" style="width: 150px" class="inputxt" datatype="*"> <span class="Validform_checktip"></span></td>
            <td align="right"><label class="Validform_label"><t:mutiLang langKey="common.dynamic.dbsource"/> :</label></td>
            <td class="value"><t:dictSelect field="dbSource" dictTable="t_s_data_source" dictField="DB_KEY" dictText="DB_KEY" /><span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="query.sql"/>:</label></td>
			<td class="value" colspan="5"><textarea rows="5" cols="150" id="cgrSql" name="cgrSql" datatype="*"></textarea> <span class="Validform_checktip"></span>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;您可以键入“${abc}”作为一个参数，这里abc是参数的名称。例如：<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;select * from table where id = <%="${abc}"%>。<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;select * from table where id like concat('%',<%="${abc}"%>,'%')。(mysql模糊查询)<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;select * from table where id like '%'||<%="${abc}"%>||'%'。(oracle模糊查询)<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;select * from table where id like '%'+<%="${abc}"%>+'%'。(sqlserver模糊查询)<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">注：参数只支持动态报表，popup暂不支持</font><p/>
			
			</td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="common.description"/>:</label></td>


			<td class="value" colspan="5"><textarea rows="3" cols="150" id="content" name="content" ></textarea> <span class="Validform_checktip"></span></td>
			<!--update-end--Author:dangzhenghui  Date:20170316 for：TASK #1795 【页面校验】体验修改-->

		</tr>
		<!--update-begin--Author:huangzq  Date:20151129 for：[753]【在线报表】扩展增加俩字段，非必填-->
		<tr>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="common.returnvalfield"/>:</label></td>
			<td class="value"><input id="returnValField" name="returnValField" type="text" style="width: 150px" class="inputxt"> <span class="Validform_checktip"></span></td>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="common.returntxtfield"/>:</label></td>
			<td class="value"><input id="returnTxtField" name="returnTxtField" type="text" style="width: 150px" class="inputxt"> <span class="Validform_checktip"></span></td>
			<td align="right"><label class="Validform_label"><t:mutiLang langKey="common.returntxttype"/>:</label></td>
			<td class="value" colspan="2"> <t:dictSelect field="popRetype" typeGroupCode="pop_retype" hasLabel="false" defaultVal="1" /><span class="Validform_checktip"></span></td>
        </tr>
        <!--update-end--Author:huangzq  Date:20151129 for：[753]【在线报表】扩展增加俩字段，非必填-->   
	</table>	
	<div style="width: auto; ">&lt;%&ndash; 增加一个div，用于调节页面大小，否则默认太小 &ndash;%&gt;	
	<div style="width: 800px; height: 1px;"></div>
	
	<t:tabs id="ttp" iframe="false" tabPosition="top" fit="false"><t:tab href="cgreportConfigHeadController.do?cgreportConfigParamList&id=${cgreportConfigHeadPage.id}" icon="icon-search" title="报表参数" id="cgreportConfigParam"></t:tab></t:tabs>				
	<t:tabs id="tt" iframe="false" tabPosition="top" fit="false"><t:tab href="cgreportConfigHeadController.do?cgreportConfigItemList&id=${cgreportConfigHeadPage.id}" icon="icon-search" title="dynamic.report.config.detail" id="cgreportConfigItem"></t:tab></t:tabs></div>
</t:formvalid>
<!-- 添加 附表明细 模版 -->
<table style="display: none">
	<tbody id="add_cgreportConfigItem_table_template">
		<tr>
			<td align="center"><input style="width: 20px;" type="checkbox" name="ck" /></td>
			<td align="left"><input name="cgreportConfigItemList[#index#].fieldName" maxlength="36" type="text" class="inputxt" style="width: 120px;"></td>
			<td align="left"><input name="cgreportConfigItemList[#index#].orderNum" maxlength="10" type="text" class="inputxt" style="width: 30px;"></td>
			<td align="left"><input name="cgreportConfigItemList[#index#].fieldTxt" maxlength="1000" type="text" class="inputxt" style="width: 120px;"></td>
			<td align="left"><t:dictSelect field="cgreportConfigItemList[#index#].fieldType" extendJson="{style:'width:80px'}" type="list" typeGroupCode="fieldtype" defaultVal="String" hasLabel="false" title="common.text.type"></t:dictSelect></td>
			<td align="left"><select id="isShow" name="cgreportConfigItemList[#index#].isShow"  style="width: 60px;">
				<option value="Y"><t:mutiLang langKey="common.show"/></option>
				<option value="N"><t:mutiLang langKey="common.hide"/></option>
			</select></td>
			<td align="left"><input name="cgreportConfigItemList[#index#].fieldHref" maxlength="1000" type="text" class="inputxt" style="width: 120px;">
			<td align="left"><t:dictSelect field="cgreportConfigItemList[#index#].SMode"  extendJson="{style:'width:90px'}" type="list" typeGroupCode="searchmode" defaultVal="" hasLabel="false" title="common.query.module"></t:dictSelect></td>
			<td align="left"><input name="cgreportConfigItemList[#index#].replaceVa" maxlength="36" type="text" class="inputxt" style="width: 120px;"></td>
			<td align="left"><input name="cgreportConfigItemList[#index#].dictCode" maxlength="36" type="text" class="inputxt" style="width: 120px;"></td>
			<td align="left"><t:dictSelect field="cgreportConfigItemList[#index#].SFlag"  extendJson="{style:'width:90px'}" type="list" typeGroupCode="yesorno" defaultVal="" hasLabel="false" title="common.isquery"></t:dictSelect></td>
		</tr>
	</tbody>
</table>
<table style="display: none">
	<tbody id="add_cgreportConfigParam_table_template">
		<tr>
		 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
		 <td align="left"><input name="cgreportConfigParamList[#index#].paramName" maxlength="32" type="text" class="inputxt"  style="width:120px;" datatype="*" ></td>
		 <td align="left"><input name="cgreportConfigParamList[#index#].paramDesc" maxlength="32" type="text" class="inputxt"  style="width:120px;" ></td>
	     <td align="left"><input name="cgreportConfigParamList[#index#].paramValue" maxlength="32" type="text" class="inputxt"  style="width:120px;" ></td>
		 <td align="left"><input name="cgreportConfigParamList[#index#].seq" maxlength="32" type="text" class="inputxt"  style="width:120px;"></td>
		</tr>
	 </tbody>
</table>
</body>
<script src="webpage/jeecg/cgreport/core/cgreportConfigHead.js"></script>--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>动态报表配置抬头</title>
    <script type="text/javascript" src="${basepath}plug-in/mutiLang/zh-cn.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/jquery-plugs/storage/jquery.storageapi.min.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/jquery-plugs/i18n/jquery.i18n.properties.js"></script>
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
    <script type="text/javascript" src="${basepath}plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
    <script type="text/javascript" src="${basepath}plug-in/ace/js/bootstrap-tab.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/tools/curdtools.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/tools/easyuiextend.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/jquery-plugs/hftable/jquery-hftable.js"></script>
    <script type="text/javascript" src="${basepath}plug-in/tools/json2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tt').tabs({
                onSelect: function (title) {
                    $('#tt .panel-body').css('width', 'auto');
                }
            });

            $('#tts').tabs({
                onSelect: function (title) {
                    $('#tts .panel-body').css('width', 'auto');
                }
            });
        });

        //初始化下标
        function resetTrNum(tableId) {
            $tbody = $("#" + tableId + "");
            $tbody.find('>tr').each(function (i) {
                $(':input, select,button,a', this).each(function () {
                    var $this = $(this), name = $this.attr('name'), id = $this.attr('id'),
                        onclick_str = $this.attr('onclick'), val = $this.val();
                    if (name != null) {
                        if (name.indexOf("#index#") >= 0) {
                            $this.attr("name", name.replace('#index#', i));
                        } else {
                            var s = name.indexOf("[");
                            var e = name.indexOf("]");
                            var new_name = name.substring(s + 1, e);
                            $this.attr("name", name.replace(new_name, i));
                        }
                    }
                    if (id != null) {
                        if (id.indexOf("#index#") >= 0) {
                            $this.attr("id", id.replace('#index#', i));
                        } else {
                            var s = id.indexOf("[");
                            var e = id.indexOf("]");
                            var new_id = id.substring(s + 1, e);
                            $this.attr("id", id.replace(new_id, i));
                        }
                    }
                    if (onclick_str != null) {
                        if (onclick_str.indexOf("#index#") >= 0) {
                            $this.attr("onclick", onclick_str.replace(/#index#/g, i));
                        } else {
                        }
                    }
                });
            });
        }

        function decode(value, id) {//value传入值,id接受值
            var last = value.lastIndexOf("/");
            var filename = value.substring(last + 1, value.length);
            $("#" + id).text(decodeURIComponent(filename));
        }
    </script>
</head>
<body style="overflow-x: hidden;">
<form id="formobj" action="cgreportConfigHeadController.do?doAdd" name="formobj" method="post"><input type="hidden"
                                                                                                      id="btn_sub"
                                                                                                      class="btn_sub"/>
    <input id="id" name="id" type="hidden" value="">
    <table cellpadding="0" cellspacing="1" class="formtable">
        <tr>
            <td align="right"><label class="Validform_label">编码:</label></td>
            <td class="value"><input id="code" name="code" type="text" style="width: 150px" class="inputxt"
                                     datatype="w1"> <span class="Validform_checktip"></span></td>
            <td align="right"><label class="Validform_label">名称 :</label></td>
            <td class="value"><input id="name" name="name" type="text" style="width: 150px" class="inputxt"
                                     datatype="*"> <span class="Validform_checktip"></span></td>
            <td align="right"><label class="Validform_label">数据源 :</label></td>
            <td class="value">
                <select name="dbSource">
                    <option value=""></option>
                    <c:forEach items="${sourceList}" var="item">
                        <option value="${item.dbName}" >${item.dbKey}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label">查询sql:</label></td>
            <td class="value" colspan="5"><textarea rows="5" cols="150" id="cgrSql" name="cgrSql"
                                                    datatype="*"></textarea> <span class="Validform_checktip"></span>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;您可以键入“”作为一个参数，这里abc是参数的名称。例如：<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;select * from table where id = ${abc}。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;select * from table where id like concat('%',${abc},'%')。(mysql模糊查询)<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;select * from table where id like '%'||${abc}||'%'。(oracle模糊查询)<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;select * from table where id like '%'+${abc}+'%'。(sqlserver模糊查询)<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;<font color="red">注：参数只支持动态报表，popup暂不支持</font>
                <p/>

            </td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label">描述:</label></td>


            <td class="value" colspan="5"><textarea rows="3" cols="150" id="content" name="content"></textarea> <span
                    class="Validform_checktip"></span></td>
            <!--update-end--Author:dangzhenghui  Date:20170316 for：TASK #1795 【页面校验】体验修改-->

        </tr>
        <!--update-begin--Author:huangzq  Date:20151129 for：[753]【在线报表】扩展增加俩字段，非必填-->
        <tr>
            <td align="right"><label class="Validform_label">返回值字段:</label></td>
            <td class="value"><input id="returnValField" name="returnValField" type="text" style="width: 150px"
                                     class="inputxt"> <span class="Validform_checktip"></span></td>
            <td align="right"><label class="Validform_label">返回文本字段:</label></td>
            <td class="value"><input id="returnTxtField" name="returnTxtField" type="text" style="width: 150px"
                                     class="inputxt"> <span class="Validform_checktip"></span></td>
            <td align="right"><label class="Validform_label">返回类型:</label></td>
            <td class="value" colspan="2"><select name="popRetype">
                <option value=""></option>
                <option value="1" selected="selected">单选</option>
                <option value="2">多选</option>
            </select><span class="Validform_checktip"></span></td>
        </tr>
        <!--update-end--Author:huangzq  Date:20151129 for：[753]【在线报表】扩展增加俩字段，非必填-->
    </table>
    <div style="width: auto; ">
        <div style="width: 800px; height: 1px;"></div>

        <div id="ttp" tabPosition="top" border=flase style="margin:0px;padding:0px;overflow-x:hidden;width:auto;"
             class="easyui-tabs" fit="false">
            <div title="报表参数" iconCls="icon-search" href="cgreportConfigHeadController.do?cgreportConfigParamList&id="
                 style="margin:0px;padding:0px;overflow-x:hidden;overflow-y:auto;width=auto;"></div>
        </div>
        <div id="tt" tabPosition="top" border=flase style="margin:0px;padding:0px;overflow-x:hidden;width:auto;"
             class="easyui-tabs" fit="false">
            <div title="动态报表配置明细" iconCls="icon-search"
                 href="cgreportConfigHeadController.do?cgreportConfigItemList&id="
                 style="margin:0px;padding:0px;overflow-x:hidden;overflow-y:auto;width=auto;"></div>
        </div>
    </div>
    <link rel="stylesheet" href="${basepath}plug-in/Validform/css/metrole/style.css" type="text/css"/>
    <link rel="stylesheet" href="${basepath}plug-in/Validform/css/metrole/tablefrom.css" type="text/css"/>
    <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
    <SCRIPT type="text/javascript" src="plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js"></SCRIPT>
    <script src="plug-in/layer/layer.js"></script>
    <script type="text/javascript">var subDlgIndex = null;
    $(function () {
        $("#formobj").Validform({
            tiptype: function (msg, o, cssctl) {
                if (o.type == 3) {
                    layer.open({
                        title: '提示信息',
                        content: msg,
                        icon: 5,
                        shift: 6,
                        btn: false,
                        shade: false,
                        time: 5000,
                        cancel: function (index) {
                            o.obj.focus();
                            layer.close(index);
                        },
                        yes: function (index) {
                            o.obj.focus();
                            layer.close(index);
                        }
                    })
                }
            }, btnSubmit: "#btn_sub", btnReset: "#btn_reset", ajaxPost: true, beforeSubmit: function (curform) {
                var tag = false;
                subDlgIndex = $.dialog({
                    content: '正在加载中',
                    zIndex: 19910320,
                    lock: true,
                    width: 100,
                    height: 50,
                    opacity: 0.3,
                    title: '提示',
                    cache: false
                });
                var infoTable = subDlgIndex.DOM.t.parent().parent().parent();
                infoTable.parent().append('<div id="infoTable-loading" style="text-align:center;"><img src="plug-in/layer/skin/default/loading-0.gif"/></div>');
                infoTable.css('display', 'none');
            }, usePlugin: {
                passwordstrength: {
                    minLen: 6, maxLen: 18, trigger: function (obj, error) {
                        if (error) {
                            obj.parent().next().find(".Validform_checktip").show();
                            obj.find(".passwordStrength").hide();
                        } else {
                            $(".passwordStrength").show();
                            obj.parent().next().find(".Validform_checktip").hide();
                        }
                    }
                }
            }, callback: function (data) {
                if (subDlgIndex && subDlgIndex != null) {
                    $('#infoTable-loading').hide();
                    subDlgIndex.close();
                }
                var win = frameElement.api.opener;
                if (data.success == true) {
                    frameElement.api.close();
                    win.tip(data.msg);
                } else {
                    if (data.responseText == '' || data.responseText == undefined) {
                        $.messager.alert('错误', data.msg);
                        $.Hidemsg();
                    } else {
                        try {
                            var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
                            $.messager.alert('错误', emsg);
                            $.Hidemsg();
                        } catch (ex) {
                            $.messager.alert('错误', data.responseText + "");
                            $.Hidemsg();
                        }
                    }
                    return false;
                }
                win.reloadTable();
            }
        });
    });</script>
</form>
<!-- 添加 附表明细 模版 -->
<table style="display: none">
    <tbody id="add_cgreportConfigItem_table_template">
    <tr>
        <td align="center"><input style="width: 20px;" type="checkbox" name="ck"/></td>
        <td align="left"><input name="cgreportConfigItemList[#index#].fieldName" maxlength="36" type="text"
                                class="inputxt" style="width: 120px;"></td>
        <td align="left"><input name="cgreportConfigItemList[#index#].orderNum" maxlength="10" type="text"
                                class="inputxt" style="width: 30px;"></td>
        <td align="left"><input name="cgreportConfigItemList[#index#].fieldTxt" maxlength="1000" type="text"
                                class="inputxt" style="width: 120px;"></td>
        <td align="left"><select name="cgreportConfigItemList[#index#].fieldType" style="width:80px">
            <option value=""></option>
            <option value="Integer">数值类型</option>
            <option value="Date">日期类型</option>
            <option value="String" selected="selected">字符类型</option>
            <option value="Long">长整型</option>
        </select></td>
        <td align="left"><select id="isShow" name="cgreportConfigItemList[#index#].isShow" style="width: 60px;">
            <option value="Y">显示</option>
            <option value="N">隐藏</option>
        </select></td>
        <td align="left"><input name="cgreportConfigItemList[#index#].fieldHref" maxlength="1000" type="text"
                                class="inputxt" style="width: 120px;">
        <td align="left"><select name="cgreportConfigItemList[#index#].SMode" style="width:90px">
            <option value="" selected="selected"></option>
            <option value="single">单条件查询</option>
            <option value="group">范围查询</option>
        </select></td>
        <td align="left"><input name="cgreportConfigItemList[#index#].replaceVa" maxlength="36" type="text"
                                class="inputxt" style="width: 120px;"></td>
        <td align="left"><input name="cgreportConfigItemList[#index#].dictCode" maxlength="36" type="text"
                                class="inputxt" style="width: 120px;"></td>
        <td align="left"><select name="cgreportConfigItemList[#index#].SFlag" style="width:90px">
            <option value="" selected="selected"></option>
            <option value="Y">是</option>
            <option value="N">否</option>
        </select></td>
    </tr>
    </tbody>
</table>
<table style="display: none">
    <tbody id="add_cgreportConfigParam_table_template">
    <tr>
        <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
        <td align="left"><input name="cgreportConfigParamList[#index#].paramName" maxlength="32" type="text"
                                class="inputxt" style="width:120px;" datatype="*"></td>
        <td align="left"><input name="cgreportConfigParamList[#index#].paramDesc" maxlength="32" type="text"
                                class="inputxt" style="width:120px;"></td>
        <td align="left"><input name="cgreportConfigParamList[#index#].paramValue" maxlength="32" type="text"
                                class="inputxt" style="width:120px;"></td>
        <td align="left"><input name="cgreportConfigParamList[#index#].seq" maxlength="32" type="text" class="inputxt"
                                style="width:120px;"></td>
    </tr>
    </tbody>
</table>
</body>
<script src="webpage/jeecg/cgreport/core/cgreportConfigHead.js"></script>