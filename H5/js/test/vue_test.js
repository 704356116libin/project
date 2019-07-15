var app = new Vue({
    el: '#app',
    data: {
        message: 'Hello Vue!'
    }
})
var app2 = new Vue({
    el: '#app-2',
    data: {
        message: '页面加载于' + new Date().toLocaleDateString()
    }
})
var app3 = new Vue({
    el: "#app-3",
    data: {
        seen: false
    }
})
// 循环数据
var app4 = new Vue({
    el: "#app-4",
    data: {
        data: [
            { value: "学习Python" },
            { value: "学习Django" },
            { value: "学习Vue.js" }
        ]
    }
})
//逆转消息
var app5 = new Vue({
    el: "#app-5",
    data: {
        message: "Hello Vue.js!"
    },
    methods: {
        reverseMessage: function () {
            this.message = this.message.split('').reverse().join('')
        }
    },
})
var app6 = new Vue({
    el: "#app-6",
    data: {
        message: "Hello Vue!"
    }
})
// ================组件====================
Vue.component('my-item', {
    // my-item 组件现在接受一个
    // "parm1"，类似于一个自定义属性
    // 这个属性名为 parm1
    props: ['my'],
    template: "<li>{{my.text}}</li>"
})
var app7 = new Vue({
    el: "#app-7",
    data: {
        datas: [
            { id: 0, text: '蔬菜' },
            { id: 1, text: '奶酪' },
            { id: 2, text: '随便其他什么人吃的东西' }
        ]
    }
})
