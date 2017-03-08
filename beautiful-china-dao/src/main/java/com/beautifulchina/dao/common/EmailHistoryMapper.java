/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.dao.common;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.email.vo.EmailHistoryVO;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/1/28.
 * 发送邮件历史记录Mapper
 */
@Repository
public interface EmailHistoryMapper extends SqlMapper {

    /**
     * 保存邮件历史记录
     * @param emailHistoryVO
     */
    void saveEmailHistory(EmailHistoryVO emailHistoryVO);

}
