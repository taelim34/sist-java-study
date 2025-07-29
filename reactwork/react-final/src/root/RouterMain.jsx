import React from 'react'
import { About, Main, Menu, Title } from '../components'
import { Route, Routes } from 'react-router-dom'
import Board from '../board/Board'
import Member from '../member/JoinForm'
import Login from '../login/Login'
import { ShopDetail, ShopForm, Shop } from '../shop'
import { JoinForm, LoginForm, MemberList } from '../member'

const RouterMain = () => {
  return (
    <div>
        <div><Title/></div>
        <div><Menu/></div>
        <div>
          <Routes>
            <Route  path='/'  element={<Main/>}/>


            {/* Shop _중첩라우트 사용시에는 index추가*/}
          <Route path='/shop'>
              <Route index element={<Shop/>}/>
              <Route path='list' element={<Shop/>}/>
              <Route  path='form' element={<ShopForm/>}/>
              <Route  path='detail/:num' element={<ShopDetail/>}/>
          </Route>

          <Route path='/member'>
            <Route index element={<JoinForm/>}/>
            <Route path='form' element={<JoinForm/>}/>
            <Route path='list' element={<MemberList/>}/>
            <Route path='login' element={<LoginForm/>}/>
          </Route>
            <Route path='/board/list' element={<Board/>}/>
            <Route path='/login' element={<Login/>}/>
            <Route path='/about' element={<About/>}/>
             <Route path='*' element={

                <div>
                    <h1>잘못된 주소입니다</h1>
                </div>
             }/>
          </Routes>

        </div>
        
        
        
        
        
    </div>
  )
}

export default RouterMain