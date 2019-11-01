from django.db import models

# Create your models here.
'''
站内用户模型
'''
class User(models.Model):
    
    # 定义模型字段&自身方法
    password = models.CharField(max_length = 200)  #用户密码字段
    username = models.CharField(max_length = 150) #用户名
    email = models.CharField(max_length = 254,default = '') #用户邮箱
    phone = models.CharField(max_length = 20) #用户手机号
    token = models.CharField(max_length = 150,default = '') #用户登录凭证
    wx_oppenid = models.CharField(max_length = 150,default = '') #扩展微信登录字段
    ali_oppenid = models.CharField(max_length = 150,default = '')#扩展支付宝登录字段
    qq_oppenid = models.CharField(max_length = 150,default = '')#扩展qq登录字段
    git_hub_oppenid = models.CharField(max_length = 150,default = '')#扩展github登录字段
    header_img = models.CharField(max_length = 255,default = '') #用户头像字段
    last_login = models.CharField(max_length = 150,default = '') #上次登录时间 
    created_at = models.CharField(max_length = 150,default = '') #记录创建时间
    updated_at = models.CharField(max_length = 150,default = '') #记录更新时间
    class Meta:
        db_table = 'users'

    def __str__(self):
        return self.username