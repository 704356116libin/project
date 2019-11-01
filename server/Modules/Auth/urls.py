from django.urls import path
from . import views
#命名空间
app_name = 'Auth'
urlpatterns = [
    path('add_user', views.add_user, name='add_user'),
    path('get_normal_user', views.get_normal_user, name='get_normal_user'),
    path('change_password', views.change_password, name='change_password'),
]