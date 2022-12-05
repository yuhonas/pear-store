from django.db import models

# "title": "2022 HP 14\" HD Laptop, Windows 11, Intel Celeron Dual-Core Processor Up to 2.80GHz, 4GB RAM, 64GB SSD, Chromes OS, Cobalt Blue (Renewed)",
# "price": "$189.80",
# "striked-price": "$199.99",
# "image": "https://m.media-amazon.com/images/I/61Y6qYNGslL._AC_UY218_.jpg",
# "vendor": "HP"

class Product(models.Model):
    title = models.TextField(null = True)
    price = models.CharField(max_length=255, null = True) # TODO: Why would a product NOT have a price
    striked_price = models.CharField(max_length=255, null = True)
    image = models.TextField(null = True)
    vendor = models.TextField(null = True)
