package com.xiaoyu.car4s.utils.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;


import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.service.UserService;


public class UserRealm extends AuthorizingRealm {

	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Override
	public String getName() {
		return "UserRealm";
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		User user = userService.findByUsername(username);
		if (user == null) {
			return null;
		}

		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
		return info;
	}

	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
