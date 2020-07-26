// var option = {
//     //为图表配置标题
//     title: {
//         text: '项目实施进度表',
//         left: 10
//     },
//     //配置提示信息
//     tooltip: {
//         trigger: 'axis',
//         formatter: function (params) {
//             var res = params[0].name + "</br>"
//             var date0 = params[0].data;
//             var date1 = params[1].data;
//             var date2 = params[2].data;
//             var date3 = params[3].data;
//             date0 = date0.getFullYear() + "-" + (date0.getMonth() + 1) + "-" + date0.getDate();
//             date1 = date1.getFullYear() + "-" + (date1.getMonth() + 1) + "-" + date1.getDate();
//             date2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
//             date3 = date3.getFullYear() + "-" + (date3.getMonth() + 1) + "-" + date3.getDate();
//             res += params[0].seriesName + "~" + params[1].seriesName + ":</br>" + date0 + "~" + date1 + "</br>"
//             res += params[2].seriesName + "~" + params[3].seriesName + ":</br>" + date2 + "~" + date3 + "</br>"
//             console.log(params[0]);
//             return res;
//         }
//     },
//     legend: {
//         y: 'bottom',
//         data: ['计划时间', '实际时间'],  //修改的地方1
//         textStyle: {
//             color: 'red'
//         }
//     },
//
//     xAxis: {
//         // type: 'time'
//     },
//     yAxis: {
//         data: ['机器一', '机器二', '机器三', '机器四']
//
//     },
//     grid: {
//         containLabel: true,
//         left: 20
//     },
//     series: [
//
//         {
//             name: '项目实施进度表',
//             type: 'bar',
//             stack: 'test1',
//
//             data: [
//                 5,10,15,20
//             ]
//         }
//
//     ]
// };


var option = {
    title: {
        text: '第一个 ECharts 实例'
    },
    tooltip: {},
    legend: {
        data:['销量']
    },
    xAxis: {
        data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
    },
    yAxis: {},
    series: [{
        name: '销量',
        type: 'bar',
        data: [5, 20, 36, 10, 10, 20]
    }]
};
echarts.init(document.getElementById('main').setOption(option));
