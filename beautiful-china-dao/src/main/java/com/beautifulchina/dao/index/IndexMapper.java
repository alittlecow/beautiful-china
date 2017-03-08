/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/3/2
 */
package com.beautifulchina.dao.index;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.index.bo.IndexBO;

import java.util.List;

/**
 * Created by zhangyun on 2016/3/2.
 */

public interface IndexMapper extends SqlMapper{
    /**
     * 首页四张图片的查询
     * @return
     */
    List<IndexBO> getBanner();

}
