from rest_framework import serializers
from api.models import Product


class ProductSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    title = serializers.CharField(max_length=255)
    price = serializers.CharField(max_length=255)
    striked_price = serializers.CharField(max_length=255)
    image = serializers.CharField(max_length=255)
    vendor =serializers.CharField(max_length=255)



