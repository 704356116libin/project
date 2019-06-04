$(document).ready(function () {
    var index = 0;
    $(".ban").click(function(){
        index = $(this).index();
        $(this).addClass("active").siblings().removeClass("active");
        $(".img-itm").eq(index).fadeIn().siblings().fadeOut();
    });		
    $(".left").click(function(){
        index--;
        if(index < 0){
            index = 4;
        }
        $(".img-itm").eq(index).fadeIn().siblings().fadeOut();
        $(".ban").eq(index).addClass("active").siblings().removeClass("active");
    });
    $(".right").click(function(){
        index++;
        if(index > 4){
            index = 0;
        }
        $(".img-itm").eq(index).fadeIn().siblings().fadeOut();
        $(".ban").eq(index).addClass("active").siblings().removeClass("active");
    });
    var timer = setInterval(function(){
        index++;
        if(index>4){
            index = 0;
        }
        $(".img-itm").eq(index).fadeIn().siblings().fadeOut();
        $(".ban").eq(index).addClass("active").siblings().removeClass("active")
    },3000);
})