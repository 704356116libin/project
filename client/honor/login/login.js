/*
 *底部导航组件
 */
Vue.component('my-footer', {
    props: {
        href: String,
        content: String
    },
    template: '<a rel="nofollow" target="_blank" href="{{this.href}}">{{this.content}}</a>'
})
var footer = new Vue({
    el: '#footer-2013',
    data: {
        data:[
            {
                href: "//www.jd.com/intro/about.aspx",
                content: "关于我们"
            },
            {
                href: "//www.jd.com/contact/",
                content: "联系我们"
            },
            {
                href: "//www.jd.com/contact/",
                content: "人才招聘"
            },
            {
                href: "//www.jd.com/789hjk/",
                content: "商家入驻"
            },
            {
                href: "//www.jd.com/54645/",
                content: "广告服务"
            },
            {
                href: "//www.jd.com/12312/",
                content: "手机京东"
            },
            {
                href: "//club.jd.com/links.aspx",
                content: "友情链接"
            },
            {
                href: "//media.jd.com/",
                content: "销售联盟"
            }
        ]
    }
})