// import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import './App.css'

function App() {
  return (
    <div className="container mt-5">
      <h1>Halo Bang, Proyek Aset Dimulai!</h1>
      <p>Tombol ini pakai class dari Bootstrap:</p>
      
      <button className="btn btn-primary me-2">Tombol Primary</button>
      <button className="btn btn-success">Tombol Success</button>

      <div className="card mt-4">
        <div className="card-header">
          Contoh Card Bootstrap
        </div>
        <div className="card-body">
          <p className="card-text">Kalau card ini tampilannya rapi, berarti Bootstrap sudah berhasil di-install.</p>
          <a href="#" className="btn btn-warning">Aksi</a>
        </div>
      </div>
    </div>
  )
}

export default App