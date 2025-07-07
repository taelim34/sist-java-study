package boot.jpa.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boot.jpa.dto.ShopDto;

@Repository
public class ShopDao {

	@Autowired
	ShopDaoInter shopInter;
	
	//insert
	public void insertShop(ShopDto dto)
	{
		shopInter.save(dto);
	}
	
	//list
	public List<ShopDto> getAllData()
	{
		return shopInter.findAll();
	}
	//getdata
	public void getData(int num)
	{
		shopInter.getById(num);
	}
	
	//update
	public void updateShop(ShopDto dto)
	{
		shopInter.save(dto);
	}
	
}
