package thyme.data.repository;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import thyme.data.dto.CarCommentDto;

@Repository
@AllArgsConstructor
public class CarCommentDao {
	
	private CarCommentDaoInter commentInter;
	
	//댓글저장
	public void insertCommentCar(CarCommentDto dto)
	{
		commentInter.save(dto);
	}
	
	//댓글목록
	public List<CarCommentDto> getJpaCarCommentList(@Param("num") Long num)
	{
		return commentInter.getJpaCarCommentList(num);
	}
}
