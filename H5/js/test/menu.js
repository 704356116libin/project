$(document).ready(function () {
    var sub=$('#sub')
    var activeRow;
    var activeMenu;

    var timer;
    var mousInSub=false;
    sub.on('mouseenter',function (e) {
        mousInSub=true;
    }).on('mouseleave',function (e) {
         mousInSub=false;
    })

    var mouseTrack=[];
    var moveHandle=function(e){
        mouseTrack.push({
            x:e.pageX,
            y:e.pageY,
        })
        if(mouseTrack.length>3){
            mouseTrack.shift();
        }
    }

    $("#test")
    .on('mouseenter',function (e) {
        sub.removeClass('none');
           $(document).bind('mousemove',moveHandle)
    })
    .on('mouseleave',function (e) {
        sub.addClass('none');
        if(activeRow){
            activeRow.removeClass('active');
            activeRow=null;
        }
        if(activeMenu){
            activeMenu.addClass('none');
            activeMenu=null;
        }
        $(document).unbind('mousemove',moveHandle)
    })
    .on('mouseenter','li',function (e) {
        if(!activeRow){
            activeRow=$(e.target).addClass('active');
            activeMenu=$('#'+activeRow.data('id'));
            activeMenu.removeClass('none');
            return;
        }
        if(timer){
            clearTimeout(timer)
        }
        //鼠标当前坐标
        var currMousePos=mouseTrack[mouseTrack.length-1]
        var leftCorner=mouseTrack[mouseTrack.length-2]
        var delay=needDelay(sub,leftCorner,currMousePos)
        if(delay){
            //设置延迟去抖
            timer=setTimeout(function () {
                if(mousInSub)return;
                activeRow.removeClass('active');
                activeMenu.addClass('none');
                activeRow=$(e.target);
                activeRow.addClass('active');
                activeMenu=$('#'+activeRow.data('id'));
                console.log('#'+activeRow.data('id'),activeRow);
                activeMenu.removeClass('none')
                timer=null;
             },300)
        }else{
            var prevActiveRow=activeRow
            var prevActiveMenu=activeMenu

            activeRow=$(e.target)
            activeMenu=$('#'+activeRow.data('id'))

            prevActiveRow.removeClass('active')
            prevActiveMenu.addClass('none')

            activeRow.addClass('active')
            activeMenu.removeClass('none')
        }

    })
})