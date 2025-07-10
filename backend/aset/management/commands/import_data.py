import csv
from django.core.management.base import BaseCommand
from django.core.exceptions import ObjectDoesNotExist
from aset.models import Akun, Kelompok, Jenis, Objek, RincianObjek, SubRincianObjek, SubSubRincianObjek, RincianBarang

class Command(BaseCommand):
    help = 'Import data dari CSV ke database'

    def add_arguments(self, parser):
        parser.add_argument('--hirarki', type=str, help='Path ke file CSV untuk hirarki kode barang')
        parser.add_argument('--barang', type=str, help='Path ke file CSV untuk data barang')

    def handle(self, *args, **kwargs):
        if kwargs['hirarki']:
            self.import_hirarki(kwargs['hirarki'])
        elif kwargs['barang']:
            self.import_barang(kwargs['barang'])
        else:
            self.stdout.write(self.style.ERROR('File yang diimpor tideak sesuai spesifikasi. Gunakan --hirarki atau --barang.'))
    
    def import_hirarki(self, file_path):
        self.stdout.write(self.style.SUCCESS('Memulai impor hirarki kode barang dari {}'.format(file_path)))
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    level = int(row['level'])
                    kode_parts = row['kode'].split('.')
                    nama = row['nama_item']

                    if level == 1:
                        Akun.objects.get_or_create(kode=kode_parts[0], defaults={'nama': nama})
                    elif level == 2:
                        parent = Akun.objects.get(kode=kode_parts[0])
                        Kelompok.objects.get_or_create(akun=parent, kode=kode_parts[1], defaults={'nama': nama})
                    elif level == 3:
                        akun_parent = Akun.objects.get(kode=kode_parts[0])
                        kelompok_parent = Kelompok.objects.get(akun=akun_parent, kode=kode_parts[1])
                        Jenis.objects.get_or_create(kelompok=kelompok_parent, kode=kode_parts[2], defaults={'nama': nama}) 
                    elif level == 4:
                        akun_parent = Akun.objects.get(kode=kode_parts[0])
                        kelompok_parent = Kelompok.objects.get(akun=akun_parent, kode=kode_parts[1])
                        jenis_parent = Jenis.objects.get(kelompok=kelompok_parent, kode=kode_parts[2])
                        Objek.objects.get_or_create(jenis=jenis_parent, kode=kode_parts[3], defaults={'nama': nama})
                    elif level == 5:
                        akun_parent = Akun.objects.get(kode=kode_parts[0])
                        kelompok_parent = Kelompok.objects.get(akun=akun_parent, kode=kode_parts[1])
                        jenis_parent = Jenis.objects.get(kelompok=kelompok_parent, kode=kode_parts[2])
                        objek_parent = Objek.objects.get(jenis=jenis_parent, kode=kode_parts[3])
                        RincianObjek.objects.get_or_create(objek=objek_parent, kode=kode_parts[4], defaults={'nama': nama})
                    elif level == 6:
                        akun_parent = Akun.objects.get(kode=kode_parts[0])
                        kelompok_parent = Kelompok.objects.get(akun=akun_parent, kode=kode_parts[1])
                        jenis_parent = Jenis.objects.get(kelompok=kelompok_parent, kode=kode_parts[2])
                        objek_parent = Objek.objects.get(jenis=jenis_parent, kode=kode_parts[3])
                        rincian_objek_parent = RincianObjek.objects.get(objek=objek_parent, kode=kode_parts[4])
                        SubRincianObjek.objects.get_or_create(rincian_objek=rincian_objek_parent, kode=kode_parts[5], defaults={'nama': nama})
                    elif level == 7:
                        akun_parent = Akun.objects.get(kode=kode_parts[0])
                        kelompok_parent = Kelompok.objects.get(akun=akun_parent, kode=kode_parts[1])
                        jenis_parent = Jenis.objects.get(kelompok=kelompok_parent, kode=kode_parts[2])
                        objek_parent = Objek.objects.get(jenis=jenis_parent, kode=kode_parts[3])
                        rincian_objek_parent = RincianObjek.objects.get(objek=objek_parent, kode=kode_parts[4])
                        sub_rincian_objek_parent = SubRincianObjek.objects.get(rincian_objek=rincian_objek_parent, kode=kode_parts[5])
                        SubSubRincianObjek.objects.get_or_create(sub_rincian_objek=sub_rincian_objek_parent, kode=kode_parts[6], defaults={'nama': nama})
                    
            self.stdout.write(self.style.SUCCESS('Impor hirarki kode barang BERHASIL.'))
        except FileNotFoundError:
            self.stdout.write(self.style.ERROR(f'File {file_path} tidak ditemukan. Pastikan path file benar.'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Kesalahan saat mengimpor hirarki kode barang: {e}'))
    
    def import_barang(self, file_path):
        self.stdout.write(self.style.SUCCESS('Memulai impor hirarki kode barang dari {}'.format(file_path)))
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    kode_barang_lengkap = row['kode_barang_lengkap']
                    nama_barang_spesifik = row['nama_barang_spesifik']

                    kode_parts = kode_barang_lengkap.split('.')

                    try:
                        akun = Akun.objects.get(kode=kode_parts[0])
                        kelompok = Kelompok.objects.get(akun=akun, kode=kode_parts[1])
                        jenis = Jenis.objects.get(kelompok=kelompok, kode=kode_parts[2])
                        objek = Objek.objects.get(jenis=jenis, kode=kode_parts[3])
                        rincian_objek = RincianObjek.objects.get(objek=objek, kode=kode_parts[4])
                        sub_rincian_objek = SubRincianObjek.objects.get(rincian_objek=rincian_objek, kode=kode_parts[5])
                        ssr_obj = SubSubRincianObjek.objects.get(sub_rincian_objek=sub_rincian_objek, kode=kode_parts[6])

                        RincianBarang.objects.get_or_create(
                            sub_sub_rincian_objek=ssr_obj,
                            nama_barang=nama_barang_spesifik
                        )
                    except ObjectDoesNotExist:
                        self.stdout.write(self.style.WARNING(f'Hirarki untuk kode {kode_barang_lengkap} tidak ditemukan. Melwatkan {nama_barang_spesifik}. Pastikan semua bagian hirarki sudah ada di database.'))
                        continue

            self.stdout.write(self.style.SUCCESS('Impor hirarki kode barang BERHASIL.'))
        except FileNotFoundError:
            self.stdout.write(self.style.ERROR(f'File {file_path} tidak ditemukan. Pastikan path file benar.'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Kesalahan saat mengimpor hirarki kode barang: {e}'))