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