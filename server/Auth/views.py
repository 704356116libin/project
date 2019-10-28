from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render
from .models import *
# from ..Application.Until.ResponseUntil import *
from django.core.serializers import serialize
from django.core.serializers.json import DjangoJSONEncoder
from django.db.models import Q
import json
import time
# Create your views here.
'''
模型转为json必须函数
'''
class LazyEncoder(DjangoJSONEncoder):
    def default(self, obj):
        if isinstance(obj, User):
            return str(obj)
        return super().default(obj)
'''
用户登录接口(需要返回用户基础信息)
'''
def login(request):
    # 重新生成用户 token 

    # 将用户基础信息返回给前端
    return HttpResponse(json.dumps({}))
'''
创建用户时进行数据合法性校验,并返回一个字典
'''
# def add_verify(data):
#     # username ,email 唯一性校验
#     # 密码强度校验
#     return verify_dict(True,'校验通过')
'''
创建一个站内用户
'''
def add_user(request):
    data = request.GET
    # verify_data = add_verify(data)
    verify_data = {'status':True,'msg':'校验成功'}
    # 先进行数据合法性校验
    if(verify_data['status']):
        format = '%Y-%m-%d %H:%M:%S'
        u = User(password='123',username='bin',phone='16638638285',created_at=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
        u.save()
        return HttpResponse("用户创建成功")
    else:
        return HttpResponse(verify_data['msg'])
'''
修改用户的密码
'''
def change_password(request):
    # 取出查询的条件
    username = request.POST['username']
    email = request.POST['email']
    u = User.objects.get(Q(username = username)|Q(email = email))
    return HttpResponse({'id':111,'username':u.username})
'''
查询出站内的用户
'''
def get_normal_user(request):
    data = User.objects.filter(Q(is_superuser = 0)|Q(username__startswith = 'l'))
    u = User.objects.get(id =1)
    return HttpResponse(json.dumps({'id':u.id,'username':u.username}))
    return HttpResponse(serialize('json', data, cls=LazyEncoder))
