import React, { useState } from 'react'
import Alert from '@mui/material/Alert'; // Alert import 추가
import CheckIcon from '@mui/icons-material/Check'; // CheckIcon import 추가
import SixSubApp from './SixSubApp';
import SixSubApp2 from './SixSubApp2';
import SixSubApp3 from './SixSubApp3';

const SixApp = () => {

  const [number,setNumber]=useState(0);

  //증가하는 이벤트함수
  const numberIncre=(e)=>{
    setNumber(number+1);
  }

  //감소하는 이벤트함수
  const numberDecre=(e)=>{
    setNumber(number-1);
  }
  return (
    <div>
      <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
        SixApp입니다_부모자식간 컴포넌트 통신
      </Alert>
      
      <SixSubApp name="제니" age="22"/>
      <SixSubApp name="지수" age="24"/>
      <SixSubApp name="리사" age="21"/>
      <br /><br />
      <SixSubApp2 menu="짜장면" price="12000" linecolor="green"/>
      <SixSubApp2 menu="햄버거" price="6000" linecolor="purple"/>
      <SixSubApp2 menu="파스타" price="18000" linecolor="red"/>
      <br /><br />
      <h1>{number}</h1>
      <SixSubApp3 incre={numberIncre} decre={numberDecre} />
    </div>
  )
}

export default SixApp