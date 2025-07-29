import React from 'react'
import { Paper, Typography, Box } from '@mui/material';

const About = () => {
  return (
    <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '60vh' }}>
      <Paper elevation={0} sx={{ p: 5, borderRadius: 3, background: '#fff', minWidth: 320, textAlign: 'center', boxShadow: '0 2px 8px rgba(76, 217, 235, 0.08)' }}>
        <Typography variant="h4" sx={{ fontFamily: 'Montserrat', color: '#009688', fontWeight: 700, mb: 2 }}>
          오시는길
        </Typography>
        <Typography variant="body1" sx={{ fontFamily: 'Quicksand', color: '#4dd0e1' }}>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.365821966831!2d127.03062587629451!3d37.499289227980654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1c32408f9b7%3A0x4e3761a4f356d1eb!2z7IyN7Jqp6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1753338685119!5m2!1sko!2skr" width="600" height="450" style={{border:'0'}} allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </Typography>
      </Paper>
    </Box>
  )
}

export default About