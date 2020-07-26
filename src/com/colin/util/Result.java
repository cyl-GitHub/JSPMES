package com.colin.util;

public class Result {
    //最短加工时间
    public int fulfillTime = 0;
    //机器的工作时间
    public int[] machineWorkTime = new int[1024];
    //工件工序编号
    public int[] processIds = new int[1024];
    //结束时间
    public int[][] endTime = new int[1024][1024];
    //开始时间
    public int[][] startTime = new int[1024][1024];
}
