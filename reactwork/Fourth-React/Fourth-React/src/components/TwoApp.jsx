import React, { useEffect, useState } from 'react'

const TwoApp = () => {

  const [count,setCount]=useState(1);
  const [visible,setVisivle]=useState('visivle');

  //count값 변경될때만 호출
  useEffect(()=>{
    setVisivle(count%3==0?'visible':'hidden');
  },[count])

  return (
    <div>
        <h1 className='alert alert-danger'>TwoApp입니다_3의 배수일때만 이미지가 보여지게</h1>
        <button className='btn btn-danger'
        onClick={()=>{
          setCount(count+1);
        }}>count증가</button>

        <h1>{count}</h1>

        <img src="/image2/b1.png" alt="" width={300} style={{visibility:visible}} />

    </div>
  )
}

export default TwoApp