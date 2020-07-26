package com.colin.util;

import java.util.*;

public class GeneticAlgorithm {
    //个体总数  初始化种群数量
    private final int populationNumber = 60;
    //变异概率
    private final double mutationProbability = 0.05;
    //作业个数
    private int jobNumber;
    //机器数
    private int machineNumber;
    //工序数
    private int processNumber;
    //染色体长度 工序数之和
    private int chromosomeSize;

    //机器矩阵
    private int[][] machineMatrix = new int[1024][1024];
    //用时时长矩阵
    private int[][] timeMatrix = new int[1024][1024];
    //工序矩阵
    private int[][] processMatrix = new int[1024][1024];

    //染色体集合 内部储存60个染色体
    private Set<Gene> geneSet = new HashSet<>();
    private Random random = new Random();


    //构造函数  对信息的初始化
    public GeneticAlgorithm(int jobNumber, int machineNumber) {
        this.jobNumber = jobNumber;//作业个数
        this.machineNumber = machineNumber; //机器个数
        //遍历机器矩阵  初始化为-1
        for (int[] matrix : this.machineMatrix) Arrays.fill(matrix, -1);
        //遍历工序矩阵  初始化为-1
        for (int[] process : this.processMatrix) Arrays.fill(process, -1);
    }

    //随机填充工件编号
    private List<Integer> makeList(int n) {
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            result.add(i);
        }
        return result;
    }

    private Integer[] filterArray(Integer[] arr, int filterVal) {
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] != filterVal) {
                result.add(arr[i]);
            }
        }
        return result.toArray(new Integer[0]);
    }

    // 初始化种群
    public void initialPopulation() {
        //种群内总数为60  进行循环填充种群
        for (int i = 0; i < populationNumber; i++) {
            Gene g = new Gene();
            //染色体长度
            int size = jobNumber * machineNumber;
            //随机填充size个工件编号
            List<Integer> indexList = makeList(size);
            //创建一个染色体,进行默认填充
            Integer[] chromosome = new Integer[size];
            Arrays.fill(chromosome, -1);

            for (int j = 0; j < jobNumber; j++) {
                for (int k = 0; k < machineNumber; k++) {
                    int index = random.nextInt(indexList.size());
                    int val = indexList.remove(index);
                    if (processMatrix[j][k] != -1) {
                        chromosome[val] = j;
                    }
                }
            }

            g.chromosome = filterArray(chromosome, -1);
            g.fitness = calculateFitness(g).fulfillTime;
            geneSet.add(g);
        }
    }

    //截取染色体的指定部分
    public List<Integer> subArray(Integer[] arr, int start, int end) {
        List<Integer> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(arr[i]);
        }
        return list;
    }

    // 计算适应度
    public Result calculateFitness(Gene g) {
        Result result = new Result();
        for (int i = 0; i < g.chromosome.length; i++) {
            int jobId = g.chromosome[i];
            int processId = result.processIds[jobId];
            int machineId = machineMatrix[jobId][processId];
            int time = timeMatrix[jobId][processId];
            result.processIds[jobId] += 1;

            if (processId == 0) {
                result.startTime[jobId][processId] = result.machineWorkTime[machineId];
            }
            //processId>0
            else {
                result.startTime[jobId][processId] = Math.max(result.endTime[jobId][processId - 1], result.machineWorkTime[machineId]);
            }

            result.machineWorkTime[machineId] = result.startTime[jobId][processId] + time;
            result.endTime[jobId][processId] = result.machineWorkTime[machineId];
            result.fulfillTime = Math.max(result.fulfillTime, result.machineWorkTime[machineId]);

        }
        return result;
    }

    // 交叉算子
    private Gene crossGene(Gene g1, Gene g2) {
        List<Integer> indexList = makeList(chromosomeSize);

        //在indexList随机选取两个数 作为交叉的起始和结束位置
        int p1 = indexList.remove(random.nextInt(indexList.size()));
        int p2 = indexList.remove(random.nextInt(indexList.size()));

        int start = Math.min(p1, p2);
        int end = Math.max(p1, p2);

        List<Integer> proto = subArray(g1.chromosome, start, end + 1);
        List<Integer> t = new ArrayList<>();
        //将g2进行一次备份t
        for (Integer c : g2.chromosome) {
            t.add(c);
        }
        //通过遍历移除t中包含proto的部分
        for (Integer val : proto) {
            for (int i = 0; i < t.size(); i++) {
                if (val.equals(t.get(i))) {
                    t.remove(i);
                    break;
                }
            }
        }

        Gene child = new Gene();
        proto.addAll(t.subList(start, t.size()));
        List<Integer> temp = t.subList(0, start);
        temp.addAll(proto);
        child.chromosome = temp.toArray(new Integer[0]);
        child.fitness = (double) calculateFitness(child).fulfillTime;
        return child;
    }

    // 突变算子
    public Gene mutationGene(Gene gene, int n) {
        List<Integer> indexList = makeList(chromosomeSize);
        for (int i = 0; i < n; i++) {
            //随机获取两个调换位置
            int a = indexList.remove(random.nextInt(indexList.size()));
            int b = indexList.remove(random.nextInt(indexList.size()));
            int t = gene.chromosome[a];
            gene.chromosome[a] = gene.chromosome[b];
            gene.chromosome[b] = t;
        }
        gene.fitness = calculateFitness(gene).fulfillTime;
        return gene;
    }

    // 选择个体
    public Gene selectGene(int n) {
        List<Integer> indexList = makeList(geneSet.size());
        Map<Integer, Boolean> map = new HashMap<>();
        //随机选取三个数 放到map中
        for (int i = 0; i < n; i++) {
            map.put(indexList.remove(random.nextInt(indexList.size())), true);
        }
        //1048575
        Gene bestGene = new Gene(0xfffff);
        int i = 0;
        for (Gene gene : geneSet) {
            //判断是否存在所选取的键值
            if (map.containsKey(i)) {
                //初始时bestGene的适合度特别大,第一次找到的gene适合度必然小于bestGene,将gene赋值给bestGene
                //最终找出三组数中适合度最小的数
                if (bestGene.fitness > gene.fitness) {
                    bestGene = gene;
                }
            }
            i++;
        }
        return bestGene;
    }

    public Result run(List<List<Integer[]>> job) {

        //工件数
        int jobSize = job.size();

        for (int i = 0; i < jobSize; i++) {
            //染色体长度 工序数之和
            chromosomeSize += job.get(i).size();
            //System.out.println(job.get(i).size());
            //工序数最多的一组
            processNumber = Math.max(processNumber, job.get(i).size());
            for (int j = 0; j < job.get(i).size(); j++) {
                machineMatrix[i][j] = job.get(i).get(j)[0];
                timeMatrix[i][j] = job.get(i).get(j)[1];

            }
        }

        for (int i = 0; i < jobSize; i++) {
            for (int j = 0; j < processNumber; j++) {
                if (machineMatrix[i][j] != -1) {
                    processMatrix[i][machineMatrix[i][j]] = j;
                }
            }
        }

        initialPopulation();

        for (int i = 0; i < populationNumber; i++) {
            double p = (double) random.nextInt(100) / 100.0;
            //如果随机数小于变异概率
            //位置变异法
            if (p < mutationProbability) {
                int index = random.nextInt(geneSet.size());
                int k = 0;
                for (Gene gene : geneSet) {
                    if (k == index) {
                        mutationGene(gene);
                        break;
                    }
                    k++;
                }
            } else {
                //选择种群中的两个个体 g1和g2
                Gene g1 = selectGene(), g2 = selectGene();
                Gene child1 = crossGene(g1, g2), child2 = crossGene(g2, g1);
                geneSet.add(child1);
                geneSet.add(child2);
            }
        }
        Gene bestGene = new Gene(0xffffff);
        for (Gene gene : geneSet) {
            if (bestGene.fitness > gene.fitness) {
                bestGene = gene;
            }
        }
        //获得适应度最小的一个
        return calculateFitness(bestGene);
    }

    public Gene selectGene() {
        //随机选取三个个体,返回适应度最低的个体
        return selectGene(3);
    }

    public Gene mutationGene(Gene gene) {
        //一共对调两组数
        return mutationGene(gene, 2);
    }


    public int getPopulationNumber() {
        return populationNumber;
    }

    public double getMutationProbability() {
        return mutationProbability;
    }

    public int getJobNumber() {
        return jobNumber;
    }

    public void setJobNumber(int jobNumber) {
        this.jobNumber = jobNumber;
    }

    public int getMachineNumber() {
        return machineNumber;
    }

    public void setMachineNumber(int machineNumber) {
        this.machineNumber = machineNumber;
    }

    public int getProcessNumber() {
        return processNumber;
    }

    public void setProcessNumber(int processNumber) {
        this.processNumber = processNumber;
    }

    public int getChromosomeSize() {
        return chromosomeSize;
    }

    public void setChromosomeSize(int chromosomeSize) {
        this.chromosomeSize = chromosomeSize;
    }

    public int[][] getMachineMatrix() {
        return machineMatrix;
    }

    public void setMachineMatrix(int[][] machineMatrix) {
        this.machineMatrix = machineMatrix;
    }

    public int[][] getTimeMatrix() {
        return timeMatrix;
    }

    public void setTimeMatrix(int[][] timeMatrix) {
        this.timeMatrix = timeMatrix;
    }

    public int[][] getProcessMatrix() {
        return processMatrix;
    }

    public void setProcessMatrix(int[][] processMatrix) {
        this.processMatrix = processMatrix;
    }

    public Set<Gene> getGeneSet() {
        return geneSet;
    }

    public void setGeneSet(Set<Gene> geneSet) {
        this.geneSet = geneSet;
    }

    public Random getRandom() {
        return random;
    }

    public void setRandom(Random random) {
        this.random = random;
    }

    public static void main(String[] args) {
        List<List<Integer[]>> job = Arrays.asList(
                Arrays.asList(new Integer[]{0, 3}, new Integer[]{1, 2}, new Integer[]{2, 2}),
                Arrays.asList(new Integer[]{0, 2}, new Integer[]{2, 1}, new Integer[]{1, 4}),
                Arrays.asList(new Integer[]{1, 4}, new Integer[]{2, 3})
        );

        //n为作业个数
        //m为机器数
        int n = 3, m = 3;

        GeneticAlgorithm ga = new GeneticAlgorithm(n, m);
        Result result = ga.run(job);
        //工序数
        int processNumber = ga.processNumber;
        //机器矩阵
        int[][] machineMatrix = ga.machineMatrix;
        //输出最短加工时间
        System.out.println(result.fulfillTime);

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < processNumber; j++) {
                if (machineMatrix[i][j] != -1) {
                    System.out.println(String.format("job: %d, process: %d, machine: %d, startTime: %d, endTime: %d",
                            i, j, machineMatrix[i][j], result.startTime[i][j], result.endTime[i][j]));
                }
            }
        }
    }
}

