import React, { useState } from 'react'
import Alert from '@mui/material/Alert'; // Alert import 추가
import CheckIcon from '@mui/icons-material/Check'; // CheckIcon import 추가
import RowItemApp from './RowItemApp';
import WriteForm from './WriteForm';

const SevenApp = () => {
  const [board,setBoard]=useState([
    {
      name:'제니',
      photo:'2',
      mbti:'ENFJ',
      today:new Date()
    },
    {
      name:'지수',
      photo:'4',
      mbti:'INTJ',
      today:new Date()
    },
    {
      name:'로제',
      photo:'7',
      mbti:'ESTP',
      today:new Date()
    }
  ]);

  //데이터를 추가하는 함수이벤트
  const addBoard=(data)=>{
    setBoard(board.concat({

      // name:data.name,
      // photo:data.photo,
      // mbti:data.mbti
      ...data,
      today:new Date()
    }));
  }
  
  //삭제하는 이벤트
  const deleteBoard=(index)=>{
    setBoard(board.filter((item, i)=> i!==index));
  }

  return (
    <div>
      <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
        SevenApp입니다_리스트 출력
      </Alert>
      <br /><br />
      <WriteForm onsave={addBoard} />


      <br /><br />
      <table className='table table-bordered' style={{width:'600px'}}>
        <caption align="top"><b>Board 배열출력</b></caption>
        <thead>
          <tr>
            <th width="100">이름</th>
            <th width="120">사진</th>
            <th width="120">MBTI</th>
            <th width="180">날짜</th>
            <th width="100">삭제</th>
          </tr>
        </thead>
        <tbody>
          {
            //데이터 개수만큼 호출함
            board.map((row,index)=>(<RowItemApp row={row} key={index} index={index} onDelete={deleteBoard}/>))
            
          }
        </tbody>
      </table>
      
    </div>
  )
}

export default SevenApp