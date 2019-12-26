<template>
  <div id="pay_gift_config">
    <el-form ref="form" :model="info" label-width="300px">
      <!-- 赠送vip -->
      <el-form-item label="赠送vip+:">
        <el-radio-group v-model="info.is_open" @change="is_open_change">
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <!-- 赠送天数 -->
      <el-form-item label="赠送天数:">
        <el-input-number
          v-model="info.send_days"
          @change="send_days_change"
          :min="1"
          label="最少为1天，最多365天"
        ></el-input-number>
      </el-form-item>
      <!-- 多少天内不重复赠送 -->
      <el-form-item label="多少天内不重复赠送:">
        <el-input-number
          v-model="info.no_repeat_days"
          @change="no_repeat_days_change"
          :min="1"
          label="多少天内不重复赠送"
        ></el-input-number>
      </el-form-item>
      <!-- 开启接单提醒 -->
      <el-form-item label="开启接单提醒:">
        <el-radio-group
          v-model="info.is_accept_order_notify"
          @change="is_accept_order_notify_change"
        >
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <!-- 评价标签 -->
      <el-form-item label="评价标签:">
        <el-tag
          :key="tag"
          v-for="tag in info.comment_tags"
          closable
          :disable-transitions="false"
          @close="comments_tag_Close(tag)"
        >{{tag}}</el-tag>
        <el-input
          class="input-new-tag"
          v-if="comment_input_visiable"
          v-model="comment_input_value"
          ref="saveTagInput"
          size="small"
          @keyup.enter.native="comments_tag_input_confirm"
          @blur="comments_tag_input_confirm"
        ></el-input>
        <el-button v-else class="button-new-tag" size="small" @click="comments_tag_show_input">+个标签</el-button>
      </el-form-item>
      <!-- 老客户回馈 -->
      <el-form-item label="老客户回馈:">
        <el-radio-group
          v-model="info.is_old_client_feedback"
          @change="is_old_client_feedback_change"
        >
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <!-- 配置策略 -->
      <el-form-item label="配置策略:">
        <el-radio-group v-model="info.config_type" @change="config_type_change">
          <el-radio :label="1">按周</el-radio>
          <el-radio :label="0">按月</el-radio>
        </el-radio-group>
      </el-form-item>

      <template v-for="(v, index) in [1,2]">
        <div :key="index">
          {{index}}{{index}}
          <el-form-item label="策略1:" :data-index="index">
            <el-select v-model="value" placeholder="请选择">
              <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value"
                :disabled="item.disabled"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="赠送类型:">
            <el-radio-group v-model="radio" @change.self="gift_type_change($event)">
              <el-radio :label='gift_type_group(index,"coupon")'>优惠券</el-radio>
              <el-radio :label="gift_type_group(index,'cash')">会员余额</el-radio>
              <el-radio :label="gift_type_group(index,'gift')">赠品</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item >
            <template v-if="show_state == 'coupon'">
              <el-select v-model="value" placeholder="请选择优惠券">
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  :disabled="item.disabled"
                ></el-option>
              </el-select>
              <el-input v-model="input" placeholder="请输入赠送数量"></el-input>
              <el-radio-group v-model="radio">
                <el-radio :label="3">支付完成自动发放</el-radio>
                <el-radio :label="6">确认收货后自动发放</el-radio>
                <el-radio :label="9">分享后自动发放</el-radio>
              </el-radio-group>
            </template>
            <template v-if="show_state == 'cash'">
              <el-radio-group v-model="radio">
                <el-radio :label="3">固定金额</el-radio>
                <el-radio :label="6">按支付比例</el-radio>
              </el-radio-group>
              <el-input v-model="input" placeholder="按支付比例"></el-input>
              <span>会员余额只支持使用微信支付进行且确认收货后进行发放,非会员不能返余额，适合做会员营销接口</span>
            </template>
            <template v-if="show_state == 'gift'">
              <el-select v-model="value" placeholder="请选择赠品">
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  :disabled="item.disabled"
                ></el-option>
              </el-select>
              <el-input v-model="input" placeholder="请输入赠送数量"></el-input>
              <el-radio-group v-model="radio">
                <el-radio :label="3">支付完成自动发放</el-radio>
                <el-radio :label="6">确认收货后自动发放</el-radio>
                <el-radio :label="9">分享后自动发放</el-radio>
              </el-radio-group>
            </template>
          </el-form-item>
        </div>
      </template>

      <!--  -->
      <el-form-item>
        <el-button type="primary" @click="onSubmit">保存</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import qs from "qs";
