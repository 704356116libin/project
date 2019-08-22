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
            shop_data:[
                {
                    main:{
                        id:0,
                        name:'',
                        img_src:'',
                        items:[

                        ]
                    }
                },
                   
            ]
        }
    },
    computed: {
        // 当前展示的banner图
        banner_img: function () {
            return this.banner_imgs[0];
        },
        // banner图展示的dot所需数据
        banner_dot: function (){

        }
    },
    // 实例创建完成后进行页面初始化操作
    created () {
        // 加入banner图dot索引属性若有背景图数据则默认从第一个,否则设为-1没有图片
        this.banner_dot_index=this.banner_imgs.length==0?-1:0
    },
    methods: {
        
    },
    
})
// 商品组件
Vue.component('shop-list',{
    props: {
        main:Object,
        items:Object
    },
    template:`
    <div>
        <div class="prod-items">
            <div class="box-hd">
                <h3 class="title">{{main.name}}</h3>
            </div>
        <div class="item">
            <a :href="main.url">
                <img :src="main.img_src" :alt="main.name">
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
    `
})