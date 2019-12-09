from django.utils.timezone import now
from rest_framework import serializers
from mysql02.models import UserInfo


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = ('user', 'pwd')

    def get_days_since_created(obj):
        return (now() - obj.created).days
