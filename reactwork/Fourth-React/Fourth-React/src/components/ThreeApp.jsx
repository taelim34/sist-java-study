import React, { useState } from 'react'

const ThreeApp = () => {
  
  //객체처리변수
  const [inputs,setInputs]=useState({
    name:'제니',
    addr:'서울시',
    age:20
  });

  //3개공통함수
  const chageData=(e)=>{
    console.log("name"+e.target.name);
    console.log("value"+e.target.value);
    
    //name,value값 얻기
    //e.target이 갖고있는 객체 한번에 변경하기
    const {name,value}=e.target;
    setInputs({
      ...inputs,  //기존의 멤버는 유지
      [name]:value//해당값만 나오고 나머지는 사라진다..해결방법..펼침연산자
    });
  }
  return (

    <div>
        <h1 className='alert alert-danger'>ThreeApp</h1>

        <span style={{fontSize:'25px'}}ThreeApp 입니다_state를 객체로></span>

        <h3 className='alert alert-info'>
          이름: <input type="text" name='name' onChange={chageData} />
        </h3>
        <h3 className='alert alert-info'>
          주소: <input type="text" name='addr' onChange={chageData} />
        </h3>
        <h3 className='alert alert-info'>
          나이: <input type="text" name='age' onChange={chageData} />
        </h3>

        <hr />
        <h2>이름:{inputs.name},{inputs['name']} </h2>
        <h2>주소:{inputs.addr},{inputs['addr']} </h2>
        <h2>나이:{inputs.age},{inputs['age']} </h2>

    </div>
  )
}

export default ThreeApp