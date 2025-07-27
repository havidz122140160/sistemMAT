from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AsetViewSet, LokasiViewSet, KlasifikasiViewSet ,generate_kib_b_pdf

router = DefaultRouter()
router.register(r'aset', AsetViewSet)
router.register(r'lokasi', LokasiViewSet)
router.register(r'klasifikasi', KlasifikasiViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('laporan/kib-b/<int:unit_bidang_id>/', generate_kib_b_pdf, name='cetak-kib-b'),
]