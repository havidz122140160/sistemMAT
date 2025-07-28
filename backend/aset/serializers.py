from rest_framework import serializers
from .models import (
    Aset,
    Akun,

    Kelompok,
    Jenis,
    Objek,
    RincianObjek,
    SubRincianObjek,
    SubSubRincianObjek,
    RincianBarang,
    Provinsi,
    Kota,
    UnitBidang,
    Bidang,
    User
)

class AkunSerializer(serializers.ModelSerializer):
    class Meta:
        model = Akun
        fields = '__all__'

class KelompokSerializer(serializers.ModelSerializer):
    class Meta:
        model = Kelompok
        fields = '__all__'

class JenisSerializer(serializers.ModelSerializer):
    class Meta:
        model = Jenis
        fields = '__all__'

class ObjekSerializer(serializers.ModelSerializer):
    class Meta:
        model = Objek
        fields = '__all__'

class RincianObjekSerializer(serializers.ModelSerializer):
    class Meta:
        model = RincianObjek
        fields = '__all__'

class SubRincianObjekSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubRincianObjek
        fields = '__all__'

class SubSubRincianObjekSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubSubRincianObjek
        fields = '__all__'
        
class RincianBarangSerializer(serializers.ModelSerializer):
    class Meta:
        model = RincianBarang
        fields = '__all__'

class ProvinsiSerializer(serializers.ModelSerializer):
    class Meta:
        model = Provinsi
        fields = '__all__'

class KotaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Kota
        fields = '__all__'

class UnitBidangSerializer(serializers.ModelSerializer):
    class Meta:
        model = UnitBidang
        fields = '__all__'

class BidangSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bidang
        fields = '__all__'

class AsetSerializer(serializers.ModelSerializer):
    klasifikasi = SubSubRincianObjekSerializer(read_only=True)
    unit_bidang = UnitBidangSerializer(read_only=True)
    bidang = BidangSerializer(read_only=True)

    klasifikasi_id = serializers.PrimaryKeyRelatedField(
        queryset=SubSubRincianObjek.objects.all(), source='klasifikasi', write_only=True
    )
    unit_bidang_id = serializers.PrimaryKeyRelatedField(
        queryset=UnitBidang.objects.all(), source='unit_bidang', write_only=True
    )
    bidang_id = serializers.PrimaryKeyRelatedField(
        queryset=Bidang.objects.all(), source='bidang', write_only=True, required=False
    )
    didaftarkan_oleh_id = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(), source='didaftarkan_oleh', write_only=True, required=False
    )

    class Meta:
        model = Aset
        fields = [
            'id',
            'kode_aset',
            'nama_barang',
            'klasifikasi',
            'unit_bidang',
            'bidang',
            'klasifikasi_id',
            'unit_bidang_id',
            'bidang_id',
            'didaftarkan_oleh_id',
            'nomor_register',
            'ukuran',
            'bahan',
            'nomor_pabrik',
            'nomor_rangka',
            'nomor_mesin',
            'keterangan',
            'tanggal_pembelian',
            'harga_pembelian',
            'status',
            'dibuat_pada',
            'terakhir_diperbarui',
        ]
        read_only_fields = ['kode_aset', 'dibuat_pada', 'terakhir_diperbarui']