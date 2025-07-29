import React, { useRef, useState } from 'react'
import Alert from '@mui/material/Alert'; // Alert import 추가
import CheckIcon from '@mui/icons-material/Check'; // CheckIcon import 추가

const FiveApp = () => {

  
  //uesRef:변수관리하는기능
  //state와의 차이점: 값이 변경되어도 다시 렌더링 하지 않는다
  
  const [count,setCount]=useState(0);
  //ref선언
  const countRef=useRef(0);

  console.log('랜더링중...');

  //state변수 증가하는 함수
  const stateIncre=()=>{
    setCount(count+1);
  }
  //ref변수 증가하는 함수
  const refIncre=()=>{
    countRef.current=countRef.current+1;  //ref변수.current
    console.log('countRef: '+countRef.current);
  }
  

  return (
    <div>
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          FiveApp입니다_uesRef
        </Alert>
        <br /><br />
        
        <button type='button' className='btn btn-success' onClick={stateIncre}>state변수증가</button>
        <h1>{count}</h1>

        <button type='button' className='btn btn-success' onClick={refIncre}>ref변수증가</button>
        <h1>{countRef.current}</h1>
    </div>
  )
}

export default FiveApp