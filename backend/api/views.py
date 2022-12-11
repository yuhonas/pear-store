from api.models import Product
from api.serializers import ProductSerializer
from django.http import Http404
# from rest_framework.views import APIView
from rest_framework.response import Response
# from django.core.paginator import Paginator
# from rest_framework import status
from rest_framework import generics
from django.contrib.postgres.search import SearchVector

# PAGINATION_SIZE=12


class ProductList(generics.ListAPIView):
    """
    List all products
    """
    # queryset = Product.objects.all()
    serializer_class = ProductSerializer
    # permission_classes = [IsAdminUser]

    def get_queryset(self):
        query = self.request.query_params.get('q')

        if query:
            products = Product.objects.annotate(
              # NOTE: As per the specification, perform a full text search on both title and vendor
              search=SearchVector('title', 'vendor'),
            ).filter(search=query)
        else:
            products = Product.objects.all()

        return products

    # def list(self, request):
    #     # Note the use of `get_queryset()` instead of `self.queryset`
    #     # queryset = self.get_queryset()
    #     queryset = self.paginate_queryset(Product.objects.all())
    #     serializer = ProductSerializer(queryset, many=True)
    #     return Response(serializer.data)


    # def get(self, request, format=None):
        # query = request.query_params.get('q')

        # if query:
        #     # NOTE: Use postgres full text search for better searchability rather
        #     # then a naive pattern search
        #     # See https://docs.djangoproject.com/en/4.1/ref/contrib/postgres/search/
        #     products = Product.objects.filter(title__search=query)
        # else:
        #     products = Product.objects.all()

        # paginator = Paginator(products, PAGINATION_SIZE)

        # page_number = request.query_params.get('page')

        # if page_number:
        #     product_objs = paginator.get_page(page_number)
        # else:
        #     product_objs = paginator.get_page(1)

        # serializer = ProductSerializer(product_objs, many=True)
        # return Response(serializer.data)
