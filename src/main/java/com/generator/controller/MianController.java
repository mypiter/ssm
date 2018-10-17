package com.generator.controller;


import com.generator.common.ReadExcel;
import com.generator.pojo.*;
import com.generator.service.*;
import net.sf.json.JSONObject;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.IntrospectionException;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * QT001
 * 业务接口总调度
 */
@RequestMapping("/Mian")
@Controller
public class MianController {


    /**
     * 报价流程：
     * 1，根据用户输入的材质代码进行拆分转换
     * 2.匹配所有A供应商的材质代码,如果与基价相同则直接返回，如果不相同，则计算出换纸，通过换纸价+基价+加工费=纸板价
     * 3.匹配B类供应商时，直接换算出B类供应商纸板代码，纸价+加工费+运费
     * 4.报价并返回价格
     *
     * @return List<CartonSupplier></>
     */
    @Resource
    private CartonSupplierService cartonSupplierService;
    @Resource
    private supplierMaterialAService supplierAService;
    @Resource
    private supplierMaterialBService supplierBService;
    @Resource
    private PaperChangeService paperChangeService;
    @Resource
    private PaperAService paperAService;
    @Resource
    private CartonOutInfoService cartonOutInfoService;
    @Resource
    private CartonoutService cartonoutService;
    @Resource
    private CustomService customService;
    @Resource
    private CartonStockService cartonStockService;
    @Resource
    private PlaceService placeService;
    @Resource
    private CompanyInformationService companyInformationService;
    @Resource
    private YouhuiService youhuiService;

