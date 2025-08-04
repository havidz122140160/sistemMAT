import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Spinner, Alert, Button, Pagination } from 'react-bootstrap';
import AsetTable from '../components/AsetTable';
import FilterForm from '../components/FilterForm';
import AsetModal from '../components/AsetModal';

const API_BASE_URL = 'http://127.0.0.1:8000/api'; //localhost
//const API_BASE_URL = 'http://10.99.20.123:8000/api'; // IP pake jaringan kantor
//const API_BASE_URL = 'http://10.99.58.165:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://10.99.70.137:8000/api'; // IP pake jaringan ruang TIK
// const API_BASE_URL = 'http://192.168.43.16:8000/api'; // IP pake jaringan HP

function AsetListPage() {
  const [asets, setAsets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const [unitBidangOptions, setUnitBidangOptions] = useState([]);
  const [bidangOptions, setBidangOptions] = useState([]);
  const [ruanganOptions, setRuanganOptions] = useState([]);
  const [klasifikasiOptions, setKlasifikasiOptions] = useState([]);
  const [subKegiatanOptions, setSubKegiatanOptions] = useState([]);

  const [filters, setFilters] = useState({ search: '', unit_bidang: '', bidang: '', ruangan: '', status: '' });
  
  const [showModal, setShowModal] = useState(false);
  const [currentAset, setCurrentAset] = useState({});
  const [isEditing, setIsEditing] = useState(false);
  
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  const fetchAsets = async () => {
    try {
      setLoading(true);
      const params = new URLSearchParams({
        page: page,
        search: filters.search,
        unit_bidang: filters.unit_bidang,
        bidang: filters.bidang,
        ruangan: filters.ruangan,
        status: filters.status,
      }).toString();
      const response = await axios.get(`${API_BASE_URL}/aset/?${params}`);
      setAsets(response.data.results);
      setTotalPages(Math.ceil(response.data.count / 10));
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const fetchOptions = async () => {
    try {
      const [unitBidangRes, bidangRes, klasifikasiRes, subKegiatanRes, ruanganRes] = await Promise.all([
        axios.get(`${API_BASE_URL}/unit_bidang/`),
        axios.get(`${API_BASE_URL}/bidang/`),
        axios.get(`${API_BASE_URL}/klasifikasi/`),
        axios.get(`${API_BASE_URL}/sub_kegiatan/`),
        axios.get(`${API_BASE_URL}/ruangan/`),
      ]);
      
      setUnitBidangOptions(unitBidangRes.data.results || unitBidangRes.data);
      setBidangOptions(bidangRes.data.results || bidangRes.data);
      setKlasifikasiOptions(klasifikasiRes.data.results || klasifikasiRes.data);
      setSubKegiatanOptions(subKegiatanRes.data.results || subKegiatanRes.data);
      setRuanganOptions(ruanganRes.data.results || ruanganRes.data);

    } catch (err) {
      console.error("Gagal mengambil data options:", err);
      setError("Gagal memuat data filter. Coba refresh halaman.");
    }
  };

  useEffect(() => {
    fetchAsets();
  }, [filters, page]);

  useEffect(() => {
    fetchOptions();
  }, []);

  const handleFilterChange = (e) => {
    setFilters({ ...filters, [e.target.name]: e.target.value });
    setPage(1);
  };

  const handlePageChange = (pageNumber) => {
    setPage(pageNumber);
  };

  const handleShow = (aset = null) => {
    if (aset) {
      setIsEditing(true);
      setCurrentAset({
        ...aset,
        unit_bidang_id: aset.unit_bidang.id,
        bidang_id: aset.bidang?.id,
        ruangan_id: aset.ruangan?.id,
        klasifikasi_id: aset.klasifikasi.id,
        sub_kegiatan_id: aset.sub_kegiatan?.id,
      });
    } else {
      setIsEditing(false);
      setCurrentAset({
        merek_tipe: '',
        unit_bidang_id: '',
        bidang_id: '',
        ruangan_id: '',
        klasifikasi_id: '',
        sub_kegiatan_id: '',
        tanggal_pembelian: '',
        harga_pembelian: '',
        status: 'Baik',
        nomor_register: '',
        ukuran: '',
        bahan: '',
        nomor_pabrik: '',
        nomor_rangka: '',
        nomor_mesin: '',
        keterangan: '',
        jenis_belanja: 'LS',
      });
    }
    setShowModal(true);
  };

  const handleClose = () => {
    setShowModal(false);
    setCurrentAset({});
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    const updatedAset = { ...currentAset, [name]: value };

    if (name === 'unit_bidang_id') {
      updatedAset.bidang_id = '';
    }

    setCurrentAset(updatedAset);

    if (name === 'bidang_id') {
      updatedAset.ruangan_id = '';
    }

    setCurrentAset(updatedAset);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const url = isEditing ? `${API_BASE_URL}/aset/${currentAset.id}/` : `${API_BASE_URL}/aset/`;
    const method = isEditing ? 'put' : 'post';

    try {
      await axios[method](url, currentAset);
      handleClose();
      fetchAsets();
    } catch (err) {
      console.error("Gagal menyimpan aset:", err.response.data);
      alert(`Gagal menyimpan: ${JSON.stringify(err.response.data)}`);
    }
  };

  const handleDelete = async (id) => {
    if (window.confirm('Apakah Anda yakin ingin menghapus aset ini?')) {
      try {
        await axios.delete(`${API_BASE_URL}/aset/${id}/`);
        fetchAsets();
      } catch (err) {
        console.error("Gagal menghapus aset:", err);
      }
    }
  };

  const renderPagination = () => {
    if (totalPages <= 1) return null;
    let items = [];
    for (let number = 1; number <= totalPages; number++) {
      items.push(
        <Pagination.Item key={number} active={number === page} onClick={() => handlePageChange(number)}>
          {number}
        </Pagination.Item>,
      );
    }
    return <Pagination className="justify-content-center">{items}</Pagination>;
  };

  const renderContent = () => {
    if (loading) return <div className="text-center mt-5"><Spinner /><p>Memuat data...</p></div>;
    if (error) return <Alert variant="danger" className="mt-3">{error}</Alert>;
    return (
        <>
            <AsetTable asets={asets} handleEdit={handleShow} handleDelete={handleDelete} />
            {renderPagination()}
        </>
    );
  };

  return (
    <>
      <Container className="mt-4">
        <div className="d-flex justify-content-between align-items-center">
          <h2>Daftar Inventaris Aset</h2>
          <Button variant="primary" onClick={() => handleShow()}>
            + Tambah Aset Baru
          </Button>
        </div>
        
        <FilterForm
          filters={filters}
          handleFilterChange={handleFilterChange}
          unitBidangOptions={unitBidangOptions}
          bidangOptions={bidangOptions}
          klasifikasiOptions={klasifikasiOptions}
          ruanganOptions={ruanganOptions}

        />
        <hr />
        {renderContent()}
      </Container>

      <AsetModal
        show={showModal}
        handleClose={handleClose}
        handleSubmit={handleSubmit}
        handleChange={handleChange}
        isEditing={isEditing}
        currentAset={currentAset}
        unitBidangOptions={unitBidangOptions}
        bidangOptions={bidangOptions}
        ruanganOptions={ruanganOptions}
        klasifikasiOptions={klasifikasiOptions}
        subKegiatanOptions={subKegiatanOptions}
      />
    </>
  );
}

export default AsetListPage;