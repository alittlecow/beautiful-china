/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-11
 */
package com.beautifulchina.service.information;

import com.beautifulchina.dao.information.InformationMapper;
import com.beautifulchina.order.bo.OrdersBO;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/11.
 * 个人信息服务
 */
@Service
public class InformationService {
    @Autowired
    private InformationMapper informatinMapper;//注入dao

    /**
     * 修改密码
     * @param ordinaryUserVO
     */
    public void passwordChang(OrdinaryUserVO ordinaryUserVO){
        ordinaryUserVO = this.setPassword(ordinaryUserVO);
        informatinMapper.passwordChang(ordinaryUserVO);
    }
    private OrdinaryUserVO setPassword(OrdinaryUserVO ordinaryUserVO){
        String pwd = MD5Util.getDecryptLoginPassword(ordinaryUserVO.getPassword());
        String psw = SecurityUtil.getNewPsw();
        // 密码采用加盐处理
        String encryptPassword = SecurityUtil.getStoreLogpwd(ordinaryUserVO.getEmail(),pwd , psw);
        ordinaryUserVO.setPassword(encryptPassword);
        ordinaryUserVO.setPsw(psw);
        return ordinaryUserVO;
    }

    /**
     * 验证原密码是否正确
     * @param ordinaryUserVO
     * @return
     */
    public Boolean passwordVerify(OrdinaryUserVO ordinaryUserVO){
        //String email=ordinaryUserVO.getEmail();
        Long userId = ordinaryUserVO.getUserId();
        OrdinaryUserBO ordinaryUserBO=informatinMapper.passwordVerify(userId);
        String oldPwd=ordinaryUserBO.getPassword();//库里的密码
        String psw=ordinaryUserBO.getPsw();//库里的盐值
        String password = MD5Util.getDecryptLoginPassword(ordinaryUserVO.getPassword());//前端输入得密码，先解密
        String newPwd=SecurityUtil.getStoreLogpwd(ordinaryUserBO.getEmail(),password, psw);//加盐后的密码

        return oldPwd.equals(newPwd);
    }

    /**
     * 查询当前用户的订单
     * @param userId
     * @return
     */
    public List<OrdersBO> getALLOrder(long userId,int number,String language){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("userId",userId);
        map.put("number",number);
        map.put("language",language);
        //修改图片路径
        List<OrdersBO> list=informatinMapper.getALLOrder(map);
        try{
            for(OrdersBO ordersBO:list){
                String Url=ordersBO.getImageUrl();
                String[] str = Url.split("\\/");
                //图片名之前的路径
                String prefix = "";
                //图片的格式
                String suffix = str[str.length - 1];
                for (int i = 0; i < str.length - 1; i++) {
                    prefix += str[i] + "/";
                }
                //中等图片路径
                ordersBO.setImageUrl(prefix + "medium_" + suffix);
                //时间去掉最后一个.0
                String orderTime=ordersBO.getPlacedtime();
                ordersBO.setPlacedtime(orderTime.substring(0,orderTime.length()-2));
            }
        }catch(Exception e){
        }
        return list;
    }

    /**
     * 查询订单数量
     * @param userId
     * @return
     */
    public int getCount(long userId){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("userId",userId);
        int count = informatinMapper.getCount(map);
        return count;
    }

    /**
     * 验证是否已评价
     * @param userId
     * @param targetId
     * @return
     */
    public String ratingVerify(long userId,long targetId){
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userId",userId);
        map.put("targetId",targetId);
        return informatinMapper.ratingVerify(map);
    }

    /**
     * 删除订单
     * @param orderNo
     */
    @Transactional
    public void deleteOrder(String orderNo){
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("orderNo",orderNo);
        informatinMapper.deleteOrder(map);
    }
    /**
     * 取消订单
     * @param orderNo
     */
    @Transactional
    public void cancelOrder(String orderNo){
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("orderNo",orderNo);
        informatinMapper.cancelOrder(map);
    }
}
