from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from .models import *
from django.utils import timezone
import json
def index(request):
    return HttpResponse("您好这是准备展示honor的")
def hello_honor(request):
    return HttpResponse("hello_honor")
'''
创建一个商品分类
'''
def add_goods_class(request):
    # 新建一个商品分类
    good_class=GoodsClass(name=request.GET['name'],is_show=1,parent_id=0,sort=0,created_at=timezone.now(),updated_at=timezone.now())
    good_class.save()
    return HttpResponse('分类创建成功')
'''
查询商品类别
'''
def search_goods_class(request):
    # 查询出一条数据
    # record=GoodsClass.objects.get(pk=2)
    # print(record.toJSON())
    # return HttpResponse(record.toJSON())
    data=GoodsClass.objects.all()[:5]
    return HttpResponse(data.toJSON(data))
'''
添加商品
'''
def add_goods(request):
    # 查询出目标id的goods_class
    goods_class=GoodsClass.objects.get(pk=request.GET['class_id'])
    goods=Goods(name='iphone x',price=7999,stock=1000,desc='iphone x 有着非常牛x的功能')
    goods.goodclass=goods_class
    goods.save()
    return HttpResponse('商品创建成功')
# 遍历查询集 调用model属性转换成dict
def queryset_to_json(queryset):
        obj_arr=[]
        for o in queryset:
            obj_arr.append(o.toDict())
        return obj_arr

