<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="roleTalentToolbar">
    <div>
        <a href="javascript:void(0)" id="addRoleDialogShow" class="easyui-linkbutton"
           onclick="sysRoleListObj.toolbar.showAddDialog();"
           data-options="
		iconCls:'icon-add',
		plain:true">
            新增
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysRoleListObj.toolbar.showUpdateDialog();"
           data-options="
		iconCls:'icon-edit',
		plain:true">
            修改
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysRoleListObj.toolbar.remove();" data-options="
		iconCls:'icon-remove',
		plain:true">
            删除
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysRoleListObj.toolbar.redo();" data-options="
		iconCls:'icon-redo',
		plain:true">
            取消
        </a>
    </div>
    <div>
        <strong>姓名：</strong>
        <input type="text" name="name" id="searchName"/>
        <strong>时间：</strong>
        <input type="text" name="time" id="searchTime" class="easyui-datetimebox"/>
        <a href="javascript:void(0)" onclick="sysRoleListObj.toolbar.search();" class="easyui-linkbutton" data-options="
		iconCls:'icon-search',
		plain:true">
            查询
        </a>
    </div>
</div>

<table id="sysRoleListDatagrid"></table>

<div id="addRoleDialog" class="easyui-dialog" data-options="
width: 350,
title:'新增角色',
buttons:'#sysRoleListObjAddDialogButtons',
closed: true,
onClose: sysRoleListObj.toolbar.resetAddForm,">
    <form id="RoleAddForm" class="form-offset-left">
        <div class="form-group">
            <strong>角色名：</strong>
            <input type="text" name="name" class="easyui-textbox" data-options="
			required:true,
			validType:'length[1,20]'
			">
        </div>
    </form>
</div>
<div id="sysRoleListObjAddDialogButtons">
    <a href="javascript:void(0)" onclick="sysRoleListObj.toolbar.add()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        新增
    </a>
    <a href="javascript:void(0)" onclick="sysRoleListObj.toolbar.hideAddDialog()" class="easyui-linkbutton"
       data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<div id="sysRoleListObjUpdateDialog" class="easyui-dialog" data-options="
width: 350,
title:'修改角色',
buttons:'#sysRoleListObjUpdateDialogButtons',
closed: true,
onClose: sysRoleListObj.toolbar.resetUpdateForm,
">
    <form id="sysRoleListObjUpdateForm" class="form-offset-left">
        <div class="form-group">
            <strong>角色名：</strong>
            <input type="text" name="roleIds" class="easyui-textbox" data-options="
			required: true,
			valueField: 'id',
			textField: 'name',
			multiple: true,
			editable: false,
			">
        </div>
    </form>
