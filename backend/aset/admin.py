from django.contrib import admin
from .models import RincianBarang, Aset, Akun, Kelompok, Jenis, Objek, RincianObjek, SubRincianObjek, SubSubRincianObjek

@admin.register(RincianBarang)
class RincianBarangAdmin(admin.ModelAdmin):
    search_fields = ('nama_barang', 'kode_lengkap')

@admin.register(Aset)
class AsetAdmin(admin.ModelAdmin):
    readonly_fields = ('kode_aset',)

    autocomplete_fields = ('rincian_barang',)
# Register your models here.
