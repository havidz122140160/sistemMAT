import React from 'react';
import { Modal, Form, Button } from 'react-bootstrap';

function AsetModal({ show, handleClose, handleSubmit, handleChange, isEditing, currentAset, unitBidangOptions, bidangOptions, ruanganOptions, klasifikasiOptions }) {

  return (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>{isEditing ? 'Edit Aset' : 'Tambah Aset Baru'}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form onSubmit={handleSubmit}>
          <Form.Group className="mb-3">
            <Form.Label>Nama/Merek/Tipe Barang</Form.Label>
            <Form.Control type="text" name="merek_tipe" value={currentAset.merek_tipe || ''} onChange={handleChange} required />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Klasifikasi</Form.Label>
            <Form.Select name="klasifikasi_id" value={currentAset.klasifikasi_id || ''} onChange={handleChange} required>
              <option value="">Pilih Klasifikasi</option>
              {klasifikasiOptions.map(opt => <option key={opt.id} value={opt.id}>{opt.nama}</option>)}
            </Form.Select>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Unit Bidang</Form.Label>
            <Form.Select
              name="unit_bidang_id"
              value={currentAset.unit_bidang_id || ''}
              onChange={handleChange}
              required
            >
              <option value="">Pilih Unit Bidang</option>
              {unitBidangOptions
                .map(opt => <option key={opt.id} value={opt.id}>{opt.nama_unit}</option>)}
            </Form.Select>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Bidang</Form.Label>
            <Form.Select 
              name="bidang_id" 
              value={currentAset.bidang_id || ''} 
              onChange={handleChange}
              disabled={!currentAset.unit_bidang_id}
              required
            >
              <option value="">Pilih Bidang</option>
              {bidangOptions
                ?.filter(opt => opt.unit_bidang == currentAset.unit_bidang_id)
                .map(opt => <option key={opt.id} value={opt.id}>{opt.nama_bidang}</option>)
              }
            </Form.Select>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Ruangan</Form.Label>
            <Form.Select 
              name="ruangan_id" 
              value={currentAset.ruangan_id || ''} 
              onChange={handleChange}
              disabled={!currentAset.bidang_id}
            >
              <option value="">Pilih Ruangan</option>
              {ruanganOptions
                ?.filter(opt => opt.bidang && opt.bidang.id === parseInt(currentAset.bidang_id))
                .map(opt => <option key={opt.id} value={opt.id}>{opt.nama_ruangan}</option>)
              }
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