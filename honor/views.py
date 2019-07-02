from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return HttpResponse("您好这是准备展示honor的")
def hello_honor(request):
    return HttpResponse("hello_honor")