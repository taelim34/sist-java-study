import React, { useState } from 'react'
import Alert from '@mui/material/Alert'; // Alert import 추가
import CheckIcon from '@mui/icons-material/Check'; // CheckIcon import 추가

const SixApp = () => {

  const [names,setNames]=useState(['제니','리사','로제','지수']);
  const [irum,setIrum]=useState('');


  //추가버튼이벤트
  const btnInsert=()=>{
    setNames(names.concat(irum));
    setIrum('');
  }
  //입력change이벤트
  const txtInput= (e) =>{
    setIrum(e.target.value);
  }
  //enter이벤트
  const txtEnter=(e)=>{
    if(e.key==='Enter'){
      btnInsert();
      e.target.value='';
    }
  }
  //더블클릭 삭제 이벤트
  const dataRemove=(index)=>{
    // //방법1
    // setNames([
    //   ...names.slice(0,index),
    //   ...names.slice(index+1,names.length)
    // ]);  //index번지만 빼고 잘라서 넣는다

    //방법2
    setNames(names.filter((item,i) => i !== index))
  }
  return (
    <div>
      <h1 className='alert alert-danger'>SixApp</h1>
      <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
        SixApp_추가/삭제 이벤트
      </Alert>
      <div className='input-group'>
        <input type="text" placeholder='이름을 입력해주세요' className='form-control'
        value={irum} onChange={txtInput} onKeyUp={txtEnter} />
        <button type='button' className='btn btn-info' style={{marginLeft:'5px'}}
        onClick={btnInsert}>추가</button>
      </div>
      <br /><br />
      <h5>데이터를 더블클릭시 삭제됩니다</h5>
      <ul>
        {
          names.map((name,index)=>(<li className='data' key={index}
          onDoubleClick={() => dataRemove(index)}>{name}</li>))
        }
      </ul>

    </div>
  )
}

export default SixApp