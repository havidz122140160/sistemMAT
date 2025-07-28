from django.contrib import admin
from .models import (
    Aset, RincianBarang, Akun, Kelompok, Jenis, Objek, RincianObjek, 
    SubRincianObjek, SubSubRincianObjek, Provinsi, Kota, UnitBidang, Bidang, Pekerjaan, Kegiatan, SubKegiatan
)

@admin.register(RincianBarang)
class RincianBarangAdmin(admin.ModelAdmin):
    search_fields = ('nama_barang', 'kode_lengkap')

@admin.register(SubSubRincianObjek)
class SubSubRincianObjekAdmin(admin.ModelAdmin):
    search_fields = ('nama',)

@admin.register(UnitBidang)
class UnitBidangAdmin(admin.ModelAdmin):
    search_fields = ('nama_unit',)

@admin.register(Pekerjaan)
class PekerjaanAdmin(admin.ModelAdmin):
    search_fields = ('nama_pekerjaan',)

@admin.register(Kegiatan)
class KegiatanAdmin(admin.ModelAdmin):
    search_fields = ('nama_kegiatan',)

@admin.register(SubKegiatan)
class SubKegiatanAdmin(admin.ModelAdmin):
    search_fields = ('nama_sub_kegiatan',)

@admin.register(Aset)
class AsetAdmin(admin.ModelAdmin):
    readonly_fields = ('kode_aset',)
    search_fields = ('klasifikasi', 'unit_bidang')
    list_display = ('nama_barang', 'kode_aset', 'klasifikasi', 'unit_bidang', 'status')

# Daftar Model Hirarki
admin.site.register(Akun)
admin.site.register(Kelompok)
admin.site.register(Jenis)
admin.site.register(Objek)
admin.site.register(RincianObjek)
admin.site.register(SubRincianObjek)

# Daftar Model Lokasi
admin.site.register(Provinsi)
admin.site.register(Kota)
admin.site.register(Bidang)