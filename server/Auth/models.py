from django.db import models

# Create your models here.
'''
站内用户模型
'''
class User(models.Model):
    db_table = 'auth_user'
    # 定义模型字段&自身方法
    password = models.CharField(max_length = 200) 
    last_login = models.DateField() #上次登录时间 
    is_superuser = models.IntegerField() #是否为超级管理员
    username = models.CharField(max_length = 150)
    first_name = models.CharField(max_length = 30) #用户姓
    username = models.CharField(max_length = 150) #用户名
    email = models.CharField(max_length= 254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateField()
    def __str__(self):
        return self.username