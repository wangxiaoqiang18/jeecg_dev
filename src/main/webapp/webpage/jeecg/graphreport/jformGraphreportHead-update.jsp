<%--
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>图表配置</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  $(document).ready(function(){
	$('#tt').tabs({
	   onSelect:function(title){
	       $('#tt .panel-body').css('width','auto');
		}
	});
	$(".tabs-wrap").css('width','100%');
  });
 </script>
 </head>
 <body style="overflow-x: hidden;">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="jformGraphreportHeadController.do?doUpdate">
					<input id="id" name="id" type="hidden" value="${jformGraphreportHeadPage.id }">
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right">
				<label class="Validform_label">名称:</label>
			</td>
			<td class="value">
		     	 <input id="name" name="name" type="text" style="width: 150px" class="inputxt" datatype="*" value='${jformGraphreportHeadPage.name}'>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">名称</label>
			</td>
			<td align="right">
				<label class="Validform_label">编码:</label>
			</td>
			<td class="value">
		     	 <input id="code" name="code" type="text" style="width: 150px" class="inputxt" datatype="*" value='${jformGraphreportHeadPage.code}'>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">编码</label>
			</td>
		</tr>

		<tr>
			<td align="right">
				<label class="Validform_label">描述:</label>
			</td>
			<td class="value">
				<input id="content" name="content" type="text" style="width: 150px" class="inputxt"  value='${jformGraphreportHeadPage.content}' />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">描述</label>
			</td>
			<td align="right">
				<label class="Validform_label">y轴文字:</label>
			</td>
			<td class="value">
				<input id="ytext" name="ytext" type="text" style="width: 150px" class="inputxt" datatype="*" value='${jformGraphreportHeadPage.ytext}'>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">y轴文字</label>
			</td>

		</tr>
		<tr>

			<td align="right">
				<label class="Validform_label">x轴数据:</label>
			</td>
			<td class="value">
		     	 <input id="categories" name="categories" type="text" style="width: 150px" class="inputxt" datatype="*" value='${jformGraphreportHeadPage.categories}'>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">x轴数据</label>
			</td>
			<td align="right">
				<label class="Validform_label">是否显示明细:</label>
			</td>
			<td class="value">
				<t:dictSelect field="isShowList" type="list"
							  typeGroupCode="sf_yn" defaultVal="${jformGraphreportHeadPage.isShowList}" hasLabel="false"  title="是否显示明细"></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">是否显示明细</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">查询数据SQL:</label>
			</td>
			<td class="value" colspan="3">
				<textarea id="cgrSql" style="width:600px;" class="inputxt" rows="4" name="cgrSql">${jformGraphreportHeadPage.cgrSql}</textarea>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">查询数据SQL</label>
			</td>

		</tr>
		<tr>

			<td align="right">
				<label class="Validform_label">扩展JS:</label>
			</td>
			<td class="value" colspan="3">
				 <textarea id="xpageJs" style="width:600px;" class="inputxt" rows="4" name="xpageJs">${jformGraphreportHeadPage.xpageJs}</textarea>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">扩展JS</label>
			</td>
		</tr>
			</table>
			<div style="width:auto;">
				&lt;%&ndash; 增加一个div，用于调节页面大小，否则默认太小 &ndash;%&gt;
				<div style="width:800px;height:1px;"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="jformGraphreportHeadController.do?jformGraphreportItemList&id=${jformGraphreportHeadPage.id}" icon="icon-search" title="图表配置" id="jformGraphreportItem"></t:tab>
				</t:tabs>
			</div>
			</t:formvalid>
			<!-- 添加 附表明细 模版 -->
		<table style="display:none">
		<tbody id="add_jformGraphreportItem_table_template">
		<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  	<input name="jformGraphreportItemList[#index#].fieldName" maxlength="36" 
					  		type="text" class="inputxt"  style="width:120px;" />
					  <label class="Validform_label" style="display: none;">字段名</label>
				  </td>
				  <td align="left">
					  	<input name="jformGraphreportItemList[#index#].fieldTxt" maxlength="1000" 
					  		type="text" class="inputxt"  style="width:120px;" />
					  <label class="Validform_label" style="display: none;">字段文本</label>
				  </td>
				  <td align="left">
					  	<input name="jformGraphreportItemList[#index#].orderNum" maxlength="10" 
					  		type="text" class="inputxt"  style="width:40px;" />
					  <label class="Validform_label" style="display: none;">排序</label>
				  </td>
				  <td align="left">
							<t:dictSelect field="jformGraphreportItemList[#index#].fieldType" extendJson="{style:'width:100px'}"
										typeGroupCode="fieldtype" defaultVal="" hasLabel="false"  title="字段类型"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">字段类型</label>
				  </td>
				  <td align="left">
							<t:dictSelect field="jformGraphreportItemList[#index#].isShow" type="list" extendJson="{style:'width:100px'}"
										typeGroupCode="sf_yn" defaultVal="" hasLabel="false"  title="是否显示"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">是否显示</label>
				  </td>
				  <td align="left">
							<t:dictSelect field="jformGraphreportItemList[#index#].searchFlag" type="list" extendJson="{style:'width:100px'}"
										typeGroupCode="sf_yn" defaultVal="" hasLabel="false"  title="是否查询"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">是否查询</label>
				  </td>
				  <td align="left">
							<t:dictSelect field="jformGraphreportItemList[#index#].searchMode" type="list" extendJson="{style:'width:100px'}"
										typeGroupCode="searchmode" defaultVal="" hasLabel="false"  title="查询模式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">查询模式</label>
				  </td>
				  <td align="left">
					  	<input name="jformGraphreportItemList[#index#].dictCode" maxlength="500" 
					  		type="text" class="inputxt"  style="width:120px;" />
					  <label class="Validform_label" style="display: none;">字典Code</label>
				  </td>
				  <td align="left">
							<t:dictSelect field="jformGraphreportItemList[#index#].isGraph" type="list" extendJson="{style:'width:100px'}"
										typeGroupCode="sf_yn" defaultVal="" hasLabel="false"  title="显示图表"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">显示图表</label>
				  </td>
				  <td align="left">
							<t:dictSelect field="jformGraphreportItemList[#index#].graphType" type="list" extendJson="{style:'width:100px'}"
										typeGroupCode="tblx" defaultVal="" hasLabel="false"  title="图表类型"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">图表类型</label>
				  </td>
				  <td align="left">
					  	<input name="jformGraphreportItemList[#index#].graphName" maxlength="100" 
					  		type="text" class="inputxt"  style="width:120px;" />
					  <label class="Validform_label" style="display: none;">图表名称</label>
				  </td>
				  <td align="left">
					  	<input name="jformGraphreportItemList[#index#].tabName" maxlength="50" 
					  		type="text" class="inputxt"  style="width:120px;" />
					  <label class="Validform_label" style="display: none;">标签名称</label>
				  </td>
			</tr>
		 </tbody>
		</table>
 </body>
  <script src = "webpage/jeecg/graphreport/jformGraphreportHead.js"></script>--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>图表配置</title>
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
            $(".tabs-wrap").css('width', '100%');
        });
    </script>
