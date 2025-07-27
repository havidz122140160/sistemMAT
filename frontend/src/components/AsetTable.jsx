import React from 'react';
import { Table, Button } from 'react-bootstrap';

function AsetTable({ asets, handleEdit, handleDelete }) {
  return (
    <Table striped bordered hover responsive className="mt-3">
      <thead>
        <tr>
          <th>#</th>
          <th>Kode Aset</th>
          <th>Nama Barang</th>
          <th>Lokasi</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        {asets.map((aset, index) => (
          <tr key={aset.id}>
            <td>{index + 1}</td>
            <td>{aset.kode_aset}</td>
            <td>{aset.nama_barang}</td>
            <td>{aset.lokasi_detail}</td>
            <td>
              <Button variant="warning" size="sm" onClick={() => handleEdit(aset)} className="me-2">
                Edit
              </Button>
              <Button variant="danger" size="sm" onClick={() => handleDelete(aset.id)}>
                Hapus
              </Button>
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
}

export default AsetTable;