// 商品组件
Vue.component('shop-list', {
    props: {
        main: Object,
        items: Array
    },
    template: `
    <div>
        <div class="prod-items">
            <div class="box-hd">
                <h3 class="title">{{main.name}}</h3>
            </div>
        </div>
        <div class="item">
            <a :href="main.url">
                <img :src="main.url" :alt="main.name">
            </a>
        </div>
        <div class="item" v-for="item in items">
            <div class="title">{{item.name}}</div>
            <div class="desc">{{item.dsc}}</div>
            <a href="item.url" @click="">
                <img :src="item.url" alt="">
            </a>
        </div>
    </div>
    `,
    methods:{
        detail:function(id){
            alert("点击了"+id+"商品")
        }
    }
})
new Vue({
    el: "#index-content",
    data() {
        return {
            banner_imgs: [
                '../img/a62c3c8dcc506d241b26272a506c265e.jpg',
                '../img/04b2c6ca437a8bfacd72254fe028a70b.jpg',
                '../img/07cd880d456642bb060e00121b975be7.jpg',
                '../img/1.jpg',
                '../img/2.jpg'
            ], //首页轮播图数据组
            shop_data: [
                {
                    main: {
                        id: 1,
                        name: '手机',
                        url: '../img/a.jpg',
                        items: [
                            {
                                id:6,
                                name:'荣耀8X',
                                dsc:'千元屏霸',
                                url:'../img/6.jpg'
                            },
                            {
                                id:7,
                                name:'荣耀8X Max',
                                dsc:'千元大屏 随身影院',
                                url:'../img/b.jpg'
                            },
                            {
                                id:8,
                                name:'荣耀Note 10',
                                dsc:'更大 更快 更Cool',
                                url:'../img/c.jpg'
                            },
                            {
                                id:9,
                                name:'荣耀Play',
                                dsc:'突破   让快更快',
                                url:'../img/6.jpg'
                            },
                            {
                                id:10,
                                name:'荣耀9i',
                                dsc:'突破   让快更快',
                                url:'../img/d.jpg'
                            },
                            {
                                id:11,
                                name:'荣耀畅玩7',
                                dsc:'小巧全面屏 通话大音量',
                                url:'../img/e.jpg'
                            },
                            {
                                id:12,
                                name:'荣耀10',
                                dsc:'会 变 色 更 潮 美',
                                url:'../img/13.jpg'
                            },
                        ]
                    }
                },
                {
                    main: {
                        id: 2,
                        name: '平板',
                        url: '../img/b1.jpg',
                        items: [
                            {
                                id:13,
                                name:'荣耀magicbook-锐龙版',
                                dsc:'高性能金属轻薄本',
                                url:'../img/b2.jpg'
                            },
                            {
                                id:14,
                                name:'荣耀MagicBook',
                                dsc:'独显轻薄',
                                url:'../img/b2.jpg'
                            },
                            {
                                id:15,
                                name:'荣耀畅玩平板2',
                                dsc:'持久畅快  更痛快',
                                url:'../img/b3.jpg'
                            }
                        ]
                    }
                },
                {
                    main: {
                        id: 3,
                        name: '穿戴设备',
                        url: '../img/c1.jpg',
                        items: [
                            {
                                id:16,
                                name:'荣耀手环4-锐龙版',
                                dsc:'AMOLED触控大彩屏心率手环',
                                url:'../img/c2.jpg'
                            },
                            {
                                id:17,
                                name:'荣耀手表S1',
                                dsc:'看到改变',
                                url:'../img/c3.jpg'
                            },
                            {
                                id:18,
                                name:'荣耀畅玩手表A1',
                                dsc:'精致随行  更痛快',
                                url:'../img/b4.jpg'
                            }
                        ]
                    }
                },
                {
                    main: {
                        id: 4,
                        name: '智能家庭',
                        url: '../img/d1.jpg',
                        items: [
                            {
                                id:19,
                                name:'荣耀路由2',
                                dsc:'智能体验  快人一步',
                                url:'../img/d2.jpg'
                            },
                            {
                                id:20,
                                name:'荣耀路由X1增强版',
                                dsc:'不见天线',
                                url:'../img/d3.jpg'
                            },
                            {
                                id:21,
                                name:'荣耀畅玩手表A1',
                                dsc:'精致随行  更痛快',
                                url:'../img/d4.jpg'
                            }
                        ]
                    }
                },
                {
                    main: {
                        id: 5,
                        name: '配件',
                        url: '../img/f1.jpg',
                        items: [
                            {
                                id:22,
                                name:'荣耀自拍杆',
                                dsc:'发现更美的自己',
                                url:'../img/f2.jpg'
                            },
                            {
                                id:23,
                                name:'荣耀小口哨',
                                dsc:'随时听你的',
                                url:'../img/f3.jpg'
                            },
                            {
                                id:24,
                                name:'荣耀引擎耳机2',
                                dsc:'一副耳机，两种音乐态度  更痛快',
                                url:'../img/f4.jpg'
                            }
                        ]
                    }
                }

            ],
            banner_index: 0, //背景图索引
            timer: null //定时任务标识
        }
    },
    computed: {
        // 当前展示的banner图
        banner_img: function () {
            return this.banner_imgs[this.banner_index];
        },
        // banner图展示的dot所需数据
        banner_dot: function () {

        }
    },
    // 实例创建完成后进行页面初始化操作
    created() {
        clearInterval(this.timer)
        this.timer = null
        this.setTimer()
        // 加入banner图dot索引属性若有背景图数据则默认从第一个,否则设为-1没有图片
        this.banner_dot_index = this.banner_imgs.length == 0 ? -1 : 0
    },
    destroyed: function () {
        // 每次离开当前界面时，清除定时器
        clearInterval(this.timer)
        this.timer = null
    },
    methods: {
        // 动态切换底部背景轮播图
        setTimer() {
            if (this.timer == null) {
                this.timer = setInterval(() => {
                    // 计算共有几张背景图
                    let count = this.banner_imgs.length;
                    if (this.banner_index == (count - 1)) {
                        this.banner_dot_index = 0
                        this.banner_index = 0
                    } else {
                        this.banner_dot_index += 1
                        this.banner_index += 1
                    }
                }, 4000)
            }
        }
    },

})
