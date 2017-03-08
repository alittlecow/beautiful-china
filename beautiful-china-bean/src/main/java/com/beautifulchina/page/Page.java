package com.beautifulchina.page;

import com.beautifulchina.base.BaseBean;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */


public class Page extends BaseBean {

    private int pageNow = 1; // 当前页数

    private int pageSize = 3; // 每页显示记录的条数

    private int totalCount; // 总的记录条数

    private int totalPageCount; // 总的页数

    private int startPos; // 开始位置，从0开始

    private int tourId;//线路Id

    private int allLevel;//总评
    public Page(int totalCount, int pageNow,int tourId) {
        this.totalCount = totalCount;
        this.pageNow = pageNow;
        this.tourId = tourId;
    }

    public int getTotalPageCount() {
        totalPageCount = getTotalCount() / getPageSize();
        return (totalCount % pageSize == 0) ? totalPageCount
                : totalPageCount + 1;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getStartPos() {
        return (pageNow - 1) * pageSize;
    }

    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getAllLevel() {
        return allLevel;
    }

    public void setAllLevel(int allLevel) {
        this.allLevel = allLevel;
    }
}

