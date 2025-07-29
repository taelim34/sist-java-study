import React from 'react'
import { Paper, Typography, Button, Box } from '@mui/material';
import CelebrationIcon from '@mui/icons-material/Celebration';
import mainImg from '../image/logoImg/logo.png';

const Main = () => {
  return (
    <Box sx={{ minHeight: '80vh', display: 'flex', alignItems: 'center', justifyContent: 'center', background: '#f8fafc' }}>
      <Paper elevation={0} sx={{ p: 6, borderRadius: 4, textAlign: 'center', maxWidth: 500, width: '100%', background: '#fff', boxShadow: '0 2px 8px rgba(76, 217, 235, 0.08)' }}>
        <img src={mainImg} alt="Main Logo" style={{ width: 120, marginBottom: 28, borderRadius: '50%', boxShadow: '0 2px 8px #4dd0e122', background: '#e0f7fa' }} />
        <Typography variant="h3" sx={{ fontFamily: 'Montserrat', color: '#009688', mb: 2, fontWeight: 700 }}>
          Welcome!
        </Typography>
        <Typography variant="h6" sx={{ fontFamily: 'Quicksand', color: '#4dd0e1', mb: 4 }}>
          민트톤의 심플하고 깔끔한 메인 페이지에 오신 것을 환영합니다.
        </Typography>
        <Button variant="outlined" size="large" endIcon={<CelebrationIcon />} sx={{ fontWeight: 700, fontFamily: 'Montserrat', fontSize: '1.1em', background: '#fff', color: '#009688', border: '1.5px solid #4dd0e1', borderRadius: 3, px: 4, py: 1.5, boxShadow: 'none', transition: 'background 0.18s, color 0.18s, border 0.18s', '&:hover': { background: '#4dd0e1', color: '#fff', border: '1.5px solid #009688' } }}>
          시작하기
        </Button>
      </Paper>
    </Box>
  )
}

export default Main