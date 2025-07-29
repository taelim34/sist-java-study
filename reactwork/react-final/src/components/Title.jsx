import React from 'react'
import { Paper, Typography, Box } from '@mui/material';
import titleimg from '../image/jquery_img/title3.png'

const Title = () => {
  return (
    <Box sx={{ display: 'flex', justifyContent: 'center', mt: 4 }}>
      <Paper elevation={0} sx={{ p: 4, borderRadius: 3, textAlign: 'center', background: '#fff', boxShadow: '0 2px 8px rgba(76, 217, 235, 0.08)', minWidth: 320 }}>
        <img src={titleimg} alt="타이틀" style={{ width: 180, marginBottom: 16, borderRadius: 10, boxShadow: '0 2px 8px #4dd0e122', background: '#e0f7fa' }} />
        <Typography variant="h5" sx={{ fontFamily: 'Montserrat', color: '#009688', fontWeight: 700, mt: 2 }}>
          React Spring_boot Project
        </Typography>
      </Paper>
    </Box>
  )
}

export default Title