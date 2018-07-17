<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<table id="SysRoleDatagrid"></table>

<div id="SysRoleToolbar">
    <div>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysRole.toolbar.showAddDialog();" data-options="
		iconCls:'icon-add',
		plain:true">
            新增
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysRole.toolbar.showUpdateDialog();" data-options="
		iconCls:'icon-edit',
		plain:true">
            修改
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysRole.toolbar.remove();" data-options="
		iconCls:'icon-remove',
		plain:true">
            删除
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="SysRole.toolbar.redo();" data-options="
		iconCls:'icon-redo',
		plain:true">
            取消
        </a>
    </div>
    <div>
        <strong>角色：</strong>
        <input type="text" name="name" id="SysRoleSearchUsername" class="form-input"/>
        <strong>状态：</strong>
        <select name="status" id="SysRoleSearchStatus" class="easyui-combobox" data-options="
		editable: false
		">
            <option value="0">-全部-</option>
            <option value="1" selected="selected">启用</option>
            <option value="2">禁用</option>
        </select>
        <a href="javascript:void(0)" onclick="SysRole.toolbar.search();" class="easyui-linkbutton" data-options="
		iconCls:'icon-search',
		plain:true">
            查询
        </a>
    </div>
</div>

<div id="SysRoleAddDialog" class="easyui-dialog" data-options="
width: 350,
title:'新增角色',
buttons:'#SysRoleAddDialogButtons',
closed: true,
onClose: SysRole.toolbar.resetAddForm,
">
    <form id="SysRoleAddForm" class="form-offset-left">
        <div class="form-group">
            <strong>角色：</strong>
            <input type="text" name="name" class="easyui-textbox" data-options="
			required:true,
			validType:['length[1,20]', 'remote[\'<%=request.getContextPath() %>/role/validateName\',\'name\']'],
			delay: 500
			">
        </div>
        <div class="form-group">
            <strong>菜单：</strong>
            <input type="text" name="menuIds" id="SysRoleAddFormMenuIds">
        </div>
    </form>
</div>
<div id="SysRoleAddDialogButtons">
    <a href="javascript:void(0)" onclick="SysRole.toolbar.add()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        新增
    </a>
    <a href="javascript:void(0)" onclick="SysRole.toolbar.hideAddDialog()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<div id="SysRoleUpdateDialog" class="easyui-dialog" data-options="
width: 350,
title:'修改角色',
buttons:'#SysRoleUpdateDialogButtons',
closed: true,
onClose: SysRole.toolbar.resetUpdateForm,
">
    <form id="SysRoleUpdateForm" class="form-offset-left">
        <input type="hidden" name="id"/>
        <div class="form-group">
            <strong>角色：</strong>
            <input type="text" name="name" id="SysRoleUpdateFormName">
        </div>
        <div class="form-group">
            <strong>菜单：</strong>
            <input type="text" name="menuIds" id="SysRoleUpdateFormMenuIds">
        </div>
    </form>
