from django.http import HttpResponse
from django.shortcuts import render, redirect
from rest_framework import viewsets

from .models import UserInfo, UserForm
from django.views.generic import TemplateView
from django.forms.models import modelform_factory

from django.db import IntegrityError
from django.http import JsonResponse
from django.core.exceptions import ObjectDoesNotExist

from mysql02.StatusCode import StatusCode
from mysql02.Serialize import UserSerializer

import json


# class HomeView(TemplateView):
#     template_name = 'home.html'
#
#     def get(self, request):
#         form = UserForm()
#         userList = UserInfo.objects.all().order_by('user')
#         return render(request, self.template_name, locals())
#
#     def post(self, request):
#         form = UserForm(request.POST)
#         if form.is_valid():
#             UserInfo.objects.create(
#                 user=form.cleaned_data.get('user'),
#                 pwd=form.cleaned_data.get('pwd')
#             )
#             return HttpResponse("OK")
#         return render(request, self.template_name, context={'form': form})
#
#
# def index(request):
#     num_user = UserInfo.objects.all().count()
#     context = {
#         'hello': 'Hello World!',
#         'num_user': num_user
#     }
#     return render(request, 'hello.html', context)


class UserViewSet(viewsets.ModelViewSet):
    queryset = UserInfo.objects.all()
    serializer_class = UserSerializer


def login(request):
    response_data = {"statusCode": StatusCode.SUCCESS}

    try:
        req_body = json.loads(request.body.decode("utf-8"))
        username = req_body["username"]
        password = req_body["password"]
        user = UserInfo.objects.get(user=username, pwd=password)
    except KeyError:
        response_data["statusCode"] = StatusCode.INSUFFICIENT_ARGS
    except ObjectDoesNotExist:
        response_data["statusCode"] = StatusCode.VALIDATION_ERR
    return JsonResponse(response_data)
