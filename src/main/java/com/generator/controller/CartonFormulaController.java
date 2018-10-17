package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.CartonFormulaService;
import com.generator.service.CartonPitRelationService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 箱型公式控制层
 */
@Controller
@RequestMapping("/CartonFormulaController")
public class CartonFormulaController {
    @Resource
    private CartonFormulaService cartonFormulaService;
    @Resource
    private CartonPitRelationService cartonPitRelationService;

    /**
     * 新增箱型公式 并且新增箱型楞型关系
     * @param cartonFormula
     * @param table_data
     * @return
     */
    @RequestMapping("/addCartonFormula/")
    @ResponseBody
    public void addCartonFormula(HttpServletResponse response, CartonFormula cartonFormula, String table_data){
        Msg msg = new Msg();
        cartonFormula.setFake(0);
        int num = cartonFormulaService.addCartonFormula(cartonFormula);
        if(num>0){
            List<CartonPitRelation> list = new ArrayList<>();
            JSONArray jsonArray = JSONArray.fromObject(table_data);
            Iterator<Object> it = jsonArray.iterator();
            while (it.hasNext()) {
                JSONObject obj = (JSONObject) it.next();//迭代器拿到下一个对象
                CartonPitRelation cartonPitRelation = new CartonPitRelation();
                cartonPitRelation.setFake(0);
                cartonPitRelation.setCartonId(cartonFormula.getId());
                cartonPitRelation.setCartonName(cartonFormula.getCartonName());
                cartonPitRelation.setPitId(Integer.valueOf(obj.get("id").toString()));
                cartonPitRelation.setPitName(obj.get("name").toString());
                if(obj.get("coefficient").toString()!=null && !obj.get("coefficient").toString().equals("")){
                    cartonPitRelation.setCoefficient(Double.valueOf(obj.get("coefficient").toString()));
                }else{
                    cartonPitRelation.setCoefficient(0.00);
                }
                list.add(cartonPitRelation);
            }
            int n = cartonPitRelationService.addRelatinS(list);
            if(n>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功!");
            }else{
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败!");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 箱型下拉框查询
     * @param q
     * @return
     */
    @RequestMapping("/dropSelectCarton/")
    @ResponseBody
    public pageBaen dropSelectCarton(String q){
        pageBaen pages = new pageBaen();
        List<CartonFormula> list = cartonFormulaService.dropSelectCarton(q);
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

    /**
     * 计算压线和纸板尺寸
     * @param pit_id
     * @param carton_id
     * @param cartonLength
     * @param cartonWidth
     * @param cartonHeight
     * @return
     */
    @RequestMapping("/operation/")
    @ResponseBody
    public JSONObject operation(String pit_id,String carton_id,String cartonLength,String cartonWidth,String cartonHeight){
        JSONObject jsonObject = new JSONObject();
        CartonFormula cartonFormula = cartonFormulaService.findFormula(Integer.valueOf(carton_id));//通过箱型id查询压线公式
        CartonPitRelation cartonPitRelation = cartonPitRelationService.findRelation(Integer.valueOf(carton_id),Integer.valueOf(pit_id));
        String lengthLine = cartonFormula.getLengthLine();
        String widthLine = cartonFormula.getWidthLine();
        String d = cartonPitRelation.getCoefficient().toString();

        lengthLine=lengthLine.replaceAll("长",cartonLength);
        lengthLine=lengthLine.replaceAll("宽",cartonWidth);
        lengthLine=lengthLine.replaceAll("高",cartonHeight);
        lengthLine=lengthLine.replaceAll("楞",d);
        widthLine=widthLine.replaceAll("长",cartonLength);
        widthLine=widthLine.replaceAll("宽",cartonWidth);
        widthLine=widthLine.replaceAll("高",cartonHeight);
        widthLine=widthLine.replaceAll("楞",d);

        String[] lengthLines = lengthLine.split("\\|");
        String[] widthLines = widthLine.split("\\|");
        ScriptEngine se = new ScriptEngineManager().getEngineByName("JavaScript");
        String LengthLine="";//计算出的长度压线
        String WidthLine="";//计算出的宽度压线
        double cardLength=0.0;//计算出的纸板长
        double cardWidth=0.0;//计算出的纸板宽
        for(int i=0;i<lengthLines.length;i++){
            String chang = lengthLines[i];
            Double s = null;
            try {
                if(chang.indexOf("+")>-1
                || chang.indexOf("-")>-1
                || chang.indexOf("*")>-1
                || chang.indexOf("/")>-1){
                    s = (Double) se.eval(chang);
                }else{
                    s=Double.valueOf(chang);
                }
                double b = new BigDecimal(Double.toString(s)).setScale(1, BigDecimal.ROUND_DOWN).doubleValue();
                LengthLine+=Double.valueOf(b).toString();
                BigDecimal bd1 = new BigDecimal(Double.toString(cardLength));
                BigDecimal bd2 = new BigDecimal(Double.toString(s));
                cardLength = bd1.add(bd2).setScale(1, BigDecimal.ROUND_DOWN).doubleValue();
//                System.out.println(s.toString());
            } catch (ScriptException e) {
                e.printStackTrace();
            }
            if(i!=lengthLines.length-1){
                LengthLine+="|";
            }
        }
        for(int i=0;i<widthLines.length;i++){
            String kuan = widthLines[i];
            Double s = null;
            try {
                if(kuan.indexOf("+")>-1
                        || kuan.indexOf("-")>-1
                        || kuan.indexOf("*")>-1
                        || kuan.indexOf("/")>-1){
                    s = (Double) se.eval(kuan);
                }else{
                    s=Double.valueOf(kuan);
                }
                double b = new BigDecimal(Double.toString(s)).setScale(1, BigDecimal.ROUND_DOWN).doubleValue();
                WidthLine+=Double.valueOf(b).toString();
                BigDecimal bd1 = new BigDecimal(Double.toString(cardWidth));
                BigDecimal bd2 = new BigDecimal(Double.toString(s));
                cardWidth = bd1.add(bd2).setScale(1, BigDecimal.ROUND_DOWN).doubleValue();
//                System.out.println(s.toString());
            } catch (ScriptException e) {
                e.printStackTrace();
            }
            if(i!=widthLines.length-1){
                WidthLine+="|";
            }
        }
        jsonObject.put("LengthLine",LengthLine);
        jsonObject.put("WidthLine",WidthLine);
        jsonObject.put("cardLength",cardLength);
        jsonObject.put("cardWidth",cardWidth);
        return jsonObject;
    }

    /**
     * 箱型列表加载所有的箱型公式
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @return
     */
    @RequestMapping("/findCartonForAll/")
    @ResponseBody
    public pageBaen findCartonForAll(int page,int rows,String sort,String order,String advanceFilter){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*rows;
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
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
        List<CartonFormula> list = new ArrayList<CartonFormula>();
        List<CartonFormula> listAll = new ArrayList<CartonFormula>();
        list = cartonFormulaService.findCartonFor(cur,rows,sort,order,queryList);
        listAll = cartonFormulaService.findCartonForAll(queryList);
        pageBaen.setTotal(listAll.size());
        pageBaen.setRows(list);
        int total=listAll.size();
        int totalPage=total%rows==0?(total/rows):(total/rows)+1;//总页数
        pageBaen.setTotalPage(totalPage);
        pageBaen.setCurrentPage(page);
        pageBaen.setNumPerPage(rows);
        pageBaen.setNextPage(totalPage-page==0?page:page+1);
        pageBaen.setPreviousPage(page-0==1?page:page-1);
        pageBaen.setHasPreviousPage(true);
        pageBaen.setHasNextPage(true);
        pageBaen.setFirstPage(true);
        pageBaen.setLastPage(true);
        return pageBaen;
    }

    //更新箱型公式
    @RequestMapping("/updateCartonFormula/")
    @ResponseBody
    public void updateCartonFormula(HttpServletResponse response,CartonFormula cartonFormula){
        Msg msg = new Msg();
        int num = cartonFormulaService.updateCartonFormula(cartonFormula);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功!");
        }else {
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);

    }

    /**
     * 删除箱型公式
     * @param response
     * @param id
     */
    @RequestMapping("/delete/")
    @ResponseBody
    public void delete(HttpServletResponse response,String id){
        Msg msg = new Msg();
        id=id.replaceAll("'","");
        String[] ids = id.split(",");
        List<CartonFormula> list = new ArrayList<>();
        for (int i = 0; i < ids.length; i++) {
            CartonFormula cartonFormula = new CartonFormula();
            cartonFormula.setId(Integer.valueOf(ids[i].trim()));
            list.add(cartonFormula);
        }
        int num = cartonFormulaService.deleteBatch(list);//批量删除箱型公式
        if(num>0){
            int n = cartonPitRelationService.deleteBatchCarPit(list);//批量删除箱型楞型关系表
            if(n>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("删除成功!");
            }else {
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("删除失败!");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 跳转到编辑箱型页面，并且把箱型传递过去
     * @param url
     * @param ids
     * @return
     */
    @RequestMapping("/jumpEditView/")
    public ModelAndView jumpEditView(String url,String ids){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ids",ids);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    //箱型编辑页面中通过箱型id查询该箱型的信息
    @RequestMapping("/findById/")
    @ResponseBody
    public CartonFormula findById(String ids){
        CartonFormula cartonFormula = new CartonFormula();
        cartonFormula = cartonFormulaService.findFormula(Integer.valueOf(ids));
        return cartonFormula;
    }

}
