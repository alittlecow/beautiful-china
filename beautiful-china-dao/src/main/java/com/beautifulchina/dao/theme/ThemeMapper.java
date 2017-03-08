/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: fengbaitong
 * date: 2016-01-10
 */
package com.beautifulchina.dao.theme;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.theme.bo.ThemeBO;
import com.beautifulchina.theme.vo.ThemeVO;
import com.beautifulchina.tour.bo.TourBO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 主题Mapper
 */
@Repository
public interface ThemeMapper extends SqlMapper {

    /**
     * 获取主题标题列表
     * @return
     */
    List<ThemeBO> getThemes(@Param(value="language")String language);

    /**
     * 根据id获取主题相关信息
     * @param id
     * @return
     */
    ThemeBO getThemeById(@Param(value="id")String id, @Param(value="language")String language);

    /**
     * 获取主页要显示主题
     */
    List<ThemeVO> getTheme(String language);

    /**
     * 根据主题id获取9条线路列表
     * @return
     */
    List<TourBO> getAllToursByThemeId(@Param(value="themeId")String themeId,
                                      @Param(value="language")String language,
                                      @Param(value="day3")String day3,
                                      @Param(value="page")Integer page);

    /**
     * 根据主题id获取全部线路条数
     * @param themeId
     * @return
     */
    Integer getAllToursNo(@Param(value="themeId")String themeId);


}
