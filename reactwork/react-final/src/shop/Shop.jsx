import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import ShopRowItem from './ShopRowItem';

const Shop = () => {

  const navi=useNavigate();

  //백앤드에서 반환받을 리스트 변수
  const [shopList,setShopList]=useState([]);

  //데이타가져오는 함수
  const list=()=>{

       let url="http://localhost:9000/shop/list";

       axios.get(url)
       .then(res=>{
           
           //스프링으로부터 받아온 리스트를 shopList에 넣기
           setShopList(res.data);

           console.log("len="+res.data.length);
       });

      

  }

   //처음 랜더링시 딱한번 데이타 가져오기
       useEffect(()=>{

           console.log("list");
          list();
       },[])


  return (
    <div>

    <button type='button' className='btn btn-info'
    onClick={()=>{
      navi("/shop/form");
    }}>상품등록</button>

        {/* 번호 사진  상품명만 출력 */}
        <table className='table table-bordered' style={{width:'600px'}}>
          <thead>
              <tr className='table-secondary'>
                <th width='80'>번호</th>
                <th width='400'>상품명</th>
                <th width='120'>상세보기</th>
              </tr>
          </thead>
          <tbody>
              {
                // shopList.map((row,idx)=>(
                //    <ShopRowItem key={idx.row} idx={idx} row={row}/>
                // ))

                shopList.map((row,idx)=>{
                   return    <ShopRowItem key={idx.row} idx={idx} row={row}/>
                 })

              }
          </tbody>
        </table>
        
    </div>
  )
}

export default Shop