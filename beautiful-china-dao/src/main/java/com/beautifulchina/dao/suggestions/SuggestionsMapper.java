package com.beautifulchina.dao.suggestions;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.suggestions.Suggestions;
import org.springframework.stereotype.Repository;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Repository
public interface SuggestionsMapper extends SqlMapper {
    void insertSuggestions(Suggestions suggestions);

}
