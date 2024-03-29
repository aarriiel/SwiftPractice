"""djangoHW1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from rest_framework.routers import DefaultRouter

from mysql02 import views

# from mysql02.views import HomeView

router = DefaultRouter()
router.register(r'user', views.UserViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    # url(r'^hello/', views.index),
    # url(r'', HomeView.as_view(), name="home"),
    url(r'^api/', include(router.urls)),
    url(r'^user/login', views.login),
]
