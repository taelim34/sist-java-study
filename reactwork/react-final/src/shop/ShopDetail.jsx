import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

const ShopDetail = () => {

  const {num}=useParams();

  //dto들어올 변수선언
  const [data,setData]=useState('');

  //navi
  const navi=useNavigate();

  const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };


  //삭제시 호출할 함수
  const onDelete=()=>{
    console.log("delete");

    //실제삭제
   axios.delete(deleteUrl)
   .then(()=>{
       
       navi("/shop/list")
   })


    handleClose();
  }


  //url등록
  let detaildUrl="http://localhost:9000/shop/detail?num="+num;
  let photoUrl="http://localhost:9000/save/";
  let deleteUrl="http://localhost:9000/shop/delete?num="+num;

    //스프링으로 부터 num에 해당하는 data받기

    const onDataReceive=()=>{
      axios.get(detaildUrl)
      .then(res=>{
          console.log(res.data.sangpum);
          setData(res.data);
      }).catch(err=>{
        alert(err.data);
      })
    }

    //처음랜더링시 위의 함수 호출
    useEffect(()=>{
      onDataReceive();
    },[]);


  return (
    <div>
       {/* num확인후 db에서 가져올것!!! */}
      {/* <h1>{num}</h1> */}
      <React.Fragment>
        <Button variant="outlined" onClick={handleClickOpen}>
          Open alert dialog
        </Button>
        <Dialog
          open={open}
          onClose={handleClose}
          aria-labelledby="alert-dialog-title"
          aria-describedby="alert-dialog-description"
        >
          <DialogTitle id="alert-dialog-title">
            {"상품삭제확인?"}
          </DialogTitle>
          <DialogContent>
            <DialogContentText id="alert-dialog-description">
              <h5>{data.sangpum} 상품을 삭제하시려면 [확인]버튼을 눌러주세요</h5>
            </DialogContentText>
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>취소</Button>
            <Button onClick={onDelete} autoFocus>
              확인
            </Button>
          </DialogActions>
        </Dialog>
      </React.Fragment>





      <table className='table table-bordered' style={{width:'500px'}}>
         <caption style={{captionSide:'top'}}><b>상품상세보기</b></caption>
         <tbody>
           <tr>
            <td width='300' rowSpan='4'>
              <img src={photoUrl+data.photo} alt="" style={{width:'300px'}}/>
            </td>
            <td>상품명: {data.sangpum}</td>
           </tr>
           <tr>
            <td>수량: {data.su}</td>
           </tr>
           <tr>
            <td>단가: {data.dan}</td>
           </tr>
           <tr>
            <td>입고일: {data.ipgoday}</td>
           </tr>
           <tr>
              <td colSpan='2' align='right'>
                <button type='button' className='btn btn-outline-secondary'
                onClick={()=>{
                  navi("/shop/list");
                }}>목록</button>
                <button type='button' className='btn btn-outline-secondary'
                onClick={()=>{
                  navi("/shop/form")
                }}>상품추가</button>
                <button type='button' className='btn btn-outline-secondary'>수정</button>
                <button type='button' className='btn btn-outline-secondary'
                onClick={handleClickOpen}>삭제</button>
              </td>
           </tr>
         </tbody>
      </table>
    </div>
  )
}

export default ShopDetail