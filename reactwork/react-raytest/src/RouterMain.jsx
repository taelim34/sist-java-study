import React from 'react'
import Menu from './components/Menu'
import { Route, Routes } from 'react-router-dom'
import { About, Home } from './pages'
import Food from './pages/Food'
const RouterMain = () => {
  return (
    <div>

        {/* 모든페이지에서 공통으로 포함될 컴포넌트나 이미지 */}
        <h1 className='alert alert-warning'>React Router 실습중</h1>
        <Menu/>
        <img src="../image2/Food/1.jpg" alt="" className='main_photo' />
        <hr style={{clear:'both'}} />

        <Routes>
          <Route path='/' element={<Home/>} />
          <Route path='/about' element={<About/>}/>
          <Route  path='/about/:name' element={<About/>}></Route>
          <Route path='/food' element={<Food/>}/>
          <Route  path='/food/:food1/:food2' element={<Food/>}></Route>
          <Route path='/login/*' element={
            <div>
              <h1>로그인 기능은 아직 구현하기 전입니다</h1>
              <img src="/image2/Food/1.jpg" alt="" />
              <h3>점심메뉴는 이것</h3>
            </div>
          }></Route>
          <Route path='*' element={
            <h1>잘못된 주소입니다</h1>
          }></Route>
        </Routes>

    </div>
  )
}

export default RouterMain