</head>
<body style="overflow-x: hidden;">
<form id="formobj" action="jformGraphreportHeadController.do?doUpdate" name="formobj" method="post"><input type="hidden"
                                                                                                           id="btn_sub"
                                                                                                           class="btn_sub"/>
    <input id="id" name="id" type="hidden" value="${jformGraphreportHeadPage.id }">
    <table cellpadding="0" cellspacing="1" class="formtable">
        <tr>
            <td align="right">
                <label class="Validform_label">名称:</label>
            </td>
            <td class="value">
                <input id="name" name="name" type="text" style="width: 150px" class="inputxt" datatype="*"
                       value='${jformGraphreportHeadPage.name}'>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">名称</label>
            </td>
            <td align="right">
                <label class="Validform_label">编码:</label>
            </td>
            <td class="value">
                <input id="code" name="code" type="text" style="width: 150px" class="inputxt" datatype="*"
                       value='${jformGraphreportHeadPage.code}'>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">编码</label>
            </td>
        </tr>

        <tr>
            <td align="right">
                <label class="Validform_label">描述:</label>
            </td>
            <td class="value">
                <input id="content" name="content" type="text" style="width: 150px" class="inputxt"
                       value='${jformGraphreportHeadPage.content}'/>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">描述</label>
            </td>
            <td align="right">
                <label class="Validform_label">y轴文字:</label>
            </td>
            <td class="value">
                <input id="ytext" name="ytext" type="text" style="width: 150px" class="inputxt" datatype="*"
                       value='${jformGraphreportHeadPage.ytext}'>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">y轴文字</label>
            </td>

        </tr>
        <tr>

            <td align="right">
                <label class="Validform_label">x轴数据:</label>
            </td>
            <td class="value">
                <input id="categories" name="categories" type="text" style="width: 150px" class="inputxt" datatype="*"
                       value='${jformGraphreportHeadPage.categories}'>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">x轴数据</label>
            </td>
            <td align="right">
                <label class="Validform_label">是否显示明细:</label>
            </td>
            <td class="value">
                <select name="isShowList">
                    <option value=""></option>
                    <option value="Y" <c:if
                            test="${jformGraphreportHeadPage.isShowList != null && jformGraphreportHeadPage.isShowList eq 'Y'}"> selected="selected"</c:if>>
                        是
                    </option>
                    <option value="N" <c:if
                            test="${jformGraphreportHeadPage.isShowList != null && jformGraphreportHeadPage.isShowList eq 'N'}"> selected="selected"</c:if>>
                        否
                    </option>
                </select>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">是否显示明细</label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <label class="Validform_label">查询数据SQL:</label>
            </td>
            <td class="value" colspan="3">
                <textarea id="cgrSql" style="width:600px;" class="inputxt" rows="4"
                          name="cgrSql">${jformGraphreportHeadPage.cgrSql}</textarea>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">查询数据SQL</label>
            </td>

        </tr>
        <tr>

            <td align="right">
                <label class="Validform_label">扩展JS:</label>
            </td>
            <td class="value" colspan="3">
                <textarea id="xpageJs" style="width:600px;" class="inputxt" rows="4"
                          name="xpageJs">${jformGraphreportHeadPage.xpageJs}</textarea>
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">扩展JS</label>
            </td>
        </tr>
    </table>
    <div style="width:auto;">

        <div style="width:800px;height:1px;"></div>


        <div id="tt" tabPosition="top" border=flase style="margin:0px;padding:0px;overflow-x:hidden;width:auto;"
             class="easyui-tabs" fit="false">
            <div title="图表配置" iconCls="icon-search"
                 href="jformGraphreportHeadController.do?jformGraphreportItemList&id=${jformGraphreportHeadPage.id}"
                 style="margin:0px;padding:0px;overflow-x:hidden;overflow-y:auto;width:auto;"></div>
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
<table style="display:none">
    <tbody id="add_jformGraphreportItem_table_template">
    <tr>
        <td align="center">
            <div style="width: 25px;" name="xh"></div>
        </td>
        <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
        <td align="left">
            <input name="jformGraphreportItemList[#index#].fieldName" maxlength="36"
                   type="text" class="inputxt" style="width:120px;"/>
            <label class="Validform_label" style="display: none;">字段名</label>
        </td>
        <td align="left">
            <input name="jformGraphreportItemList[#index#].fieldTxt" maxlength="1000"
                   type="text" class="inputxt" style="width:120px;"/>
            <label class="Validform_label" style="display: none;">字段文本</label>
        </td>
        <td align="left">
            <input name="jformGraphreportItemList[#index#].orderNum" maxlength="10"
                   type="text" class="inputxt" style="width:40px;"/>
            <label class="Validform_label" style="display: none;">排序</label>
        </td>
        <td align="left">
            <select name="jformGraphreportItemList[#index#].fieldType" style="width:100px">
                <option value="" selected="selected"></option>
                <option value="Integer">数值类型</option>
                <option value="Date">日期类型</option>
                <option value="String">字符类型</option>
                <option value="Long">长整型</option>
            </select>
            <label class="Validform_label" style="display: none;">字段类型</label>
        </td>
        <td align="left">
            <select name="jformGraphreportItemList[#index#].isShow" style="width:100px">
                <option value="" selected="selected"></option>
                <option value="Y">是</option>
                <option value="N">否</option>
            </select>
            <label class="Validform_label" style="display: none;">是否显示</label>
        </td>
        <td align="left">
            <select name="jformGraphreportItemList[#index#].searchFlag" style="width:100px">
                <option value="" selected="selected"></option>
                <option value="Y">是</option>
                <option value="N">否</option>
            </select>
            <label class="Validform_label" style="display: none;">是否查询</label>
        </td>
        <td align="left">
            <select name="jformGraphreportItemList[#index#].searchMode" style="width:100px">
                <option value="" selected="selected"></option>
                <option value="single">单条件查询</option>
                <option value="group">范围查询</option>
            </select>
            <label class="Validform_label" style="display: none;">查询模式</label>
        </td>
        <td align="left">
            <input name="jformGraphreportItemList[#index#].dictCode" maxlength="500"
                   type="text" class="inputxt" style="width:120px;"/>
            <label class="Validform_label" style="display: none;">字典Code</label>
        </td>
        <td align="left">
            <select name="jformGraphreportItemList[#index#].isGraph" style="width:100px">
                <option value="" selected="selected"></option>
                <option value="Y">是</option>
                <option value="N">否</option>
            </select>
            <label class="Validform_label" style="display: none;">显示图表</label>
        </td>
        <td align="left">
            <select name="jformGraphreportItemList[#index#].graphType" style="width:100px">
                <option value="" selected="selected"></option>
                <option value="spline">曲线图</option>
                <option value="column">柱状图</option>
                <option value="pie">饼图</option>
            </select>
            <label class="Validform_label" style="display: none;">图表类型</label>
        </td>
        <td align="left">
            <input name="jformGraphreportItemList[#index#].graphName" maxlength="100"
                   type="text" class="inputxt" style="width:120px;"/>
            <label class="Validform_label" style="display: none;">图表名称</label>
        </td>
        <td align="left">
            <input name="jformGraphreportItemList[#index#].tabName" maxlength="50"
                   type="text" class="inputxt" style="width:120px;"/>
            <label class="Validform_label" style="display: none;">标签名称</label>
        </td>
    </tr>
    </tbody>
</table>
</body>
<script src="webpage/jeecg/graphreport/jformGraphreportHead.js"></script>