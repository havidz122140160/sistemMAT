from django.db import models
from django.contrib.auth.models import User

# Hirarki untuk Kode Barang
class Akun(models.Model):
    kode = models.CharField(max_length=10, unique=True)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.kode} - {self.nama}"

class Kelompok(models.Model):
    akun = models.ForeignKey(Akun, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.akun.kode}.{self.kode} - {self.nama}"

class Jenis(models.Model):
    kelompok = models.ForeignKey(Kelompok, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.kelompok.kelompok.akun.kode}.{self.kelompok.kode}.{self.kode} - {self.nama}"

class Objek(models.Model):
    jenis = models.ForeignKey(Jenis, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return self.nama

class RincianObjek(models.Model):
    objek = models.ForeignKey(Objek, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return self.nama

class SubRincianObjek(models.Model):
    rincian_objek = models.ForeignKey(RincianObjek, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return self.nama

class SubSubRincianObjek(models.Model):
    sub_rincian_objek = models.ForeignKey(SubRincianObjek, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)

    def __str__(self):
        return self.nama

# Model "Kamus" Pusat untuk Barang
class RincianBarang(models.Model):
    sub_sub_rincian_objek = models.ForeignKey(SubSubRincianObjek, on_delete=models.CASCADE)
    nama_barang = models.CharField(max_length=255, unique=True)
    kode_lengkap = models.CharField(max_length=100, unique=True, blank=True, editable=False)

    def save(self, *args, **kwargs):
        s = self.sub_sub_rincian_objek.sub_rincian_objek.rincian_objek.objek.jenis.kelompok
        kode_akun = s.akun.kode
        kode_kelompok = s.kode
        kode_jenis = self.sub_sub_rincian_objek.sub_rincian_objek.rincian_objek.objek.jenis.kode
        kode_objek = self.sub_sub_rincian_objek.sub_rincian_objek.rincian_objek.objek.kode
        kode_rincian = self.sub_sub_rincian_objek.sub_rincian_objek.rincian_objek.kode
        kode_sub_rincian = self.sub_sub_rincian_objek.sub_rincian_objek.kode
        kode_sub_sub_rincian = self.sub_sub_rincian_objek.kode
        self.kode_lengkap = f"{kode_akun}.{kode_kelompok}.{kode_jenis}.{kode_objek}.{kode_rincian}.{kode_sub_rincian}.{kode_sub_sub_rincian}"
        super().save(*args, **kwargs)

    def __str__(self):
        return self.nama_barang

# Hirarki untuk Lokasi
class Provinsi(models.Model):
    kode = models.CharField(max_length=10, unique=True)
    nama = models.CharField(max_length=100)
    def __str__(self): return self.nama

class Kota(models.Model):
    provinsi = models.ForeignKey(Provinsi, on_delete=models.CASCADE)
    kode = models.CharField(max_length=10)
    nama = models.CharField(max_length=100)
    def __str__(self): return self.nama
    
class Lokasi(models.Model):
    kota = models.ForeignKey(Kota, on_delete=models.CASCADE)
    nama_lokasi = models.CharField(max_length=100)
    def __str__(self): return self.nama_lokasi

class UnitBidang(models.Model):
    nama_unit = models.CharField(max_length=255, unique=True)
    nama_kepala_dinas = models.CharField(max_length=255)
    nip_kepala_dinas = models.CharField(max_length=50)

    def __str__(self):
        return self.nama_unit

# Model Utama Aset
class Aset(models.Model):
    STATUS_CHOICES = [
        ('Baik', 'Baik'),
        ('Perbaikan', 'Perbaikan'),
        ('Rusak', 'Rusak'),
        ('Hilang', 'Hilang'),
    ]

    # --- Data Klasifikasi & Nama ---
    klasifikasi = models.ForeignKey(SubSubRincianObjek, on_delete=models.PROTECT, verbose_name="Klasifikasi Barang")
    nama_barang = models.CharField(max_length=260, verbose_name="Nama/Merek/Tipe Barang")

    # --- Field Baru dari Laporan ---
    nomor_register = models.CharField(max_length=50, blank=True, null=True)
    ukuran = models.CharField(max_length=50, blank=True, null=True)
    bahan = models.CharField(max_length=100, blank=True, null=True)
    nomor_pabrik = models.CharField(max_length=100, blank=True, null=True, verbose_name="Nomor Pabrik/Chasis")
    nomor_rangka = models.CharField(max_length=100, blank=True, null=True)
    nomor_mesin = models.CharField(max_length=100, blank=True, null=True)
    keterangan = models.TextField(blank=True, null=True)

    unit_bidang = models.ForeignKey(UnitBidang, on_delete=models.PROTECT, null=True, blank=True)

    # --- Data Perolehan & Lokasi ---
    lokasi = models.ForeignKey(Lokasi, on_delete=models.PROTECT)
    didaftarkan_oleh = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    tanggal_pembelian = models.DateField()
    harga_pembelian = models.DecimalField(max_digits=15, decimal_places=2)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Baik')
    
    # --- Kode Aset Otomatis ---
    kode_aset = models.CharField(max_length=100, unique=True, blank=True, editable=False)
    
    terakhir_diperbarui = models.DateTimeField(auto_now=True)
    dibuat_pada = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.nama_barang} ({self.kode_aset})"

    def save(self, *args, **kwargs):
        if not self.pk:
            # --- Logika pembuatan kode aset otomatis ---
            kode_provinsi = self.lokasi.kota.provinsi.kode
            kode_kota = self.lokasi.kota.kode

            s = self.klasifikasi.sub_rincian_objek.rincian_objek.objek.jenis.kelompok
            kode_akun = s.akun.kode
            kode_kelompok = s.kode
            kode_jenis = self.klasifikasi.sub_rincian_objek.rincian_objek.objek.jenis.kode
            kode_objek = self.klasifikasi.sub_rincian_objek.rincian_objek.objek.kode
            kode_rincian = self.klasifikasi.sub_rincian_objek.rincian_objek.kode
            kode_sub_rincian = self.klasifikasi.sub_rincian_objek.kode
            kode_sub_sub_rincian = self.klasifikasi.kode
            
            kode_barang_lengkap = f"{kode_akun}.{kode_kelompok}.{kode_jenis}.{kode_objek}.{kode_rincian}.{kode_sub_rincian}.{kode_sub_sub_rincian}"
            tahun_pembelian = str(self.tanggal_pembelian.year)
            
            nomor_terakhir = Aset.objects.filter(klasifikasi=self.klasifikasi).count()
            nomor_urut_baru = nomor_terakhir + 1
            nomor_urut_terformat = f"{nomor_urut_baru:06d}"

            self.kode_aset = f"{kode_provinsi}.{kode_kota}.{kode_barang_lengkap}.{tahun_pembelian}.{nomor_urut_terformat}"
        
        super().save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Daftar Aset"
        ordering = ['-dibuat_pada']