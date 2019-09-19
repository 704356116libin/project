function dmeo(){
    a='hello'
    console.log(window.a,a)
}
function demo2(){
    dmeo()
    console.log(window.a)
}
/**
 * 添加事件句柄
 */
window.onload = function(){
    var test_btn=document.getElementById('test-btn')
    test_btn.addEventListener("click",demo2)
    // var a = function () {
    //     document.write("Hello! 我是自己调用的" + "<br />");
    //     return '返回的东西';
    // }();
    
    // document.write(a);

    var tempFunc;
var add = (function () {
    var counter = 0;
    tempFunc = function () { return counter += 1; }
    return tempFunc
})();
function myFunction() {
    console.log("add === tempFunc : " + (add === tempFunc))
    document.getElementById("addOneS").innerHTML = add();
}
myFunction()
}
