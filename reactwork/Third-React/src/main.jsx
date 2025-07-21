import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import OneApp from './components/OneApp.jsx'
import TwoApp from './components/TwoApp.jsx'
import ThreeApp from './components/ThreeApp.jsx'
import FourApp from './components/FourApp.jsx'
import FiveApp from './components/FiveApp.jsx'
import SixApp from './components/SixApp.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
