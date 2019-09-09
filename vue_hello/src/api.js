import axios from 'axios' 
//在api中导入axios
let base = '/v1'

//把整个项目的网络请求都写在这个文件中用export导出

export const getproduct = params => { return axios.get(`${base}/product/info/${params}`) }

//这样写方便管理整个项目的网络请求