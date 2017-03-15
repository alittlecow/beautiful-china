/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhuhoufeng
 * date: 2016-04-14
 */
package com.beautifulchina.dao.language;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.language.Language;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface LanguageMapper extends SqlMapper {
    /**
     * 新增多语言数据
     *
     * @param languages
     */
    void insertLanguageItem(List<Language> languages);

    void insertLanguage(Language language);

    String getLanguageContent(Map map);
}
