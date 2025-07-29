import React from 'react'
import { useNavigate } from 'react-router-dom'

const Home = () => {
  const navi=useNavigate();
  return (
    <div>
        <h1>Home</h1>
        <button type='button' className='btn btn-info'
        onClick={()=>{
          navi("/about");
        }}>About</button>
        <button type='button' className='btn btn-info' onClick={()=>{
          navi("/about/제니");
        }}>About2</button>
        <button type='button' className='btn btn-info'
        onClick={()=>{
          navi("/food/4/5");
        }}>점심메뉴</button>
    </div>
  )
}

export default Home