package thyme.data.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import thyme.data.dto.ShopDto;
import thyme.data.mapper.ShopMapperInter;
import thyme.my.mini.HomeController;

@Service
public class ShopService{

    private final HomeController homeController;

	@Autowired
	ShopMapperInter inter;

    ShopService(HomeController homeController) {
        this.homeController = homeController;
    }
	
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return inter.getTotalCount();
	}

	
	public void insertShop(ShopDto dto, MultipartFile upload, HttpSession session) {
		// TODO Auto-generated method stub
		
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		String fileName=upload.getOriginalFilename();
		
		dto.setPhoto(fileName);
		
		try {
			upload.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		inter.insertShop(dto);
	}
	
	public List<ShopDto> getListAll()
	{
		List<ShopDto> list=inter.getListAll();
		
		return list;
	}

}
