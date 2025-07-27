from django.contrib import admin
from .models import (
    Aset, RincianBarang, Akun, Kelompok, Jenis, Objek, RincianObjek, 
    SubRincianObjek, SubSubRincianObjek, Provinsi, Kota, Lokasi
)
from .models import UnitBidang

@admin.register(RincianBarang)
class RincianBarangAdmin(admin.ModelAdmin):
    search_fields = ('nama_barang', 'kode_lengkap')

@admin.register(SubSubRincianObjek)
class SubSubRincianObjekAdmin(admin.ModelAdmin):
    search_fields = ('nama',)

@admin.register(Lokasi)
class LokasiAdmin(admin.ModelAdmin):
    search_fields = ('nama_lokasi',)

@admin.register(Aset)
class AsetAdmin(admin.ModelAdmin):
    readonly_fields = ('kode_aset',)
    autocomplete_fields = ('klasifikasi', 'lokasi') # bakal diupdate
    list_display = ('nama_barang', 'kode_aset', 'klasifikasi', 'lokasi', 'status')

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
admin.site.register(UnitBidang)