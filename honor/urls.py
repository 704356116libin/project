from django.urls import path
from .import views
urlpatterns=[
    path('',views.index,name='index'),
    path('hello_honor',views.hello_honor,name='hello_honor'),
  
]