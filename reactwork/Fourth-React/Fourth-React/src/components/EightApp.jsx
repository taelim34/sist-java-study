import React, { useState } from 'react'
import EightSubApp1 from './EightSubApp1';
import EightSubApp2 from './EightSubApp2';

const EightApp = () => {

  //1번째
  const [message,setMessage]=useState('오늘 과제는 리액트 이벤트 입니다');
  const [photo,setPhoto]=useState('1');
  const [color,setColor]=useState('magenta');

  const changeData=(key, value)=>{
    if (key === 'message') {
      setMessage(value);
    } else if (key === 'photo') {
      setPhoto(value);
    } else if (key === 'color') {
      setColor(value);
    }
  }
  //2번째
  const [colorelt,setColorelt]=useState(['pink','blue','red','gray']);
  const addColor=(data)=>{
    setColorelt(colorelt.concat(
        data
    ))
  }
  const deleteColor=(idx)=>{
    setColorelt(colorelt.filter((item,i) => i!==idx))
  }
  return (
    <div>
        <h2>EightApp_부모 자식간 이벤트 과제</h2>
        <br /><br />

        {/* 첫번째 자식 이벤트로 변경할곳 */}
        <h3 style={{color:color}}>{message}</h3>
        <img src={`../image2/Food/${photo}.jpg`} alt="" style={{width:'300px'}} />

        {/* 두번째 자식 이벤트로 변경할곳 */}
        <br />
        {
            colorelt.map((col,idx)=>(<div style={{backgroundColor:col, cursor:'pointer'}} className='circle' key={idx} color={colorelt} onDoubleClick={() =>deleteColor(idx)}>{idx}</div>))
        }
        <br style={{clear:'both'}} />
        <EightSubApp1 message={message} photo={photo} color={color} changeData={changeData} />
        <br /><br />
        <EightSubApp2 onAddColor={addColor} />
    </div>
  )
}

export default EightApp