package com.ning.login.action;

import com.ning.exception.login.LoginException;
import com.ning.login.entity.User;
import com.ning.login.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
@Controller
public class Login {
    private static final Logger logger = LoggerFactory.getLogger(Login.class);
    @Resource
    private UserService userService;
    @RequestMapping("login")
    public String userLogin(Model model, HttpServletRequest request) throws LoginException {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        if (user != null && user.getUid() != null) {
            logger.debug("用户成功登录 {}", user);
            return "redirect:index.jsp";
        }
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
        if (exceptionClassName != null) {
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                model.addAttribute("returninfo", "账号不存在");
            } else if (IncorrectCredentialsException.class.getName().equals(
                    exceptionClassName) || AuthenticationException.class.getName().equals(exceptionClassName)) {
                model.addAttribute("returninfo", "用户名/密码错误");
            } else {
                throw new LoginException(exceptionClassName);
            }
        }
        return "jsp/login.jsp";
    }
}
