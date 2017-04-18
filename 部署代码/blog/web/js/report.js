$( document ).ready( function(){
    var isPC = true;
    // 用ajax接收 综合报表 数据 (对象转数组不够彻底，有时间记得要回来调整)
    // 若改正后 pay_amount[ i ] =  data.payData.amount[ i ][ i ];
    // => pay_amount[ i ] =  data.payData.amount[ i ];
    // 已解决该bug
    $.post( "index.php?r=report/syn-report", { data:null },function(data,status){
        // 把数据封装为数组（两个总金额）
        var pay_amount  = pottArr(data.payAmount);
        var con_amount  = pottArr(data.conAmount);
        // 取最长的季度
        var x_len       = ( pay_amount.length >= con_amount.length ) ? pay_amount.length : con_amount.length;
        var x_arr       = [];
        // 获取x_arr(从1到x_len生成x轴坐标 数组)
        for ( var i = 1; i <= x_len; ){
            x_arr[ i - 1 ] = i++;
        }
        // 检测屏幕是否为手机 是 isPC=false 不是 true
        if (navigator.userAgent.match(/mobile/i)) {
            // 控制报表中的toolbox（工具栏）
            isPC = false;
        }
        conPaySynReport( con_amount, pay_amount, x_arr, isPC );
    }, 'json' );
    // 接收 季度报表 数据（只需要各个季度中各个月份的总金额）
    $.post( "index.php?r=report/quarter-report", { data:null },function(data,status){
        // 把数据封装为['1季度第一月'，‘二季度第一月’，‘三季度第一月’....]
        var mon = pottByMon( data.classify_money );
        // 把对象转换为数组
        var ilen = mon.length;
        for ( var i = 0; i < ilen; i++ ){
            mon[ i ] =quaPottArr( mon[ i ] );
        }
        // 检测屏幕是否为手机 是 isPC=false 不是 true
        if (navigator.userAgent.match(/mobile/i)) {
            // 控制报表中的toolbox（工具栏）
            isPC = false;
        }
        // 生成第几季度
        var quarter = sumQuarter( mon[0].length );
        conSynReport( quarter, mon, isPC );
    }, 'json' );

});
// 计算总共有多少个季度(生成第几季度)
function sumQuarter( len ) {
    var arr       = [];
    // 获取arr(从1到x_len生成x轴坐标 数组)
    for ( var i = 1; i <= len; i++ ){
        arr[ i - 1 ] = i + '季度';
    }
    return arr;
}
// 数据转换 季度综合报表
function quaPottArr( obj ) {
    var result = [];
    var ilen = obj.length;
    for( var i = 0; i < ilen; i++ ){
        result[ i ] = obj[ i ].money;
    }
    return result;
}
// 数据封装['1季度第一月'，‘二季度第一月’，‘三季度第一月’....]
// 传入的json
function pottByMon( data ) {
    // 最终数组
    var result = [];
    var sign = []; // 中转
    // 获取到该json中最长的数组下标
    var max = 0;
    var klen = data.length;
    for ( var k = 0; k < klen; k++ ){
        var index = data[ k ].length;
        if ( index > max ){
            max = index;
        }
    }
    // console.log( data  );
    // 循环次数是最大月份，也就是之前取出的max
    for ( var j = 0; j < max; j++ ){
        var ilen = data.length;
        for ( var i = 0; i < ilen; i++ ){
            // 数组元素全部取出，长度=0
            var len = data[ i ].length;
            if ( len == 1 ){
                // 用0填充该数组
                var obj = {
                    'money':0,
                };
                // 装载对象
                data[ i ].push(obj);
            }
            // 删除并返回数组第一个元素
            sign[ i ] = data[ i ].shift();
        }
        result[ j ] = sign;
        sign = [];
    }
    return result;
}
// 把数据封装为数组 消费-缴费综合报表
function pottArr( data ) {
    var len = data.length;
    var amount = [];
    for ( var i = 0; i < len; i++ ){
        amount[ i ] =  data[ i ];
    }
    return amount;
}
/* 某个季度消费情况 */
function conSynReport( quarter, mon, isPC ) {
    var myChart = echarts.init( $( '.featured-canvas' )[1]);
    var option = {
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['第一月','第二月','第三月','第四月']
        },
        xAxis: {
            data: quarter
        },
        yAxis: [
            {
                name:'  人民币(￥)',
                type : 'value',
                axisLabel : {
                    formatter: '{value}'
                }
            }
        ],
        //右上角工具条
        toolbox: {
            show : isPC,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        series: [{
            name: '第一月',
            type: 'bar',
            data: mon[0],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
//          markLine : {
//              data : [
//                  {type : 'average', name: '平均值'}
//              ]
//          }
        },
            {
                name: '第二月',
                type: 'bar',
                data: mon[1],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
//              markLine : {
//                  data : [
//                      {type : 'average', name: '平均值'}
//                  ]
//              }
            },
            {
                name: '第三月',
                type: 'bar',
                data: mon[2],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
//              markLine : {
//                  data : [
//                      {type : 'average', name: '平均值'}
//                  ]
//              }
            },
            {
                name: '第四月',
                type: 'bar',
                data: mon[3],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
//              markLine : {
//                  data : [
//                      {type : 'average', name: '平均值'}
//                  ]
//              }
            }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    // 自适应浏览器
    $(window).resize(function(){
        myChart.resize();

    });
}
/* 季度综合报表（两条折线） */
function conPaySynReport( con_series_data, pay_series_data, x_arr, isPC ) {
    // canvas容器
    var myChart = echarts.init( $( '.featured-canvas' )[0]);
    var option = {
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['消费金额','缴费金额']
        },
        calculable : true,
        //右上角工具条
        toolbox: {
            show : isPC,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        xAxis : [
            {
                name:'季度(个) ',
                type : 'category',
                boundaryGap : false,
                data :x_arr
            }
        ],
        yAxis : [
            {
                name:'  人民币(￥)',
                type : 'value',
                axisLabel : {
                    formatter: '{value}'
                }
            }
        ],
        series : [
            {
                name:'消费金额',
                type:'line',
                data:con_series_data,
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
//              markLine : {
//                  data : [
//                      {type : 'average', name: '平均值'}
//                  ]
//              }
            },
            {
                name:'缴费金额',
                type:'line',
                data:pay_series_data,
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
//              markLine : {
//                  data : [
//                      {type : 'average', name : '平均值'}
//                  ]
//              }
            }

        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    // 自适应浏览器
    $(window).resize(function(){
        myChart.resize();

    });
}
