from django.contrib import admin

# Register your models here.
from .models import *
admin.site.register(GoodsClass)#将商品类注册至后台管理中