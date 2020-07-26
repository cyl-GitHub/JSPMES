<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工作运行结果</title>
    <script src="${requestScope.ContextPath}/jquery-2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/echarts/4.0.2/echarts.min.js"></script>
    <script src="${requestScope.ContextPath}/js/result/result.js"></script>
</head>
<body>
<label for="t_name">工作名</label><input type="text" id="t_name" name="t_name" value="${task.tName}">
<br>
<form action="/task/showResult" method="post">
    <input type="text" id="tId" name="tId" value="${task.id}" style="display:none">
    <label for="id">机器编号(不可大于${task.machineNum-1}):</label><input type="text" name="id" id="id" placeholder="${mId}">
    <input type="submit" value="切换">
</form>

<a href="/task/showResult/"></a>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<p>最短用时${task.endTime}</p>

<div id="container" style="width: 600px;height:400px;">
    <p></p>
</div>

<script type="text/javascript">

    var myCharts = echarts.init(document.getElementById('container'));
    var option = {
        title: {
            text: '项目实施进度表'
        },
        grid: {
            containLabel: true,
            left: 20
        },
        xAxis: {
            name: '时间',
            type: 'value'
        },

        yAxis: {
            name: '作业',

            data: [
                <c:forEach items="${jopNames}" var="jopName">
                '${jopName}',
                </c:forEach>
            ]

        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var end = parseInt(params[1].data) + parseInt(params[0].data);
                return params[0].name + ":" + params[0].data + "~" + end;

            }
        },
        series: [
            {
                name: '作业开始时间',
                type: 'bar',
                stack: 'test1',
                itemStyle: {
                    normal: {
                        color: 'rgba(0,0,0,0)'
                    }
                },
                data: [
                    <c:forEach items="${processes}" var="process">
                    '${process.starttime}',
                    </c:forEach>
                ]
            },
            {
                name: '作业',
                type: 'bar',
                stack: 'test1',
                //修改地方2
                itemStyle: {
                    normal: {
                        color: '#F98563'
                    }
                },
                data: [<c:forEach items="${processes}" var="process">
                    '${process.endtime-process.starttime}',
                    </c:forEach>]
            }

        ]
    };
    myCharts.setOption(option);
</script>
</body>
</html>
