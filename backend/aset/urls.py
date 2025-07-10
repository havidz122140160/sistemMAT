from django.urls import path
from .views import AsetListCreateView
#RincianBarangListCreateView, LokasiListCreateView, AkunListCreateView, KelompokListCreateView, JenisListCreateView, ObjekListCreateView, RincianObjekListCreateView, SubRincianObjekListCreateView, SubSubRincianObjekListCreateView

urlpatterns = [
    path('aset/', AsetListCreateView.as_view(), name='aset-list-create'),
]