package com.generator.controller;

import com.generator.common.ResponseUtil;
import com.generator.pojo.*;
import com.generator.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 原材料采购
 */
@Controller
@RequestMapping("/Purchase")
public class  PurchaseController {
    private static final Logger LOG = LoggerFactory.getLogger(PurchaseController.class);
    @Resource
    private PlaceService placeService;

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
    private PurchaseService purchaseService;

    @Resource
    private CardboardEnterService cardboardEnterService;

    @Resource
    private CompanyInformationService companyInformationService;

    @Resource
    private YouhuiService youhuiService;

    /**
     * 获取待采购订单列表，已采购总数小于备料数
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/findByPurchase/")
    @ResponseBody
    public pageBaen findByPurchase(int page,int limit,String supplierId,String supplierType) {
        pageBaen pageBaen = new pageBaen();
        int cur = (page - 1) * limit;
        List<Place> list = new ArrayList<>();
//        List<Place> list = placeService.findByPurchase(cur, limit);
        List<Place> listAll = placeService.findAll();
        if (supplierId != null && !supplierId.equals("")) {//方法重载逻辑   cartonPrice单价   supplierMaterial供应商材质
            //3.遍历list,判断供应商类型
            for (int i = 0; i < listAll.size(); i++) {
                List<SupplierMateriala> la = new ArrayList<SupplierMateriala>();
                //A类报价
                double Aprice = 0;
                //B类报价
                double Bprice = 0;
                String Hname = "";//供应商材质
                String name = listAll.get(i).getMaterialScience();
//                System.out.println(name);
                String code = listAll.get(i).getPitType();
                int supplier = Integer.parseInt(supplierId);
                if (supplierType.equals("1")) {
                    //本公司材质供应商材质转换
                    String[] arr = name.split("");//拆分本公司材质
                    //查询A供应商单材质
                    List<PaperA> li = new ArrayList<PaperA>();
                    li = paperAService.findAll(supplier);
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
                        //4.A类报价,根据供应商id查询该供应商的材质,如果没有则返回无法供应
                        la = supplierAService.findBySu(supplier,code,name.length());
                        for (int o = 0; o < la.size(); o++) {
                            if (name.equals(la.get(o).getMyCode()) && code.equals(la.get(o).getFluteType())) {
                                //如果存在直接返回
                                Aprice = la.get(o).getSpecialPrice();
//                                list.get(i).setCartonPrice(Aprice);
                                listAll.get(i).setSupplierPrice(Aprice);//单平方价
                                listAll.get(i).setSupplierMaterial(la.get(o).getMaterialCode());
                                break;
                            } else if (la.get(o).getMyCode().length() == name.length() && la.get(o).getFluteType().equals(code)) {
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
                                if (name.length() == 2 || name.length() == 4) {
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
                            listAll.get(i).setSupplierMaterial(Hname);
//                            list.get(i).setCartonPrice(Aprice);
                            listAll.get(i).setSupplierPrice(Aprice);
                            continue;
                        }

                    }

                } else if (supplierType.equals("2")) {
                    double jia = 0;//加工费
                    //根据供应商id查询供应商
                    CartonSupplier cartonSupplier = cartonSupplierService.selectById(supplier);
                    //根据层数计算加工费
                    switch (name.length()) {
                        case 2: {
                            jia = cartonSupplier.getTw();
                            break;
                        }
                        case 3: {
                            jia = cartonSupplier.getTc();
                            break;
                        }
                        case 4: {
                            jia = cartonSupplier.getFc();
                            break;
                        }
                        case 5: {
                            double vc = cartonSupplier.getVc();
                            jia = vc;
                            break;
                        }
                        case 6: {
                            jia = cartonSupplier.getSc();
                            break;
                        }
                        case 7: {
                            jia = cartonSupplier.getEc();
                            break;
                        }
                    }
                    //5.B类报价,查询该供应商的材质,如果没有则返回无法供应
                    List<SupplierMaterialb> lb = new ArrayList<SupplierMaterialb>();
                    lb = supplierBService.findByAll(supplier);
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
                    listAll.get(i).setSupplierMaterial(str);
//                    list.get(i).setCartonPrice(Bprice);
                    listAll.get(i).setSupplierPrice(Bprice);
                    //查询加工费（根据层数查询供应商加工费），两层起算，如果没有则返回null,层数=arr.length
                }
            }

            Iterator<Place> it = listAll.iterator();
            while (it.hasNext()){
                Place p = it.next();
                if(p.getSupplierPrice()!=null){
                    double supplierPrice = p.getSupplierPrice();
                    if(supplierPrice==0 || p.getSupplierMaterial().equals("")){
                        it.remove();
                    }
                }else{
                    it.remove();
                }
            }

            for(int i=cur;i<page*limit;i++){
                if(i<listAll.size()){
                    Place place = listAll.get(i);
                    place.setNum(place.getNumberOfSpareParts());//采购数装填
                    BigDecimal chang;
                    BigDecimal kuan;
                    if(place.getCartonUnit().equals("MM")){
                        chang = new BigDecimal(Double.toString(place.getBlankingLength()/1000));//纸板长
                        kuan = new BigDecimal(Double.toString(place.getBlankingWidth()/1000));//纸板宽
                    }else{
                        chang = new BigDecimal(Double.toString(place.getBlankingLength()/100));//纸板长
                        kuan = new BigDecimal(Double.toString(place.getBlankingWidth()/100));//纸板宽
                    }
                    BigDecimal danpingfangjia = new BigDecimal(Double.toString(place.getSupplierPrice()));//优惠前的单平方价

                    BigDecimal caigou_num = new BigDecimal(Double.toString(place.getNumberOfSpareParts()));//采购数
                    double resultTs = chang.multiply(kuan).multiply(caigou_num).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();//采购纸板总平方

                    int ceng = place.getMaterialScience().length();
                    List<Youhui> youlist=youhuiService.findByC(Integer.valueOf(supplierId),ceng);
                    double dou=0.0;
                    //计算优惠价格
                    if(youlist.size()==1){
                        if(youlist.get(0).getSquareNumber()<resultTs){
                            dou=youlist.get(0).getDiscount();
                        }
                    }else{
                        for(int k=0;k<youlist.size();k++){
                            if(youlist.get(k).getSquareNumber()<resultTs){
                                continue;
                            }else{
                                dou=youlist.get(k-1).getDiscount();
                                break;
                            }
                        }
                    }
                    /**for (int j=0;j<youlist.size();j++){
                        if(youlist.get(j).getSquareNumber()<resultTs) {
                            if (j + 1 == youlist.size()) {
                                if (youlist.get(0).getSquareNumber() <= resultTs) {
                                    dou = youlist.get(j).getDiscount();
                                }
                            } else {
                                if (youlist.get(j).getSquareNumber() <= resultTs && resultTs < youlist.get(j + 1).getSquareNumber()) {
                                    dou = youlist.get(j).getDiscount();
                                }
                            }
                        }else{
                            dou=youlist.get(j).getDiscount();
                        }
                    }**/
                    BigDecimal dou1 = new BigDecimal(Double.toString(dou));//纸板单平方优惠金额