    /**
     * 该报价为一般报价，根据材质，楞型报价
     *
     * @param name//材质
     * @param code//楞型
     * @param //总平方
     * @param //送货距离
     * @return list
     */
    @RequestMapping("/baojia/")
    @ResponseBody
    public pageBaen baojia(String name, String code, int page, int rows) {
        pageBaen pages = new pageBaen();
        int cur = (page-1)*rows;
        List<CartonSupplier> lis = new ArrayList<CartonSupplier>();
        DecimalFormat df = new DecimalFormat("#.00");
        //2.查询所有供应商
        List<CartonSupplier> list = new ArrayList<CartonSupplier>();
        list = cartonSupplierService.select();
        List<SupplierMateriala> la = new ArrayList<SupplierMateriala>();
        //A类报价
        double Aprice = 0;
        //B类报价
        //纸板层数
        int ce = 0;
        if (name != null) {
            ce = name.length();
        }
        double Bprice = 0;
        String Hname = "";//供应商材质
        if (name == null || code == null) {
            pages.setRows(list);
            int total=list.size();
            pages.setTotal(total);
            int totalPage=total%rows==0?(total/rows):(total/rows)+1;//总页数
            pages.setTotalPage(totalPage);
            pages.setCurrentPage(page);
            pages.setNumPerPage(rows);
            pages.setNextPage(totalPage-page==0?page:page+1);
            pages.setPreviousPage(page-0==1?page:page-1);
            pages.setHasPreviousPage(true);
            pages.setHasNextPage(true);
            pages.setFirstPage(true);
            pages.setLastPage(true);
            return pages;
        } else {
            //3.遍历list,判断供应商类型
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getSupplierType() == 1) {
                    //本公司材质供应商材质转换
                    String[] arr = name.split("");//拆分本公司材质
                    //查询A供应商单材质
                    List<PaperA> li = new ArrayList<PaperA>();
                    li = paperAService.findAll(list.get(i).getSupplierId());
                    int co = 0;
                    for (int s = 0; s < arr.length; s++) {
                        for (int z = 0; z < li.size(); z++) {
                            if (arr[s].trim().equals(li.get(z).getMyTexture())) {
                                Hname += li.get(z).getTexture();
                                co++;
                            }
                        }
                    }
                    if (co < name.length()) {
                        Hname = "";
                    } else {
                        //4.A类报价,根据供应商id,楞型，层数，查询该供应商的材质,如果没有则返回无法供应
                        la = supplierAService.findBySu(list.get(i).getSupplierId(), code, ce);
                        //根据层数筛选

                        for (int o = 0; o < la.size(); o++) {
                            if (name.equals(la.get(o).getMyCode()) && code.equals(la.get(o).getFluteType())) {
                                //如果存在直接返回
                                Aprice = la.get(o).getSpecialPrice();
                                df.format(Aprice);
                                list.get(i).setOffer(Aprice);
                                list.get(i).setName(la.get(o).getMaterialCode());
                                break;
                            } else if (la.get(o).getMyCode().length() == ce && la.get(o).getFluteType().equals(code)) {
                                //计算换纸.使用当前的代码-基价代码=换纸方式(如K323K,去掉前后两个字母，保留中间两个，与基价相减)，如果存在则返回，如果没有则无法供应
                                //根据转换后的材质，寻找基价材质
                                String codes = name.substring(1, name.length() - 1);
                                String ji = null;
                                String[] ar = Hname.split("");
                                String s = ar[0].trim();
                                String e = ar[name.length() - 1].trim();
                                double Jprice = 0;//基价

                                String a = la.get(o).getMaterialCode();
                                String t = la.get(o).getFluteType();

                                //层数为2或4的特殊处理
                                if (ce == 2 || ce == 4) {
                                    if (a.substring(a.length() - 1, a.length()).equals(e)) {
                                        ji = la.get(o).getMaterialCode();
                                        Jprice = la.get(o).getSpecialPrice();
                                    }
                                } else if (a.length() == name.length()) {
                                    if (a.substring(a.length() - 1, a.length()).equals(e) && a.substring(0, 1).equals(s) && t.equals(code)) {
                                        ji = la.get(o).getMaterialCode();
                                        Jprice = la.get(o).getSpecialPrice();
                                    }
                                }
                                //计算换纸
                                if (ji != null && Hname != null) {
                                    String jj = Hname.substring(1, name.length() - 1);
                                    String ja = ji.substring(1, name.length() - 1);
                                    for (int k = 0; k < ja.length(); k++) {
                                        if (!ja.substring(k, k + 1).equals(jj.substring(k, k + 1))) {
                                            //Hname=ji.substring(0,1)+codes+ji.substring(ji.length()-1,ji.length());
                                            //根据原纸和替换纸查询换纸，如果存在则加算，不存在则无法供应
                                            List<PaperChange> l = new ArrayList<PaperChange>();
                                            l = paperChangeService.selectPrice(ja.substring(k, k + 1), jj.substring(k, k + 1));
                                            if (l.size() > 0) {
                                                for (int p = 0; p < l.size(); p++) {
                                                    Aprice += l.get(p).getPaperChangePrice();
                                                }
                                            } else {
                                                Aprice = 0;
                                            }
                                        }
                                    }
                                } else {
                                    //无法供应
                                    continue;
                                }
                                if (Aprice == 0) {
                                    Jprice = 0;
                                    Hname = "";
                                } else {
                                    Aprice += Jprice;
                                }
                            }
                            df.format(Aprice);
                            list.get(i).setName(Hname);
                            list.get(i).setOffer(Aprice);
                            continue;
                        }

                    }

                } else if (list.get(i).getSupplierType() == 2) {
                    double jia = 0;//加工费
                    //根据层数计算加工费
                    switch (name.length()) {
                        case 2: {
                            jia = list.get(i).getTw();
                            break;
                        }
                        case 3: {
                            jia = list.get(i).getTc();
                            break;
                        }
                        case 4: {
                            jia = list.get(i).getFc();
                            break;
                        }
                        case 5: {
                            double vc = list.get(i).getVc();
                            jia = vc;
                            break;
                        }
                        case 6: {
                            jia = list.get(i).getSc();
                            break;
                        }
                        case 7: {
                            jia = list.get(i).getEc();
                            break;
                        }
                    }
                    //5.B类报价,查询该供应商的材质,如果没有则返回无法供应
                    List<SupplierMaterialb> lb = new ArrayList<SupplierMaterialb>();
                    lb = supplierBService.findByAll(list.get(i).getSupplierId());
                    //拆分Mycode得到转换后的代码（供应商代码)
                    String[] arr = name.split("");
                    int count = 0;
                    String str = "";//供应商材质
                    //根据拆分后代码查询每张纸单价并累加
                    for (int j = 0; j < arr.length; j++) {
                        for (int a = 0; a < lb.size(); a++) {
                            if (lb.get(a).getMyCode().equals(arr[j])) {
                                Bprice += lb.get(a).getSquarePrice();
                                count++;
                                str += lb.get(a).getMaterialCode();
                            } else {
                            }
                        }
                    }
                    if (count < name.length()) {
                        Bprice = 0;
                        str = "";
                        jia = 0;
                    }
                    Bprice += jia;
                    list.get(i).setName(str);
                    list.get(i).setOffer(Bprice);
                    //查询加工费（根据层数查询供应商加工费），两层起算，如果没有则返回null,层数=arr.length
                }
            }
            //6.返回所有供应商报价
            pages.setRows(list);
            int total=list.size();
            pages.setTotal(total);
            int totalPage=total%rows==0?(total/rows):(total/rows)+1;//总页数
            pages.setTotalPage(totalPage);
            pages.setCurrentPage(page);
            pages.setNumPerPage(rows);
            pages.setNextPage(totalPage-page==0?page:page+1);
            pages.setPreviousPage(page-0==1?page:page-1);
            pages.setHasPreviousPage(true);
            pages.setHasNextPage(true);
            pages.setFirstPage(true);
            pages.setLastPage(true);
            return pages;
        }


    }

    /**
     * 送货单报表接口
     * 返回list集合
     */
    @RequestMapping("/selectPs/")
    @ResponseBody
    public DeliBean selectPs(String deliveryNumber,String coid) {
        //1.根据送货单号查询Cartonout
        String[] orderAccounts = deliveryNumber.split(",");
        List<Cartonout> list = new ArrayList<Cartonout>();
        list = cartonoutService.selectByNums(orderAccounts);
        //2.根据送货单号查询CartonOutInfo
        List<CartonOutInfo> lit= cartonOutInfoService.selectByBnumber(orderAccounts);
        DeliBean deliBean = new DeliBean();
        List<songhuo> li = new ArrayList<songhuo>();

        //3.查询台头
        String [] coids=coid.split(",");
        //将数据打包返回
        for (int i = 0; i < list.size(); i++) {
            CompanyInformation companyInformation=companyInformationService.findById(Integer.parseInt(coids[i]));
            //返回数据对象
            songhuo song = new songhuo();
            song.setCompany_name(companyInformation.getCompanyName());
            song.setCompany_address(companyInformation.getCompanyAddress());
            song.setCompany_tel(companyInformation.getCompanyTel());
            song.setFax("");
            song.setConsignee(lit.get(i).getConsignee());
            song.setSpecifications(list.get(i).getSpecifications());
            song.setCarton_price(list.get(i).getCartonPrice());
            song.setConsignee_address(lit.get(i).getConsigneeAddress());
            song.setCustom_company(lit.get(i).getCustomCompany());
            song.setDeli_time(lit.get(i).getDeliTime());
            song.setDelivery_number(list.get(i).getDeliveryNumber());
            song.setOut_num(list.get(i).getOutNum());
            song.setProduct_name(list.get(i).getProductName());
            song.setDanjia(list.get(i).getCartonPrice() * list.get(i).getOutNum());
            li.add(song);
        }
        if (li.size()>0) {
            //拼接json
            deliBean.setTable(li);
        } else {

            return null;
        }

        return deliBean;
    }
    public int[] StringToInt(String[] arrs){
        int[] ints = new int[arrs.length];
        for(int i=0;i<arrs.length;i++){
            ints[i] = Integer.parseInt(arrs[i]);
        }
        return ints;
    }

    /**
     * 查找所有有库存的客户
     */
    @RequestMapping("/select/")
    @ResponseBody
    public pageBaen select(String q) {
        //查询有成品库存的客户
        List<CartonStock> list = new ArrayList<CartonStock>();
        list = cartonStockService.select(q);
        pageBaen pages = new pageBaen();
        List<Custom> li = customService.selectBylist(list);
        pages.setRows(li);
        int total = li.size();
        pages.setTotal(total);
        int totalPage = 1;
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

    @RequestMapping("/getList/")
    @ResponseBody
    public List<Custom> getList(String q) {
        //查询有成品库存的客户
        List<CartonStock> list = new ArrayList<CartonStock>();
        list = cartonStockService.select(q);
        pageBaen pages = new pageBaen();
        List<Custom> li = customService.selectBylist(list);
        return li;
    }

    @RequestMapping("/selectBylist/")
    @ResponseBody
    public List<CartonStock> selectBylist() {
        //查询有成品库存的客户
        List<CartonStock> list = new ArrayList<CartonStock>();
        String q = null;
        list = cartonStockService.select(q);
        return list;
    }

    @RequestMapping("/selectByq/")
    @ResponseBody
    public List<CartonOutInfo> selectByq() {
        //查询有成品库存的客户
        List<CartonOutInfo> list = new ArrayList<CartonOutInfo>();
        list = cartonOutInfoService.select();
        return list;
    }

    //查询配送完成的客户信息
    @RequestMapping("/selectCus/")
    @ResponseBody
    public pageBaen selectCus(String q) {
        //查询有成品库存的客户
        List<CartonOutInfo> list = new ArrayList<CartonOutInfo>();
        list = cartonOutInfoService.getListB();
        pageBaen pages = new pageBaen();
        List<Custom> li = customService.selectB(list);
        pages.setRows(li);
        int total = li.size();
        pages.setTotal(total);
        int totalPage = 1;
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
     * 对账单报表接口
     * 返回list集合
     */
    @RequestMapping("/selectDs/")
    @ResponseBody
    public DeliBean selectDs(String custom, String stratime, String endtime,int coid) {
        //返回数据对象

        //1.根据送货单号查询Cartonout
        List<Cartonout> list = new ArrayList<Cartonout>();
        //查询客户某一时间段送出的所有订单
        list = cartonoutService.selectDui(custom, stratime, endtime);
        DeliBean deliBean = new DeliBean();
        List<duizhangdan> li = new ArrayList<duizhangdan>();
        //3.查询台头
        CompanyInformation companyInformation=companyInformationService.findById(coid);
        //将数据打包返回
        for (int i = 0; i < list.size(); i++) {
            duizhangdan song = new duizhangdan();
            song.setCompany_name(companyInformation.getCompanyName());
            song.setCompany_address(companyInformation.getCompanyAddress());
            song.setCompany_tel(companyInformation.getCompanyTel());
            song.setFax("");
            song.setCustom_company(custom);
            song.setOrder_account(list.get(i).getOrderAccount());
            song.setSpecifications(list.get(i).getSpecifications());
            song.setCarton_price(list.get(i).getCartonPrice());
            song.setOut_num(list.get(i).getOutNum());
            song.setProduct_name(list.get(i).getProductName());
            song.setAll_price(list.get(i).getAllPrice());
            song.setMaterial_name(list.get(i).getMaterialName());
            song.setPitType_name(list.get(i).getPitTypeName());
            song.setOut_time(list.get(i).getOutTime());
            li.add(song);
        }
        if (li.size()>0) {
            //拼接json
            deliBean.setTable(li);
        } else {

            return null;
        }

        return deliBean;
    }
    /**
     * 仓库报表接口
     * 返回list集合
     */
    @RequestMapping("/selectCs/")
    @ResponseBody
    public DeliBean selectCs(String cust) {
        //返回数据对象
        List<CartonStock> list = new ArrayList<CartonStock>();
        list = cartonStockService.selectCs(cust);
        //查询客户某一时间段送出的所有订单
        DeliBean deliBean = new DeliBean();
        if (list != null) {
            //拼接json
            deliBean.setTable(list);
        } else {

            return null;
        }

        return deliBean;
    }
    //仓库导出excel实现
    @RequestMapping("/export/")
    @ResponseBody
    public void export(HttpServletRequest request, HttpServletResponse response,String excelTitle,String colName,String fieldName,String cust) throws UnsupportedEncodingException, ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException
    {
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
        workbook = cartonStockService.export(mmp,sheetName);
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
     * 跳转对账单页面
     *
     * @param url
     * @param
     * @return
     */
    @RequestMapping("/show/")
    public ModelAndView show(String url, String custom, String startTime, String endTime,String durl,int coid) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("custom", custom);
        modelAndView.addObject("stratime", startTime);
        modelAndView.addObject("endTime", endTime);
        modelAndView.addObject("durl", durl);
        modelAndView.addObject("coid", coid);
        modelAndView.setViewName(url);
        return modelAndView;
    }
    /**
     * 跳转仓库报表页面
     *
     * @param url
     * @param
     * @return
     */
    @RequestMapping("/showCs/")
    public ModelAndView showCs(String url, String custom) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("custom", custom);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    /**
     * 查询供应商优惠
     * @param sid
     * @param prinst
     * @return
     */
    @RequestMapping("/getYh/")
    @ResponseBody
    public JSONObject getYh(int sid,double prinst,int ceng){
        JSONObject jsonObject = new JSONObject();
        double dou=0;
        List<Youhui> list=youhuiService.findByC(sid,ceng);
        for (int i=0;i<list.size();i++){
            if(i+1==list.size()){
                if (list.get(0).getSquareNumber() <= prinst) {
                    dou = list.get(i).getDiscount();
                }
            }else {
                if (list.get(i).getSquareNumber() <= prinst && prinst < list.get(i + 1).getSquareNumber()) {
                    dou = list.get(i).getDiscount();
                }
            }
        }
        jsonObject.put("you",dou);
        return jsonObject;
    }

    /**
     * 上传订单excel
     *
     * @param response
     * @param
     * @param request
     * @throws IllegalStateException
     * @throws IOException
     */
    @RequestMapping("/uploadExcel/")
    @ResponseBody
    public Msg uploadExcel(HttpServletResponse response, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
        Msg msg = new Msg();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String res = sdf.format(new Date());
        //保存数据库的路径
        String localPath = request.getSession().getServletContext().getRealPath("/");
        //定义文件保存的本地路径
        //String localPath="/opt/Knife/";
        //定义 文件名
        String filename = null;
        // 如果文件不存在就创建
        File folder = new File(localPath);
        //文件夹路径不存在
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        if (!file.isEmpty()) {
            String name = file.getOriginalFilename();
            //得到 文件名
            filename = name;
            //System.out.println(filename);
            //文件保存路径
            file.transferTo(new File(localPath + res + filename));
        }
        //读取文件验证文件格式正确性
        ReadExcel obj = new ReadExcel();
        // 此处为文件上传的路径
        File files = new File(localPath + res + filename);
        List excelList = obj.readExcel(files);
        if (excelList == null) {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败！excel中数据为空！");
            msg.setFilePath("");
        } else {
            //如果list中字段数量与对象数量相同且首位字段相同，验证通过
            List list = (List) excelList.get(0);
            if (list.size() == 7) {
                if (filename != null) {
                    msg.setStatusCode("200");
                    msg.setTitle("操作提示");
                    msg.setMessage("操作成功！");
                    msg.setFilePath(localPath + res + filename);
                } else {
                    msg.setStatusCode("500");
                    msg.setTitle("操作提示");
                    msg.setMessage("添加失败！");
                    msg.setFilePath("");
                }
                for (int i = 0; i < excelList.size(); i++) {
                    List lists = (List) excelList.get(i);
                    for (int j = 0; j < lists.size(); j++) {
                        System.out.print("\"" + lists.get(j) + "\"" + ",");
                    }
                }

            } else {
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("操作失败！文件格式错误！");
                msg.setFilePath("");
            }
        }

        //ResponseUtil.writeJson(response,msg);
        return msg;
    }

    /**
     * excel导入数据库
     *
     * @param response
     * @param request
     * @throws IllegalStateException
     * @throws IOException
     */
    @RequestMapping("/importExcel/")
    @ResponseBody
    public Msg importExcel(HttpServletResponse response, HttpServletRequest request, String filePath) throws IllegalStateException, IOException {
        Msg msg=new Msg();
        //读取文件
        ReadExcel obj = new ReadExcel();
        File file = new File(filePath);
        List excelList = obj.readExcel(file);
        //创建订单对象进行映射
        List<Place> li = new ArrayList<Place>();
        int num=0;
        //遍历表格数据
        for (int i = 0; i < excelList.size(); i++) {
            List list = (List) excelList.get(i);
            Place place = new Place();
            //获取订单号
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
            String time = "D" + df.format(new Date());
            //获取数据库中当天的最大的订单号
            Place place1 = placeService.findByMaxAccount(time);
            String str="";
            if (place1 == null) {
                time += "0001";
                place.setOrderAccount(time);
            } else {
                String orderAccount = place1.getOrderAccount();
                String orderAccounts = orderAccount.substring(orderAccount.length() - 4);
                int orderAcc = (Integer.valueOf(orderAccounts) + 1);
                //如果不足4位前面补0
                str = String.format("%04d", orderAcc);
                place.setOrderAccount(time + str);
            }
                place.setCustomName((String) list.get(0));
                place.setCustomName((String) list.get(1));
                place.setCartonName((String) list.get(2));
                place.setCartonLength(Double.valueOf(list.get(3).toString()));
                place.setCartonWidth(Double.valueOf(list.get(4).toString()));
                place.setCartonHeight(Double.valueOf(list.get(5).toString()));
                place.setOrderNum(Integer.valueOf(list.get(6).toString()));
                place.setFake(0);
                //li.add(place);
                //存入数据库
                num = placeService.addPlace(place);
                /*place.setId((Integer) list.get(0));
                place.setOrderAccount((String) list.get(1));
                place.setCustomId((Integer) list.get(2));
                place.setCustomName((String) list.get(3));
                place.setCustomCompany((String) list.get(4));
                place.setCustomTel((String) list.get(5));
                place.setStaffId((String) list.get(6));
                place.setDeliveryTime((String) list.get(7));
                place.setDeliveryAddress((String) list.get(8));
                place.setOrderNum((Integer) list.get(9));
                place.setOrderTime((String) list.get(10));
                place.setCartonName((String) list.get(11));
                place.setIsSampleBox((Integer) list.get(12));
                place.setCartonId((Integer) list.get(13));
                place.setCartonType((String) list.get(14));
                place.setCartonLength((Double) list.get(15));
                place.setCartonWidth((Double) list.get(16));
                place.setCartonHeight((Double) list.get(17));
                place.setBlankingLength((Double) list.get(18));
                place.setBlankingWidth((Double) list.get(19));
                place.setCartonUnit((String) list.get(20));
                place.setMaterialScience((String) list.get(21));
                place.setCardboardLength((Double) list.get(22));
                place.setCardboardWidth((Double) list.get(23));
                place.setPitId((Integer) list.get(24));
                place.setPitType((String) list.get(25));
                place.setCartonColor((String) list.get(26));
                place.setCombinationMode((String) list.get(27));
                place.setNailingNum((Integer) list.get(28));
                place.setFabricWidth((Double) list.get(29));
                place.setFabricBei((Integer) list.get(30));
                place.setWorkingProcedure((String) list.get(31));
                place.setPlateId((String) list.get(32));
                place.setPlateName((String) list.get(33));
                place.setKnifePicture((String) list.get(34));
                place.setPlatesId((String) list.get(35));
                place.setPlatesName((String) list.get(36));
                place.setPrintingImage((String) list.get(37));
                place.setCartonImage((String) list.get(38));
                place.setLineType((Integer) list.get(39));
                place.setPackNum((Integer) list.get(40));
                place.setCartonPrice((Double) list.get(41));
                place.setCartonTotal((Double) list.get(42));
                place.setProfit((Double) list.get(43));
                place.setCost((Double) list.get(44));
                place.setSquareOfCardboard((Double) list.get(45));
                place.setSquareOfCardboardT((Double) list.get(46));
                place.setLengthLine((String) list.get(47));
                place.setWidthLine((String)list.get(48));
                place.setOpenNumber((String) list.get(49));
                place.setSizeType((Integer) list.get(50));
                place.setNumberOfSpareParts((Integer) list.get(51));
                place.setKnifePicture((String) list.get(52));
                place.setKnifePicture((String) list.get(53));
                place.setKnifePicture((String) list.get(54));
                place.setKnifePicture((String) list.get(55));
                place.setKnifePicture((String) list.get(56));
                place.setKnifePicture((String) list.get(57));
                place.setKnifePicture((String) list.get(58));
                place.setKnifePicture((String) list.get(59));
                place.setKnifePicture((String) list.get(60));
                place.setKnifePicture((String) list.get(61));
                place.setKnifePicture((String) list.get(62));*/

        }
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("导入成功！");
        } else {
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("导入失败！");
        }
        return msg;
    }
}
