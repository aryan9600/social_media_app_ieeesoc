from django.contrib import admin
from django.urls import path
from .views import login, sample_api

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/login', login),
    path('api/sample_api', sample_api)
]
