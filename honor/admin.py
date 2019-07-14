from django.contrib import admin

# Register your models here.
from .models import *
admin.site.register(GoodsClass)#将商品类注册至后台管理中
admin.site.register(Goods)#将商品注册至后台管理中
admin.site.register(Factory)#将商品注册至后台管理中
admin.site.register(GoodsFactory)#将商品注册至后台管理中