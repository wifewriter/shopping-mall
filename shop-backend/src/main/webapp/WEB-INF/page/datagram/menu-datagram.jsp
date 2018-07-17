<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<table id="SysMenuTreegrid"></table>

<div id="SysMenuToolbar">
    <div>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysMenu.toolbar.showAddDialog();" data-options="
		iconCls:'icon-add',
		plain:true">
            新增
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysMenu.toolbar.showUpdateDialog();" data-options="
		iconCls:'icon-edit',
		plain:true">
            修改
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysMenu.toolbar.remove();" data-options="
		iconCls:'icon-remove',
		plain:true">
            删除
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysMenu.toolbar.redo();" data-options="
		iconCls:'icon-redo',
		plain:true">
            取消
        </a>
    </div>
</div>

<div id="SysMenuAddDialog" class="easyui-dialog" data-options="
width: 350,
title:'新增菜单',
buttons:'#SysMenuAddDialogButtons',
closed: true,
onClose: SysMenu.toolbar.resetAddForm,
">
    <form id="SysMenuAddForm" class="form-offset-left">
        <div class="form-group">
            <strong>父级：</strong>
            <input type="text" name="pid" id="SysMenuAddFormPid">
        </div>
        <div class="form-group">
            <strong>菜单：</strong>
            <input type="text" name="text" class="easyui-textbox" data-options="
			required:true,
			validType:'length[1,20]'
			">
        </div>
        <div class="form-group">
            <strong>地址：</strong>
            <input type="text" name="url" class="easyui-textbox" data-options="
			validType:'length[5,255]'
			">
        </div>
    </form>
</div>
<div id="SysMenuAddDialogButtons">
    <a href="javascript:void(0)" onclick="SysMenu.toolbar.add()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        新增
    </a>
    <a href="javascript:void(0)" onclick="SysMenu.toolbar.hideAddDialog()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<div id="SysMenuUpdateDialog" class="easyui-dialog" data-options="
width: 350,
title:'修改菜单',
buttons:'#SysMenuUpdateDialogButtons',
closed: true,
onClose: SysMenu.toolbar.resetUpdateForm,
">
    <form id="SysMenuUpdateForm" class="form-offset-left">
        <input type="hidden" name="id"/>
        <div class="form-group">
            <strong>菜单：</strong>
            <input type="text" name="text" class="easyui-textbox" data-options="
			required:true,
			validType:'length[1,20]'
			">
        </div>
        <div class="form-group">
            <strong>地址：</strong>
            <input type="text" name="url" class="easyui-textbox" data-options="
			validType:'length[5,255]'
			">
        </div>
    </form>
