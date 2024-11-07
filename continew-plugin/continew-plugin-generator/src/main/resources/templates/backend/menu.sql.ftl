-- MYSQL
-- ${businessName}管理菜单
INSERT INTO sys_menu (
    title, parent_id, type, path, name, component, icon,
    is_external, is_cache, is_hidden, permission, sort, status, create_time, update_time
) VALUES (
    '${businessName}管理', 1000, ${menuType}, '/${apiModuleName}/${apiName}',
    '${classNamePrefix}', '${apiModuleName}/${apiName}/index', '${icon!"list"}',
    0, 1, 0, null, ${sort!1}, 1, now(), now()
);

SET @parentId = LAST_INSERT_ID();

-- ${businessName}管理按钮
INSERT INTO sys_menu (
    title, parent_id, type, permission, sort, status, create_time, update_time
) VALUES 
('查询${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:list', 1, 1, now(), now()),
('详情${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:detail', 2, 1, now(), now()),
('新增${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:add', 3, 1, now(), now()),
('修改${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:update', 4, 1, now(), now()),
('删除${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:delete', 5, 1, now(), now()),
('导出${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:export', 6, 1, now(), now()),
('导入${businessName}', @parentId, 3, '${apiModuleName}:${apiName}:import', 7, 1, now(), now());


<#--
-- PG_SQL
-- ${businessName}管理菜单
INSERT INTO sys_menu (
    title, parent_id, type, path, name, component, icon,
    is_external, is_cache, is_hidden, permission, sort, status, create_time, update_time
) VALUES (
    '${businessName}管理', 1000, ${menuType}, '/${apiModuleName}/${apiName}',
    '${classNamePrefix}', '${apiModuleName}/${apiName}/index', '${icon!"list"}',
    0, 1, 0, null, ${sort!1}, 1, now(), now()
) RETURNING id INTO parentId;

-- ${businessName}管理按钮
INSERT INTO sys_menu (
    title, parent_id, type, permission, sort, status, create_time, update_time
) VALUES
('查询${businessName}', parentId, 3, '${apiModuleName}:${apiName}:list', 1, 1, now(), now()),
('详情${businessName}', parentId, 3, '${apiModuleName}:${apiName}:detail', 2, 1, now(), now()),
('新增${businessName}', parentId, 3, '${apiModuleName}:${apiName}:add', 3, 1, now(), now()),
('修改${businessName}', parentId, 3, '${apiModuleName}:${apiName}:update', 4, 1, now(), now()),
('删除${businessName}', parentId, 3, '${apiModuleName}:${apiName}:delete', 5, 1, now(), now()),
('导出${businessName}', parentId, 3, '${apiModuleName}:${apiName}:export', 6, 1, now(), now()),
('导入${businessName}', parentId, 3, '${apiModuleName}:${apiName}:import', 7, 1, now(), now());
-->
