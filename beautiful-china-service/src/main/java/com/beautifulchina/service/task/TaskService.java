/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/3/10
 */
package com.beautifulchina.service.task;

import com.beautifulchina.dao.task.TaskMapper;
import com.beautifulchina.product.bo.ToursListBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyun on 2016/3/10.
 */

@Service
public class TaskService {
    @Autowired
    private TaskMapper taskMapper;
    /**
     * 定时任务，每天凌晨两点执行
     * 已经完成的线路订单停用
     */
    public void finishOrders(){
        List<String> list=taskMapper.getOrderNo();
        if(list.size()!=0){
            taskMapper.updateState(list);
        }
    }
}
