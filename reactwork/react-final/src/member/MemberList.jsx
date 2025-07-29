import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'

const MemberList = () => {
  const navi = useNavigate();
  const [memberList,setMemberList]=useState([]);

  const resultList=()=>{
    let url="http://localhost:9000/member/list";
    axios.get(url)
    .then(res=>{
      setMemberList(res.data);
    })
  }

  useEffect(()=>{
    resultList();
  },[])

  const deleteMember=(num)=>{
    if (!window.confirm("정말로 이 회원을 삭제하시겠습니까?")) {
      return;
    }

    let url="http://localhost:9000/member/delete?num="+num;
    axios.delete(url)
    .then(()=>{
      setMemberList(memberList.filter(member => member.num!==num));
      alert("회원이 삭제되었습니다");
    }).catch(err=>{
      console.error("회원삭제중 오류발생", err);
      alert("회원 삭제에 실패되었습니다");
    });
  };
  
  return (
    <div>
      <button type='button' className='btn btn-success'
      onClick={()=>{
        navi("/member/form");
      }}>회원가입</button>
      <table className='table table-boardered'>
        <tbody>
          <tr>
            <th>번호</th>
            <th>이름</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>가입일</th>
            <th>삭제</th>
          </tr>
          {
            memberList.map((row,idx)=>(
              <tr key={idx}>
                <td>{idx+1}</td>
                <td>{row.myname}</td>
                <td>{row.myid}</td>
                <td>{row.mypass}</td>
                <td>{row.gaipday}</td>
                <td>
                  <button type='button' className='btn btn-danger'
                  onClick={()=>deleteMember(row.num)}>삭제</button>
                </td>
              </tr>
            ))
          }
        </tbody>
      </table>
    </div>
  )
}

export default MemberList