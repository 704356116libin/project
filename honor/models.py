from django.db import models

# Create your models here.
class GoodsClass(models.Model):
    name=models.CharField(max_length=15)#商品分类名
    is_show=models.IntegerField()#是否展示
    parent_id=models.IntegerField()#父级id
    created_at = models.DateTimeField('创建时间')
    updated_at = models.DateTimeField('更新时间')