import React from 'react'

const RowItemApp = ({row ,index ,onDelete}) => {

  
  return (
    <tr>
        <td>
            {row.name}    
        </td>

        <td>
            <img src={`./image2/연예인사진/${row.photo}.jpg`} style={{width:'80px', height:'80px', borderRadius:'50px'}} />    
        </td>

        <td>
            {row.mbti}    
        </td>

        <td>
            {row.today.toLocaleDateString('ko-kr')}
        </td>

        <td>
            <button type='button' className='btn btn-danger' onClick={()=> onDelete(index)}>삭제</button>
        </td>
    </tr>
  )
}

export default RowItemApp