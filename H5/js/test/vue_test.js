var app = new Vue({
    el: '#app',
    data: {
        message: 'Hello Vue!'
    },
    // 计算属性
    computed: {
        newMessage: function () {
            return this.message.split().reverse().join('-');
        },
        newMessage2: function () {
            return '666';
        }
    }
})
var app2 = new Vue({
    el: '#app-2',
    data: {
        message: '页面加载于' + new Date().toLocaleDateString()
    },
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
        data: [{
                value: "学习Python"
            },
            {
                value: "学习Django"
            },
            {
                value: "学习Vue.js"
            }
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
    template: "<li >{{my.text}}</li>"
})


var app7 = new Vue({
    el: "#app-7",
    data: {
        datas: [{
                id: 0,
                text: '蔬菜'
            },
            {
                id: 1,
                text: '奶酪'
            },
            {
                id: 2,
                text: '随便其他什么人吃的东西'
            }
        ]
    },
    computed: {
        colorClass: function () {
            data = {
                red: false,
                green: true
            }
            if (this.active) {
                data.red = true
                data.green = false
            }
            return data
        }
    }
})
//================侦听器demo=====================
var wacthExample = new Vue({
    el: '#watch-example',
    data: {
        question: '',
        answer: 'I cannot give you an answer until you ask a question!'
    },
    watch: {
        // 如果 `question` 发生改变，这个函数就会运行
        question: function (newQuestion, oldQuestion) {
            this.answer = 'Waiting for you to stop typing...';
            this.debouncedGetAnswer();
        }
    },
    //vue生命周期创建完成后调用
    created: function () {
        // `_.debounce` 是一个通过 Lodash 限制操作频率的函数。
        // 在这个例子中，我们希望限制访问 yesno.wtf/api 的频率
        // AJAX 请求直到用户输入完毕才会发出。想要了解更多关于
        // `_.debounce` 函数 (及其近亲 `_.throttle`) 的知识，
        // 请参考：https://lodash.com/docs#debounce
        this.debouncedGetAnswer = _.debounce(this.getAnswer, 500);
    },
    methods: {
        getAnswer: function () {
            if (this.question.indexOf('?') === -1) {
                this.answer = 'Questions usually contain a question mark. ;-)'
                return
            }
            this.answer = 'Thinking...'
            var vm = this
            axios.get('https://yesno.wtf/api')
                .then(function (response) {
                    vm.answer = response.data.answer
                })
                .catch(function (error) {
                    vm.answer = 'Error! Could not reach the API. ' + error
                })
        }
    }
})
//===================绑定class style
var app8 = new Vue({
    el: '#app-8',
    data: {
        active: false,
        switch_bg: true
    },
    computed: {
        colorClass: function () {
            data = {
                red: false,
                green: true
            }
            if (this.active) {
                data.red = true
                data.green = false
            }
            return data
        },
        bgClass: function () {
            $data = {
                bg: false
            }
            this.switch_bg ? data.bg = true : data.bg = false
            return $data
        }
    }
})

Vue.component('blog-post', {
    props: ['post'],
    template: `
      <div class="blog-post">
        <h3>{{ post.title }}</h3>
        <div v-html="post.content"></div>
        <slot>asdada</slot>
      </div>
    `
})
new Vue({
    el: '#app-x',
    data: {
        posts: [{
                id: 1,
                content: 'aaaa',
                title: '879'
            },
            {
                id: 2,
                content: 'aaaa',
                title: '879'
            },
            {
                id: 3,
                content: 'aaaa',
                title: '879'
            }
        ],
        postFontSize: 1
    },
    methods: {
        big: function () {
            return 0.1
        }
    }
})
// 选项卡测试
Vue.component('tab-1', {
    template: `
      <div class="blog-post">
        <h5>aaaaa</h5>
      </div>
    `
})
Vue.component('tab-2', {
    template: `
      <div class="blog-post">
        <h5>bbbbb</h5>
      </div>
    `
})
Vue.component('tab-3', {
    template: `
      <div class="blog-post">
        <h5>ccccc</h5>
      </div>
    `
})
new Vue({
    el: '#app-xx',
    data: {
        current: 'tab-1'
    },
    methods: {
        show_tab: function (index) {
            this.current = 'tab-' + index
        }
    }
})
//测试组键传值验证验证
Vue.component('user-info', {
    props: {
        username: String, //用户名必须为string类型
        age: Number, //年龄必须为整数且必须0-100之间
        sex: {
            type: String,
            default: '男'
        },
        money: {
            validator: function (value) {
                return value > 0 && value <= 100
            }
        }
    },
    template: '<div>\
        <table>\
            <th>\
                <tr>姓名:{{this.username}}</tr>\
                <tr>年龄:{{this.age}}</tr>\
                <tr>性别:{{this.sex}}</tr>\
                <tr>金币:{{this.money}}</tr>\
                <slot></slot>\
            </th>\
        </table>\
    </div>'
})
new Vue({
    el: "#app-show-info",
    data: {
        data:[
            {
                id:1,
                username: 'libin',
                age: 24,
                money: 67
            }
        ]
    }
        
})