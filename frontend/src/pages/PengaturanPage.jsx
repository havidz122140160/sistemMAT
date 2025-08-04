import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Card, Table, Button, Modal, Form, Alert, Row, Col } from 'react-bootstrap';

const API_BASE_URL = 'http://127.0.0.1:8000/api'; //localhost
//const API_BASE_URL = 'http://10.99.20.123:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://10.99.58.165:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://192.168.43.16:8000/api'; // IP pake jaringan HP
// const API_BASE_URL = 'http://10.99.70.137:8000/api'; // IP pake ruangan TIK

function PengaturanPage() {
  const [pekerjaanList, setPekerjaanList] = useState([]);
  const [loadingPekerjaan, setLoadingPekerjaan] = useState(true);
  const [errorPekerjaan, setErrorPekerjaan] = useState(null);
  const [showPekerjaanModal, setShowPekerjaanModal] = useState(false);
  const [currentPekerjaan, setCurrentPekerjaan] = useState({});
  const [isEditingPekerjaan, setIsEditingPekerjaan] = useState(false);

  const [kegiatanList, setKegiatanList] = useState([]);
  const [loadingKegiatan, setLoadingKegiatan] = useState(true);
  const [errorKegiatan, setErrorKegiatan] = useState(null);
  const [showKegiatanModal, setShowKegiatanModal] = useState(false);
  const [currentKegiatan, setCurrentKegiatan] = useState({});
  const [isEditingKegiatan, setIsEditingKegiatan] = useState(false);

  const [subkegiatanList, setSubkegiatanList] = useState([]);
  const [loadingSubkegiatan, setLoadingSubkegiatan] = useState(true);
  const [errorSubkegiatan, setErrorSubkegiatan] = useState(null);
  const [showSubkegiatanModal, setShowSubkegiatanModal] = useState(false);
  const [currentSubkegiatan, setCurrentSubkegiatan] = useState({});
  const [isEditingSubkegiatan, setIsEditingSubkegiatan] = useState(false);

  const fetchPekerjaan = async () => {
    try {
      setLoadingPekerjaan(true);
      const response = await axios.get(`${API_BASE_URL}/pekerjaan/`);
      setPekerjaanList(response.data);
    } catch (err) {
      setErrorPekerjaan(err.message);
    } finally {
      setLoadingPekerjaan(false);
    }
  };

  const fetchKegiatan = async () => {
    try {
      setLoadingKegiatan(true);
      const response = await axios.get(`${API_BASE_URL}/kegiatan/`);
      setKegiatanList(response.data);
    } catch (err) {
      setErrorKegiatan(err.message);
    } finally {
      setLoadingKegiatan(false);
    }
  };

   const fetchSubkegiatan = async () => {
    try {
      setLoadingSubkegiatan(true);
      const response = await axios.get(`${API_BASE_URL}/sub_kegiatan/`);
      setSubkegiatanList(response.data);
    } catch (err) {
      setErrorSubkegiatan(err.message);
    } finally {
      setLoadingSubkegiatan(false);
    }
  };

  useEffect(() => {
    fetchPekerjaan();
    fetchKegiatan();
    fetchSubkegiatan();
  }, []);

  const handleShow = (item = null) => {
    if (item) {
      setIsEditingPekerjaan(true);
      setCurrentPekerjaan(item);
    } else {
      setIsEditingPekerjaan(false);
      setCurrentPekerjaan({ nama_pekerjaan: '' });
    }
    setShowPekerjaanModal(true);
  };

  const handleClose = () => setShowPekerjaanModal(false);

  const handleChange = (e) => {
    setCurrentPekerjaan({ ...currentPekerjaan, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const url = isEditingPekerjaan ? `${API_BASE_URL}/pekerjaan/${currentPekerjaan.id}/` : `${API_BASE_URL}/pekerjaan/`;
    const method = isEditingPekerjaan ? 'put' : 'post';
    try {
      await axios[method](url, currentPekerjaan);
      handleClose();
      fetchPekerjaan();
    } catch (err) {
      console.error("Gagal menyimpan pekerjaan:", err.response.data);
    }
  };

  const handleDelete = async (id) => {
    if (window.confirm('Yakin ingin menghapus item ini?')) {
      try {
        await axios.delete(`${API_BASE_URL}/pekerjaan/${id}/`);
        fetchPekerjaan();
      } catch (err) {
        console.error("Gagal menghapus pekerjaan:", err.response.data);
      }
    }
  };

  const handleShowKegiatan = (item = null) => {
    if (item) {
      setIsEditingKegiatan(true);
      setCurrentKegiatan(item);
    } else {
      setIsEditingKegiatan(false);
      setCurrentKegiatan({ nama_kegiatan: '', pekerjaan: '' });
    }
    setShowKegiatanModal(true);
  };
  const handleCloseKegiatan = () => setShowKegiatanModal(false);
  const handleChangeKegiatan = (e) => {
    setCurrentKegiatan({ ...currentKegiatan, [e.target.name]: e.target.value });
  };
  const handleSubmitKegiatan = async (e) => {
    e.preventDefault();
    const url = isEditingKegiatan ? `${API_BASE_URL}/kegiatan/${currentKegiatan.id}/` : `${API_BASE_URL}/kegiatan/`;
    const method = isEditingKegiatan ? 'put' : 'post';
    try {
      await axios[method](url, currentKegiatan);
      handleCloseKegiatan();
      fetchKegiatan();
    } catch (err) {
      console.error("Gagal menyimpan kegiatan:", err.response.data);
    }
  };
  const handleDeleteKegiatan = async (id) => {
    if (window.confirm('Yakin ingin menghapus item ini?')) {
      try {
        await axios.delete(`${API_BASE_URL}/kegiatan/${id}/`);
        fetchKegiatan();
      } catch (err) {
        console.error("Gagal menghapus kegiatan:", err.response.data);
      }
    }
  };

  const handleShowSubkegiatan = (item = null) => {
    if (item) {
      setIsEditingSubkegiatan(true);
      setCurrentSubkegiatan(item);
    } else {
      setIsEditingSubkegiatan(false);
      setCurrentSubkegiatan({ nama_sub_kegiatan: '', kegiatan: '' });
    }
    setShowSubkegiatanModal(true);
  };
  const handleCloseSubkegiatan = () => setShowSubkegiatanModal(false);
  const handleChangeSubkegiatan = (e) => {
    setCurrentSubkegiatan({ ...currentSubkegiatan, [e.target.name]: e.target.value });
  };
  const handleSubmitSubkegiatan = async (e) => {
    e.preventDefault();
    const url = isEditingSubkegiatan ? `${API_BASE_URL}/sub_kegiatan/${currentSubkegiatan.id}/` : `${API_BASE_URL}/sub_kegiatan/`;
    const method = isEditingSubkegiatan ? 'put' : 'post';
    try {
      await axios[method](url, currentSubkegiatan);
      handleCloseSubkegiatan();
      fetchSubkegiatan();
    } catch (err) {
      console.error("Gagal menyimpan subkegiatan:", err.response.data);
    }
  };
  const handleDeleteSubkegiatan = async (id) => {
    if (window.confirm('Yakin ingin menghapus item ini?')) {
      try {
        await axios.delete(`${API_BASE_URL}/sub_kegiatan/${id}/`);
        fetchSubkegiatan();
      } catch (err) {
        console.error("Gagal menghapus subkegiatan:", err.response.data);
      }
    }
  };

  return (
    <><Container className="mt-4">
          <h2>Halaman Pengaturan</h2>
          <hr/>
          <Row>
            <Col md={6}>
                <Card>
                    <Card.Header className="d-flex justify-content-between align-items-center">
                        Manajemen Pekerjaan
                        <Button variant="primary" size="sm" onClick={() => handleShow()}>+ Tambah Pekerjaan</Button>
                    </Card.Header>
                    <Card.Body>
                        {loadingPekerjaan && <p>Loading...</p>}
                        {errorPekerjaan && <Alert variant="danger">{errorPekerjaan}</Alert>}
                        {!loadingPekerjaan && !errorPekerjaan && (
                            <Table striped bordered hover responsive>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nama Pekerjaan</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {pekerjaanList.map((item, index) => (
                                        <tr key={item.id}>
                                            <td>{index + 1}</td>
                                            <td>{item.nama_pekerjaan}</td>
                                            <td>
                                                <Button variant="warning" size="sm" onClick={() => handleShow(item)} className="me-2">Edit</Button>
                                                <Button variant="danger" size="sm" onClick={() => handleDelete(item.id)}>Hapus</Button>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </Table>
                        )}
                    </Card.Body>
                </Card>
            </Col>

            <Col md={6}>
                <Card className="mb-3">
                    <Card.Header className="d-flex justify-content-between align-items-center">
                    Manajemen Kegiatan
                    <Button variant="primary" size="sm" onClick={() => handleShowKegiatan()}>+ Tambah Kegiatan</Button>
                    </Card.Header>
                    <Card.Body>
                    {loadingKegiatan && <p>Loading...</p>}
                    {errorKegiatan && <Alert variant="danger">{errorKegiatan}</Alert>}
                    {!loadingKegiatan && !errorKegiatan && (
                        <Table striped bordered hover responsive>
                        <thead>
                            <tr>
                            <th>#</th>
                            <th>Nama Kegiatan</th>
                            <th>Pekerjaan Induk</th>
                            <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            {kegiatanList.map((item, index) => (
                            <tr key={item.id}>
                                <td>{index + 1}</td>
                                <td>{item.nama_kegiatan}</td>
                                {/* Cari nama pekerjaan dari pekerjaanList */}
                                <td>{pekerjaanList.find(p => p.id === item.pekerjaan)?.nama_pekerjaan}</td>
                                <td>
                                <Button variant="warning" size="sm" onClick={() => handleShowKegiatan(item)} className="me-2">Edit</Button>
                                <Button variant="danger" size="sm" onClick={() => handleDeleteKegiatan(item.id)}>Hapus</Button>
                                </td>
                            </tr>
                            ))}
                        </tbody>
                        </Table>
                    )}
                    </Card.Body>
                </Card>
            </Col>

            <Col md={12} lg={4}>
                <Card className="mb-3">
                    <Card.Header className="d-flex justify-content-between align-items-center">
                    Manajemen Subkegiatan
                    <Button variant="primary" size="sm" onClick={() => handleShowSubkegiatan()}>+ Tambah</Button>
                    </Card.Header>
                    <Card.Body>
                    {loadingSubkegiatan && <p>Loading...</p>}
                    {errorSubkegiatan && <Alert variant="danger">{errorSubkegiatan}</Alert>}
                    {!loadingSubkegiatan && !errorSubkegiatan && (
                        <Table striped bordered hover responsive size="sm">
                        <thead>
                            <tr>
                              <th>#</th>
                              <th>Nama Subkegiatan</th>
                              <th>Kegiatan Induk</th>
                              <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            {subkegiatanList.map((item, index) => (
                            <tr key={item.id}>
                                <td>{index + 1}</td>
                                <td>{item.nama_sub_kegiatan}</td>
                                <td>{kegiatanList.find(p => p.id === item.kegiatan)?.nama_kegiatan}</td>
                                <td>
                                <Button variant="warning" size="sm" onClick={() => handleShowSubkegiatan(item)} className="me-1">Edit</Button>
                                <Button variant="danger" size="sm" onClick={() => handleDeleteSubkegiatan(item.id)}>Hapus</Button>
                                </td>
                            </tr>
                            ))}
                        </tbody>
                        </Table>
                    )}
                    </Card.Body>
                </Card>
            </Col>
            </Row>
          {/* Di sini nanti bisa ditambahkan Card untuk Kegiatan, Subkegiatan, dll. */}
      </Container>
        <Modal show={showPekerjaanModal} onHide={handleClose}>
              <Modal.Header closeButton>
                  <Modal.Title>{isEditingPekerjaan ? 'Edit Pekerjaan' : 'Tambah Pekerjaan Baru'}</Modal.Title>
              </Modal.Header>
              <Modal.Body>
                  <Form onSubmit={handleSubmit}>
                      <Form.Group className="mb-3">
                          <Form.Label>Nama Pekerjaan</Form.Label>
                          <Form.Control type="text" name="nama_pekerjaan" value={currentPekerjaan.nama_pekerjaan || ''} onChange={handleChange} required />
                      </Form.Group>
                      <Button variant="secondary" onClick={handleClose} className="me-2">Batal</Button>
                      <Button variant="primary" type="submit">Simpan</Button>
                  </Form>
              </Modal.Body>
        </Modal>

        <Modal show={showKegiatanModal} onHide={handleCloseKegiatan}>
            <Modal.Header closeButton>
            <Modal.Title>{isEditingKegiatan ? 'Edit Kegiatan' : 'Tambah Kegiatan Baru'}</Modal.Title>
            </Modal.Header>
            <Modal.Body>
            <Form onSubmit={handleSubmitKegiatan}>
                <Form.Group className="mb-3">
                <Form.Label>Pekerjaan Induk</Form.Label>
                <Form.Select name="pekerjaan" value={currentKegiatan.pekerjaan || ''} onChange={handleChangeKegiatan} required>
                    <option value="">Pilih Pekerjaan</option>
                    {pekerjaanList.map(p => <option key={p.id} value={p.id}>{p.nama_pekerjaan}</option>)}
                </Form.Select>
                </Form.Group>
                <Form.Group className="mb-3">
                <Form.Label>Nama Kegiatan</Form.Label>
                <Form.Control type="text" name="nama_kegiatan" value={currentKegiatan.nama_kegiatan || ''} onChange={handleChangeKegiatan} required />
                </Form.Group>
                <Button variant="secondary" onClick={handleCloseKegiatan} className="me-2">Batal</Button>
                <Button variant="primary" type="submit">Simpan</Button>
            </Form>
            </Modal.Body>
        </Modal>

        <Modal show={showSubkegiatanModal} onHide={handleCloseSubkegiatan}>
            <Modal.Header closeButton>
            <Modal.Title>{isEditingSubkegiatan ? 'Edit Subkegiatan' : 'Tambah Subkegiatan Baru'}</Modal.Title>
            </Modal.Header>
            <Modal.Body>
            <Form onSubmit={handleSubmitSubkegiatan}>
                <Form.Group className="mb-3">
                <Form.Label>Kegiatan Induk</Form.Label>
                <Form.Select name="kegiatan" value={currentSubkegiatan.kegiatan || ''} onChange={handleChangeSubkegiatan} required>
                    <option value="">Pilih Kegiatan</option>
                    {kegiatanList.map(p => <option key={p.id} value={p.id}>{p.nama_kegiatan}</option>)}
                </Form.Select>
                </Form.Group>
                <Form.Group className="mb-3">
                <Form.Label>Nama Subkegiatan</Form.Label>
                <Form.Control type="text" name="nama_sub_kegiatan" value={currentSubkegiatan.nama_sub_kegiatan || ''} onChange={handleChangeSubkegiatan} required />
                </Form.Group>
                <Button variant="secondary" onClick={handleCloseSubkegiatan} className="me-2">Batal</Button>
                <Button variant="primary" type="submit">Simpan</Button>
            </Form>
            </Modal.Body>
        </Modal>
    </>
  );
}

export default PengaturanPage;