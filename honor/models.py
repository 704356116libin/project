from django.db import models
import json
# Create your models here.
class GoodsClass(models.Model):
    name=models.CharField(max_length=15, help_text='分类名称')#商品分类名
    parent_id= models.IntegerField(help_text='父级id',default=0)
    is_show=models.IntegerField(default=1, help_text='商品展示开关')#是否展示
    sort=models.SmallIntegerField( help_text='同级分类权重')
    created_at = models.DateTimeField(help_text='创建时间')
    updated_at = models.DateTimeField(help_text='更新时间')
    class Meta:
        db_table='honor_goods_class'
    def __str__(self):
        return self.name
'''
厂家模型类
'''
class Factory(models.Model):
    name=models.CharField(max_length=100,help_text='厂家名字')
    def __str__(self):
        return self.name  
    class Meta:
        db_table='honor_factory'
'''
商品表
'''
class Goods(models.Model):
    name=models.CharField(max_length=100,help_text='商品名称')
    goodclass=models.ForeignKey(GoodsClass,help_text='所属分类',on_delete=models.CASCADE,verbose_name='class id')
    price=models.IntegerField(help_text='商品价格')
    stock=models.IntegerField(help_text='商品库存')
    desc=models.CharField(max_length=255,help_text='商品描述')
    head_img=models.CharField(max_length=255,help_text='商品主图路径',default='')
    factory=models.ManyToManyField(Factory,through='GoodsFactory')#与厂家多对多关系
    class Meta:
        db_table='honor_goods'
    def __str__(self):
        return self.name
'''
厂家-商品多对对中间表
'''
class GoodsFactory(models.Model):
    goods_id = models.ForeignKey(Goods, on_delete=models.CASCADE)
    factory_id = models.ForeignKey(Factory, on_delete=models.CASCADE)
    date_joined = models.DateField()
    class Meta:
        db_table='goods_factory'

    

