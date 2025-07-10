from django.shortcuts import render
from rest_framework import generics
from .models import Aset, RincianBarang, Lokasi, Akun, Kelompok, Jenis, Objek, RincianObjek, SubRincianObjek, SubSubRincianObjek
from .serializer import AsetSerializer
# LokasiSerializer, AkunSerializer, KelompokSerializer, JenisSerializer, ObjekSerializer, RincianObjekSerializer, SubRincianObjekSerializer, SubSubRincianObjekSerializer

class AsetListCreateView(generics.ListCreateAPIView):
    queryset = Aset.objects.all()
    serializer_class = AsetSerializer

# Create your views here.
