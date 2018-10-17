package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.IntrospectionException;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 订单
 */
@Controller
@RequestMapping("/PlaceController")
public class PlaceController {
    private static final Logger LOG = LoggerFactory.getLogger(PlaceController.class);

    @Resource
    private PlaceService placeService;

    @Resource
    private CartonOutInfoService cartonOutInfoService;

    @Resource
    private PurchaseService purchaseService;

    @Resource
    private ProductRegisterService productRegisterService;

    @Resource
    private  BackLogService backLogService;

    PlaceByCustomName placeByCustomName=new PlaceByCustomName();
    /**
     * 新增订单信息
     * @param place
     * @return
     */
    @RequestMapping("/addPlace")
    @ResponseBody
    public void addPlace(HttpServletResponse response,Place place,String tz,String cartonplantModel2Id){
        Msg msg = new Msg();
        place.setMaterialScience(place.getMaterialScience().toUpperCase());//转化为大写字母保存
        place.setPitType(place.getPitType().toUpperCase());
//        计算纸板单平方
        BigDecimal a1;
        BigDecimal a2;
        if(place.getCartonUnit().equals("MM")){
            a1 = new BigDecimal(Double.toString(place.getBlankingLength()/1000));//长
            a2 = new BigDecimal(Double.toString(place.getBlankingWidth()/1000));//宽
        }else{
            a1 = new BigDecimal(Double.toString(place.getBlankingLength()/100));//长
            a2 = new BigDecimal(Double.toString(place.getBlankingWidth()/100));//宽
        }

        BigDecimal result = a1.multiply(a2);
        place.setSquareOfCardboard(result.doubleValue());
        //计算纸板总平方
        BigDecimal a4 = new BigDecimal(Double.toString(place.getOrderNum()));//订单数量
        BigDecimal resultT = a4.multiply(result);
        place.setSquareOfCardboardT(resultT.doubleValue());

        place.setOrderState(0);
        place.setFake(0);
        place.setOrderIdentification(0);
        place.setIsLibrary(2);

        if(place.getIsSampleBox()==null){
            place.setIsSampleBox(0);
        }

        int num = placeService.addPlace(place);
//        System.out.println(num);

        BackLog backLog = new BackLog();
        backLog.setName("下订单");
        backLog.setOrderNum(place.getOrderAccount());
        backLog.setDescription("请在"+place.getDeliveryTime()+"之前完成订单配送");
        backLog.setLastTime(place.getDeliveryTime());
        backLog.setState("待处理");
        if(num>0){
            int num1 = backLogService.addBackLog(backLog);
            System.out.println("--------------插入Backlog结果为"+num1);
            CartonplantModel2 cartonplantModel2 = new CartonplantModel2();
            cartonplantModel2.setCustomId(place.getCustomId());
            cartonplantModel2.setCustomName(place.getCustomName());
            cartonplantModel2.setCartonName(place.getCartonName());
            cartonplantModel2.setBoxName(place.getCartonType());
            cartonplantModel2.setSizeType(place.getSizeType().toString());
            cartonplantModel2.setCartonLength(place.getCartonLength());
            cartonplantModel2.setCartonWidth(place.getCartonWidth());
            cartonplantModel2.setCartonHeight(place.getCartonHeight());
            cartonplantModel2.setCartonUnit(place.getCartonUnit());
            cartonplantModel2.setMaterialName(place.getMaterialScience());
            cartonplantModel2.setPitType(place.getPitType());
            cartonplantModel2.setCartonPrice(place.getCartonPrice());
            cartonplantModel2.setLengthLine(place.getLengthLine());
            cartonplantModel2.setWidthLine(place.getWidthLine());
            cartonplantModel2.setLineType(place.getLineType());
            cartonplantModel2.setWorkingProcedure(place.getWorkingProcedure());
            cartonplantModel2.setKnifePlateNum(place.getPlateId());
            cartonplantModel2.setKnifePlateName(place.getPlateName());
            cartonplantModel2.setPrintedId(place.getPlatesId());
            cartonplantModel2.setPrintedName(place.getPlatesName());
            cartonplantModel2.setCardLength(place.getCardboardLength());
            cartonplantModel2.setCardWidth(place.getCardboardWidth());
            cartonplantModel2.setCombinationMode(Integer.valueOf(place.getCombinationMode()));
            cartonplantModel2.setNailingNum(place.getNailingNum());
            cartonplantModel2.setColorNum(place.getCartonColor());
            cartonplantModel2.setFabricWidth(place.getFabricWidth());
            cartonplantModel2.setFabricBei(place.getFabricBei());
            cartonplantModel2.setFake(0);
            cartonplantModel2.setBoxId(place.getCartonId());
            cartonplantModel2.setPitId(place.getPitId());
            cartonplantModel2.setPrintPicture(place.getPrintingImage());
            cartonplantModel2.setKnifePicture(place.getKnifePicture());
            cartonplantModel2.setCartonImage(place.getCartonImage());
            if(tz!=null){
                if(tz.equals("1")){
                    if(cartonplantModel2Id!=null && !cartonplantModel2Id.equals("")){//更新
                        cartonplantModel2.setCartonId(Integer.valueOf(cartonplantModel2Id));
                        int n = productRegisterService.updateProduct(cartonplantModel2);
                        if(n>0){
                            msg.setStatusCode("200");
                            msg.setTitle("操作提示");
                            msg.setMessage("添加成功！");
                        }else{
                            msg.setStatusCode("300");
                            msg.setTitle("操作提示");
                            msg.setMessage("添加失败!");
                        }
                    }else{//录入
                        cartonplantModel2.setCartonRemarks("订单登记录入");
                        int n = productRegisterService.addProductRegister(cartonplantModel2);
                        if(n>0){
                            msg.setStatusCode("200");
                            msg.setTitle("操作提示");
                            msg.setMessage("添加成功！");
                        }else{
                            msg.setStatusCode("300");
                            msg.setTitle("操作提示");
                            msg.setMessage("添加失败!");
                        }
                    }
                }else{//录入
                    cartonplantModel2.setCartonRemarks("订单登记录入");
                    int n = productRegisterService.addProductRegister(cartonplantModel2);
                    if(n>0){
                        msg.setStatusCode("200");
                        msg.setTitle("操作提示");
                        msg.setMessage("添加成功！");
                    }else{
                        msg.setStatusCode("300");
                        msg.setTitle("操作提示");
                        msg.setMessage("添加失败!");
                    }
                }
            }else{
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功！");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }


    /**
     * 订单报表加载列表数据
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("/loadPlaceList/")
    @ResponseBody
    public pageBaen loadPlaceList(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime){
        pageBaen pageBaen = new pageBaen();
        List<ComplexQuery> queryList = new ArrayList<ComplexQuery>();
        int cur = (page-1)*rows;
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
        List<Place> list = placeService.loadPlaceList(cur,rows,sort,order,queryList,startTime,endTime);
        List<Place> listAll = placeService.loadPlaceListAll(queryList,startTime,endTime);
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

    /**
     * 跳转订单编辑页面
     * @param url
     * @param placeId
     * @return
     */
    @RequestMapping("/edit/")
    public ModelAndView jump(String url, int placeId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("placeId",placeId);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    /**
     * 编辑订单时获取订单数据填充页面
     * @param placeId
     * @return
     */
    @RequestMapping("/from/")
    @ResponseBody
    public Place from(int placeId){
        Place place = new Place();
        place = placeService.getPlace(placeId);
        return place;
    }

    /**
     * 编辑订单实现
     * @param place
     * @return
     */
    @RequestMapping("/updatePlace/")
    @ResponseBody
    public void updatePlace(HttpServletResponse response,Place place){
        Msg msg = new Msg();
        //在采购单中查询该订单有无采购，如果有则不让修改，没有就让修改
        List<CartonPurchase> list=purchaseService.findByOrderAccount(place.getOrderAccount());
        if(list.size()==0){
            int num = placeService.updatePlace(place);
            if(num>0){
                msg.setStatusCode("200");
                msg.setTitle("操作提示");
                msg.setMessage("添加成功！");
            }else{
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("编辑失败！");
            }
        }else{
            msg.setStatusCode("300");
            msg.setTitle("操作提示");
            msg.setMessage("订单已采购不可修改!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    //删除订单
    @RequestMapping("/deletePlace/")
    @ResponseBody
    public void deletePlace(HttpServletResponse response,String orderAccount,String orderState){
        Msg msg=new Msg();
        List<Place> list = new ArrayList<Place>();
        orderAccount=orderAccount.replaceAll("'","");
        orderState = orderState.replaceAll("'","");
        String[] orderA=orderAccount.split(",");
        String[] orderS=orderState.split(",");
        for(int i=0;i<orderS.length;i++){
            int state = Integer.valueOf(orderS[i]);
            if(state==0 || state==6){
                Place p = new Place();
                p.setOrderAccount(orderA[i]);
                list.add(p);
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("订单"+orderA[i]+"生产中，删除失败!");
                ResponseUtil.writeJson(response,msg);
            }
        }
        int num = placeService.deletePlace(list);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("订单删除成功!");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("订单删除失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 跳转到并填充数据到订单详情页面
     * @param url
     * @param orderAccount
     * @return
     */
    @RequestMapping("/jumpPlaceInfo/")
    public ModelAndView jumpPlaceInfo(String url,String orderAccount){
        ModelAndView modelAndView = new ModelAndView();
        Place place = placeService.findById(orderAccount);
        modelAndView.addObject("place",place);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    /**
     * 下拉菜单查询
     * @param q
     * @return
     */
    @RequestMapping("/select/")
    @ResponseBody
    public pageBaen selects(String page, String rows, String advanceFilter, String sort, String oder,String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            System.out.println("下拉框进来的查询");
            List<Place> list = placeService.selects(q);
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
        }
        return pages;
    }

    @RequestMapping("/getListByPid/")
    @ResponseBody
    public List<Place> getListByPid(String deliveryNumber) {
        String customName="";
        if(deliveryNumber!=""&&deliveryNumber!=null){
            CartonOutInfo cartonOutInfo= cartonOutInfoService.selectByDeliveryNumber(deliveryNumber);
            customName=cartonOutInfo.getConsignee();
            placeByCustomName.setCustomName(customName);
        }else {
            placeByCustomName.setCustomName("");
        }
        //返回前端的对象
        List<Place> list =new ArrayList<Place>();
        list=placeService.getListByPid(customName);
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }

    @RequestMapping("/getListByCustomName/")
    @ResponseBody
    public List<Place> getListByCustomName(String customName) {
        //返回前端的对象
        List<Place> list =new ArrayList<Place>();
        list=placeService.getListByCustomName(customName);
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }

    @RequestMapping("/getListByOrderAccount/")
    @ResponseBody
    public List<Place> getListByOrderAccount(String orderAccount) {
        Place place=placeService.getPlaceByOrderAccount(orderAccount);
        String customName=place.getCustomName();
        String cartonName=place.getCartonName();
        //返回前端的对象
        List<Place> list =new ArrayList<Place>();
        list=placeService.getListByOrderAccount(customName,cartonName);
        if (list != null) {
            return list;
        } else {
            return null;
        }
    }

    /**
     * 下拉菜单查询
     * @param q
     * @return
     */
    @RequestMapping("/getList/")
    @ResponseBody
    public pageBaen getList(String page, String rows, String advanceFilter, String sort, String oder,String q){
        pageBaen pages = new pageBaen();
        //如果q不为空的话那就是客户下拉框进来的查询
        if(page==null && rows==null && advanceFilter==null && sort==null && oder==null ){//下拉搜索框进来的查询
            String customName=placeByCustomName.getCustomName();
            System.out.println("下拉框进来的查询");
            List<Place> list = placeService.getList(q,customName);
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
        }
        return pages;
    }

    /**
     * 生产单列表查询
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/findByProList/")
    @ResponseBody
    public pageBaen findByProList(int page,int rows){
        pageBaen pageBaen = new pageBaen();
        int cur = (page-1)*rows;
        List<Place> listpage = placeService.findByProListP(cur,rows);
        //List<ProductionList> list = placeService.findByProList();
//        if(list.size()>0){
//            for(int i=0;i<list.size();i++){
//                ProductionList pro = list.get(i);
//                if(pro.getStockNum()==0){
//                    pro.setState(1);
//                }else{
//                    if(pro.getStockNum()>pro.getOutNum()+Integer.valueOf(pro.getN())){
//                        pro.setState(2);
//                    }else{
//                        pro.setState(1);
//                    }
//                }
//            }
//        }
        List<Place> list=placeService.findByList();

        pageBaen.setTotal(list.size());
        pageBaen.setRows(listpage);
        int total=list.size();
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

    /**
     * 订单登记界面跳转到图片查看页面
     * @param url
     * @param urll
     * @return
     */
    @RequestMapping("/jumpImageSee/")
    public ModelAndView jumpImageSee(String url,String urll){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("urll",urll);
        modelAndView.setViewName(url);
        return modelAndView;
    }
    /**
     * 跳转至制造单页面
     * @param url
     * @param
     * @return
     */
    @RequestMapping("/make/")
    public ModelAndView make (String url,String orderAccount,String num){
        ModelAndView modelAndView = new ModelAndView();
        String[] orderAccounts = orderAccount.split(",");
        String[] nums = num.split(",");
        List<Place> list = new ArrayList<>();
        List<String> listNum = new ArrayList<>();

        for (int i = 0; i < orderAccounts.length; i++) {
            Place place = new Place();
            place.setOrderAccount(orderAccounts[i].trim());
            list.add(place);
//            listNum.add(nums[i].trim());
        }
        List<Place> listPlace = placeService.getListById(list);
        for (int i = 0; i < listPlace.size(); i++) {
            String order = listPlace.get(i).getOrderAccount();
            int number=0;
            for (int j=0;j<orderAccounts.length;j++){
                if(order.equals(orderAccounts[j])){
                    number+=Integer.valueOf(nums[j]);
                }
                if(j==orderAccounts.length-1){
                    listNum.add(String.valueOf(number));
                }
            }
        }
        modelAndView.addObject("listPlace",listPlace);
        modelAndView.addObject("listNum",listNum);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    //生产单导出excel实现
    @RequestMapping("/export/")
    @ResponseBody
    public void export(HttpServletRequest request, HttpServletResponse response,String excelTitle,String colName,String fieldName) throws UnsupportedEncodingException, ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException {
//        String salaryDate = request.getParameter("salaryDate");
        response.reset();
        excelTitle=excelTitle+".xlsx";
        Map<Integer,Object> map = new HashMap<Integer,Object>();
        response.setHeader("Content-Disposition","attachment;filename=" + new String(excelTitle.getBytes("GBK"),"ISO-8859-1"));
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires",0);
        XSSFWorkbook workbook = null;
        String[] colNames = colName.split(",");//中文列名
        String[] fieldNames = fieldName.split(",");//字段名
        List<ExcelBean> excel = new ArrayList<>();
        Map<Integer,List<ExcelBean>> mmp = new LinkedHashMap<>();
        for(int i = 0;i<colNames.length;i++){
            excel.add(new ExcelBean(colNames[i],fieldNames[i],0));
        }
        mmp.put(0,excel);
        String sheetName = excelTitle+"导出数据";
        workbook = placeService.export(mmp,sheetName);
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutput = new BufferedOutputStream(output);
            bufferedOutput.flush();
            workbook.write(bufferedOutput);
            bufferedOutput.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成订单号
     * @return
     */
    @RequestMapping("/generateOrderAccount/")
    @ResponseBody
    public Place generateOrderAccount(){
        Place place = new Place();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
        String time = "D"+df.format(new Date());
        //获取数据库中当天的最大的订单号
        Place place1 = placeService.findByMaxAccount(time);
        if(place1==null){
            time+="0001";
            place.setOrderAccount(time);
        }else{
            String orderAccount = place1.getOrderAccount();
            String orderAccounts = orderAccount.substring(orderAccount.length()-4);
            int orderAcc = (Integer.valueOf(orderAccounts)+1);
            //如果不足4位前面补0
            String str = String.format("%04d", orderAcc);
            place.setOrderAccount(time+str);
        }
        return place;
    }

    /**
     * 订单界面样箱图片上传
     * @param carton_image
     * @return
     * @throws IOException
     */
    @RequestMapping("/cartonUpload/")
    @ResponseBody
    public Msg cartonUpload(MultipartFile carton_image, HttpServletRequest request) throws IOException {
        Msg msg = new Msg();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
        //保存数据库的路径
        String sqlPath = "";
        String localPath = "/opt/Product/";
//        String localPath = request.getSession().getServletContext().getRealPath("/")+"opt/rh/";
        //定义 文件名
        String filename = null;
        // 如果文件不存在就创建
        File folder = new File(localPath);
        //文件夹路径不存在
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        if (!carton_image.isEmpty()) {
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = carton_image.getContentType();
            String demo = carton_image.getOriginalFilename();
            //获得文件后缀名
            String suffixName = demo.substring(demo.indexOf(".") + 1);
            //得到 文件名
            filename = sdf1.format(new Date()) + "." + suffixName;
//                System.out.println(filename);
            //文件保存路径
            carton_image.transferTo(new File(localPath + filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/opt/Product/" + filename;
        if (filename != null){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage(sqlPath);
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！");
        }
        return msg;
    }
    /**
     * 置顶
     */
    @RequestMapping("/zhid/")
    @ResponseBody
    public Msg zhid(String id, HttpServletRequest request){
        Msg msg = new Msg();
        //查询最小的订单id
        //List<Place> li=new ArrayList<Place>();
        //li= placeService.findByList();
        int num=placeService.updateById(Integer.parseInt(id));
        //int nums=placeService.updateById(li.get(0).getId(),Integer.parseInt(id));
        if (num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("操作成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("操作失败！");
        }
        return msg;
    }


}
