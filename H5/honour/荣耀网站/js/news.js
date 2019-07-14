// 点击我则移除我兄弟之间的class
//全部
$(function(){
    // 刷新后还停留在本页
    // window.location.reload()
$(".nva-ul").click(function(e){
    console.log("你好");
    e.preventDefault();
    var itme=$(e.target);
    var i=itme.index();
    var i=`.content${i}`;
    console.log("第一次i"+i);
    console.log(i);
    $(i).css('display','block').siblings().css('display','none');
    if(e.target.nodeName=="LI"){
    itme.addClass("shadow-div").siblings().removeClass("shadow-div");


        var i=`${i}`;
        console.log("look");
        console.log("第二次i"+i)
        var iTitile=`${i}-title`;


     

        // $(".content-title").fadeIn("slow");
        // console.log("ce");
    }else{
       itme.parent().parent().addClass("shadow-div").siblings().removeClass("shadow-div").index();
        var itme=$(e.target);
        var i=itme.parent().parent().index();
        console.log(i);
        var i=`.content${i}`;
        var iTitile=`${i}-title`;
        $(i).css('display','block').siblings().css('display','none');
        console.log("完成");
        $(iTitile).addClass("show-title").siblings().removeClass("show-title");
       console.log("最后的数据"+i);
        $(i).css('display','block').siblings().css('display','none');
     //
     // var i=itme.parent().parent().index();
     // console.log(i);
    }
    console.log(e.target.nodeName);

    // var i=itme.index();
})
   

});