let post_url = "xxx.com";
export default {
  name: "Element",
  props: {},
  components: {},
  data: function() {
    return {
      //表单提交url
      form_url: post_url,
      //对应的配置记录
      info: {
        is_open: 0, //是否开启赠送vip
        no_repeat_days: 1, //多少天内不重复
        send_days: 1, //赠送vip天数
        is_accept_order_notify: 0, //是否开启接单提醒
        comment_tags: ["相当便宜", "品牌可靠", "好~"],
        is_old_client_feedback: 1, //是否开启老客户回馈
        config_type: 0 //0--按周 1--按月策略选择年月标识
      },
      //评价标签表单相关参数
      comment_input_visiable: false,
      comment_input_value: "",
      //赠送策略数据组
      gift_config_data:[
        {

        }
      ],
      radio: 3,
      options: [
        {
          value: "week",
          label: "黄金糕"
        },
        {
          value: "选项2",
          label: "双皮奶",
          disabled: true
        },
        {
          value: "选项3",
          label: "蚵仔煎"
        },
        {
          value: "选项4",
          label: "龙须面"
        },
        {
          value: "选项5",
          label: "北京烤鸭"
        }
      ],
      value: "",
      input: "",
      show_state:"coupon"
      //优惠券列表组
      //赠品列表组
    };
  },
  methods: {
    onSubmit() {
      let post_data = {
        is_open: this.info.is_open,
        send_days: this.info.send_days,
        no_repeat_days: this.info.no_repeat_days,
        id: this.info.id
      };
      let that = this;
      $.ajax({
        url: this.form_url, //请求的url地址
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: post_data, //参数值
        type: "post", //请求方式
        success: function(res) {
          console.log("onSubmit", res);
          //判断是否保存成功
          if (res.code == 1) {
            that.$message({
              message: "保存成功",
              type: "success"
            });
            location.reload();
          } else {
            that.$message.error(info);
          }
        },
        error: function(err) {
          console.log(err);
          that.$message.error(err);
        }
      });
    },
    /**
     *赠送vip开关
     */
    is_open_change: function(e) {
      console.log("is_open_change", e);
      this.info.is_open = e;
    },
    /**
     * vip+赠送天数   ------=change事件改变
     */
    send_days_change: function(e) {
      console.log("send_days_change", e);
      this.info.send_days = e;
    },
    /**
     * 多少天内不重复赠送 -----change事件改变
     */
    no_repeat_days_change: function(e) {
      console.log("no_repeat_days_change", e);
      this.info.no_repeat_days = e;
    },
    /**
     * 是否开启接单提醒 -----change事件改变
     */
    is_accept_order_notify_change: function(e) {
      console.log("is_accept_order_notify_change", e);
      this.info.is_accept_order_notify = e;
    },
    /**
     * 是否进行老客户回馈 -----change事件改变
     */
    is_old_client_feedback_change: function(e) {
      console.log("is_old_client_feedback_change", e);
      this.info.is_old_client_feedback = e;
    },
    /**
     * 配置策略 -----change事件改变
     */
    config_type_change: function(e) {
      console.log("config_type_change", e);
      this.info.config_type_change = e;
    },
    //=======================评论标签控件===================
    /**
     *评论标签------点击关闭事件
     */
    comments_tag_Close(tag) {
      let comment_tags = this.info.comment_tags;
      //进行弹框确认--删除标签会删除对应的记录--点击量--以及相关数据
      //需要进行后端请求删除评论标签
      comment_tags.splice(comment_tags.indexOf(tag), 1);
    },
    /**
     *显示评论标签输入框
     */
    comments_tag_show_input() {
      this.comment_input_visiable = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    /**
     *评论标签输入框确认
     */
    comments_tag_input_confirm() {
      let comment_input_value = this.comment_input_value;
      //需要进行后端请求添加评论标签
      if (comment_input_value) {
        this.info.comment_tags.push(comment_input_value);
      }
      this.comment_input_visiable = false;
      this.comment_input_value = "";
    },
    //=================================================
    //==================赠品策略的处理逻辑====================
    /**
     * 点击每项赠送类型时的触发事件
     * index:策略索引位
     */
    gift_type_change:function(v){
      //分割赠品类型label str
      let data = v.split('-')
      console.log('gift_type_change',v)
      this.show_state = data[0]
    },
    gift_type_group:function(index,type){
      let str = ''
      switch(type){
        case 'coupon':
          str = 'coupon-'+index
          break
        case 'cash':
          str = 'cash-'+index
          break
        case 'gift':
            str = 'gift-'+index
          break
        default:
          console.log('gift_type_group--出错l')
          break
      }
      return str
    }
  },
  mounted: function() {
    let that = this;
    // $.ajax({
    //   url: this.form_url, //请求的url地址
    //   async: true, //请求是否异步，默认为异步，这也是ajax重要特性
    //   data: {}, //参数值
    //   type: "get", //请求方式
    //   success: function(res) {
    //     if (res.code == 1) {
    //       let info = res.data;
    //赋值配置数据
    that.info.is_open = 1;
    that.info.no_repeat_days = 2;
    that.info.send_days = 3;
    console.log("mounted", that.info);
    //     } else {
    //       that.$message.error("没有数据,请确认");
    //     }
    //   },
    //   error: function(err) {
    //     that.$message.error(err);
    //   }
    // });
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
 <style>
.routeBox {
  background: #fff;
  padding: 10px 20px;
  margin-bottom: 10px;
  font-size: 16px;
}

.routeItem {
  color: #09bb07;
  margin: 0 6px;
}

.routeBox span {
  margin: 0 6px;
}

.routeItem:hover {
  text-decoration: underline;
}

/* 标签样式*/
.el-tag + .el-tag {
  margin-left: 10px;
}

.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}

.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
</style>
