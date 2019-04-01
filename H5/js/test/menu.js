$(document).ready(function () {
    var sub=$('#sub')
    var activeRow;
    var activeMenu;
    $("#test")
    .on('mouseenter',function (e) {
        sub.removeClass('none');
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
    })
    .on('mouseenter','li',function (e) {
        if(!activeRow){
            activeRow=$(e.target()).addClass('active');
            activeMenu=$('#'+activeRow.data('id'));
            activeMenu.removeClass('none');
            return;
        }
        activeRow.removeClass('active');
        activeMenu.addClass('none');
        activeRow=$(e.target());
        activeRow.addClass('active');
        activeMenu=$('#'+activeRow.data('id'));
        activeMenu.removeClass('none')
    })
})