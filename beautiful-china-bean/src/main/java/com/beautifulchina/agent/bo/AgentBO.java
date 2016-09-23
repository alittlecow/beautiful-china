package com.beautifulchina.agent.bo;

import com.beautifulchina.agent.vo.AgentVO;

/**
 * Created by ZHF on 2016/4/7.
 */
public class AgentBO extends AgentVO {

    /**
     * 代理商级别
     */
    private String level;
    /**
     * 审批时间
     */
    private String approvetime;
    /**
     * 审批状态
     */
    private String status;
    /**
     * 驳回原因
     */
    private String reason;
    /**
     * 操作人员id
     */
    private Integer plateFormId;

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getApprovetime() {
        return approvetime;
    }

    public void setApprovetime(String approvetime) {
        this.approvetime = approvetime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getPlateFormId() {
        return plateFormId;
    }

    public void setPlateFormId(Integer plateFormId) {
        this.plateFormId = plateFormId;
    }
}
