import React, { useState } from 'react';
import { Container, Form, Button, Card } from 'react-bootstrap';

const API_BASE_URL = 'http://10.99.20.123:8000/api'; // Sesuaikan IP

function LaporanPage() {
  const [year, setYear] = useState(new Date().getFullYear());

  const handleCetakBelanjaModal = () => {
    window.open(`${API_BASE_URL}/laporan/belanja-modal/?year=${year}`, '_blank');
  };

  return (
    <Container className="mt-4">
      <h2>Cetak Laporan</h2>
      <hr />
      <Card>
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

      {/* Di sini bisa ditambahkan card lain untuk Laporan KIB, dll. */}
    </Container>
  );
}

export default LaporanPage;