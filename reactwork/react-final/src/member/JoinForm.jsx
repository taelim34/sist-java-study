import React, { useState } from 'react';
import { Paper, Typography, Box } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Member = () => {
  const [myname, setMyname] = useState('');
  const [myid, setMyid] = useState('');
  const [mypass, setMypass] = useState('');
  const [btnok, setBtnok] = useState(false); // 중복체크버튼 클릭여부
  const [idmsg, setIdmsg] = useState(''); // 아이디가능여부 메시지

  const navi = useNavigate();

  // API의 기본 URL을 상수로 정의
  const API_URL = "http://localhost:9000";

  // 아이디 중복체크
  const btnIdCheck = () => {
    if (!myid) {
      alert("아이디를 입력해주세요.");
      return;
    }

    // 올바른 URL 생성
    const url = `${API_URL}/member/idcheck?myid=${myid}`;
    
    console.log("Request URL:", url); // 콘솔에서 URL이 올바른지 확인

    axios.get(url)
      .then(res => {
        if (res.data === 0) {
          setIdmsg("가입 가능한 아이디입니다.");
          setBtnok(true);
        } else {
          setIdmsg("이미 사용 중인 아이디입니다.");
          setBtnok(false);
        }
      })
      .catch(error => {
        console.error("ID check error!", error);
        setIdmsg("서버 통신 오류!");
      });
  };

  // 아이디 입력 시 호출
  const inputIdChange = (e) => {
    setMyid(e.target.value);
    setBtnok(false); // 중복체크 후 아이디 다시 입력할 경우를 위해 초기화
    setIdmsg('');
  };

  // 회원가입 버튼 클릭 시
  const onSubmitButton = (e) => {
    e.preventDefault(); // form의 기본 전송 기능을 막음

    let insertUrl=`${API_URL}/member/insert`;
    if (!btnok) {
      alert('아이디 중복체크를 해주세요');
      return;
    }

    axios.post(insertUrl,{myname,myid,mypass})
    .then(()=>{
      navi("/member/login")
    })
    
  };

  return (
    <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '60vh' }}>
      <Paper elevation={0} sx={{ p: 5, borderRadius: 3, background: '#fff', minWidth: 450, textAlign: 'center', boxShadow: '0 2px 8px rgba(0,0,0,0.1)' }}>
        <Typography variant="h4" sx={{ color: '#009688', fontWeight: 700, mb: 3 }}>
          회원가입
        </Typography>
        <form onSubmit={onSubmitButton}>
          <table className='table' style={{ width: '100%' }}>
            <tbody>
              <tr>
                <th style={{width: '100px', verticalAlign: 'middle'}}>이름</th>
                <td>
                  <input type="text" className='form-control'
                    required
                    value={myname} onChange={(e) => setMyname(e.target.value)} />
                </td>
              </tr>
              <tr>
                <th style={{verticalAlign: 'middle'}}>아이디</th>
                <td>
                  <div className='input-group'>
                    {/* defaultValue를 value로 수정 */}
                    <input type="text" className='form-control'
                      required
                      value={myid} onChange={inputIdChange} />
                    <button type='button' className='btn btn-outline-danger'
                      onClick={btnIdCheck}>중복체크</button>
                  </div>
                  <div style={{fontSize: '0.8em', color: btnok ? 'blue' : 'red', textAlign: 'left', marginTop: '5px'}}>
                    {idmsg}
                  </div>
                </td>
              </tr>
              <tr>
                <th style={{verticalAlign: 'middle'}}>비밀번호</th>
                <td>
                  <input type="password" className='form-control'
                    required
                    value={mypass} onChange={(e) => setMypass(e.target.value)} />
                </td>
              </tr>
              <tr>
                <td colSpan='2' align='center' style={{paddingTop: '20px'}}>
                  <button type='submit' className='btn btn-success'>
                    회원가입
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </form>
      </Paper>
    </Box>
  );
};

export default Member;
