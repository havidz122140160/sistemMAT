// src/pages/LandingPage.jsx

import React from 'react';
import { Container, Button } from 'react-bootstrap';
import './LandingPage.css';
// Ganti dengan link gambar pesawat yang kamu punya
import planeImage from '../assets/react.svg'; 

function LandingPage() {
  return (
    <Container>
      <div className="hero-section">
        <div className="hero-content">
          <p style={{ color: 'var(--primary-blue)', fontWeight: '500' }}>LET'S GO FOR A TRAVEL, EVERYONE!</p>
          <h1>Experience The Magic Of Flight!</h1>
          <p>You can see the popular destination for travel and book a ticket for your favorite destination.</p>
          <Button variant="primary" style={{backgroundColor: 'var(--primary-blue)', border: 'none', padding: '10px 20px'}}>Book A Ticket Now</Button>
        </div>
        <img src={planeImage} alt="Airplane in clouds" className="hero-image" />
      </div>
      {/* Bagian selanjutnya (Popular Destination, dll) akan kita buat di sini */}
    </Container>
  );
}

export default LandingPage;