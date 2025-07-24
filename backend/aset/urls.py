from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AsetViewSet, LokasiViewSet, KlasifikasiViewSet

router = DefaultRouter()
router.register(r'aset', AsetViewSet)
router.register(r'lokasi', LokasiViewSet)
router.register(r'klasifikasi', KlasifikasiViewSet)

urlpatterns = [
    path('', include(router.urls)),
]