import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import { Navbar, Container, Nav } from 'react-bootstrap';
import LoginPage from './pages/LoginPage';
import AsetListPage from './pages/AsetListPage';
import LaporanPage from './pages/LaporanPage';
import 'bootstrap/dist/css/bootstrap.min.css';

function MainLayout() {
  return (
    <>
      <Navbar bg="dark" variant="dark" expand="lg">
        <Container fluid>
          <Navbar.Brand as={Link} to="/">Sistem Manajemen Aset</Navbar.Brand>
          <Nav className="me-auto">
            <Nav.Link as={Link} to="/">Daftar Aset</Nav.Link>
            <Nav.Link as={Link} to="/laporan">Laporan</Nav.Link>
          </Nav>
        </Container>
      </Navbar>
      <Outlet /> {/* Ini adalah tempat halaman (AsetList atau Laporan) akan dirender */}
    </>
  );
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        {/* Rute untuk halaman-halaman utama yang menggunakan Navbar */}
        <Route path="/" element={<MainLayout />}>
          <Route index element={<AsetListPage />} />
          <Route path="laporan" element={<LaporanPage />} />
        </Route>
        
        {/* Rute khusus untuk halaman Login (tanpa Navbar utama) */}
        <Route path="/login" element={<LoginPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;