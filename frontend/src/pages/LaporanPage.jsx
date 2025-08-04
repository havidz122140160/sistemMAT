import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Form, Button, Card, Row, Col } from 'react-bootstrap';

const API_BASE_URL = 'http://127.0.0.1:8000/api'; //localhost
//const API_BASE_URL = 'http://10.99.20.123:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://10.99.58.165:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://192.168.43.16:8000/api'; // IP pake jaringan HP
// const API_BASE_URL = 'http://10.99.70.137:8000/api'; // IP pake ruang TIK

function LaporanPage() {
  const [year, setYear] = useState(new Date().getFullYear());
  const [ruanganList, setRuanganList] = useState([]);
  const [selectedRuangan, setSelectedRuangan] = useState('');
  
  // --- STATE BARU UNTUK KIB B ---
  const [unitBidangList, setUnitBidangList] = useState([]);
  const [selectedUnitBidang, setSelectedUnitBidang] = useState('');

  useEffect(() => {
    // Fungsi untuk mengambil semua data dropdown
    async function fetchOptions() {
      try {
        const ruanganRes = await axios.get(`${API_BASE_URL}/ruangan/`);
        const unitBidangRes = await axios.get(`${API_BASE_URL}/unit_bidang/`);
        
        setRuanganList(ruanganRes.data);
        setUnitBidangList(unitBidangRes.data);
      } catch (error) {
        console.error("Gagal mengambil daftar options:", error);
      }
    }
    fetchOptions();
  }, []);

  const handleCetakBelanjaModal = () => {
    window.open(`${API_BASE_URL}/laporan/belanja-modal/?year=${year}`, '_blank');
  };

  const handleCetakKIR = () => {
    if (selectedRuangan) {
      window.open(`${API_BASE_URL}/laporan/kir/${selectedRuangan}/`, '_blank');
    }
  };

  const handleCetakKIBB = () => {
    if (selectedUnitBidang) {
      window.open(`${API_BASE_URL}/laporan/kib-b/${selectedUnitBidang}/`, '_blank');
    }
  };

//kode baru

  return (
      <Container className="mt-4">
        <h2>Cetak Laporan</h2>
        <hr />
        <Row>
          <Col md={6}>
            <Card className="mb-3">
              <Card.Header>Laporan Belanja Modal</Card.Header>
              <Card.Body>
                <Form.Group className="mb-3">
                  <Form.Label>Pilih Tahun Periode</Form.Label>
                  <Form.Control 
                    type="number" 
                    value={year}
                    onChange={(e) => setYear(e.target.value)}
                  />
                </Form.Group>
                <Button onClick={handleCetakBelanjaModal}>
                  Cetak Laporan Belanja Modal
                </Button>
              </Card.Body>
            </Card>
          </Col>

          <Col md={6}>
            <Card className="mb-3">
              <Card.Header>Kartu Inventaris Ruangan (KIR)</Card.Header>
              <Card.Body>
                <Form.Group className="mb-3">
                  <Form.Label>Pilih Ruangan</Form.Label>
                  <Form.Select 
                    value={selectedRuangan}
                    onChange={(e) => setSelectedRuangan(e.target.value)}
                  >
                    <option value="">-- Pilih Ruangan --</option>
                    {ruanganList.map(ruangan => (
                      <option key={ruangan.id} value={ruangan.id}>
                        {ruangan.nama_ruangan}
                      </option>
                    ))}
                  </Form.Select>
                </Form.Group>
                <Button onClick={handleCetakKIR} disabled={!selectedRuangan}>
                  Cetak Laporan KIR
                </Button>
              </Card.Body>
            </Card>
          </Col>

          <Col md={6}>
            <Card className="mb-3">
              <Card.Header>Kartu Inventaris Barang (KIB) B - Peralatan & Mesin</Card.Header>
              <Card.Body>
                <Form.Group className="mb-3">
                  <Form.Label>Pilih Unit Bidang</Form.Label>
                  <Form.Select 
                    value={selectedUnitBidang}
                    onChange={(e) => setSelectedUnitBidang(e.target.value)}
                  >
                    <option value="">-- Pilih Unit Bidang --</option>
                    {unitBidangList.map(unit => (
                      <option key={unit.id} value={unit.id}>
                        {unit.nama_unit}
                      </option>
                    ))}
                  </Form.Select>
                </Form.Group>
                <Button onClick={handleCetakKIBB} disabled={!selectedUnitBidang}>
                  Cetak Laporan KIB B
                </Button>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Container>
    );
  }

export default LaporanPage;