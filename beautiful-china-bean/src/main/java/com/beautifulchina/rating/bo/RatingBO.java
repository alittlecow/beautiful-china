/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-21
 */
package com.beautifulchina.rating.bo;

import com.beautifulchina.rating.vo.RatingVO;

/**
 * Created by Administrator on 2016/1/21.
 * 用户评价BO
 */
public class RatingBO extends RatingVO {
    /**
     * 评价表id
     */
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
