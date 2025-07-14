package thyme.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import thyme.data.dto.ShopDto;

@Mapper
public interface ShopMapperInter {

	@Select("select count(*) from myshop")
	public int getTotalCount();
	@Insert("insert into myshop values(null,#{sangpum},#{photo},#{price},#{color},#{ipgoday},now())")
	public void insertShop(ShopDto dto);
	@Select("select * from myshop")
	public List<ShopDto> getListAll();
}
