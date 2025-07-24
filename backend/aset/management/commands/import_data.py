import csv
from django.core.management.base import BaseCommand
from django.core.exceptions import ObjectDoesNotExist
from aset.models import Akun, Kelompok, Jenis, Objek, RincianObjek, SubRincianObjek, SubSubRincianObjek, RincianBarang

class Command(BaseCommand):
    help = 'Mengimpor data dari file CSV ke dalam database'

    def add_arguments(self, parser):
        parser.add_argument('--hirarki', type=str, help='Lokasi file CSV untuk data hirarki kode')
        parser.add_argument('--barang', type=str, help='Lokasi file CSV untuk data daftar barang')

    def handle(self, *args, **kwargs):
        if kwargs['hirarki']:
            self.import_hirarki(kwargs['hirarki'])
        elif kwargs['barang']:
            self.import_barang(kwargs['barang'])
        else:
            self.stdout.write(self.style.ERROR('Tolong spesifikasikan file yang mau diimpor dengan --hirarki atau --barang'))

    def import_hirarki(self, file_path):
        self.stdout.write(self.style.SUCCESS(f'Memulai impor hirarki dari {file_path}...'))
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    level = int(row['level'])
                    kode_parts = row['kode_lengkap'].split('.')
                    nama = row['nama_item']

                    try:
                        if level == 1:
                            Akun.objects.get_or_create(kode=kode_parts[0], defaults={'nama': nama})
                        elif level == 2:
                            parent = Akun.objects.get(kode=kode_parts[0])
                            Kelompok.objects.get_or_create(akun=parent, kode=kode_parts[1], defaults={'nama': nama})
                        elif level == 3:
                            parent = Kelompok.objects.get(akun__kode=kode_parts[0], kode=kode_parts[1])
                            Jenis.objects.get_or_create(kelompok=parent, kode=kode_parts[2], defaults={'nama': nama})
                        elif level == 4:
                            parent = Jenis.objects.get(kelompok__akun__kode=kode_parts[0], kelompok__kode=kode_parts[1], kode=kode_parts[2])
                            Objek.objects.get_or_create(jenis=parent, kode=kode_parts[3], defaults={'nama': nama})
                        elif level == 5:
                            parent = Objek.objects.get(jenis__kelompok__akun__kode=kode_parts[0], jenis__kelompok__kode=kode_parts[1], jenis__kode=kode_parts[2], kode=kode_parts[3])
                            RincianObjek.objects.get_or_create(objek=parent, kode=kode_parts[4], defaults={'nama': nama})
                        elif level == 6:
                            parent = RincianObjek.objects.get(objek__jenis__kelompok__akun__kode=kode_parts[0], objek__jenis__kelompok__kode=kode_parts[1], objek__jenis__kode=kode_parts[2], objek__kode=kode_parts[3], kode=kode_parts[4])
                            SubRincianObjek.objects.get_or_create(rincian_objek=parent, kode=kode_parts[5], defaults={'nama': nama})
                        elif level == 7:
                            parent = SubRincianObjek.objects.get(rincian_objek__objek__jenis__kelompok__akun__kode=kode_parts[0], rincian_objek__objek__jenis__kelompok__kode=kode_parts[1], rincian_objek__objek__jenis__kode=kode_parts[2], rincian_objek__objek__kode=kode_parts[3], rincian_objek__kode=kode_parts[4], kode=kode_parts[5])
                            SubSubRincianObjek.objects.get_or_create(sub_rincian_objek=parent, kode=kode_parts[6], defaults={'nama': nama})
                    except ObjectDoesNotExist:
                        self.stdout.write(self.style.WARNING(f"Induk untuk kode '{row['kode_lengkap']}' tidak ditemukan. Melewatkan..."))
                        continue
            self.stdout.write(self.style.SUCCESS('Impor data hirarki berhasil!'))
        except FileNotFoundError:
            self.stdout.write(self.style.ERROR(f'File tidak ditemukan di {file_path}'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Terjadi error saat impor hirarki: {e}'))

    def import_barang(self, file_path):
        self.stdout.write(self.style.SUCCESS(f'Memulai DEBUG impor daftar barang dari {file_path}. Sabar ya KAMPANG!'))
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                reader = csv.DictReader(file)
                for i, row in enumerate(reader, 1):
                    kode_barang_lengkap = row['kode_barang_lengkap'].strip()
                    nama_barang_spesifik = row['nama_barang_spesifik'].strip()
                    kode_parts = kode_barang_lengkap.split('.')

                    self.stdout.write(f"\n--- Memproses Baris {i}: {nama_barang_spesifik} ({kode_barang_lengkap}) ---")
                    
                    try:
                        # DEBUGGING: Cek setiap level satu per satu
                        akun = Akun.objects.get(kode=kode_parts[0])
                        self.stdout.write(f"  [OK] Akun '{kode_parts[0]}' ditemukan.")

                        kelompok = Kelompok.objects.get(akun=akun, kode=kode_parts[1])
                        self.stdout.write(f"  [OK] Kelompok '{kode_parts[1]}' ditemukan.")

                        jenis = Jenis.objects.get(kelompok=kelompok, kode=kode_parts[2])
                        self.stdout.write(f"  [OK] Jenis '{kode_parts[2]}' ditemukan.")

                        objek = Objek.objects.get(jenis=jenis, kode=kode_parts[3])
                        self.stdout.write(f"  [OK] Objek '{kode_parts[3]}' ditemukan.")

                        rincian_objek = RincianObjek.objects.get(objek=objek, kode=kode_parts[4])
                        self.stdout.write(f"  [OK] Rincian Objek '{kode_parts[4]}' ditemukan.")

                        sub_rincian_objek = SubRincianObjek.objects.get(rincian_objek=rincian_objek, kode=kode_parts[5])
                        self.stdout.write(f"  [OK] Sub Rincian Objek '{kode_parts[5]}' ditemukan.")

                        ssro_obj = SubSubRincianObjek.objects.get(sub_rincian_objek=sub_rincian_objek, kode=kode_parts[6])
                        self.stdout.write(f"  [OK] Sub-Sub Rincian Objek '{kode_parts[6]}' ditemukan.")

                        # Jika semua ditemukan, baru buat RincianBarang
                        RincianBarang.objects.get_or_create(
                            sub_sub_rincian_objek=ssro_obj,
                            defaults={'nama_barang': nama_barang_spesifik}
                        )
                        self.stdout.write(self.style.SUCCESS(f"  [BERHASIL] Data '{nama_barang_spesifik}' berhasil diimpor."))

                    except ObjectDoesNotExist as e:
                        self.stdout.write(self.style.ERROR(f"  [GAGAL] Proses berhenti. Error: {e}"))
                        self.stdout.write(self.style.WARNING(f"  Penyebab: Salah satu level di atas GAGAL ditemukan di database."))
                        continue

            self.stdout.write(self.style.SUCCESS('\nProses impor daftar barang selesai. Bersyukur Kau Bujang.'))
        except FileNotFoundError:
            self.stdout.write(self.style.ERROR(f'File tidak ditemukan di {file_path}'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Terjadi error tak terduga: {e}'))