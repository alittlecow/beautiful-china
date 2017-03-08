/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/27.
 */
package com.beautifulchina.controller.pay;

import com.beautifulchina.base.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Enumeration;

/**
 * paypal支付控制器
 */
@RequestMapping(value = "paypal")
@Controller
public class PaypalController extends  BaseController{
    private static Logger logger = LoggerFactory.getLogger(PaypalController.class);


    @RequestMapping(value = "ipn")
    public String IPN(HttpServletRequest request) throws Exception{
        //从 PayPal 出读取 POST 信息同时添加变量cmd
        Enumeration en = request.getParameterNames();
        String str = "cmd=_notify-validate";
        while (en.hasMoreElements()) {
            String paramName = (String) en.nextElement();
            String paramValue = request.getParameter(paramName);
            str = str + "&" + paramName + "="
                    + URLEncoder.encode(paramValue, "utf-8");
            //此处的编码一定要和自己的网站编码一致，不然会出现乱码，paypal回复的通知为‘INVALID’
        }
        logger.info("paypal传递过来的交易信息:" + str);

        //建议在此将接受到的信息 str 记录到日志文件中以确认是否收到 IPN 信息
        //将信息 POST 回给 PayPal 进行验证
        //设置 HTTP 的头信息
        //在 Sandbox 情况下，设置：
        //URL u = new URL("https://www.sandbox.paypal.com/cgi-bin/webscr");
        //正式环境
        URL u = new URL("https://www.paypal.com/cgi-bin/webscr");
        HttpsURLConnection  uc = (HttpsURLConnection)u.openConnection();
        uc.setDoOutput(true);
        uc.setRequestProperty("Content-Type",
                "application/x-www-form-urlencoded");
        PrintWriter pw = new PrintWriter(uc.getOutputStream());
        pw.println(str);
        pw.close();
        //接受 PayPal 对 IPN 回发的回复信息
        BufferedReader in = new BufferedReader(new InputStreamReader(
                uc.getInputStream()));
        String res = in.readLine();
        in.close();
        //将 POST 信息分配给本地变量，可以根据您的需要添加
        //该付款明细所有变量可参考：
        //https://www.paypal.com/IntegrationCenter/ic_ipn-pdt-variable-reference.html
        String itemName = request.getParameter("item_name");//商品名
        String itemNumber = request.getParameter("item_number");//购买数量
        String paymentStatus = request.getParameter("payment_status");//交易状态
        String paymentDate = request.getParameter("payment_date");//交易时间
        String paymentAmount = request.getParameter("mc_gross");//交易钱数
        String paymentCurrency = request.getParameter("mc_currency");//货币种类
        String txnId = request.getParameter("txn_id");//交易id
        String receiverEmail = request.getParameter("receiver_email");//收款人email
        String payerEmail = request.getParameter("payer_email");//付款人email
        String item_number = request.getParameter("item_number");//购买商品订单号

        if (res == null || res == "")
            res = "0";
        //…
        //获取 PayPal 对回发信息的回复信息，判断刚才的通知是否为 PayPal 发出的
        if (res.equals("VERIFIED")) {
            //检查付款状态
            //支付完成，修改订单状态
            if(paymentStatus.equals("Completed ")){
                //TODO 支付订单
                //检查 txn_id 是否已经处理过
                //检查 receiver_email 是否是您的 PayPal 账户中的 EMAIL 地址
                if(receiverEmail.equals("business_email"/*paypal收款帐号*/)){

                }
                //检查付款金额和货币单位是否正确
                if(paymentAmount.equals("order_cost"/*该订单金额*/)){

                }

                //处理其他数据，包括写数据库
                return "redirect:/payment/pay?orderNo="+item_number;
            }


        } else if (res.equals("INVALID")) {
            //非法信息，可以将此记录到您的日志文件中以备调查
        } else {
            //处理其他错误

        }
        //测试环境默认支付订单
        return "redirect:/payment/pay?orderNo="+item_number;
    }
}
