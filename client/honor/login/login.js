const Vue = require('vue')
/*
 *底部导航组件
 */
Vue.component('my-footer', {
    props: {
        url: String,
        content: String
    },
    template: '<a rel="nofollow" target="_blank" :href="url">{{content}}</a>'
})
/**
 * 登陆框组件
 */
Vue.component('my-login-footer', {

    template: `
        <div class="coagent" id="kbCoagent">
            <ul>
                <li><b></b>
                <a @click="clickQQ" href="javascript:void(0)"  clstag="pageclick|keycount|login_pc_201804112|3" class="pdl"><b class="QQ-icon"></b><span>QQ</span></a>
                    <span class="line">|</span>
                </li>
                <li>
                <a  @click="clickWx" href="javascript:void(0)"clstag="pageclick|keycount|login_pc_201804112|4" class="pdl"><b class="weixin-icon"></b><span>微信</span></a>
                </li>
                <li class="extra-r">
                    <a href="#" clstag="pageclick|keycount|login_pc_201804112|5" target="_blank">立即注册</a>
                </li>
            </ul>
        </div>`,
    methods: {
        clickQQ: function () {
            console.log('QQ')
            alert('点击了QQ登录')
        },
        clickWx: function () {
            console.log('WX')
            alert('点击了WX登录')
        }
    }
})
/**
 * 底部导航数据实例
 */
var footer = new Vue({
    el: '#footer-2013',
    data: {
        data: [{
                url: "//www.jd.com/intro/about.aspx",
                content: "关于我们",
                id: 1
            },
            {
                url: "//www.jd.com/contact/",
                content: "联系我们",
                id: 2
            },
            {
                url: "//www.jd.com/contact/",
                content: "人才招聘",
                id: 3
            },
            {
                url: "//www.jd.com/789hjk/",
                content: "商家入驻",
                id: 4
            },
            {
                url: "//www.jd.com/54645/",
                content: "广告服务",
                id: 5
            },
            {
                url: "//www.jd.com/12312/",
                content: "手机京东",
                id: 6
            },
            {
                url: "//club.jd.com/links.aspx",
                content: "友情链接",
                id: 7
            },
            {
                url: "//media.jd.com/",
                content: "销售联盟",
                id: 8
            }
        ],
        copyright: 'Copyright&nbsp;©&nbsp;2019&nbsp;&nbsp;彬&nbsp;版权所有'
    },
    methods: {

    }
})


/**
 * 登录页面实例
 */
var login = new Vue({
    el: "#content",
    data: {
        password: '',
        name: '',
        login_url: '#',
        reset_pwd_url: '#',
        bg_index: 0, //登陆背景图索引
        imgs: {
            login_banner_bgs: ['../img/login/login-banner1.png', '../img/login/bg-2.jpg'], //登录页面背景图面组
            logo: '' //头部logo图
        },
        timer: null
    },
    methods: {
        login: function (e) {
            console.log(e)
            alert('点击了登录按钮:用户名-' + this.name + '密码-' + this.password)
        },
        // 动态切换底部背景轮播图
        setTimer() {
            if (this.timer == null) {
                this.timer = setInterval(() => {
                    // 计算共有几张背景图
                    let count = this.imgs.login_banner_bgs.length;
                    if (this.bg_index == (count - 1)) {
                        this.bg_index = 0
                    } else {
                        this.bg_index += 1
                    }
                }, 4000)
            }
        }
    },
    computed: {
        login_banner_bg: function () {
            return this.imgs.login_banner_bgs[this.bg_index]
        }
    },
    created: function () {
        // 每次进入界面时，先清除之前的所有定时器，然后启动新的定时器
        clearInterval(this.timer)
        this.timer = null
        this.setTimer()
    },
    destroyed: function () {
        // 每次离开当前界面时，清除定时器
        clearInterval(this.timer)
        this.timer = null
    }
})