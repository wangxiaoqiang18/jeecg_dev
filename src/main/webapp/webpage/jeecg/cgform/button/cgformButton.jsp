<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>表单自定义按钮</title>
    <link rel="stylesheet" href="${basePath}plug-in/Validform/css/metrole/style.css" type="text/css">
    <link rel="stylesheet" href="${basePath}plug-in/Validform/css/metrole/tablefrom.css">
    <link rel="stylesheet" href="${basePath}plug-in/Validform/css/metrole/style.css" type="text/css"/>
    <link rel="stylesheet" href="${basePath}plug-in/Validform/css/metrole/tablefrom.css"
          type="text/css"/>
    <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
    <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
    <SCRIPT type="text/javascript" src="plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js"></SCRIPT>
    <script src="plug-in/layer/layer.js"></script>
    <t:base type="jquery,easyui,tools,DatePicker"></t:base>
</head>
<body style="overflow-y: hidden" scroll="no">
<form id="formobj" action="cgformButtonController.do?save" name="formobj" method="post">
    <input type="hidden" id="btn_sub" class="btn_sub">
    <input id="id" name="id" type="hidden" value="${cgformButtonPage.id }">
    <input id="formId" name="formId" type="hidden" value="${cgformButtonPage.formId }">
    <table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
        <tbody>
        <tr>
            <td align="right"><label class="Validform_label"> 按钮编码 : </label></td>
            <td class="value"><input class="inputxt" id="buttonCode" name="buttonCode" ignore="ignore" value="${cgformButtonPage.buttonCode}"> <span
                    class="Validform_checktip">编码不能是add/update/delete</span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 按钮名称: </label></td>
            <td class="value"><input class="inputxt" id="buttonName" name="buttonName" ignore="ignore" value="${cgformButtonPage.buttonName}"> <span
                    class="Validform_checktip"></span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 按钮样式 </label></td>
            <td class="value"><select name="buttonStyle" id="buttonStyle">
                <option value="link" <c:if test="${cgformButtonPage.buttonStyle=='link'}">selected="selected"</c:if>>link</option>
                <option value="button" <c:if test="${cgformButtonPage.buttonStyle=='button'}">selected="selected"</c:if>>button</option>
            </select> <span class="Validform_checktip"></span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 动作类型: </label></td>
            <td class="value"><select name="optType" id="optType">
                <option value="js" <c:if test="${cgformButtonPage.optType=='js'}">selected="selected"</c:if>>js</option>
                <option value="action" <c:if test="${cgformButtonPage.optType=='action'}">selected="selected"</c:if>>action</option>
            </select> <span class="Validform_checktip"></span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 显示顺序: </label></td>
            <td class="value"><input class="inputxt" id="orderNum" name="orderNum" datatype="n" value="${cgformButtonPage.orderNum}">
                <span class="Validform_checktip"></span>
            </td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 显示图标样式: </label></td>
            <td class="value"><input class="inputxt" id="buttonIcon" name="buttonIcon" datatype="*"
                                     value="<c:if test="${cgformButtonPage.buttonIcon!=null&&cgformButtonPage.buttonIcon!=''}">${cgformButtonPage.buttonIcon}</c:if><c:if test="${cgformButtonPage.buttonIcon==null||cgformButtonPage.buttonIcon==''}">icon-edit</c:if>">
                <span class="Validform_checktip"></span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 显示表达式: </label></td>
            <td class="value"><input class="inputxt" id="exp" name="exp" ignore="ignore" value="${cgformButtonPage.exp}"> <span
                    class="Validform_checktip"></span></td>
        </tr>
        <tr>
            <td align="right"><label class="Validform_label"> 状态: </label></td>
            <td class="value"><select name="buttonStatus" id="buttonStatus">
                <option value="0" <c:if test="${cgformButtonPage.buttonStatus=='0'}">selected="selected"</c:if>><t:mutiLang langKey="common.inactive"/></option>
                <option value="1" <c:if test="${cgformButtonPage.buttonStatus=='1'}">selected="selected"</c:if>><t:mutiLang langKey="common.active"/></option>
            </select> <span class="Validform_checktip"></span></td>
        </tr>
        </tbody>
    </table>
    <link rel="stylesheet" href="${basepath}plug-in/Validform/css/metrole/style.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/plug-in/Validform/css/metrole/tablefrom.css"
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
</form>
<%--<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cgformButtonController.do?save">
	<input id="id" name="id" type="hidden" value="${cgformButtonPage.id }">
	<input id="formId" name="formId" type="hidden" value="${cgformButtonPage.formId }">
	<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.button.code"/> : </label></td>
			<td class="value"><input class="inputxt" id="buttonCode" name="buttonCode" ignore="ignore" value="${cgformButtonPage.buttonCode}"> <span class="Validform_checktip"><t:mutiLang langKey="lang.code.cannot.add.update.delete"/></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.button.name"/>: </label></td>
			<td class="value"><input class="inputxt" id="buttonName" name="buttonName" ignore="ignore" value="${cgformButtonPage.buttonName}"> <span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.button.style"/> </label></td>
			<td class="value"><select name="buttonStyle" id="buttonStyle">
				<option value="link" <c:if test="${cgformButtonPage.buttonStyle=='link'}">selected="selected"</c:if>>link</option>
				<option value="button" <c:if test="${cgformButtonPage.buttonStyle=='button'}">selected="selected"</c:if>>button</option>
			</select> <span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.action.type"/>: </label></td>
			<td class="value"><select name="optType" id="optType">
				<option value="js" <c:if test="${cgformButtonPage.optType=='js'}">selected="selected"</c:if>>js</option>
				<option value="action" <c:if test="${cgformButtonPage.optType=='action'}">selected="selected"</c:if>>action</option>
			</select> <span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.show.sequence"/>: </label></td>
			<td class="value"><input class="inputxt" id="orderNum" name="orderNum" datatype="n" value="${cgformButtonPage.orderNum}"> <span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.show.icon.style"/>: </label></td>
			<td class="value"><input class="inputxt" id="buttonIcon" name="buttonIcon" datatype="*"
				value="<c:if test="${cgformButtonPage.buttonIcon!=null&&cgformButtonPage.buttonIcon!=''}">${cgformButtonPage.buttonIcon}</c:if><c:if test="${cgformButtonPage.buttonIcon==null||cgformButtonPage.buttonIcon==''}">icon-edit</c:if>">
			<span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.show.expression"/>: </label></td>
			<td class="value"><input class="inputxt" id="exp" name="exp" ignore="ignore" value="${cgformButtonPage.exp}"> <span class="Validform_checktip"></span></td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.status"/>:  </label></td>
			<td class="value"><select name="buttonStatus" id="buttonStatus">
				<option value="0" <c:if test="${cgformButtonPage.buttonStatus=='0'}">selected="selected"</c:if>><t:mutiLang langKey="common.inactive"/></option>
				<option value="1" <c:if test="${cgformButtonPage.buttonStatus=='1'}">selected="selected"</c:if>><t:mutiLang langKey="common.active"/></option>
			</select> <span class="Validform_checktip"></span></td>
		</tr>
	</table>
</t:formvalid>--%>
</body>
</html>