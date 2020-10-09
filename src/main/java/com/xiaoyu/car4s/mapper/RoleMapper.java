package com.xiaoyu.car4s.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaoyu.car4s.entity.Role;
import com.xiaoyu.car4s.utils.RedisCache;

@CacheNamespace(implementation = RedisCache.class)
public interface RoleMapper {
	
	@Select("select * from t_4s_role where del_flag=1")
	List<Role> all();
	
	
	List<Role> roleAll(Map<String, Object> map);

	@Insert("insert into t_4s_role(name,del_flag) values(#{name},#{delFlag})")
	void save(Role role);

	@Select("select * from t_4s_role where id=#{id}")
	Role findRole(Integer id);

	@Update("update t_4s_role set name=#{name} where id=#{id}")
	void update(Role role);

	
	void deleteRole(String[] ids);

	@Delete("delete from t_4s_role2menu where role_id=#{roleId}")
	void deleteRoleMenus(Integer roleId);

	
	void insertRoleMenus(@Param("roleId") Integer roleId,@Param("menuIds") Integer[] menuIds);
}
