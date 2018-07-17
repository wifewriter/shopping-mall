<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="userTalentToolbar">
    <div>
        <a href="javascript:void(0)" id="addUserDialogShow" class="easyui-linkbutton"
           onclick="sysUserListObj.toolbar.showAddDialog();"
           data-options="
		iconCls:'icon-add',
		plain:true">
            新增
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysUserListObj.toolbar.showUpdateDialog();"
           data-options="
		iconCls:'icon-edit',
		plain:true">
            修改
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysUserListObj.toolbar.remove();" data-options="
		iconCls:'icon-remove',
		plain:true">
            删除
        </a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysUserListObj.toolbar.redo();" data-options="
		iconCls:'icon-redo',
		plain:true">
            取消
        </a>
    </div>
    <div>
        <strong>姓名/邮箱：</strong>
        <input type="text" name="email" id="SysUserSearchName"/>
        <strong>时间：</strong>
        <input type="text" name="createTime" id="SysUserSearchTime" class="easyui-datetimebox"/>
        <strong>状态：</strong>
        <select name="status" id="SysUserSearchStatus" class="easyui-combobox" data-options="
		editable: false
		">
            <option value="0">-全部-</option>
            <option value="1" selected="selected">启用</option>
            <option value="2">禁用</option>
        </select>
        <a href="javascript:void(0)" onclick="sysUserListObj.toolbar.search();" class="easyui-linkbutton" data-options="
		iconCls:'icon-search',
		plain:true">
            查询
        </a>
    </div>
</div>

<table id="sysUserListDatagrid"></table>

<div id="addUserDialog" class="easyui-dialog" data-options="
width: 350,
title:'新增用户',
buttons:'#sysUserListObjAddDialogButtons',
closed: true,
onClose: sysUserListObj.toolbar.resetAddForm,">
    <form id="UserAddForm" class="form-offset-left">
        <div class="form-group">
            <strong>邮箱：</strong>
            <input type="text" name="email" id="UserAddFormEmail" style="width:200px" class="easyui-textbox"
                   data-options="
			required:true,
			validType:['email', 'remote[\'<%=request.getContextPath() %>/validate/validateEmail\',\'email\']'],
			delay: 1000
			">
        </div>
        <div class="form-group">
            <strong>姓名：</strong>
            <input type="text" name="username" class="easyui-textbox" data-options="
			required:true,
			validType:'length[1,20]'
			">
        </div>
        <div class="form-group">
            <strong>角色：</strong>
            <input type="text" name="roleIds" class="easyui-combobox" data-options="
			required: true,
			valueField: 'id',
			textField: 'name',
			url: '<%=request.getContextPath() %>/role/listAll',
			multiple: true,
			editable: false,
			">
        </div>
    </form>
</div>
<div id="sysUserListObjAddDialogButtons">
    <a href="javascript:void(0)" onclick="sysUserListObj.toolbar.add()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        新增
    </a>
    <a href="javascript:void(0)" onclick="sysUserListObj.toolbar.hideAddDialog()" class="easyui-linkbutton"
       data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>

<div id="sysUserListObjUpdateDialog" class="easyui-dialog" data-options="
width: 350,
title:'修改用户',
buttons:'#sysUserListObjUpdateDialogButtons',
closed: true,
onClose: sysUserListObj.toolbar.resetUpdateForm,
">
    <form id="sysUserListObjUpdateForm" class="form-offset-left">
        <input type="hidden" name="id"/>
        <div class="form-group">
            <strong>邮箱：</strong>
            <input type="text" name="email" id="sysUserListObjUpdateFormEmail" style="width:200px"
                   class="easyui-textbox"
                   disabled="disabled">
        </div>
        <div class="form-group">
            <strong>姓名：</strong>
            <input type="text" name="username" class="easyui-textbox" data-options="
			required:true,
			validType:'length[1,20]'
			">
        </div>
        <div class="form-group">
            <strong>角色：</strong>
            <input type="text" name="roleIds" class="easyui-combobox" data-options="
			required: true,
			valueField: 'id',
			textField: 'name',
			url: '<%=request.getContextPath() %>/role/listAll',
			multiple: true,
			editable: false,
			">
        </div>
    </form>
</div>
<div id="sysUserListObjUpdateDialogButtons">
    <a href="javascript:void(0)" onclick="sysUserListObj.toolbar.update()" class="easyui-linkbutton" data-options="
	iconCls: 'icon-add',
	plain: true">
        修改
    </a>
    <a href="javascript:void(0)" onclick="sysUserListObj.toolbar.hideUpdateDialog()" class="easyui-linkbutton"
       data-options="
	iconCls: 'icon-redo',
	plain: true">
        取消
    </a>
</div>


