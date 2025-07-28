import { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Table, Spinner, Alert, Navbar, Button, Modal, Form, Row, Col, Pagination } from 'react-bootstrap'; // Tambah Pagination
import AsetTable from '../components/AsetTable.jsx';
import FilterForm from '../components/FilterForm';
import AsetModal from '../components/AsetModal';
import 'bootstrap/dist/css/bootstrap.min.css';

const API_BASE_URL = 'http://10.99.20.123:8000/api';

function AsetListPage() {
  const [asets, setAsets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [lokasiOptions, setLokasiOptions] = useState([]);
  const [klasifikasiOptions, setKlasifikasiOptions] = useState([]);
  const [filters, setFilters] = useState({ search: '', lokasi: '', status: '' });
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
        lokasi: filters.lokasi,
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
      const lokasiRes = await axios.get(`${API_BASE_URL}/lokasi/`);
      const klasifikasiRes = await axios.get(`${API_BASE_URL}/klasifikasi/`);
      setLokasiOptions(lokasiRes.data.results || lokasiRes.data);
      setKlasifikasiOptions(klasifikasiRes.data.results || klasifikasiRes.data);
    } catch (err) {
      console.error("Gagal mengambil data options:", err);
    }
  };

  useEffect(() => {
    fetchAsets();
  }, [filters, page]);

  useEffect(() => {
    fetchOptions();
  }, []);

  const handlePageChange = (pageNumber) => {
    setPage(pageNumber);
  };

  // Handler untuk mengubah state filter
  const handleFilterChange = (e) => {
    setFilters({ ...filters, [e.target.name]: e.target.value });
  };

  // Handler untuk membuka modal
  const handleShow = (aset = null) => {
    if (aset) {
      // Mode Edit: isi form dengan data aset yang ada
      setIsEditing(true);
      setCurrentAset({
        ...aset,
        lokasi_id: aset.lokasi.id,
        klasifikasi_id: aset.klasifikasi.id
      });
    } else {
      // Mode Tambah: form kosong
      setIsEditing(false);
      setCurrentAset({
        nama_barang: '',
        lokasi_id: '',
        klasifikasi_id: '',
        tanggal_pembelian: '',
        harga_pembelian: '',
        status: 'Baik',
      });
    }
    setShowModal(true);
  };

  // Handler untuk menutup modal
  const handleClose = () => {
    setShowModal(false);
    setCurrentAset({});
  };

  // Handler untuk memperbarui state form saat user mengetik
  const handleChange = (e) => {
    setCurrentAset({ ...currentAset, [e.target.name]: e.target.value });
  };

  // Handler untuk submit form (bisa untuk Tambah atau Edit)
  const handleSubmit = async (e) => {
    e.preventDefault();
    const url = isEditing 
      ? `${API_BASE_URL}/aset/${currentAset.id}/` 
      : `${API_BASE_URL}/aset/`;
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

  // Handler untuk menghapus aset
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

  // render tabel
  const renderContent = () => {
    if (loading) return <div className="text-center mt-5"><Spinner /><p>Memuat data...</p></div>;
    if (error) return <Alert variant="danger" className="mt-3">Gagal memuat data: {error}</Alert>;

    return <AsetTable asets={asets} handleEdit={handleShow} handleDelete={handleDelete} />;
};

  // render pagination
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

  return (
    <>
      <Navbar bg="dark" variant="dark">
        <Container fluid>
          <Navbar.Brand href="#home">Sistem Manajemen Aset</Navbar.Brand>
        </Container>
      </Navbar>

      <Container fluid className="mt-4">
        <div className="d-flex justify-content-between align-items-center">
          <h2>Daftar Inventaris Aset</h2>
          <Button variant="primary" onClick={() => handleShow()}>
            + Tambah Aset Baru
          </Button>
        </div>
        
        <FilterForm 
          filters={filters} 
          handleFilterChange={handleFilterChange} 
          lokasiOptions={lokasiOptions} 
        />

        <hr />

        {renderContent()}

        {!loading && !error && renderPagination()}

        <Button onClick={() => window.open(`${API_BASE_URL}/laporan/kib-b/1/`, '_blank')}>
          Cetak Laporan KIB B
        </Button>


      </Container>
      <AsetModal
        show={showModal}
        handleClose={handleClose}
        handleSubmit={handleSubmit}
        handleChange={handleChange}
        isEditing={isEditing}
        currentAset={currentAset}
        lokasiOptions={lokasiOptions}
        klasifikasiOptions={klasifikasiOptions}
      />
    </>
  );
}

export default AsetListPage;