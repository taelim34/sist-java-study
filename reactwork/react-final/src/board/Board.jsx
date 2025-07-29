import React from 'react'
import { Paper, Typography, Box } from '@mui/material';

const Board = () => {
  return (
    <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '60vh' }}>
      <Paper elevation={0} sx={{ p: 5, borderRadius: 3, background: '#fff', minWidth: 320, textAlign: 'center', boxShadow: '0 2px 8px rgba(76, 217, 235, 0.08)' }}>
        <Typography variant="h4" sx={{ fontFamily: 'Montserrat', color: '#009688', fontWeight: 700, mb: 2 }}>
          Board
        </Typography>
        <Typography variant="body1" sx={{ fontFamily: 'Quicksand', color: '#4dd0e1' }}>
          게시판 기능이 여기에 들어갑니다.
        </Typography>
      </Paper>
    </Box>
  )
}

export default Board