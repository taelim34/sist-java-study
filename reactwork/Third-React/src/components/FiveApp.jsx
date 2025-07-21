import React, { useState } from 'react'

const FiveApp = () => {

  const [image,setImage]=useState('b1.png');
  const changeImage = (e)=>{
    setImage(e.target.value);
  }

  const colors=['red','green','yellow','gray','pink','purple'];

  const foodImgs=['1','2','3','4','5','6','7','8','9','10','11','12'];

  return (
    <div>
        <h1 className='alert alert-danger'>FiveApp</h1>
        {/* 1.radio클릭시 이미지 변경할것  (public이미지를 value로 할것_일부 or 경로포함전체) */}
        <div>
          <label ><input type="radio" value='b1.png' onClick={changeImage} defaultChecked />이미지1</label>
          <label ><input type="radio" value='b2.png' onClick={changeImage} />이미지2</label>
          <label><input type="radio" value='b3.png' onClick={changeImage} />이미지3</label>
          <label><input type="radio" value='b4.png' onClick={changeImage} />이미지4</label>
          <label><input type="radio" value='b5.png' onClick={changeImage} />이미지5</label>
        </div>
        <img src={'../image2/'+image} alt="" />
        <hr />
        <div style={{display:'flex', justifyContent:'center'}}>
        {/* 2.색상 6개를 배열선언후 동그라미 원안에 1~6까지를 각각의 색안에 출력하시오 */}
        {
          colors.map((color,index) => (<div style={{backgroundColor:color, width:'50px', height:'50px', borderRadius:'50%', marginRight:'5px'}}>{index}</div>))
        }
        </div>
        <hr />
        {/* 3.public에 Food이미지를 넣고 1~12까지를 모두 출력하시오 */}
        {
          foodImgs.map((food)=>(<img src={`../image2/Food/${food}.jpg`} style={{width:'60px', height:'60px'}} />))
        }
    </div>
  )
}

export default FiveApp