</div>
<div id="SysRoleUpdateDialogButtons">
    <a href="javascript:void(0)" onclick="SysRole.toolbar.update()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        修改
    </a>
    <a href="javascript:void(0)" onclick="SysRole.toolbar.hideUpdateDialog()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<script>
    var SysRole = {
        init: function() {
            SysRole.datagrid = $('#SysRoleDatagrid');
            SysRole.addDialog = $('#SysRoleAddDialog');
            SysRole.addForm = $('#SysRoleAddForm');
            SysRole.addFormEmail = $('#SysRoleAddFormEmail');
            SysRole.addFormMenuIds = $('#SysRoleAddFormMenuIds');
            SysRole.updateDialog = $('#SysRoleUpdateDialog');
            SysRole.updateForm = $('#SysRoleUpdateForm');
            SysRole.updateFormMenuIds = $('#SysRoleUpdateFormMenuIds');
            SysRole.searchEmail = $('#SysRoleSearchEmail');
            SysRole.searchUsername = $('#SysRoleSearchUsername');
            SysRole.searchStatus = $('#SysRoleSearchStatus');
            SysRole.updateFormName = $('#SysRoleUpdateFormName');

            SysRole.datagrid.datagrid({
                url: ctx + '/role/listAll',
                fixed: true,
                fitColumns: true,
                striped: true,
                rownumbers: true,
                pagination: true,
                pageSize: 8,
                pageList: [8, 15, 30, 50, 100],
                pageNumber: 1,
                toolbar: '#SysRoleToolbar',
                sortName: 'createTime',
                sortOrder: 'desc',
                columns:[[
                    {field:'id', checkbox: true},
                    {field:'name', title:'角色', width:100, align:'center'},
                    {field:'statusStr', title:'状态', width:100, align:'center'},
                    {field:'createTime', title:'创建时间', width:100, align:'center', sortable: true},
                ]],
                onDblClickRow: function(rowIndex, rowData) {
                    SysRole.toolbar.showUpdateDialog(rowData.id);
                }
            })
        },
        toolbar: {
            showAddDialog: function() {
                SysRole.addFormMenuIds.combotree({
                    url: ctx + '/menu/listByPid',
                    multiple: true,
                    checkbox: true,
                    required: true,
                    cascadeCheck: false,
                    onCheck: function(node, checked){
                        var treeNode = $(this);
                        var treeChildNode = treeNode.tree("getChildren", node.target);
                        if (checked) {
                            for(var i= 0; i < treeChildNode.length; i++) {
                                treeNode.tree("check", treeChildNode[i].target);
                            }
                        } else {
                            for(var i= 0; i < treeChildNode.length; i++) {
                                treeNode.tree("uncheck", treeChildNode[i].target);
                            }
                        }

                    },
                    onLoadSuccess: function() {
                        $(this).tree('expandAll');
                    }
                });

                SysRole.addDialog.dialog('open');
            },
            add: function() {
                if (SysRole.addForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/role/add', SysRole.addForm.serialize(), function(data) {
                        if (data) {
                            EasyUI.show('新增成功！');
                            SysRole.datagrid.datagrid('reload');
                        } else {
                            EasyUI.alertError('新增失败');
                        }
                        EasyUI.closeProgress();
                        SysRole.toolbar.hideAddDialog()
                    });
                }
            },
            hideAddDialog: function() {
                SysRole.addDialog.dialog('close');
            },
            resetAddForm: function() {
                SysRole.addForm.form('reset');
            },
            showUpdateDialog: function(id) {
                var getData = function(value) {
                    EasyUI.progress();
                    $.post(ctx + '/role/getById', {id: value}, function(data) {
                        if (data.result) {
                            var menuIds = data.data.menuIds;

                            // TODO 修改角色时，动态设置验证，但有一个Bug就是会重复发送请求！
                            SysRole.updateFormName.textbox({
                                required: true,
                                validType: [
                                    'length[1,20]',
                                    "[remote['" + ctx + "/role/validateName?id=" + data.data.id + "','name']"
                                ],
                                delay: 500,
                            })

                            SysRole.updateForm.form('load', {
                                id: data.data.id,
                                name: data.data.name
                            });

                            SysRole.updateFormMenuIds.combotree({
                                url: ctx + '/nume/listByPid',
                                multiple: true,
                                checkbox: true,
                                required: true,
                                cascadeCheck: false,
                                onCheck: function(node, checked){
                                    var treeNode = $(this);
                                    var treeChildNode = treeNode.tree("getChildren", node.target);
                                    if (checked) {
                                        for(var i= 0; i < treeChildNode.length; i++) {
                                            treeNode.tree("check", treeChildNode[i].target);
                                        }
                                    } else {
                                        for(var i= 0; i < treeChildNode.length; i++) {
                                            treeNode.tree("uncheck", treeChildNode[i].target);
                                        }
                                    }

                                },
                                onLoadSuccess: function(node, data) {
                                    var that = this;
                                    $(that).tree('expandAll');
                                    $(data).each(function(index, value) {
                                        if ($.inArray(value.id, menuIds) != -1) {
                                            $(that).tree('check', value.target);
                                        }
                                    });
                                }
                            });

                            SysRole.updateDialog.dialog('open');
                        } else {
                            EasyUI.alertError('获取信息失败！');
                        }
                    });
                    EasyUI.closeProgress();
                }
                if (id) {
                    getData(id);
                } else {
                    var row = SysRole.datagrid.datagrid('getSelections');
                    if (row.length == 1) {
                        var id = row[0].id;
                        getData(id);
                    } else {
                        EasyUI.show('请选择一行数据进行修改！');
                    }
                }
            },
            update: function() {
                if (SysRole.updateForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/role/update', SysRole.updateForm.serialize(), function(data) {
                        if (data) {
                            EasyUI.show('修改成功！');
                            SysRole.datagrid.datagrid('reload');
                        } else {
                            EasyUI.alertError('修改失败！');
                        }
                        EasyUI.closeProgress();
                        SysRole.toolbar.hideUpdateDialog()
                    });
                }
            },
            hideUpdateDialog: function() {
                SysRole.updateDialog.dialog('close');
            },
            resetUpdateForm: function() {
                SysRole.updateForm.form('reset');
            },
            remove: function() {
                var row = SysRole.datagrid.datagrid('getSelections');
                if (row.length > 0) {
                    EasyUI.confirm('该操作不会物理删除数据，而是把对应的状态改成禁用，确认继续吗？', function(result) {
                        if (result) {
                            var ids = [];
                            $.each(row, function(i, v) {
                                ids.push(v.id);
                            });
                            $.post(ctx + '/role/deleteByIds', {ids: ids.join(',')}, function(data) {
                                if (data) {
                                    EasyUI.show('删除成功！');
                                    SysRole.datagrid.datagrid('reload');
                                } else {
                                    EasyUI.alertError('删除失败！');
                                }
                                EasyUI.closeProgress();
                                SysRole.toolbar.hideUpdateDialog()
                            });
                        }
                    });
                } else {
                    EasyUI.show('请选择数据进行删除！');
                }
            },
            redo: function() {
                SysRole.datagrid.datagrid('unselectAll');
            },
            search: function() {
                SysRole.datagrid.datagrid('load', {
                    name: $.trim(SysRole.searchUsername.val()),
                    status: $.trim(SysRole.searchStatus.combobox('getValue')),
                });
            }
        },
    }

    $(function() {
        SysRole.init();
    })
</script>