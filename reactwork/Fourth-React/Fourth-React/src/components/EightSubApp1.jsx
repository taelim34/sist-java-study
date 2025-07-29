import React from 'react'

const EightSubApp1 = ({changeData}) => {
  return (
    <div>
        <h3>EightSubApp1_자식1 컴포넌트</h3>
        <b>메세지</b>
        <input type="text" className='form-control' onChange={(e)=>( changeData('message',e.target.value))} />
        <b>색상 변경</b>
        <input type="color" className='form-control' value={'#ffccff'} onChange={(e)=>( changeData('color',e.target.value))} />
        <b>이미지 변경</b>
        <select onChange={(e)=>( changeData('photo',e.target.value))}>
            {/* option은 1~10번까지만 배열로 생성할것 */}
            {
                [...new Array(10)].map((img,idx)=>(<option value={idx+1}>{idx+1}</option>))
            }

        </select>
    </div>
  )
}

export default EightSubApp1