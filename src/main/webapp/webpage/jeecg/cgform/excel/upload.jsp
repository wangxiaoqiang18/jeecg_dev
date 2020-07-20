<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>导入数据</title>
    <t:base type="jquery,easyui,tools"></t:base>
</head>
<body style="overflow-y: hidden" scroll="no">
<div id="content">
    <div id="wrapper" style="border-left:1px solid #ddd;">
        <div id="steps">
            <form id="formobj" action="null" name="formobj" method="post">
                <input type="hidden" id="btn_sub" class="btn_sub"/>

                <fieldset class="step">
                    <div class="form">
                        <link rel="stylesheet" href="plug-in/uploadify/css/uploadify.css" type="text/css"></link>
                        <script type="text/javascript" src="plug-in/uploadify/jquery.uploadify-3.1.js"></script>
                        <script type="text/javascript" src="plug-in/tools/Map.js"></script>
                        <script type="text/javascript">var flag = false;
                        var fileitem = "";
                        var fileKey = "";
                        var serverMsg = "";
                        var m = new Map();
                        $(function () {
                            debugger
                            var query = window.location.search.substring(1);
                            var vars = query.split("&");
                            var formId = "";
                            for (var i =0; i < vars.length; i++) {
                                if (vars[i].split('=')[0] === 'tableName') {
                                    formId = vars[i].split('=')[1];
                                }
                            }
                            $('#file_upload').uploadify({
                                buttonText: '选择要导入的文件',
                                auto: false,
                                progressData: 'speed',
                                multi: true,
                                height: 18,
                                width: 80,
                                overrideEvents: ['onDialogClose'],
                                fileTypeDesc: '文件格式:',
                                queueID: 'filediv',
                                fileTypeExts: '*.xls',
                                fileSizeLimit: '15MB',
                                swf: 'plug-in/uploadify/uploadify.swf',
                                uploader: 'excelTempletController.do?importExcel&tableName=' + formId,
                                onUploadStart: function (file) {
                                    var documentTitle = $('#documentTitle').val();
                                    $('#file_upload').uploadify("settings", "formData", {'documentTitle': documentTitle});
                                },
                                onQueueComplete: function (queueData) {
                                    var win = frameElement.api.opener;
                                    win.reloadTable();
                                    win.tip(serverMsg);
                                    if (subDlgIndex && $('#infoTable-loading')) {
                                        $('#infoTable-loading').hide();
                                        if (!subDlgIndex.closed) subDlgIndex.close();
                                    }
                                    frameElement.api.close();
                                },
                                onUploadSuccess: function (file, data, response) {
                                    var d = $.parseJSON(data);
                                    if (d.success) {
                                        var win = frameElement.api.opener;
                                        serverMsg = d.msg;
                                    }
                                },
                                onFallback: function () {
                                    tip("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试")
                                },
                                onSelectError: function (file, errorCode, errorMsg) {
                                    switch (errorCode) {
                                        case -100:
                                            tip("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                                            break;
                                        case -110:
                                            tip("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
                                            break;
                                        case -120:
                                            tip("文件 [" + file.name + "] 大小异常！");
                                            break;
                                        case -130:
                                            tip("文件 [" + file.name + "] 类型不正确！");
                                            break;
                                    }
                                },
                                onUploadProgress: function (file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
                                }
                            });
                        });

                        function upload() {
                            $('#file_upload').uploadify('upload', '*');
                            return flag;
                        }

                        function cancel() {
                            $('#file_upload').uploadify('cancel', '*');
                        }</script>
                        <span id="file_uploadspan"><input type="file" name="fiels" id="file_upload"/></span></div>
                    <div class="form" id="filediv" style="height: 50px"></div>
                </fieldset>
                <link rel="stylesheet" href="plug-in/Validform/css/metrole/divfrom.css"
                      type="text/css"/>
                <link rel="stylesheet" href="plug-in/Validform/css/metrole/style.css"
                      type="text/css"/>
                <link rel="stylesheet" href="plug-in/Validform/css/metrole/tablefrom.css"
                      type="text/css"/>
                <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
                <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
                <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
                <script src="plug-in/layer/layer.js"></script>
                <script type="text/javascript">var subDlgIndex = null;
                $(function () {
                    $("#formobj").Validform({
                        tiptype: 4,
                        btnSubmit: "#btn_sub",
                        btnReset: "#btn_reset",
                        ajaxPost: true,
                        beforeSubmit: function (curform) {
                            var tag = true;
                            tag = upload(curform);
                            if (tag || tag != false) {
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
                            } else {
                                return false;
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
        </div>
    </div>
</div>

<%--<t:formvalid formid="formobj" layout="div" dialog="true" beforeSubmit="upload">
	<fieldset class="step">
	<div class="form"><t:upload name="fiels" buttonText="选择要导入的文件" uploader="excelTempletController.do?importExcel&tableName=${tableName}" extend="*.xls" id="file_upload" formData="documentTitle"></t:upload></div>
	<div class="form" id="filediv" style="height: 50px"></div>
	</fieldset>
</t:formvalid>--%>
</body>
</html>
