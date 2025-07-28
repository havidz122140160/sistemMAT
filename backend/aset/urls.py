from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AsetViewSet, UnitBidangViewSet, SubSubRincianObjekViewSet ,generate_kib_b_pdf, generate_belanja_modal_pdf
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

router = DefaultRouter()
router.register(r'aset', AsetViewSet)
router.register(r'unit_bidang', UnitBidangViewSet)
router.register(r'klasifikasi', SubSubRincianObjekViewSet)

urlpatterns = [
    path('', include(router.urls)),
]

urlpatterns += [
    path('laporan/kib-b/<int:unit_bidang_id>/', generate_kib_b_pdf, name='cetak-kib-b'),
    path('laporan/belanja-modal/', generate_belanja_modal_pdf, name='cetak-belanja-modal'),
]