import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const LoginForm = () => {
  const [myid,setMyid]=useState('');
  const [mypass,setMypass]=useState('');
  const navi=useNavigate();

  //submin이벤트
  const onSubmitLogin=(e)=>{
    e.preventDefault();

    if(!localStorage.url){
      localStorage.setItem("url","http://localhost:9000");
    }
    let loginUrl=localStorage.url+"/login/check";

    axios.post(loginUrl,{myid,mypass})
    .then(res=>{
      console.log(res.data.check);
      
      if(res.data.check===1){
        localStorage.loginok='yes';
        localStorage.myid=myid;
        localStorage.myname=res.data.myname;

        //일단폼
        navi("/member/list");
        window.location.reload();
      }else{
        alert("아이디나 비번이 맞지 않습니다");
        setMyid('');
        setMypass('');
      }
    })

  }
  return (
    <div className='login'>
      <form onSubmit={onSubmitLogin}>
        <table className='table table-bordered' style={{width:'250px'}}>
          <tbody>
          <tr>
            <th>아이디</th>
            <td>
              <input type="text" className='form-control'
              required autoFocus value={myid} onChange={(e)=>{
                setMyid(e.target.value)
              }} />
            </td>
          </tr>

          <tr>
            <th>비밀번호</th>
            <td>
              <input type="password" className='form-control'
              required value={mypass} onChange={(e)=>{
                setMypass(e.target.value)
              }} />
            </td>
          </tr>
          <tr>
            <td colSpan='2' align='center'>
              <button type='submit' className='btn btn-success'>로그인</button>
            </td>
          </tr>
          </tbody>
        </table>
      </form>
    </div>
  )
}

export default LoginForm