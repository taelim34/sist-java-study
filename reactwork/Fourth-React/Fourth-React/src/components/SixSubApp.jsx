import React from 'react'

const SixSubApp = (props) => {
    console.log(props);
  return (
    <div>
         SixSubApp_SixApp의 첫번째 자식

        <div className='line'>
            {props.name}
            {props.age}
        </div>
    </div>
  )
}

export default SixSubApp