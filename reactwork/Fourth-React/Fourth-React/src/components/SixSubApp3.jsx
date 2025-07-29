import React from 'react'

const SixSubApp3 = (props) => {
  return (
    <div>
        SixSubApp3_SixApp의 3번째 자식
        <br />
        <button type='button' className='btn btn-success' onClick={props.incre}>증가</button>
        <button type='button' className='btn btn-danger' onClick={props.decre}>감소</button>

    </div>
  )
}

export default SixSubApp3