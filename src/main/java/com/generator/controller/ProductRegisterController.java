package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.CartonplantModel2;
import com.generator.pojo.ComplexQuery;
import com.generator.pojo.Msg;
import com.generator.pojo.pageBaen;
import com.generator.service.ProductRegisterService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 产品库
 */
@RequestMapping("/ProductRegister")
@Controller
public class ProductRegisterController {
    @Resource
    ProductRegisterService productRegisterService;

    @RequestMapping("/AddProductRegister/")
    @ResponseBody
    public void addProductRegister(HttpServletResponse response,CartonplantModel2 cartonplantModel2) throws IllegalStateException, IOException {
        Msg msg = new Msg();
        //我要获取当前的日期
        Date date = new Date();
        if(cartonplantModel2.getFile()!=null) {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
            //保存数据库的路径
            String sqlPath = "";
            String localPath = "/opt/Product/";
            //定义 文件名
            String filename = null;
            // 如果文件不存在就创建
            File folder = new File(localPath);
            //文件夹路径不存在
            if (!folder.exists() && !folder.isDirectory()) {
                folder.mkdirs();
            }
            if (!cartonplantModel2.getFile().isEmpty()) {
                //获得文件类型（可以判断如果不是图片，禁止上传）
                String contentType = cartonplantModel2.getFile().getContentType();
                //获得文件后缀名
                String suffixName = contentType.substring(contentType.indexOf("/") + 1);
                //得到 文件名
                filename = sdf1.format(date) + "." + suffixName;
//                System.out.println(filename);
                //文件保存路径
                cartonplantModel2.getFile().transferTo(new File(localPath + filename));
            }
            //把图片的相对路径保存至数据库
            sqlPath = "/opt/Product/" + filename;
            if (filename != null)
                cartonplantModel2.setCartonImage(sqlPath);
        }
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        cartonplantModel2.setFake(0);
        //获取String类型的时间
        cartonplantModel2.setCartonTime(sdf.format(date));
        cartonplantModel2.setMaterialName(cartonplantModel2.getMaterialName().toUpperCase());//转化为大写字母保存
        cartonplantModel2.setPitType(cartonplantModel2.getPitType().toUpperCase());
        int num = productRegisterService.addProductRegister(cartonplantModel2);
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

    @RequestMapping("/ProductList/")
    @ResponseBody
    private pageBaen select(int page, int rows, String advanceFilter, String sort, String oder) {
        //判断是否为带条件查询
        pageBaen pages = new pageBaen();//分页对象
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page-1)*rows;
        String sql = "and fake=0";
        if(advanceFilter!=null && advanceFilter!="[]"){
            JSONArray jsonArray=JSONArray.fromObject(advanceFilter);
            Iterator<Object> it = jsonArray.iterator();
            while (it.hasNext()){
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
        List<CartonplantModel2>list=productRegisterService.select(cur,rows,sort,oder,queryList);
        List<CartonplantModel2>listAll=productRegisterService.selectAll(queryList);
        pages.setRows(list);
        int total = listAll.size();
        pages.setTotal(total);
        int totalPage = total % rows == 0 ? (total / rows) : (total / rows) + 1;//总页数
        pages.setTotalPage(totalPage);
        pages.setCurrentPage(page);
        pages.setNumPerPage(rows);
        pages.setNextPage(totalPage - page == 0 ? page : page + 1);
        pages.setPreviousPage(page - 0 == 1 ? page : page - 1);
        pages.setHasPreviousPage(true);
        pages.setHasNextPage(true);
        pages.setFirstPage(true);
        pages.setLastPage(true);

        return pages;
    }

    @RequestMapping("/edit/")
    public ModelAndView jump(String url, int cartonId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("cartonId",cartonId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    @RequestMapping("/findById/")
    @ResponseBody
    public CartonplantModel2 findById(int cartonId) {
        //返回前端的对象
        CartonplantModel2 cartonplantModel2 = new CartonplantModel2();
        cartonplantModel2 = productRegisterService.selectById(cartonId);
        return cartonplantModel2;
    }

    @RequestMapping("/updataProduct/")
    @ResponseBody
    public void updataProduct(HttpServletResponse response,CartonplantModel2 cartonplantModel2) {
        Msg msg = new Msg();
        int num = productRegisterService.updateProduct(cartonplantModel2);
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

    @RequestMapping("/deleteProduct/")
    @ResponseBody
    public void deleteProduct(HttpServletResponse response,String cartonId) {
        Msg msg = new Msg();
        String sid = null;
        sid = cartonId.replaceAll("'", "");//去除单引号0
        int num =0;
        for(int i=0;i<sid.split(",").length;i++) {
            String id=sid.split(",")[i];
            num =  productRegisterService.deleteProduct(Integer.parseInt(id));
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
        }/*
        if (sid.indexOf(",") == -1) {//是否包含，
            int num = productRegisterService.deleteProduct(Integer.parseInt(sid));
            if (num > 0) {
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("删除成功！");
            } else {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败！");
            }
        } else {
            //拆分，进行批量删除

        }*/
       ResponseUtil.writeJson(response,msg);
    }

    /**
     * 产品库下拉列表框加载
     * @param q
     * @return
     */
    @RequestMapping("/dropSelect/")
    @ResponseBody
    public pageBaen dropSelect(String q){
        pageBaen pages = new pageBaen();
        List<CartonplantModel2> list = productRegisterService.dropSelect(q);
        pages.setRows(list);
        int total=list.size();
        pages.setTotal(total);
        int totalPage=1;
        pages.setTotalPage(totalPage);
        pages.setCurrentPage(1);
        pages.setNumPerPage(20);
        pages.setNextPage(1);
        pages.setPreviousPage(1);
        pages.setHasPreviousPage(false);
        pages.setHasNextPage(false);
        pages.setFirstPage(true);
        pages.setLastPage(true);
        return pages;
    }


}
