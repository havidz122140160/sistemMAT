import { useState, useEffect } from 'react';
import { Container, Table, Spinner, Alert } from 'react-bootstrap'; // Import komponen dari React Bootstrap
import './App.css';

function App() {
  const [asets, setAsets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchAsets() {
      try {
        // Pastikan URL ini sesuai dengan alamat IP laptopmu
        const response = await fetch('http://10.99.20.123:8000/api/aset/');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        setAsets(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }
    fetchAsets();
  }, []);

  return (
    <Container className="mt-4">
      <h1>Daftar Inventaris Aset</h1>
      <hr />

      {loading && (
        <div className="text-center">
          <Spinner animation="border" role="status">
            <span className="visually-hidden">Loading...</span>
          </Spinner>
          <p>Memuat data...</p>
        </div>
      )}

      {error && (
        <Alert variant="danger">
          Gagal memuat data: {error}
        </Alert>
      )}

      {!loading && !error && (
        <Table striped bordered hover responsive>
          <thead>
            <tr>
              <th>#</th>
              <th>Kode Aset</th>
              <th>Nama Barang</th>
              <th>Lokasi</th>
              <th>Status</th>
              <th>Tgl. Pembelian</th>
            </tr>
          </thead>
          <tbody>
            {asets.map((aset, index) => (
              <tr key={aset.id}>
                <td>{index + 1}</td>
                <td>{aset.kode_aset}</td>
                <td>{aset.nama_barang}</td>
                <td>{aset.lokasi.nama_lokasi}</td>
                <td>{aset.status}</td>
                <td>{aset.tanggal_pembelian}</td>
              </tr>
            ))}
          </tbody>
        </Table>
      )}
    </Container>
  );
}

export default App;