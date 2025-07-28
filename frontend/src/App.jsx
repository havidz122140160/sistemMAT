import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import { Navbar, Container, Nav } from 'react-bootstrap';
import AsetListPage from './pages/AsetListPage';
import LaporanPage from './pages/LaporanPage';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  return (
    <BrowserRouter>
      <Navbar bg="dark" variant="dark" expand="lg">
        <Container fluid>
          <Navbar.Brand as={Link} to="/">Sistem Manajemen Aset</Navbar.Brand>
          <Nav className="me-auto">
            <Nav.Link as={Link} to="/">Daftar Aset</Nav.Link>
            <Nav.Link as={Link} to="/laporan">Laporan</Nav.Link>
          </Nav>
        </Container>
      </Navbar>

      <Routes>
        <Route path="/" element={<AsetListPage />} />
        <Route path="/laporan" element={<LaporanPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;