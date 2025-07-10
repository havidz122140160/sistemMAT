from rest_framework import serializers
from .models import Aset 

class AsetSerializer(serializers.ModelSerializer):
    nama_barang = serializers.CharField(source='rincian_barang.nama_barang', read_only=True)
    nama_lokasi = serializers.CharField(source='lokasi.nama_lokasi', read_only=True)

    class Meta:
        model = Aset
        fields = [
            'id', 
            'kode_aset', 
            'nama_barang',
            'nama_lokasi',
            'rincian_barang',
            'lokasi',
            'status', 
            'tanggal_pembelian', 
            'harga_pembelian',
            'didaftarkan_oleh'
        ]
        
        read_only_fields = ['kode_aset']