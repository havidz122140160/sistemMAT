from rest_framework import serializers
from .models import Aset, Lokasi, SubSubRincianObjek, User

# Serializer untuk menampilkan detail Lokasi
class LokasiDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lokasi
        fields = ['id', 'nama_lokasi']

# Serializer untuk menampilkan detail Klasifikasi
class KlasifikasiDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubSubRincianObjek
        fields = ['id', 'nama']

# Serializer utama untuk Aset
class AsetSerializer(serializers.ModelSerializer):
    lokasi = LokasiDetailSerializer(read_only=True)
    klasifikasi = KlasifikasiDetailSerializer(read_only=True)
    
    lokasi_id = serializers.PrimaryKeyRelatedField(
        queryset=Lokasi.objects.all(), source='lokasi', write_only=True
    )
    klasifikasi_id = serializers.PrimaryKeyRelatedField(
        queryset=SubSubRincianObjek.objects.all(), source='klasifikasi', write_only=True
    )
    didaftarkan_oleh_id = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(), source='didaftarkan_oleh', write_only=True, required=False
    )

    class Meta:
        model = Aset
        fields = [
            'id', 'kode_aset', 'nama_barang', 
            'lokasi', 'lokasi_id', 
            'klasifikasi', 'klasifikasi_id',
            'tanggal_pembelian', 'harga_pembelian', 'status', 'keterangan',
            'nomor_register', 'ukuran', 'bahan', 'nomor_pabrik', 
            'nomor_rangka', 'nomor_mesin', 'didaftarkan_oleh_id'
        ]
        read_only_fields = ['kode_aset']