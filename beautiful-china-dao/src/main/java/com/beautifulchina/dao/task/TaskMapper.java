/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/3/10
 */
package com.beautifulchina.dao.task;

import com.beautifulchina.base.SqlMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * 定时任务，每天凌晨两点执行
 * 已经完成的线路订单停用
 * Created by zhangyun on 2016/3/10.
 */
@Repository
public interface TaskMapper extends SqlMapper {

    /**
     * 获取符合条件的订单号
     * @return
     */
    List<String> getOrderNo();

    /**
     * 修改符合条件的订单状态
     * @param list
     */
    void updateState(List<String> list);
}
