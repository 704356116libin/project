$(document).ready(function () {
    /**
     *隐藏文字段落
     */
    $("button#hide-bt").click(function () {
        console.log($("p"));
        $("p").toggle(1000);
    });
    /**
     *隐藏事件表单
     */
    $("button#event-bt").click(function () {
        // $("#tb-event").fadeToggle(500);//淡入淡出
        $("#tb-event").slideToggle(300);//淡入淡出
    });
    /**
     *面板滑动
     */
    $("#slide").click(function () {
        // $("#tb-event").fadeToggle(500);//淡入淡出
        // 面板滑动--回调测试
        $("#panel").slideToggle(500, function () {
            alert('触发面板滑动');
        });
    });
    /**
     * 动画测试(鼠标滑入)
     */
    $("#animate-img").mouseenter(function () {
        // $("#tb-event").fadeToggle(500);//淡入淡出
        $("#animate-img").animate({width: '150px', height: '75px', opacity: '1'})
    });
    /**
     * 动画测试(鼠标滑出)
     */
    $("#animate-img").mouseleave(function () {
        // $("#tb-event").fadeToggle(500);//淡入淡出
        $("#animate-img").animate({width: '100px', height: '50px'})
    });
    var animate_btn_click=1;
     /**
     * 动画链式操作&&css属性链式操作
     */
    $("#animate-btn").click(function () {
        animate_btn_click++;
        if(animate_btn_click%2==0){
            $("#animate-img").animate({width: '100px', height: '50px',opacity: '1'})
            $("#animate-btn").text('点我变大')
        }else{
            $("#animate-img").animate({width: '150px', height: '75px',opacity: '1'})
            $("#animate-btn").text('点我变小')
        }
    });
    /**
     * 测试dom遍历--获取子元素
     */
    $("#btn-div-children").click(function () {
        console.log($("#div-1").children());
    });
    /**
     * 测试dom遍历--获取父元素
     */
    $("#btn-p-parent").click(function () {
        console.log($("#p-1").parent());
    });
});
