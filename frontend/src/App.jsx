import { BrowserRouter, Routes, Route, Link, Outlet } from 'react-router-dom';
import { Navbar, Container, Nav } from 'react-bootstrap';
import AsetListPage from './pages/AsetListPage';
import LaporanPage from './pages/LaporanPage';
import LoginPage from './pages/LoginPage';
import PengaturanPage from './pages/PengaturanPage';
import ProtectedRoute from './components/ProtectedRoute';
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
            <Nav.Link as={Link} to="/pengaturan">Pengaturan</Nav.Link>
          </Nav>
        </Container>
      </Navbar>
      <Outlet />
    </>
  );
}


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        
        <Route element={<ProtectedRoute />}>
          <Route path="/" element={<MainLayout />}>
            <Route index element={<AsetListPage />} />
            <Route path="laporan" element={<LaporanPage />} />
            <Route path="pengaturan" element={<PengaturanPage />} />
          </Route>
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;