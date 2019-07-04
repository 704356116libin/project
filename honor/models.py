from django.db import models

# Create your models here.
class GoodsClass(models.Model):
    name=models.CharField(max_length=15)#商品分类名
    is_show=models.IntegerField(default=1)#是否展示
    parent_id=models.IntegerField()#父级id
    created_at = models.DateTimeField('创建时间')
    updated_at = models.DateTimeField('更新时间')
    def __str__(self):
        return self.name+'\n'
    # 将属性和属性值转换成dict 列表生成式
    def toDict(self):
        return dict([(attr, getattr(self, attr)) for attr in [f.name for f in self._meta.fields]])#type(self._meta.fields).__name__
