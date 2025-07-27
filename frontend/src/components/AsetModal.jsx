import React from 'react';
import { Modal, Form, Button } from 'react-bootstrap';

function AsetModal({ show, handleClose, handleSubmit, handleChange, isEditing, currentAset, lokasiOptions, klasifikasiOptions }) {
  return (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>{isEditing ? 'Edit Aset' : 'Tambah Aset Baru'}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form onSubmit={handleSubmit}>
          <Form.Group className="mb-3">
            <Form.Label>Nama/Merek/Tipe Barang</Form.Label>
            <Form.Control type="text" name="nama_barang" value={currentAset.nama_barang || ''} onChange={handleChange} required />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Klasifikasi</Form.Label>
            <Form.Select name="klasifikasi_id" value={currentAset.klasifikasi_id || ''} onChange={handleChange} required>
              <option value="">Pilih Klasifikasi</option>
              {klasifikasiOptions.map(opt => <option key={opt.id} value={opt.id}>{opt.nama}</option>)}
            </Form.Select>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Lokasi</Form.Label>
            <Form.Select name="lokasi_id" value={currentAset.lokasi_id || ''} onChange={handleChange} required>
              <option value="">Pilih Lokasi</option>
              {lokasiOptions.map(opt => <option key={opt.id} value={opt.id}>{opt.nama_lokasi}</option>)}
            </Form.Select>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Tanggal Pembelian</Form.Label>
            <Form.Control type="date" name="tanggal_pembelian" value={currentAset.tanggal_pembelian || ''} onChange={handleChange} required />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Harga Pembelian</Form.Label>
            <Form.Control type="number" name="harga_pembelian" value={currentAset.harga_pembelian || ''} onChange={handleChange} required />
          </Form.Group>

          <Button variant="secondary" onClick={handleClose} className="me-2">Batal</Button>
          <Button variant="primary" type="submit">Simpan</Button>
        </Form>
      </Modal.Body>
    </Modal>
  );
}

export default AsetModal;