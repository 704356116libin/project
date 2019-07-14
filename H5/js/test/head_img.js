$(document).ready(function () {
    $(".slider a").click(function () {
        $arr1={
            '#bg1':'big-img1',
            '#bg2':'big-img2',
            '#bg3':'big-img3',
            '#bg4':'big-img4',
            '#bg5':'big-img5',
        }
        //获取点击的a标签的href
        $href=$(this).attr('href')
        //更换背景图片
        //选中的背景图展示--其余的隐藏
        $('.'+$arr1[$href]).css('display','block')

        //隐藏没选中的
        for (var prop in $arr1) {
            if (prop!=$href) {
                $('.' + $arr1[prop]).css('display', 'none')
                console.log($($arr1[prop]))
            }
        }
    })
})