package com.colin.util;
//个体 包含一条染色体
public class Gene {
    //适合度
    public double fitness;
    //染色体
    public Integer[] chromosome;

    public Gene() {
        fitness = 0;
    }

    public Gene(double fitness) {
        this.fitness = fitness;
    }
}
