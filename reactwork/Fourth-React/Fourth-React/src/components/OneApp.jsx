import React, { useEffect, useState } from 'react'

function OneApp() {
  const [count,setCount]=useState(0);
  const [message,setMessage]=useState('hello');
  const [number,setNumber]=useState(100);

  const changeCount=() =>{
    setCount(count+1);
  }
  const changeNumber=() =>{
    setNumber(number+10);
  }

  const changeAll=()=>{
    setCount(count+1);
    setNumber(number+5);
  }

  const changeMessage=(e)=>{
    setMessage(e.target.value);
  }
  //useEffect는 여러번 정의가 가능하다
  // useEffect(()=>{
  //   console.log("처음시작시,그리고 state값이 변경될때마다 무조건 호출");
  // })

  useEffect(()=>{
    console.log("처음시작시 딱 한번만 호출");
  },[])

  useEffect(()=>{
    console.log("처음시작시 그리고 count값 변경시에만 호출");
  },[count])

  useEffect(()=>{
    console.log("처음시작시 그리고 count,number값 변경시에만 호출");
  },[count,number])

  useEffect(()=>{
    console.log("처음시작시 그리고 message값 변경시에만 호출");
  },[message])
  

  return (
    <div>
        <h1 className='alert alert-danger'>OneApp입니다_UseEffect</h1>

        
        <button type='button' className='btn btn-info'
        onClick={changeCount}>Count만 증가</button>
        <button type='button' className='btn btn-info'
        onClick={changeNumber}>Number만 증가</button>
        <button type='button' className='btn btn-info'
        onClick={changeAll}>Count,Number 증가</button>
        <br />
        <b style={{fontSize:'4em'}}>{count}</b>
        <b style={{marginLeft:'30px', fontSize:'4em'}}>{number}</b>
        <hr />
        <input type="text" className='form-control'
        defaultValue={message} onKeyUp={changeMessage} />

        <h1>{message}</h1>
    </div>
  )
}

export default OneApp