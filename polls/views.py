from django.http import HttpResponse, Http404
from django.shortcuts import render, get_object_or_404
from django.template import loader
from django.utils import timezone

from .models import Question

'''
django视图以及数据库基本测试--返回问题的列表
'''
def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('polls/index.html')
    context = {
        'latest_question_list': latest_question_list,
    }
    return HttpResponse(template.render(context, request))
'''
访问单个问题详情
'''
def detail(request, question_id):
    question = get_object_or_404(Question,pk=question_id)
    #get_list_or_404()函数
    return render(request, 'polls/detail.html', {'question': question})

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
def addQuestion(request):
    q=Question(question_text="this is content",pub_date=timezone.now())
    q.save()
    return HttpResponse("问题创建成功")