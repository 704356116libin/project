from django.db import models
from django.utils import timezone
import datetime
'''
模型类,里边的属性对应数据库中的字段
'''
class Question(models.Model):
    # 定义模型字段&自身方法
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')
    def __str__(self):
        return self.question_text
    # 自定义函数
    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now

class Choice(models.Model):
    #定义模型字段&自身方法
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0,)
    def __str__(self):
        return self.choice_text