from django.db import models
import json
# Create your models here.
class BaseModel(models.Model):
    class Meta:
        abstract = True

    # 返回self._meta.fields中没有的，但是又是需要的字段名的列表
    # 形如['name','type']
    def getMtMField(self):
        pass

    # 返回需要在json中忽略的字段名的列表
    # 形如['password']
    def getIgnoreList(self):
        pass

    def isAttrInstance(self, attr, clazz):
        return isinstance(getattr(self, attr), clazz)

    def getDict(self):
        fields = []
        for field in self._meta.fields:
            fields.append(field.name)

        d = {}
        import datetime
        for attr in fields:
            if isinstance(getattr(self, attr), datetime.datetime):
                d[attr] = getattr(self, attr).strftime('%Y-%m-%d %H:%M:%S')
            elif isinstance(getattr(self, attr), datetime.date):
                d[attr] = getattr(self, attr).strftime('%Y-%m-%d')
            # 特殊处理datetime的数据
            elif isinstance(getattr(self, attr), BaseModel):
                d[attr] = getattr(self, attr).getDict()
            # 递归生成BaseModel类的dict
            elif self.isAttrInstance(attr, int) or self.isAttrInstance(attr, float) \
                    or self.isAttrInstance(attr, str):
                d[attr] = getattr(self, attr)
            # else:
            #     d[attr] = getattr(self, attr)

        mAttr = self.getMtMField()
        if mAttr is not None:
            for m in mAttr:
                if hasattr(self, m):
                    attlist = getattr(self, m).all()
                    l = []
                    for attr in attlist:
                        if isinstance(attr, BaseModel):
                            l.append(attr.getDict())
                        else:
                            dic = attr.__dict__
                            if '_state' in dic:
                                dic.pop('_state')
                            l.append(dic)
                    d[m] = l
        # 由于ManyToMany类不能存在于_meat.fields，因而子类需要在getMtMFiled中返回这些字段
        if 'basemodel_ptr' in d:
            d.pop('basemodel_ptr')

        ignoreList = self.getIgnoreList()
        if ignoreList is not None:
            for m in ignoreList:
                if d.get(m) is not None:
                    d.pop(m)
        # 移除不需要的字段
        return d

    def toJSON(self):
        import json
        return json.dumps(self.getDict(), ensure_ascii=False).encode('utf-8').decode()
class GoodsClass(BaseModel):
    name=models.CharField(max_length=15, help_text='分类名称')#商品分类名
    parent_id= models.IntegerField(help_text='父级id',default=0)
    is_show=models.IntegerField(default=1, help_text='商品展示开关')#是否展示
    sort=models.SmallIntegerField( help_text='同级分类权重')
    created_at = models.DateTimeField(help_text='创建时间')
    updated_at = models.DateTimeField(help_text='更新时间')
    def __str__(self):
        return self.name
'''
厂家模型类
'''
class Factory(BaseModel):
    name=models.CharField(max_length=100,help_text='厂家名字')
    def __str__(self):
        return self.name  
'''
商品表
'''
class Goods(BaseModel):
    name=models.CharField(max_length=100,help_text='商品名称')
    goodclass=models.ForeignKey(GoodsClass,help_text='所属分类',on_delete=models.CASCADE,verbose_name='class id')
    price=models.IntegerField(help_text='商品价格')
    stock=models.IntegerField(help_text='商品库存')
    desc=models.CharField(max_length=255,help_text='商品描述')
    head_img=models.CharField(max_length=255,help_text='商品主图路径',default='')
    goods=models.ManyToManyField(Factory,through='goods_factory')#与厂家多对多关系
    def __str__(self):
        return self.name
'''
厂家-商品多对对中间表
'''
class GoodsFactory(BaseModel):
    goods_id = models.ForeignKey(Goods, on_delete=models.CASCADE)
    factory_id = models.ForeignKey(Factory, on_delete=models.CASCADE)
    date_joined = models.DateField()
    

