import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Row, Col, Card, Spinner, Alert } from 'react-bootstrap';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Pie } from 'react-chartjs-2';

ChartJS.register(ArcElement, Tooltip, Legend);

const API_BASE_URL = 'http://127.0.0.1:8000/api'; //localhost
//const API_BASE_URL = 'http://10.99.20.123:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://10.99.58.165:8000/api'; // IP pake jaringan kantor
// const API_BASE_URL = 'http://192.168.43.16:8000/api'; // IP pake jaringan HP
// const API_BASE_URL = 'http://10.99.70.137:8000/api'; // IP pake ruang TIK

function DashboardPage() {
  const [stats, setStats] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchStats() {
      try {
        const response = await axios.get(`${API_BASE_URL}/dashboard-stats/`);
        setStats(response.data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }
    fetchStats();
  }, []);

  const pieChartData = {
    labels: stats?.aset_by_status.map(item => item.status) || [],
    datasets: [
      {
        label: '# Jumlah Aset',
        data: stats?.aset_by_status.map(item => item.total) || [],
        backgroundColor: [
          'rgba(75, 192, 192, 0.6)', // Baik
          'rgba(255, 206, 86, 0.6)', // Perbaikan
          'rgba(255, 99, 132, 0.6)',  // Rusak
          'rgba(153, 102, 255, 0.6)', // Hilang
        ],
        borderColor: [
          'rgba(75, 192, 192, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(153, 102, 255, 1)',
        ],
        borderWidth: 1,
      },
    ],
  };

  if (loading) return <div className="text-center mt-5"><Spinner /></div>;
  if (error) return <Alert variant="danger">Gagal memuat data: {error}</Alert>;

  return (
    <Container fluid className="p-4">
      <div className="page-header">
        <h2>Dashboard</h2>
      </div>
      <Row className="mt-3">
        <Col md={6}>
          <Card className="text-center h-100 shadow-sm border-0 rounded-4">
            <Card.Body>
              <Card.Title>Total Aset</Card.Title>
              <h1 className="display-2">{stats?.total_aset}</h1>
            </Card.Body>
          </Card>
        </Col>
        <Col md={6}>
          <Card className="h-100 shadow-sm border-0 rounded-4">
            <Card.Body>
              <Card.Title>Aset Berdasarkan Status</Card.Title>
              <Pie data={pieChartData} />
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
}

export default DashboardPage;
