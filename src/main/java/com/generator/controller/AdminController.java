package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.listener.LoginListener;
import com.generator.pojo.Admin;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.AdminService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.jms.ServerSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Date;

import static com.generator.common.UserUtil.isEmpty;
import static com.generator.common.UserUtil.isLogin;

@Controller
@RequestMapping("/AdminController")
public class AdminController {
    private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);
    private List<Admin> login=new ArrayList<Admin>();
    @Resource
    private AdminService adminService;
    @RequestMapping("/showAdminToJspById/{adminId}")
    public String showUser(Model model, @PathVariable("adminId") int adminId){
        Admin user = this.adminService.getById(adminId);
        model.addAttribute("user", user);
        return "showUser";
    }
    @RequestMapping("/login/")
    public String login(String account, String password, HttpServletRequest request){
        Object accounts=request.getSession().getAttribute("user");
        HttpSession session=request.getSession();
        //判断用户是否已经登录
        if(LoginListener.isOnline(account)){
            //在线逻辑:挤掉前用户
            if(LoginListener.isAlreadyEnter(session,account)){
                try {

                    Admin user = this.adminService.login(account,password);
                    session.setAttribute("accounts",user.getAdminAccount());
                    session.setAttribute("adminName",user.getAdminName());
                    session.setAttribute("adminId",user.getAdminId());
                    session.setAttribute("user",user);
                    //login.add(user);
                }catch (Exception e){
                    request.setAttribute("message","登录失败！请检查账号密码是否正确！");
                    return "forward:/login.jsp";
                }
                return "redirect:/AdminController/index/";
            }else{
                request.setAttribute("message","登录失败！请检查账号密码是否正确！");
                return "forward:/login.jsp";
            }
        }else {
            //非在线逻辑：正常登录
                try {
                    Admin user = this.adminService.login(account, password);
                    session.setAttribute("accounts", user.getAdminAccount());
                    session.setAttribute("adminName", user.getAdminName());
                    session.setAttribute("adminId", user.getAdminId());
                    session.setAttribute("user", user);
                    login.add(user);
                } catch (Exception e) {
                    request.setAttribute("message", "登录失败！请检查账号密码是否正确！");
                    return "forward:/login.jsp";
                }
                return "redirect:/AdminController/index/";
          }
        }
        /**if(isEmpty(admin)){
            int adminid=0;
            try {
                Admin user = this.adminService.login(account,password);
                if(isLogin(login,user)){
                    HttpSession session=request.getSession();
                    session.setAttribute("accounts",user.getAdminAccount());
                    session.setAttribute("adminName",user.getAdminName());
                    session.setAttribute("adminId",user.getAdminId());
                    session.setAttribute("user",user);
                    login.add(user);
                }else{
                    request.setAttribute("message","登录失败！该账号已经登录！");
                    return "forward:/login.jsp";
                }
                //
            }catch (Exception e){
                request.setAttribute("message","登录失败！请检查账号密码是否正确！");
                return "forward:/login.jsp";
            }
            //redirect:/index/
            return "redirect:/AdminController/index/";
        }else{
            request.setAttribute("message","登录失败！该账号已经登录！");
            return "forward:/login.jsp";
        }**/
    @RequestMapping("/index/")
    public String index(){
        return "index";
    }
   /**
    @RequestMapping("/logout/")
    public String logout(HttpSession session,String adminName){
        session.invalidate();
        if(adminName!=null){
            login.remove(adminName);
        }
        return "redirect:/login.jsp";
    }*/
    @RequestMapping("/jsp/")
    public String show(String url){
        return url;
    }

    @RequestMapping("/updataAdmin/")
    @ResponseBody
    public void updataAdmin(HttpServletResponse response,Admin user) {
        Msg msg = new Msg();
        int num = adminService.updateAdmin(user);
        if (num > 0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("修改成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("修改失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
    /**
     * 退出登录
     */
    @RequestMapping("/logOn/")
    @ResponseBody
    public void logOn(HttpServletRequest request, HttpServletResponse response,String account)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);//防止创建Session
        /**Iterator<Admin> it = login.iterator();
        if(session == null){
            if(adminId!=null){
                while(it.hasNext()){
                    Admin admin = it.next();
                    if(admin.getAdminId()==Integer.parseInt(adminId)){
                        it.remove();
                    }
                }
            }
            response.sendRedirect("../../login.jsp");
            return;
        }else{
            while(it.hasNext()){
                Admin admin = it.next();
                if(admin.getAdminId()==Integer.parseInt(adminId)){
                    it.remove();
                }
            }**/
            //清除所有session
            //session.invalidate();
            request.getSession().removeAttribute("accounts");
            response.sendRedirect("../../login.jsp");
            return;
        }
//        session.removeAttribute("user");
//        response.sendRedirect("/AdminController/index/");
    @RequestMapping("/AdminList/")
    @ResponseBody
    public pageBaen AdminList(int page, int rows, String sort, String order, String advanceFilter) {
        pageBaen pages = new pageBaen();//分页对象
        pageBaen pageBaen = new pageBaen();
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page - 1) * rows;
        if (advanceFilter != null && advanceFilter != "[]") {
            JSONArray jsonArray = JSONArray.fromObject(advanceFilter);
            Iterator<Object> it = jsonArray.iterator();
            while (it.hasNext()) {
                JSONObject obj = (JSONObject) it.next();
                ComplexQuery complexQuery = new ComplexQuery();
                complexQuery.setJoin((String) obj.get("join"));
                complexQuery.setLb((String) obj.get("lb"));
                complexQuery.setField((String) obj.get("field"));
                complexQuery.setOp((String) obj.get("op"));
                complexQuery.setValue((String) obj.get("value"));
                complexQuery.setRb((String) obj.get("rb"));
                queryList.add(complexQuery);
            }
        }
        List<Admin> list = adminService.selectAdmin(cur, rows, sort, order, queryList);
        List<Admin> listAll = adminService.selectAdminAll(queryList);
        pageBaen.setTotal(listAll.size());
        pageBaen.setRows(list);
        int total = listAll.size();
        int totalPage = total % rows == 0 ? (total / rows) : (total / rows) + 1;//总页数
        pageBaen.setTotalPage(totalPage);
        pageBaen.setCurrentPage(page);
        pageBaen.setNumPerPage(rows);
        pageBaen.setNextPage(totalPage - page == 0 ? page : page + 1);
        pageBaen.setPreviousPage(page - 0 == 1 ? page : page - 1);
        pageBaen.setHasPreviousPage(true);
        pageBaen.setHasNextPage(true);
        pageBaen.setFirstPage(true);
        pageBaen.setLastPage(true);
        return pageBaen;
    }
    @RequestMapping("/UserList/")
    @ResponseBody
    public pageBaen UserList(int page, int rows, String sort, String order) {
        pageBaen pages = new pageBaen();//分页对象
        pageBaen pageBaen = new pageBaen();
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page - 1) * rows;

        pageBaen.setTotal(login.size());
        pageBaen.setRows(login);
        int total = login.size();
        int totalPage = total % rows == 0 ? (total / rows) : (total / rows) + 1;//总页数
        pageBaen.setTotalPage(totalPage);
        pageBaen.setCurrentPage(page);
        pageBaen.setNumPerPage(rows);
        pageBaen.setNextPage(totalPage - page == 0 ? page : page + 1);
        pageBaen.setPreviousPage(page - 0 == 1 ? page : page - 1);
        pageBaen.setHasPreviousPage(true);
        pageBaen.setHasNextPage(true);
        pageBaen.setFirstPage(true);
        pageBaen.setLastPage(true);
        return pageBaen;
    }
    @RequestMapping("/deleteAdmin/")
    @ResponseBody
    public void deleteAdmin(HttpServletResponse response,String adminId) {
        Msg msg = new Msg();
        String sid = null;
        sid = adminId.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num = adminService.deleteAdmin(Integer.parseInt(id));
            if (num ==0) {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败！");
                continue;
            }
        }
        if (num >0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功！");
        }
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 强制下线
     * @param response
     * @param adminId
     */
    @RequestMapping("/delete/")
    @ResponseBody
    public void delete(HttpServletResponse response,String adminId) {
            Msg msg = new Msg();
            Iterator<Admin> it = login.iterator();
            int num=0;
            if(adminId!=null){
                while(it.hasNext()){
                    //Admin admin = it.next();
                    //if(admin.getAdminId()==Integer.parseInt(adminId)){
                        it.remove();
                        num=1;
                    //}
                }
            }
            if (num ==0) {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("下线失败！");
            }
            if (num==1) {
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("下线成功！");
            }
            ResponseUtil.writeJson(response,msg);
        }

    @RequestMapping("/edit/")
    public ModelAndView jump(String url, String adminNamed,int adminId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("adminNamed",adminNamed);
        modelAndView.addObject("adminId",adminId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/AddAdmin/")
    @ResponseBody
    public void AddAdmin(HttpServletResponse response,Admin user){
        Msg msg = new Msg();
        user.setFake(0);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        user.setRegisterTime(sdf.format(new Date()));
        int num = adminService.addAdmin(user);
        if (num > 0) {
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        ResponseUtil.writeJson(response,msg);
    }
    @RequestMapping("/getAdmin/")
    @ResponseBody
    public Admin getAdmin(int adminId) {
        //返回前端的对象
        Admin admin = new Admin();
        admin = adminService.getAdmin(adminId);
        return admin;
    }

}
