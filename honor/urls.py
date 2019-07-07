from django.urls import path
from .import views
urlpatterns=[
    path('',views.index,name='index'),
    path('hello_honor',views.hello_honor,name='hello_honor'),
    path('add_goods_class',views.add_goods_class,name='add_goods_class'),#创建商品分类
    path('search_goods_class',views.search_goods_class,name='search_goods_class'),#查询商品分类
    path('add_goods',views.add_goods,name='add_goods')#添加商品
]