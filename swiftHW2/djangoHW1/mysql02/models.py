from django.db import models
from django.forms import ModelForm


# Create your models here.
class UserInfo(models.Model):
    user = models.CharField(max_length=32)
    pwd = models.CharField(max_length=32)

    def __str__(self):
        return self.user


class UserForm(ModelForm):

    class Meta:
        model = UserInfo
        fields = ['user', 'pwd']