</div>
<div id="SysMenuUpdateDialogButtons">
    <a href="javascript:void(0)" onclick="SysMenu.toolbar.update()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        修改
    </a>
    <a href="javascript:void(0)" onclick="SysMenu.toolbar.hideUpdateDialog()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<script>
    var SysMenu = {
        init: function() {
            SysMenu.treegrid = $('#SysMenuTreegrid');
            SysMenu.addDialog = $('#SysMenuAddDialog');
            SysMenu.addForm = $('#SysMenuAddForm');
            SysMenu.addFormEmail = $('#SysMenuAddFormEmail');
            SysMenu.addFormPid = $('#SysMenuAddFormPid');
            SysMenu.updateDialog = $('#SysMenuUpdateDialog');
            SysMenu.updateForm = $('#SysMenuUpdateForm');
            SysMenu.searchEmail = $('#SysMenuSearchEmail');
            SysMenu.searchUsername = $('#SysMenuSearchUsername');
            SysMenu.searchStatus = $('#SysMenuSearchStatus');

            SysMenu.treegrid.treegrid({
                url: ctx + '/menu/listByPid',
                fixed: true,
                fitColumns: true,
                striped: true,
                rownumbers: true,
                toolbar: '#SysMenuToolbar',
                idField:'id',
                treeField:'text',
                columns:[[
                    {field:'id', checkbox: true},
                    {field:'text', title:'菜单', width:100, align:'center'},
                    {field:'url', title:'地址', width:100, align:'center'},
                    {field:'state', title:'类型', width:100, align:'center'},
                ]],
                onDblClickRow: function(row) {
                    SysMenu.toolbar.showUpdateDialog(row.id);
                },
                onLoadSuccess: function(node, data) {
                    $(this).treegrid('expandAll');
                },
            })
        },
        toolbar: {
            showAddDialog: function() {
                SysMenu.addFormPid.combotree({
                    url: ctx + '/menu/listByPid',
                    onLoadSuccess: function() {
                        debugger;
                        $(this).tree('expandAll');
                    },
                });

                var row = SysMenu.treegrid.treegrid('getSelections');
                if (row.length == 1) {
                    SysMenu.addFormPid.combotree('setValue', row[0].id);
                }

                SysMenu.addDialog.dialog('open');
            },
            add: function() {
                if (SysMenu.addForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/menu/add', SysMenu.addForm.serialize(), function(data) {
                        if (data) {
                            EasyUI.show('新增成功！');
                            SysMenu.treegrid.treegrid('reload');
                        } else {
                            EasyUI.alertError('新增失败');
                        }
                        EasyUI.closeProgress();
                        SysMenu.toolbar.hideAddDialog()
                    });
                }
            },
            hideAddDialog: function() {
                SysMenu.addDialog.dialog('close');
            },
            resetAddForm: function() {
                SysMenu.addForm.form('reset');
            },
            showUpdateDialog: function(id) {
                var getData = function(value) {
                    EasyUI.progress();
                    $.post(ctx + '/menu/getById', {id: value}, function(data) {
                        if (data.result) {
                            SysMenu.updateForm.form('load', {
                                id: data.data.id,
                                text: data.data.text,
                                url: data.data.url,
                            });
                            SysMenu.updateDialog.dialog('open');
                        } else {
                            EasyUI.alertError('获取信息失败！');
                        }
                    });
                    EasyUI.closeProgress();
                }
                if (id) {
                    getData(id);
                } else {
                    var row = SysMenu.treegrid.treegrid('getSelections');
                    if (row.length == 1) {
                        var id = row[0].id;
                        getData(id);
                    } else {
                        EasyUI.show('请选择一行数据进行修改！');
                    }
                }
            },
            update: function() {
                if (SysMenu.updateForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/menu/update', SysMenu.updateForm.serialize(), function(data) {
                        if (data) {
                            EasyUI.show('修改成功！');
                            SysMenu.treegrid.treegrid('reload');
                        } else {
                            EasyUI.alertError('修改失败！');
                        }
                        EasyUI.closeProgress();
                        SysMenu.toolbar.hideUpdateDialog()
                    });
                }
            },
            hideUpdateDialog: function() {
                SysMenu.updateDialog.dialog('close');
            },
            resetUpdateForm: function() {
                SysMenu.updateForm.form('reset');
            },
            remove: function() {
                var row = SysMenu.treegrid.treegrid('getSelections');
                if (row.length > 0) {
                    EasyUI.confirm('该操作不能恢复，确认继续吗？', function(result) {
                        if (result) {
                            $.post(ctx + '/menu/deleteById', {id: row[0].id}, function(data) {
                                if (data) {
                                    EasyUI.show('删除成功！');
                                    SysMenu.treegrid.treegrid('reload');
                                } else {
                                    EasyUI.alertError('删除失败！');
                                }
                                EasyUI.closeProgress();
                                SysMenu.toolbar.hideUpdateDialog()
                            });
                        }
                    });
                } else {
                    EasyUI.show('请选择数据进行删除！');
                }
            },
            redo: function() {
                SysMenu.treegrid.treegrid('unselectAll');
            },
        }
    }

    $(function() {
        SysMenu.init();
    })
</script>