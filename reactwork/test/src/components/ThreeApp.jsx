import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import AppleIcon from '@mui/icons-material/Apple';
import img1 from '../assets/image/연예인사진/3.jpg'
import img2 from '../assets/image/연예인사진/4.jpg'
import img3 from '../assets/image/연예인사진/5.jpg'
import img4 from '../assets/image/연예인사진/6.jpg'

const ThreeApp = () => {

  const [msg,setMsg] =useState('리액트 복습좀 합시다');
  const [photo,setPhoto]=useState(img1);
  const [width,setWidth]=useState(200);
  const [border,setBorder]=useState('');
  
  //점점작게 이벤트
  const smallImage=()=>{
    setWidth(width-10);
  }
  //점점크게 이벤트
  const largeImage=()=>{
    setWidth(width+10);
  }
  return (

    <div>
        <div>
            <input type="text" className='form-control' style={{width:'400px'}}
            placeholder='메세지를 입력해주세요'
            onChange={(e)=>{
                setMsg(e.target.value);
            }} />
        </div>


        <h1>ThreeApp 입니다</h1>
        <h2 className='alert alert-info'>{msg}</h2>
        <Alert icon={<AppleIcon fontSize="inherit" />} severity="success">
            {msg}
        </Alert>
        
        <div>
            <select className='form-select' style={{width:'200px'}}
            onChange={(e)=>{
                setPhoto(e.target.value);
            }}>

                <option value={img1}>A</option>
                <option value={img2}>B</option>
                <option value={img3}>C</option>
                <option value={img4}>D</option>
            </select>

            <select className='form-select' style={{width:'200px'}}
            onChange={(e)=>{
                setBorder(e.target.value);
            }}>

                <option value='double'>double</option>
                <option value='inset'>inset</option>
                <option value='dotted'>dotted</option>
                <option value='dashed'>dashed</option>
            </select>

            <br /><br />
            <button type='button' className='btn btn-info'
            style={{marginLeft:'100px'}} onClick={smallImage}>점점작게</button>
            <button type='button' className='btn btn-info'
            style={{marginLeft:'100px'}} onClick={largeImage}>점점크게</button>
        </div>


        {/* 이미지 */}
        <img src={photo} alt="" style={{width:`${width}px`, border:`${border} 10px gray`}} />
        <br /><br />


    </div>
  )
}

export default ThreeApp