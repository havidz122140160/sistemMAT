import React from 'react';
import { Form, Row, Col } from 'react-bootstrap';

function FilterForm({ filters, handleFilterChange, unitBidangOptions }) {
  return (
    <Form className="mt-3 p-3 border rounded">
      <Row>
        <Col md={6}>
          <Form.Group>
            <Form.Label>Cari Nama/Kode Aset</Form.Label>
            <Form.Control
              type="text"
              placeholder="Ketik untuk mencari..."
              name="search"
              value={filters.search}
              onChange={handleFilterChange}
            />
          </Form.Group>
        </Col>
        <Col md={3}>
          <Form.Group>
            <Form.Label>Filter Lokasi</Form.Label>
            <Form.Select name="unit_Bidang" value={filters.unit_Bidang} onChange={handleFilterChange}>
              <option value="">Semua Lokasi</option>
              {unitBidangOptions?.map(opt => <option key={opt.id} value={opt.id}>{opt.nama_unit}</option>)}
            </Form.Select>
          </Form.Group>
        </Col>
        <Col md={3}>
          <Form.Group>
            <Form.Label>Filter Status</Form.Label>
            <Form.Select name="status" value={filters.status} onChange={handleFilterChange}>
              <option value="">Semua Status</option>
              <option value="Baik">Baik</option>
              <option value="Perbaikan">Perbaikan</option>
              <option value="Rusak">Rusak</option>
              <option value="Hilang">Hilang</option>
            </Form.Select>
          </Form.Group>
        </Col>
      </Row>
    </Form>
  );
}

export default FilterForm;