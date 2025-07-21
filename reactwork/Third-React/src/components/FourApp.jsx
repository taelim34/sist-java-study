import React from 'react'
import img1 from '../assets/image/만화이미지/01.png'
import img2 from '../assets/image/만화이미지/02.png'
import img3 from '../assets/image/만화이미지/03.png'
import img4 from '../assets/image/만화이미지/04.png'
import img5 from '../assets/image/만화이미지/05.png'
const FourApp = () => {
  //배열변수선언
  const names=['강호동','이영자','유재석','차은우','카리나'];

  const nameList=names.map((name)=>(<li>{name}</li>));

  //색상을 배열로
  const colors=['yellow','tomato','gray','pink','green'];

  //이미지를 배열변수에 넣기
  const imgArr=[img1,img2,img3,img4,img5];

  //이미지배열변수_public
  const imgPArr=['3','4','5','6','7'];


  return (
    <div>
        <h1 className='alert alert-danger'>FourApp_반복문 연습</h1>
        <ol>{nameList}</ol>
        <ul>
          {
            //반복문을 리턴에 직접주어도 된다
            names.map((name,index)=>(<b style={{marginLeft:'10px'}}>{index}:{name}</b>))
          }
        </ul>

        <hr />

        {/* colors를 div로 출력할것(box) */}
        {
          colors.map((color)=>(<div className='box' style={{backgroundColor:color}}></div>))
        
        }
        <hr style={{clear:'both'}} />

        {/* src의 이미지를 배열반복출력하기 너비100 */}
        {
          imgArr.map((image)=>(<img src={image} style={{width:'100px'}}></img>))
        }
        <hr />
        {/* public의 이미지 배열반복 출력 css */}
        {
          imgPArr.map((photo)=>(<img src={'../image2/b'+photo+'.png'} className='myphoto'/>))
        }
        <hr />
        {
          imgPArr.map((photo)=>(<img src={`../image2/b${photo}.png`} className='myphoto'/>))
        }
        <hr />
    </div>
  )
}

export default FourApp