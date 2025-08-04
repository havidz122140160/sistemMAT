from django.http import HttpResponse
from django.template.loader import get_template
from weasyprint import HTML
from datetime import date
from rest_framework import viewsets, filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import (
    Aset, Akun, Kelompok, Jenis, Objek, RincianObjek,
    SubRincianObjek, SubSubRincianObjek, RincianBarang, Pekerjaan,
    Kegiatan, SubKegiatan,
    Provinsi, Kota, UnitBidang, Bidang, Ruangan
)
from .serializers import (
    AsetSerializer, AkunSerializer, KelompokSerializer, JenisSerializer,
    ObjekSerializer, RincianObjekSerializer, SubRincianObjekSerializer,
    SubSubRincianObjekSerializer, RincianBarangSerializer, PekerjaanSerializer,
    KegiatanSerializer, SubKegiatanSerializer, ProvinsiSerializer,
    KotaSerializer, UnitBidangSerializer, BidangSerializer, RuanganSerializer
)

class AsetViewSet(viewsets.ModelViewSet):
    queryset = Aset.objects.all().order_by('-dibuat_pada')
    serializer_class = AsetSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    filterset_fields = ['unit_bidang', 'bidang', 'status']
    search_fields = ['nama_barang', 'kode_aset', 'keterangan']
    ordering_fields = ['tanggal_pembelian', 'harga_pembelian', 'nama_barang']

class AkunViewSet(viewsets.ModelViewSet):
    queryset = Akun.objects.all()
    serializer_class = AkunSerializer
    pagination_class = None

class KelompokViewSet(viewsets.ModelViewSet):
    queryset = Kelompok.objects.all()
    serializer_class = KelompokSerializer
    pagination_class = None

class JenisViewSet(viewsets.ModelViewSet):
    queryset = Jenis.objects.all()
    serializer_class = JenisSerializer
    pagination_class = None

class ObjekViewSet(viewsets.ModelViewSet):
    queryset = Objek.objects.all()
    serializer_class = ObjekSerializer
    pagination_class = None

class RincianObjekViewSet(viewsets.ModelViewSet):
    queryset = RincianObjek.objects.all()
    serializer_class = RincianObjekSerializer
    pagination_class = None

class SubRincianObjekViewSet(viewsets.ModelViewSet):
    queryset = SubRincianObjek.objects.all()
    serializer_class = SubRincianObjekSerializer
    pagination_class = None

class SubSubRincianObjekViewSet(viewsets.ModelViewSet):
    queryset = SubSubRincianObjek.objects.all()
    serializer_class = SubSubRincianObjekSerializer
    pagination_class = None
    search_fields = ['nama', 'kode']

class RincianBarangViewSet(viewsets.ModelViewSet):
    queryset = RincianBarang.objects.all()
    serializer_class = RincianBarangSerializer
    pagination_class = None
    search_fields = ['nama_barang']

class PekerjaanViewSet(viewsets.ModelViewSet):
    queryset = Pekerjaan.objects.all()
    serializer_class = PekerjaanSerializer
    pagination_class = None

class KegiatanViewSet(viewsets.ModelViewSet):
    queryset = Kegiatan.objects.all()
    serializer_class = KegiatanSerializer
    pagination_class = None

class SubKegiatanViewSet(viewsets.ModelViewSet):
    queryset = SubKegiatan.objects.all()
    serializer_class = SubKegiatanSerializer
    pagination_class = None

class ProvinsiViewSet(viewsets.ModelViewSet):
    queryset = Provinsi.objects.all()
    serializer_class = ProvinsiSerializer
    pagination_class = None

class KotaViewSet(viewsets.ModelViewSet):
    queryset = Kota.objects.all()
    serializer_class = KotaSerializer
    pagination_class = None

class UnitBidangViewSet(viewsets.ModelViewSet):
    queryset = UnitBidang.objects.all()
    serializer_class = UnitBidangSerializer
    pagination_class = None
    search_fields = ['nama_unit']

class BidangViewSet(viewsets.ModelViewSet):
    queryset = Bidang.objects.all()
    serializer_class = BidangSerializer
    pagination_class = None
    search_fields = ['nama_bidang']
  
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['unit_bidang']

class RuanganViewSet(viewsets.ModelViewSet):
    queryset = Ruangan.objects.all()
    serializer_class = RuanganSerializer
    pagination_class = None
    search_fields = ['nama_ruangan']
  
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['bidang']

def generate_kib_b_pdf(request, unit_bidang_id):
    try:
        unit_bidang = UnitBidang.objects.get(id=unit_bidang_id)
    
        start_date_str = request.GET.get('start_date')
        end_date_str = request.GET.get('end_date', date.today().strftime('%Y-%m-%d')) # Default end_date adalah hari ini

        asets_query = Aset.objects.filter(
            unit_bidang=unit_bidang,
            klasifikasi__sub_rincian_objek__rincian_objek__objek__jenis__kelompok__akun__kode='1',
            klasifikasi__sub_rincian_objek__rincian_objek__objek__jenis__kelompok__kode='3',
            klasifikasi__sub_rincian_objek__rincian_objek__objek__jenis__kode='2'
        )

        # Jika ada start_date, filter berdasarkan rentang tanggal pembelian
        if start_date_str:
            asets_query = asets_query.filter(tanggal_pembelian__range=[start_date_str, end_date_str])

        template = get_template('kib_b_template.html')
        context = {
            'asets': asets_query,
            'unit_bidang': unit_bidang,
            'provinsi': unit_bidang.kota.provinsi,
            'kota': unit_bidang.kota,
            'start_date': start_date_str, 
            'end_date': end_date_str,  
        }
        html_string = template.render(context)
        
        pdf_file = HTML(string=html_string).write_pdf()

        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="KIB_B_{unit_bidang.nama_unit}.pdf"'
        return response
    except UnitBidang.DoesNotExist:
        return HttpResponse("Unit Bidang tidak ditemukan.", status=404)
    
def generate_belanja_modal_pdf(request):
    year = request.GET.get('year', date.today().year)

    asets = Aset.objects.filter(tanggal_pembelian__year=year).order_by(
        'klasifikasi__sub_rincian_objek__rincian_objek__objek__jenis',
        'sub_kegiatan__kegiatan__pekerjaan',
        'sub_kegiatan__kegiatan',
        'sub_kegiatan'
    )

    template = get_template('belanja_modal_template.html')
    context = {
        'asets': asets,
        'end_date': f'31 Desember {year}'
    }
    html_string = template.render(context)
    
    pdf_file = HTML(string=html_string).write_pdf()

    response = HttpResponse(pdf_file, content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="Laporan_Belanja_Modal_{year}.pdf"'
    return response

def generate_kir_pdf(request, ruangan_id):
    try:
        ruangan = Ruangan.objects.get(id=ruangan_id)
        asets = Aset.objects.filter(ruangan=ruangan)

        template = get_template('kir_template.html')
        context = {
            'ruangan': ruangan,
            'asets': asets,
        }
        html_string = template.render(context)
        
        pdf_file = HTML(string=html_string, base_url=request.build_absolute_uri()).write_pdf()

        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="KIR_{ruangan.nama_ruangan}.pdf"'
        return response
    except Ruangan.DoesNotExist:
        return HttpResponse("Ruangan tidak ditemukan.", status=404)