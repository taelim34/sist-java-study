import React from 'react'
import { useNavigate } from 'react-router-dom';

const ShopRowItem = ({idx,row}) => {

     const navi=useNavigate();

    let photoUrl="http://localhost:9000/save/";
  return (
    <tr>
      <td>{idx+1}</td>
      <td>
        <img src={photoUrl+row.photo} alt="" className='small'/> 
        <b>{row.sangpum}</b>
      </td> 
      <td><button type='button' className='btn btn-info'
      onClick={()=>{
        navi("/shop/detail/"+row.num);
        //navi(`/shop/detail/${row.num}`);
      }}>상세보기</button></td>
    </tr>
  )
}

export default ShopRowItem