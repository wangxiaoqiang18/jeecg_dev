<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><t:mutiLang langKey="enhance.js"/></title>
    <t:base type="jquery,easyui,tools,DatePicker"></t:base>
    <link rel="stylesheet" href="${basepath}plug-in/Validform/css/metrole/style.css" type="text/css">
    <link rel="stylesheet" href="${basepath}plug-in/Validform/css/metrole/tablefrom.css" type="text/css">
</head>
<body style="overflow-y: hidden" scroll="no">
<%--<form id="formobj" action="cgformEnhanceJsController.do?save" name="formobj" method="post"><input type="hidden"
                                                                                                  id="btn_sub"
                                                                                                  class="btn_sub">
    <input id="id" name="id" type="hidden" value="">
    <input id="formId" name="formId" type="hidden" value="40287d5b71c9a73d0171c9d0eefd0033">
    <table cellpadding="0" cellspacing="1" class="formtable">
        <tbody>
        <tr>
            <td align="right"><label class="Validform_label"> 增强类型: </label></td>
            <td class="value"><select name="cgJsType" id="cgJsType">
                <option value="form" selected="selected">form</option>
                <option value="list">list</option>
            </select> <span class="Validform_checktip"></span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 增强js: </label></td>
            <td class="value"><textarea id="cgJsStr" name="cgJsStr" cols="130" rows="30"></textarea> <span
                    class="Validform_checktip"></span></td>
        </tr>
        </tbody>
    </table>
    <link rel="stylesheet" href="http://localhost:8083/jeecg/plug-in/Validform/css/metrole/style.css" type="text/css">
    <link rel="stylesheet" href="http://localhost:8083/jeecg/plug-in/Validform/css/metrole/tablefrom.css"
          type="text/css">
    <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js"></script>
    <script src="plug-in/layer/layer.js"></script>
    <script type="text/javascript">var subDlgIndex = null;
    $(function () {
        $("#formobj").Validform({
            tiptype: 4,
            btnSubmit: "#btn_sub",
            btnReset: "#btn_reset",
            ajaxPost: true,
            beforeSubmit: function (curform) {
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
            },
            usePlugin: {
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
            },
            callback: function (data) {
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
</form>--%>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cgformEnhanceJsController.do?save" >
	<input id="id" name="id" type="hidden" value="${cgformenhanceJsPage.id }">
	<input id="formId" name="formId" type="hidden" value="${cgformenhanceJsPage.formId }">
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="enhance.type"/>: </label></td>
			<td class="value"><select name="cgJsType" id="cgJsType">
				<option value="form" <c:if test="${cgformenhanceJsPage.cgJsType=='form'}">selected="selected"</c:if>>form</option>
				<option value="list" <c:if test="${cgformenhanceJsPage.cgJsType=='list'}">selected="selected"</c:if>>list</option>
			</select> <span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="enhance.js"/>: </label></td>
			<td class="value"><textarea id="cgJsStr" name="cgJsStr" cols="130" rows="30">${cgformenhanceJsPage.cgJsStr}</textarea> <span class="Validform_checktip"></span></td>
		</tr>
	</table>
</t:formvalid>
</body>
<script type="text/javascript">
 $('#cgJsType').change(function() {
	 var cgJsType =$('#cgJsType').val();
	 var formId =$('#formId').val();
	 $.ajax({
			async : false,
			cache : false,
			type : 'POST',
			contentType : 'application/json', 
			dataType:"json",
			url : "cgformEnhanceJsController.do?doCgformEnhanceJs&cgJsType="+cgJsType+"&formId="+formId,// 请求的action路径
			error : function() {// 请求失败处理函数
				alert('<t:mutiLang langKey="get.error"/>');
				frameElement.api.close();
			},
			success : function(data) {
				var d = data;
				if (d.success) {
					var cgformenhanceJsPage = d.obj;
					$('#id').val(cgformenhanceJsPage.id);
					$('#cgJsStr').val(cgformenhanceJsPage.cgJsStr);
				}else{
					$('#id').val("");
					$('#cgJsStr').val("");
				}
			}
		});
	 
 });
</script>
</html>