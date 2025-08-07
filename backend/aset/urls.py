from .views import DashboardStatsView
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    AsetViewSet, UnitBidangViewSet, SubSubRincianObjekViewSet, BidangViewSet, RuanganViewSet,
    PekerjaanViewSet, KegiatanViewSet, SubKegiatanViewSet,
    generate_kib_b_pdf, generate_belanja_modal_pdf, generate_kir_pdf)
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

router = DefaultRouter()
router.register(r'aset', AsetViewSet)
router.register(r'unit_bidang', UnitBidangViewSet)
router.register(r'bidang', BidangViewSet)
router.register(r'ruangan', RuanganViewSet)
router.register(r'klasifikasi', SubSubRincianObjekViewSet)
router.register(r'pekerjaan', PekerjaanViewSet)
router.register(r'kegiatan', KegiatanViewSet)
router.register(r'sub_kegiatan', SubKegiatanViewSet)

urlpatterns = [
    path('', include(router.urls)),
]

urlpatterns += [
    path('laporan/kib-b/<int:unit_bidang_id>/', generate_kib_b_pdf, name='cetak-kib-b'),
    path('laporan/belanja-modal/', generate_belanja_modal_pdf, name='cetak-belanja-modal'),
    path('laporan/kir/<int:ruangan_id>/', generate_kir_pdf, name='cetak-kir'),
    path('dashboard-stats/', DashboardStatsView.as_view(), name='dashboard-stats'),
]