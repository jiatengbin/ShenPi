package com.shenpi.entity;

public class Topic {
    private int tid;//分类id
    private String tname;//分类名

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "tid=" + tid +
                ", tname='" + tname + '\'' +
                '}';
    }
}
