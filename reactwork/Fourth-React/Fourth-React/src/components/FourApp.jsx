import { Subject } from '@mui/icons-material';
import React, { useState } from 'react'

const FourApp = () => {
  
  const [boards,setBoards]=useState([
    {
      num:1,
      writer:'제니',
      subject:'hello jenny',
      photo:'11'
    },{
      num:2,
      writer:'지수',
      subject:'hello jisoo',
      photo:'12'
    },
    {
      num:3,
      writer:'로제',
      subject:'hello roje',
      photo:'13'
    },
    {
      num:4,
      writer:'리사',
      subject:'hello lisa',
      photo:'14'
    }
  ]);

  return (
    <div>
        <h1 className='alert alert-danger'>FourApp입니다_배열안에 객체출력</h1>
        <table className='table table-bordered'>
          <thead>
            <tr className='table-info'>
              <th>번호</th>
              <th>사진</th>
              <th>제목</th>
              <th>작성자</th>
            </tr>
          </thead>
          <tbody>
            {
              boards.map((row,index)=>(
                <tr key={index}>
                  <td>{row.num}</td>
                  <td><img src={`../image2/연예인사진/${row.photo}.jpg`} style={{width:'50px'}} /></td>
                  <td>{row.subject}</td>
                  <td>{row.writer}</td>
                </tr>
              ))
            }
          </tbody>
        </table>
    </div>
  )
}

export default FourApp