</div>
<div id="sysRoleListObjUpdateDialogButtons">
    <a href="javascript:void(0)" onclick="sysRoleListObj.toolbar.update()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        修改
    </a>
    <a href="javascript:void(0)" onclick="sysRoleListObj.toolbar.hideUpdateDialog()" class="easyui-linkbutton"
       data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<script>

    var sysRoleListObj = {
        init: function () {
            sysRoleListObj.sysRoleListDatagrid = $('#sysRoleListDatagrid');
            sysRoleListObj.addDialog = $('#addRoleDialog');
            sysRoleListObj.addForm = $('#RoleAddForm');
            sysRoleListObj.updateDialog = $('#sysRoleListObjUpdateDialog');
            sysRoleListObj.updateForm = $('#sysRoleListObjUpdateForm');

            // 生成Datagrid
            sysRoleListObj.sysRoleListDatagrid.datagrid({
                url: '/role/listAll',
                fixed: false,
                fitColumns: true,
                striped: true,
                rownumbers: true,
                pagination: true,
                pageSize: 9,
                pageList: [9, 10, 20, 30, 50, 100],
                pageNumber: 1,
                // sortName: 'age',
                // sortOrder: 'desc',
                toolbar: '#roleTalentToolbar',
                columns: [[
                    {field: 'id', checkbox: true},
                    {field: 'name', title: '角色名', width: 100, align: 'center'},
                    {
                        field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                            return row.status == 1 ? "启用" : "禁用";
                        }, align: 'center'
                    },
                    {field: 'createTime', title: '创建时间', width: 100, align: 'center'},

                ]],
                onDblClickRow: function (rowIndex, rowData) {
                    sysRoleListObj.toolbar.showUpdateDialog(rowData.id);
                }
            });
        },
        toolbar: {
            showAddDialog: function () {
                sysRoleListObj.addDialog.dialog('open');
            },
            add: function () {
                if (sysRoleListObj.addForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/role/add', sysRoleListObj.addForm.serialize(), function (data) {
                        if (data) {
                            EasyUI.show('新增成功！');
                            sysRoleListObj.sysRoleListDatagrid.datagrid('reload');
                        } else {
                            EasyUI.alertError('新增失败');
                        }
                        EasyUI.closeProgress();
                        sysRoleListObj.toolbar.hideAddDialog()
                    });
                }
            },
            hideAddDialog: function () {
                sysRoleListObj.addDialog.dialog('close');
            },
            resetAddForm: function () {
                sysRoleListObj.addForm.form('reset');
            },
            showUpdateDialog: function (id) {

                var getData = function (value) {
                    EasyUI.progress();
                    $.post(ctx + '/role/getById', {id: value}, function (data) {
                        if (data.result) {
                            sysRoleListObj.updateForm.form('load', {
                                name: data.data.name
                            });
                            sysRoleListObj.updateDialog.dialog('open');
                        } else {
                            EasyUI.alertError('获取信息失败！');
                        }
                    });
                    EasyUI.closeProgress();
                };

                if (id) {
                    getData(id);
                } else {
                    var row = sysRoleListObj.sysRoleListDatagrid.datagrid('getSelections');
                    if (row.length == 1) {
                        var id = row[0].id;
                        getData(id);
                    } else {
                        EasyUI.show('请选择一行数据进行修改！');
                    }
                }
            },
            update: function () {
                if (sysRoleListObj.updateForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/role/update', sysRoleListObj.updateForm.serialize(), function (data) {
                        if (data) {
                            EasyUI.show('修改成功！');
                            sysRoleListObj.sysRoleListDatagrid.datagrid('reload');
                        } else {
                            EasyUI.alertError('修改失败！');
                        }
                        EasyUI.closeProgress();
                        sysRoleListObj.toolbar.hideUpdateDialog()
                    });
                }
            },

            hideUpdateDialog: function () {
                sysRoleListObj.updateDialog.dialog('close');
            },

            resetUpdateForm: function () {
                sysRoleListObj.updateForm.form('reset');
            },

            remove: function () {
                var row = sysRoleListObj.sysRoleListDatagrid.datagrid('getSelections');
                if (row.length > 0) {
                    EasyUI.confirm('该操作不会物理删除数据，而是把对应的状态改成禁用，确认继续吗？', function (result) {
                        if (result) {
                            var ids = [];
                            $.each(row, function (i, v) {
                                ids.push(v.id);
                            });
                            $.post(ctx + '/role/deleteByIds', {ids: ids.join(',')}, function (data) {
                                if (data) {
                                    EasyUI.show('删除成功！');
                                    sysRoleListObj.sysRoleListDatagrid.datagrid('reload');
                                } else {
                                    EasyUI.alertError('删除失败！');
                                }
                                EasyUI.closeProgress();
                                sysRoleListObj.toolbar.hideUpdateDialog()
                            });
                        }
                    });
                } else {
                    EasyUI.show('请选择数据进行删除！');
                }
            },
            redo: function () {
                sysRoleListObj.sysRoleListDatagrid.datagrid('unselectAll');
            }
        }
    };


    $(function () {
        sysRoleListObj.init();
    })
</script>