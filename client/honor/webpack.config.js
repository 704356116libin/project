const webpack=require('webpack')

module.exports = {
    devtool:"eval-source-map",
    entry: __dirname+"/login/login.js",
    output: {
        path: __dirname+"/login",
        filename: "login.min.js"
    },
    devServer: {
        contentBase: __dirname,//本地服务器所加载的页面所在的目录
        historyApiFallback: true,//不跳转
        inline: true//实时刷新
    } 
};