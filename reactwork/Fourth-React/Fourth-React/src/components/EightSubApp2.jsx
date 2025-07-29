import React, { useState } from 'react'

const EightSubApp2 = ({onAddColor}) => {

  const [color,setColor]=useState('');
  const changeColor=(col)=>{
    
    onAddColor(col);
  }
  return (
    <div>
        <h3>EightSubApp2_2번째 자식컴포넌트</h3>
        <b>색상선택: </b>
        <input type="color" style={{width:'100px'}} id='color' value={color} onChange={(e)=>(setColor(e.target.value))} />
        <br />
        <button type='button' className='btn btn-info' onClick={()=>changeColor(color)}>색상추가</button>
    </div>
  )
}

export default EightSubApp2