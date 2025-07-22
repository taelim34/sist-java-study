import React, { useState } from 'react'
import Alert from '@mui/material/Alert'; // Alert import 추가
import CheckIcon from '@mui/icons-material/Check'; // CheckIcon import 추가

const FiveApp = () => {

  const [image,setImage]=useState('b1.png');
  const changeImage = (e)=>{
    setImage(e.target.value);
  }

  const colors=['red','green','yellow','gray','pink','purple'];

  const foodImgs=['1','2','3','4','5','6','7','8','9','10','11','12'];
  const images=[...Array(12)].map((_,i)=>i+1);
  const sangpum=[...Array(20)].map((_,i)=>i+1);
  
  //2차배열
  const arrays=[{"name":"영덕","addr":"서울"},{"name":"승윤","addr":"부산"}
    ,{"name":"현규","addr":"포항"},{"name":"창연","addr":"광주"},{"name":"희찬","addr":"대전"}];

  return (
    <div>
        <h1 className='alert alert-danger'>FiveApp</h1>
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          1.radio클릭시 이미지 변경할것  (public이미지를 value로 할것_일부 or 경로포함전체)
        </Alert>
        <br />
        <div>
          <label ><input type="radio" value='b1.png' name='imageSelect' onClick={changeImage} defaultChecked />이미지1</label>
          <label ><input type="radio" value='b2.png' name='imageSelect' onClick={changeImage} />이미지2</label>
          <label><input type="radio" value='b3.png' name='imageSelect' onClick={changeImage} />이미지3</label>
          <label><input type="radio" value='b4.png' name='imageSelect' onClick={changeImage} />이미지4</label>
          <label><input type="radio" value='b5.png' name='imageSelect' onClick={changeImage} />이미지5</label>
        </div>
        <img src={'../image2/'+image} alt="" />
        <hr />
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          2.색상 6개를 배열선언후 동그라미 원안에 1~6까지를 각각의 색안에 출력하시오
        </Alert>
        <br />
        <div style={{display:'flex', justifyContent:'center'}}>
        
        {
          colors.map((color,index) => (<div style={{backgroundColor:color, width:'50px', height:'50px', borderRadius:'50%', marginRight:'5px'}} key={index}>{index+1}</div>))
        }
        </div>
        <hr />
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          3.public에 Food이미지를 넣고 1~12까지를 모두 출력하시오
        </Alert>
        <br />
        {
          foodImgs.map((food)=>(<img src={`../image2/Food/${food}.jpg`} style={{width:'60px', height:'60px', marginLeft:'10px'}} />))
        }
        <hr />
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          4.public에 Food이미지를 넣고 1~12까지를 모두 출력하시오(배열출력)
        </Alert>
        {
          images.map((num)=>(<img key={num} src={`/image2/Food/${num}.jpg`} style={{width:'60px', height:'60px', marginLeft:'10px'}} />))
        }
        <hr />
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          5.public에 쇼핑몰이미지를 넣고 1~20까지를 모두 출력하시오(배열출력)
        </Alert>
        {
          sangpum.map((num)=>(<img src={`/image2/쇼핑몰사진/${num}.jpg`} style={{width:'60px', height:'60px', marginLeft:'10px', marginTop:'10px'}} />))
        }
        <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
          6.이중배열출력
        </Alert>
        {
          arrays.map((info,index)=>(<h5 key={index}>이름: {info.name},지역: {info.addr}</h5>))
        }
    </div>
  )
}

export default FiveApp