<script>

    var sysUserListObj = {
        init: function () {
            sysUserListObj.sysUserListDatagrid = $('#sysUserListDatagrid');
            sysUserListObj.addDialog = $('#addUserDialog');
            sysUserListObj.addForm = $('#UserAddForm');
            sysUserListObj.updateDialog = $('#sysUserListObjUpdateDialog');
            sysUserListObj.updateForm = $('#sysUserListObjUpdateForm');
            sysUserListObj.searchName = $('#SysUserSearchName');
            sysUserListObj.searchTime = $('#SysUserSearchTime');
            sysUserListObj.searchStatus = $('#SysUserSearchStatus');

            // 生成Datagrid
            sysUserListObj.sysUserListDatagrid.datagrid({
                url: '/user/list',
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
                toolbar: '#userTalentToolbar',
                columns: [[
                    {field: 'id', checkbox: true},
                    {field: 'email', title: '邮箱', width: 100, align: 'center'},
                    {field: 'username', title: '姓名', width: 100, align: 'center'/* , sortable: true */},
                    {
                        field: 'sysRoles', title: '角色', width: 100, formatter: function (value, row, index) {
                            var names = "";
                            var length = row.sysRoles.length;
                            for (var i = 0; i < length; i++) {
                                names += row.sysRoles[i].name;
                                if (i < length - 1) {
                                    names += ",";
                                }
                            }
                            return names;
                        }, align: 'center'
                    },
                    {
                        field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                            return row.status == 1 ? "启用" : "禁用";
                        }, align: 'center'
                    },
                ]],
                onDblClickRow: function (rowIndex, rowData) {
                    sysUserListObj.toolbar.showUpdateDialog(rowData.id);
                }
            });
        },
        toolbar: {
            showAddDialog: function () {
                sysUserListObj.addDialog.dialog('open');
            },
            add: function () {
                if (sysUserListObj.addForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/user/add', sysUserListObj.addForm.serialize(), function (data) {
                        if (data) {
                            EasyUI.show('新增成功！');
                            sysUserListObj.sysUserListDatagrid.datagrid('reload');
                        } else {
                            EasyUI.alertError('新增失败');
                        }
                        debugger;
                        EasyUI.closeProgress();
                        sysUserListObj.toolbar.hideAddDialog()
                    });
                }
            },
            hideAddDialog: function () {
                sysUserListObj.addDialog.dialog('close');
            },
            resetAddForm: function () {
                sysUserListObj.addForm.form('reset');
            },
            showUpdateDialog: function (id) {

                function getRoleIds(data) {
                    var rolesId = "";
                    var sysRoles = data.data.sysRoles;
                    for (var i = 0; i < sysRoles.length; i++) {
                        rolesId += sysRoles[i].name;
                    }
                    return rolesId;
                }

                var getData = function (value) {
                    EasyUI.progress();
                    $.post(ctx + '/user/getById', {id: value}, function (data) {
                        if (data.result) {
                            sysUserListObj.updateForm.form('load', {
                                id: data.data.id,
                                email: data.data.email,
                                username: data.data.username,
                                roleIds: getRoleIds(data)
                            });
                            sysUserListObj.updateDialog.dialog('open');
                        } else {
                            EasyUI.alertError('获取信息失败！');
                        }
                    });
                    EasyUI.closeProgress();
                };

                if (id) {
                    getData(id);
                } else {
                    var row = sysUserListObj.sysUserListDatagrid.datagrid('getSelections');
                    if (row.length == 1) {
                        var id = row[0].id;
                        getData(id);
                    } else {
                        EasyUI.show('请选择一行数据进行修改！');
                    }
                }
            },
            update: function () {
                if (sysUserListObj.updateForm.form('validate')) {
                    EasyUI.progress();
                    $.post(ctx + '/user/update', sysUserListObj.updateForm.serialize(), function (data) {
                        if (data) {
                            EasyUI.show('修改成功！');
                            sysUserListObj.sysUserListDatagrid.datagrid('reload');
                        } else {
                            EasyUI.alertError('修改失败！');
                        }
                        EasyUI.closeProgress();
                        sysUserListObj.toolbar.hideUpdateDialog()
                    });
                }
            },
            hideUpdateDialog: function () {
                sysUserListObj.updateDialog.dialog('close');
            },
            resetUpdateForm: function () {
                sysUserListObj.updateForm.form('reset');
            },
            remove: function () {
                var row = sysUserListObj.sysUserListDatagrid.datagrid('getSelections');
                if (row.length > 0) {
                    EasyUI.confirm('该操作不会物理删除数据，而是把对应的状态改成禁用，确认继续吗？', function (result) {
                        if (result) {
                            var ids = [];
                            $.each(row, function (i, v) {
                                ids.push(v.id);
                            });
                            $.post(ctx + '/user/deleteByIds', {ids: ids.join(',')}, function (data) {
                                if (data) {
                                    EasyUI.show('删除成功！');
                                    sysUserListObj.sysUserListDatagrid.datagrid('reload');
                                } else {
                                    EasyUI.alertError('删除失败！');
                                }
                                EasyUI.closeProgress();
                                sysUserListObj.toolbar.hideUpdateDialog()
                            });
                        }
                    });
                } else {
                    EasyUI.show('请选择数据进行删除！');
                }
            },
            redo: function () {
                sysUserListObj.sysUserListDatagrid.datagrid('unselectAll');
            },
            search: function () {
                sysUserListObj.sysUserListDatagrid.datagrid('load', {
                    email: $.trim(sysUserListObj.searchName.val()),
                    username: $.trim(sysUserListObj.searchTime.val()),
                    status: $.trim(sysUserListObj.searchStatus.combobox('getValue'))
                });
            }
        }
    };


    $(function () {
        sysUserListObj.init();
    })
</script>