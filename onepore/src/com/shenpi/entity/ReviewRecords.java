package com.shenpi.entity;

public class ReviewRecords {
    private  int reid;//送审记录id
    private int retid;//送审分类id
    private  String rename;//送审人姓名
    private  String recreateDate;//送审时间
    private  String repicPath;//上传路径
    private String restate;//审批状态 默认0 1提交成功

    public int getReid() {
        return reid;
    }

    public void setReid(int reid) {
        this.reid = reid;
    }

    public int getRetid() {
        return retid;
    }

    public void setRetid(int retid) {
        this.retid = retid;
    }

    public String getRename() {
        return rename;
    }

    public void setRename(String rename) {
        this.rename = rename;
    }

    public String getRecreateDate() {
        return recreateDate;
    }

    public void setRecreateDate(String recreateDate) {
        this.recreateDate = recreateDate;
    }

    public String getRepicPath() {
        return repicPath;
    }

    public void setRepicPath(String repicPath) {
        this.repicPath = repicPath;
    }

    public String getRestate() {
        return restate;
    }

    public void setRestate(String restate) {
        this.restate = restate;
    }

    @Override
    public String toString() {
        return "ReviewRecords{" +
                "reid=" + reid +
                ", retid=" + retid +
                ", rename='" + rename + '\'' +
                ", recreateDate='" + recreateDate + '\'' +
                ", repicPath='" + repicPath + '\'' +
                ", restate='" + restate + '\'' +
                '}';
    }
}
