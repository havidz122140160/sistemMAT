from rest_framework import viewsets
from .models import Aset, Lokasi, SubSubRincianObjek
from .serializers import AsetSerializer, LokasiDetailSerializer, KlasifikasiDetailSerializer

class AsetViewSet(viewsets.ModelViewSet):
    queryset = Aset.objects.all().order_by('-dibuat_pada')
    serializer_class = AsetSerializer

class LokasiViewSet(viewsets.ModelViewSet):
    queryset = Lokasi.objects.all()
    serializer_class = LokasiDetailSerializer

class KlasifikasiViewSet(viewsets.ModelViewSet):
    queryset = SubSubRincianObjek.objects.all()
    serializer_class = KlasifikasiDetailSerializer