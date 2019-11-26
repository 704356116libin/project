<template>
  <el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="普通登陆" name="first">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item v-if="visible" label="新密码">
          <el-input type="password" v-model="form.password" placeholder="请输入新密码">
            <i
              slot="suffix"
              title="显示密码"
              @click="changePass('show')"
              style="cursor:pointer;"
              class="el-icon-eleme"
            ></i>
          </el-input>
        </el-form-item>
        <el-form-item v-else label="新密码">
          <el-input type="text" v-model="form.password" placeholder="请输入新密码">
            <i
              slot="suffix"
              title="隐藏密码"
              @click="changePass('hide')"
              style="cursor:pointer;"
              class="el-icon-eleme"
            ></i>
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login" class="login-btn">登陆</el-button>
        </el-form-item>
      </el-form>
    </el-tab-pane>
    <el-tab-pane label="二维码登陆" name="second">
      <div class="demo-image">
        <div class="block" v-for="fit in fits" :key="fit">
          <el-image style="width: 100px; height: 100px" :src="url" :fit="fit"></el-image>
        </div>
      </div>
    </el-tab-pane>
    <el-date-picker
      v-model="value1"
      type="daterange"
      align="right"
      unlink-panels
      range-separator="至"
      start-placeholder="开始日期"
      end-placeholder="结束日期"
      :picker-options="pickerOptions"
    ></el-date-picker>
    <Menu />
  </el-tabs>
</template>

<script>
import Menu from '@/components/tool/tree/Menu.vue'
import qs from "qs";
export default {
  name: "LoginForm",
  props: {},
  components: {
   Menu
  },
  data() {
    return {
      form: {
        name: "",
        password: ""
      },
      visible: true,
      activeName: "first",
      fits: ["cover"],
      url:
        "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg",
      pickerOptions: {
        shortcuts: [
          {
            text: "最近一周",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: "最近一个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: "最近三个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
              picker.$emit("pick", [start, end]);
            }
          }
        ]
      },
      value1: ""
    };
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    },
    // 表单提交前验证
    validator: function() {},
    login: function() {
      console.log("点击了login");
      let that = this;
      // this.$http.get("/Auth/add_user", {
      //     params: {
      //       a: 12345
      //     }
      //   })
      //   .then(function(response) {
      //     console.log("1111", response);
      //   })
      //   .catch(function(error) {
      //     console.log("2222", error);
      //   });
      //post请求方式
      this.$http
        .post(
          "/Auth/add_user",
          qs.stringify({
            name: that.form.name,
            password: that.form.password
          })
        )
        .then(function(response) {
          console.log("1111", response);
        })
        .catch(function(error) {
          console.log("2222", error);
        });
    },
    changePass(value) {
      this.visible = !(value === "show");
    }, //判断渲染，true:暗文显示，false:明文显示
    demo: function(maxDate, minDate) {
      console.log(maxDate, minDate);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.login-btn {
  width: 100%;
}
</style>
