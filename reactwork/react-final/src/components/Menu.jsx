import React, { useState, useEffect } from 'react';
import { AppBar, Toolbar, Button, Box, Typography } from '@mui/material';
import { NavLink, useNavigate, useLocation } from 'react-router-dom';

// 기본 메뉴 항목
const navItems = [
  { label: 'Home', to: '/' },
  { label: 'Login', to: '/member/login' },
  { label: 'Member', to: '/member/form' },
  { label: 'Shop', to: '/shop/list' },
  { label: 'Board', to: '/board/list' },
  { label: '오시는길', to: '/about' },
];

const Menu = () => {
  // 로그인 상태와 사용자 이름을 관리하는 state
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [myName, setMyName] = useState('');

  const navi = useNavigate();
  const location = useLocation(); // URL 변경을 감지하기 위함

  // 컴포넌트가 렌더링되거나 URL이 변경될 때마다 로그인 상태를 체크
  useEffect(() => {
    const loginStatus = localStorage.getItem('loginok');
    
    // ✅ 수정된 로직: 로그인 상태일 때 localStorage에서 직접 이름 가져오기
    if (loginStatus === 'yes') {
      setIsLoggedIn(true);
      const storedName = localStorage.getItem('myname'); // localStorage에서 이름 가져오기
      if (storedName) {
        setMyName(storedName); // state 업데이트
      }
    } else {
      setIsLoggedIn(false);
    }
  }, [location]); // URL(location)이 바뀔 때마다 이 useEffect가 다시 실행됨

  // 로그아웃 처리 함수
  const handleLogout = () => {
    // ✅ 수정된 로직: myname도 함께 제거
    localStorage.removeItem('loginok');
    localStorage.removeItem('myid');
    localStorage.removeItem('myname'); // 이름 제거
    
    setIsLoggedIn(false);
    setMyName('');
    navi("/"); // 로그아웃 후 홈으로 이동
  };

  return (
    <AppBar position="static" elevation={0} sx={{ background: '#fff', borderRadius: 3, boxShadow: '0 2px 8px rgba(0,0,0,0.1)', mt: 3, mb: 3 }}>
      <Toolbar sx={{ display: 'flex', justifyContent: 'space-between', minHeight: 68 }}>
        {/* 왼쪽 메뉴 그룹 */}
        <Box sx={{ display: 'flex', gap: 2 }}>
          {navItems
            // 로그인 상태가 아닐 때만 'Login'과 'Member' 메뉴를 보여줌
            .filter(item => !isLoggedIn || (item.label !== 'Login' && item.label !== 'Member'))
            .map((item) => (
              <Button
                key={item.to}
                component={NavLink}
                to={item.to}
                sx={{
                  color: '#009688',
                  fontWeight: 700,
                  fontFamily: 'Montserrat',
                  borderRadius: 2,
                  px: 2.5,
                  py: 1,
                  fontSize: '1em',
                  border: '1.5px solid transparent',
                  '&.active': {
                    background: '#e0f2f1',
                    color: '#00796b',
                    border: '1.5px solid #009688',
                  },
                  '&:hover': {
                    background: '#b2dfdb',
                  },
                }}
              >
                {item.label}
              </Button>
            ))}
        </Box>

        {/* 오른쪽 사용자 정보 및 로그아웃 버튼 */}
        {isLoggedIn && (
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <Typography sx={{ color: '#00796b', fontWeight: 'bold' }}>
              {myName}님 환영합니다!
            </Typography>
            <Button
              onClick={handleLogout}
              sx={{
                color: '#fff',
                background: '#f44336',
                fontWeight: 700,
                borderRadius: 2,
                px: 2.5,
                py: 1,
                '&:hover': {
                  background: '#d32f2f',
                },
              }}
            >
              로그아웃
            </Button>
          </Box>
        )}
      </Toolbar>
    </AppBar>
  );
};

export default Menu;