                    BigDecimal SingleSquarePrice = danpingfangjia.add(dou1);//优惠后的纸板单平方价
                    BigDecimal unitPrice = chang.multiply(kuan).multiply(SingleSquarePrice);//优惠后的纸板单价

                    //采购数乘以优惠后的纸板单价就是采购金额
                    BigDecimal caigoujine = unitPrice.multiply(caigou_num);

                    place.setUnitPrice(unitPrice.setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue());//优惠后的纸板单价
                    place.setSupplierPrice(SingleSquarePrice.setScale(4,BigDecimal.ROUND_HALF_UP).doubleValue());//优惠后的纸板单平方价
                    place.setCost(caigoujine.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());//采购金额装填
                    list.add(place);
                }else{
                    break;
                }

            }
        }else{
            list = placeService.findByPurchase(cur, limit);
        }
        pageBaen.setCode(0);
        pageBaen.setCount(listAll.size());
        pageBaen.setData(list);
        pageBaen.setMsg("");
        return pageBaen;

    }


    /**
     * 供应商下拉框查询
     * @param q
     * @return
     */
    @RequestMapping("/dropSelect/")
    @ResponseBody
    public pageBaen dropSelect(String q){
        pageBaen pages = new pageBaen();
        List<CartonSupplier> list = cartonSupplierService.dropSelect(q);
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
     * 新增采购单
     * @param cartonPurchase
     * @param table_data
     * @return
     */
    @RequestMapping("/addPurchase/")
    @ResponseBody
    public void addPurchase(HttpServletResponse response,CartonPurchase cartonPurchase, String table_data){
        Msg msg=new Msg();
        JSONArray jsonArray = JSONArray.fromObject(table_data);
//        System.out.println(jsonArray.getJSONObject(1).get("num"));
        cartonPurchase.setEndNum(0);
        cartonPurchase.setIsTicket(0);
        Iterator<Object> it = jsonArray.iterator();
        String param1="";
        String param2="";
        String param3="";
        String param4="";
        String param5="";
        int num = 0;
        while (it.hasNext()){
            JSONObject obj = (JSONObject) it.next();
            cartonPurchase.setOrderAccount((String) obj.get("orderAccount"));
            cartonPurchase.setCustomName((String) obj.get("customName"));
            cartonPurchase.setCartonName((String) obj.get("cartonName"));
            cartonPurchase.setSingleSquare(obj.get("squareOfCardboard").toString());
            cartonPurchase.setTotalSquare(obj.get("squareOfCardboardT").toString());
            cartonPurchase.setSinglePrice(Double.valueOf(obj.get("unitPrice").toString()));//供方单价
            cartonPurchase.setSquarePrice(Double.valueOf(obj.get("supplierPrice").toString()));//供方单平方价
            cartonPurchase.setBlankingSize(obj.get("blankingLength")+"X"+obj.get("blankingWidth"));
            cartonPurchase.setCardboardSpec((String) obj.get("materialScience"));
            cartonPurchase.setPitType((String) obj.get("pitType"));
            cartonPurchase.setWidthLine((String) obj.get("widthLine"));
            cartonPurchase.setLineType(obj.get("lineType").toString());
            cartonPurchase.setUnit((String) obj.get("cartonUnit"));
            cartonPurchase.setStockNum((Integer) obj.get("numberOfSpareParts"));
            cartonPurchase.setNum(Integer.valueOf(obj.get("num").toString()));
            cartonPurchase.setOrderRequirement((String) obj.get("purchaseRemarks"));
            cartonPurchase.setSupperSpec((String) obj.get("supplierMaterial"));
            cartonPurchase.setSingleTotal(Double.valueOf(obj.get("cost").toString()));
            cartonPurchase.setFake(0);
            num = purchaseService.addPurchase(cartonPurchase);
            if(num>0){
                //采购单添加成功，修改 订单 的 已采购总数
                placeService.updatePurNum(cartonPurchase.getOrderAccount(),cartonPurchase.getNum());
                param1+=","+cartonPurchase.getPurchaseAccount();
                param2+=","+cartonPurchase.getOrderAccount();
                param3+=","+cartonPurchase.getSupplierId();
                param4+=","+cartonPurchase.getTaiId();
                param5+=","+cartonPurchase.getCaigouUrl();
            }else{
                msg.setStatusCode("300");
                msg.setTitle("操作提示");
                msg.setMessage("添加失败!");
                ResponseUtil.writeJson(response,msg);
                return;
            }
        }
        msg.setStatusCode("251");
        msg.setTitle("操作提示");
        msg.setMessage(param1+"|"+param2+"|"+param3+"|"+param4+"|"+param5);
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 采购单列表，查询出所有的采购单记录
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param advanceFilter
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("/findByPurOrderAll/")
    @ResponseBody
    public pageBaen findByPurOrderAll(int page,int rows,String sort,String order,String advanceFilter,String startTime,String endTime){
        pageBaen pageBaen  = new pageBaen();
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
        List<CartonPurchase> list = purchaseService.findByPurOrder(cur,rows,sort,order,queryList,startTime,endTime);
        List<CartonPurchase> listAll = purchaseService.findByPurOrderAll(queryList,startTime,endTime);
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
     * 采购单编辑时根据采购单id获取采购单数据
     * @param purchaseId
     * @return
     */
    @RequestMapping("/findByPurId/")
    @ResponseBody
    public CartonPurchase findByPurId(int purchaseId){
        CartonPurchase cartonPurchase = purchaseService.findByPurId(purchaseId);
        return cartonPurchase;
    }

    /**
     * 编辑采购单
     * @param cartonPurchase
     * @return
     */
    @RequestMapping("/updatePurOrder/")
    @ResponseBody
    public void updatePurOrder(HttpServletResponse response,CartonPurchase cartonPurchase){
        Msg msg = new Msg();
        int num = purchaseService.updatePurOrder(cartonPurchase);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("添加成功!");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("添加失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    //点击打印采购单跳转到采购单页面
    @RequestMapping("/printing/")
    public ModelAndView jump(String url,String purchaseAccount,String orderAccount,String supplierId,String taiId,String caigouUrl){
        ModelAndView modelAndView = new ModelAndView();
//        //根据供应商id查询供应商信息
//        CartonSupplier cartonSupplier =  cartonSupplierService.selectById(supplierId);
//        //根据采购单号查询所有采购单记录
//        List<CartonPurchase> list = purchaseService.findByPurAccount(purchaseAccount);
//        modelAndView.addObject("cartonSupplier",cartonSupplier);
//        modelAndView.addObject("cartonPurchase",list.get(0));
        if(purchaseAccount!=null && purchaseAccount.substring(0,1).equals(",")){
            purchaseAccount=purchaseAccount.substring(1);
        }
        if(orderAccount!=null && orderAccount.substring(0,1).equals(",")){
            orderAccount=orderAccount.substring(1);
        }
        if(supplierId!=null && supplierId.substring(0,1).equals(",")){
            supplierId=supplierId.substring(1);
        }
        if(taiId!=null && taiId.substring(0,1).equals(",")){
            taiId=taiId.substring(1);
        }
        if(caigouUrl!=null && caigouUrl.substring(0,1).equals(",")){
            caigouUrl=caigouUrl.substring(1);
        }
        modelAndView.addObject("purchaseAccount",purchaseAccount);
        modelAndView.addObject("orderAccount",orderAccount);
        modelAndView.addObject("supplierId",supplierId);
        modelAndView.addObject("taiId",taiId);
        modelAndView.addObject("caigouUrl",caigouUrl);
//        modelAndView.addObject("list",list);
        modelAndView.setViewName(url);
        return modelAndView;
    }

    /**
     * 采购单打印需要的数据接口
     * @param purchaseAccount
     * @param supplierId
     * @return
     */
    @RequestMapping("/getPurOrderList/")
    @ResponseBody
    public JSONObject getPurOrderList(String purchaseAccount,String orderAccount,String supplierId,String taiId){
        JSONObject jsonObject = new JSONObject();
        List<PurchasePrinting> listPurchasePrinting = new ArrayList<>();
        String[] purchaseAccounts = purchaseAccount.split(",");
        String[] orderAccounts = orderAccount.split(",");
        String[] supplierIds = supplierId.split(",");
        String[] taiIds = taiId.split(",");
        for (int i = 0; i < purchaseAccounts.length; i++) {
            CompanyInformation companyInformation = companyInformationService.findById(Integer.valueOf(taiIds[i]));
            CartonSupplier cartonSupplier =  cartonSupplierService.selectById(Integer.valueOf(supplierIds[i]));
            CartonPurchase c= purchaseService.findByPurOderAccount(purchaseAccounts[i],orderAccounts[i]);

            PurchasePrinting purchasePrinting = new PurchasePrinting();
            purchasePrinting.setSupplierName(cartonSupplier.getSupplierName());
            purchasePrinting.setSupplierTel(cartonSupplier.getSupplierTel());
            purchasePrinting.setCust(cartonSupplier.getCust());
            purchasePrinting.setFax(cartonSupplier.getFax());
            purchasePrinting.setPurRequirement(c.getPurRequirement());
            purchasePrinting.setConsignee(companyInformation.getCompanyName());//采购单抬头
            purchasePrinting.setConsignees(c.getConsignee());//收货人
            purchasePrinting.setPurOrder(c.getPurchaseAccount());
            purchasePrinting.setConsigneeAdress(c.getConsigneeAdress());
            purchasePrinting.setConsigneeTel(c.getConsigneeTel());

            purchasePrinting.setSupperSpec(c.getSupperSpec());
            purchasePrinting.setPitType(c.getPitType());
            purchasePrinting.setBlankingSize(c.getBlankingSize());
            purchasePrinting.setNum(c.getNum());
            purchasePrinting.setWidthLine(c.getWidthLine());
            purchasePrinting.setLineType(c.getLineType());
            purchasePrinting.setArrivalTime(c.getArrivalTime());

            listPurchasePrinting.add(purchasePrinting);

        }
        jsonObject.put("Table",listPurchasePrinting);
        return jsonObject;

    }

    //删除采购单实现
    @RequestMapping("/updateByfakeS/")
    @ResponseBody
    public void updateByfakeS(HttpServletResponse response,String purchaseId,String purchaseAccount,String orderAccount,String num){
        Msg msg = new Msg();
        List<CartonPurchase> listPur = new ArrayList<CartonPurchase>();
        purchaseId=purchaseId.replaceAll("'","");
        purchaseAccount=purchaseAccount.replaceAll("'","");
        orderAccount=orderAccount.replaceAll("'","");
        num=num.replaceAll("'","");
        String[] purchaseIds = purchaseId.split(",");
        String[] purchaseAccounts = purchaseAccount.split(",");
        String[] orderAccounts = orderAccount.split(",");
        String[] nums = num.split(",");
        for(int i=0;i<purchaseIds.length;i++){
            List<CardboardEnter> list = cardboardEnterService.findByPurOO(purchaseAccounts[i],orderAccounts[i]);//查询出入库记录
            if(list.size()!=0){
                for(int j=0;j<list.size();j++){
                    CardboardEnter cardboardEnter = list.get(j);
                    if(cardboardEnter.getSingular()==Integer.valueOf(nums[i])){
                        CartonPurchase cartonPurchase = new CartonPurchase();
                        cartonPurchase.setPurchaseId(Integer.valueOf(purchaseIds[i]));
                        listPur.add(cartonPurchase);
                    }else{
                        msg.setStatusCode("500");
                        msg.setTitle("操作提示");
                        msg.setMessage("订单"+orderAccounts[i]+"的采购还有未入库的，删除失败!");
                        ResponseUtil.writeJson(response,msg);
                    }
                }
            }else{
                msg.setStatusCode("500");
                msg.setTitle("操作提示");
                msg.setMessage("只有采购并入库完成的采购单才能被删除，删除失败!");
                ResponseUtil.writeJson(response,msg);
            }
        }
        int n = purchaseService.updateByfakeS(listPur);
        if(n>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功!");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("删除失败!");
        }
        ResponseUtil.writeJson(response,msg);
    }

    /**
     * 采购单号生成
     * @param time
     * @return
     */
    @RequestMapping("/generatePurOrder/")
    @ResponseBody
    public CartonPurchase generatePurOrder(String time){
        String time1 = "CG"+time;
        CartonPurchase cartonPurchase = new CartonPurchase();
        CartonPurchase cartonPurchases = purchaseService.getMaxPurOrder(time1);
        if(cartonPurchases==null){
            cartonPurchase.setPurchaseAccount(time1+"0001");
        }else{
            String purOrder=cartonPurchases.getPurchaseAccount().substring(cartonPurchases.getPurchaseAccount().length()-4);
            int purAccount=Integer.valueOf(purOrder)+1;
            //如果不足4位前面补0
            String str = String.format("%04d", purAccount);
            cartonPurchase.setPurchaseAccount(time1+str);
        }
        return cartonPurchase;
    }

    /**
     * 保留入库数据    将fake改为状态2
     * @param type
     * @param purchaseId
     * @return
     */
    @RequestMapping("/isRetain/")
    @ResponseBody
    public Msg isRetain(int type,int purchaseId){
        Msg msg = new Msg();
        int num = purchaseService.updateByPurid(type,purchaseId);
        if(num>0){
            msg.setStatusCode("200");
            msg.setTitle("操作提示");
            msg.setMessage("删除成功!");
        }else{
            msg.setStatusCode("500");
            msg.setTitle("操作提示");
            msg.setMessage("删除失败!");
        }
        return msg;
    }
}
