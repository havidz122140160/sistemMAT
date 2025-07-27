from rest_framework import viewsets, filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import Aset, Lokasi, SubSubRincianObjek, UnitBidang
from .serializers import AsetSerializer, LokasiDetailSerializer, KlasifikasiDetailSerializer
from django.http import HttpResponse
from django.template.loader import get_template
from weasyprint import HTML

def generate_kib_b_pdf(request, unit_bidang_id):
    unit_bidang = UnitBidang.objects.get(id=unit_bidang_id)
    asets = Aset.objects.filter(unit_bidang=unit_bidang)

    template = get_template('kib_b_template.html')
    html_string = template.render({'asets': asets, 'unit_bidang': unit_bidang})

    pdf_file = HTML(string=html_string).write_pdf()

    response = HttpResponse(pdf_file, content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="KIB_B_{unit_bidang.nama_unit}.pdf"'
    return response

class AsetViewSet(viewsets.ModelViewSet):
    queryset = Aset.objects.all().order_by('-dibuat_pada')
    serializer_class = AsetSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['lokasi', 'status']
    search_fields = ['nama_barang', 'kode_aset']

class LokasiViewSet(viewsets.ModelViewSet):
    queryset = Lokasi.objects.all()
    serializer_class = LokasiDetailSerializer
    pagination_class = None

class KlasifikasiViewSet(viewsets.ModelViewSet):
    queryset = SubSubRincianObjek.objects.all()
    serializer_class = KlasifikasiDetailSerializer
    pagination_class = None