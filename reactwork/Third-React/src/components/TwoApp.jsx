import React, { useState } from 'react'
import image1 from '../assets/image/연예인사진/송하영.jpg'
import image2 from '../assets/image/연예인사진/이나경.jpg'
import image3 from '../assets/image/연예인사진/이채영.jpg'
import image4 from '../assets/image/연예인사진/백지헌.jpg'
const TwoApp = () => {
  
  const [hp1,setHp1]=useState('02');``
  const [hp2,setHp2]=useState('');
  const [hp3,setHp3]=useState('');
  const [image,setImage]=useState('');

  const changeHp1=()=>{
    let hp1=document.getElementById("hp1").value;
    setHp1(hp1);
  }

  const changeHp2=()=>{
    let hp2=document.getElementById("hp2").value;
    setHp2(hp2);
  }

  const changeHp3=()=>{
    let hp3=document.getElementById("hp3").value;
    setHp3(hp3);
  }

  const changeImage=()=>{
    let image=document.getElementById("image").value;
    setImage(image);
  }


  return (
    <div>
        <h1 className='alert alert-danger'>TwoApp</h1>
        <br /><br />
        <div className='input-group'>
            <select className='form-control' style={{width:'100px'}} id='hp1'
            onChange={changeHp1}>
                <option value="02">02</option>
                <option value="010">010</option>
                <option value="031">031</option>
                <option value="017">017</option>
            </select>
            &nbsp;&nbsp;
            <b>-</b>&nbsp;&nbsp;
            <input type="text" className='form-control' maxLength='4' style={{width:'100px'}}
            id='hp2' onKeyUp={changeHp2} />
            &nbsp;&nbsp;
            <b>-</b>&nbsp;&nbsp;
            <input type="text" className='form-control' maxLength='4' style={{width:'100px'}}
            id='hp3' onKeyUp={changeHp3} />
        </div>
        <div>
            <b>이미지선택: </b>
            <select className='form-control' style={{width:'100px'}} id='image' onChange={changeImage}>
                <option value={image1}>이미지 1</option>
                <option value={image2}>이미지2</option>
                <option value={image3}>이미지3</option>
                <option value={image4}>이미지4</option>
            </select>
        </div>

        <div className='output'>
            {hp1}-{hp2}-{hp3}
        </div>

        <div className='output_image'>
            {/* src의 이미지를 출력해보세요 */}
            <img src={image} alt="" style={{width:'250px'}} />
        </div>

    </div>
  )
}

export default TwoApp