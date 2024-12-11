--PG SQL
-- 创建序列（如果还不存在的话）
CREATE SEQUENCE IF NOT EXISTS sys_menu_id_seq;

-- ${businessName}管理菜单
WITH inserted_menu AS (
INSERT INTO sys_menu (
id, title, parent_id, type, path, name, component, icon,
is_external, is_cache, is_hidden, permission, sort, status, create_time, update_time, create_user
) VALUES (
nextval('sys_menu_id_seq'), '${businessName}管理', 0, ${menuType}, '/${apiModuleName}/${apiName}',
'${classNamePrefix}', '${apiModuleName}/${apiName}/index', '${icon!"list"}',
false, true, false, null, ${sort!1}, 1, now(), now(), 1
) RETURNING id
)
-- ${businessName}管理按钮
INSERT INTO sys_menu (
id, title, parent_id, type, permission, sort, status, create_time, update_time, create_user
)
SELECT nextval('sys_menu_id_seq'), title, (SELECT id FROM inserted_menu), type, permission, sort, status, create_time, update_time, create_user
FROM (VALUES
('查询${businessName}', 3, '${apiModuleName}:${apiName}:list', 1, 1, now(), now(), 1),
('详情${businessName}', 3, '${apiModuleName}:${apiName}:detail', 2, 1, now(), now(), 1),
('新增${businessName}', 3, '${apiModuleName}:${apiName}:add', 3, 1, now(), now(), 1),
('修改${businessName}', 3, '${apiModuleName}:${apiName}:update', 4, 1, now(), now(), 1),
('删除${businessName}', 3, '${apiModuleName}:${apiName}:delete', 5, 1, now(), now(), 1),
('导出${businessName}', 3, '${apiModuleName}:${apiName}:export', 6, 1, now(), now(), 1),
('导入${businessName}', 3, '${apiModuleName}:${apiName}:import', 7, 1, now(), now(), 1)
) AS t(title, type, permission, sort, status, create_time, update_time, create_user);