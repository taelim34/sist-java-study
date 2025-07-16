package thyme.data.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import thyme.data.dto.CarDto;
import thyme.data.repository.CarDao;

@Service
@AllArgsConstructor
public class CarService {


	CarDao dao;

	
	//db저장
		public void insertCar(
				@ModelAttribute("dto") CarDto dto,
				HttpSession session,
				@RequestParam(name = "carupload") MultipartFile carupload)
		{
			String path=session.getServletContext().getRealPath("/carsave");
			System.out.println(path);
			
			String uploadName=carupload.getOriginalFilename();
			
			dto.setCarphoto(uploadName);
			
			try {
				carupload.transferTo(new File(path+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dao.insertCar(dto);
		}
		
		
		//전체출력
		public List<CarDto> getAllMyCars()
		{
			return dao.getAllMyCars();
		}
		
		
		//dto
		public CarDto getData(Long num)
		{
			return dao.getData(num);
		}
		
		
		//수정
		public void updateCar(@ModelAttribute("dto") CarDto dto,
				HttpSession session,
				@RequestParam(name = "carupload") MultipartFile upload)
		{
			String path=session.getServletContext().getRealPath("/carsave");
			System.out.println(path);
			
			String uploadName=upload.getOriginalFilename();
			
			dto.setCarphoto(uploadName);
			
			try {
				upload.transferTo(new File(path+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			dao.updateCar(dto);
		}
		
		
		//삭제
		public void deleteCar(Long num)
		{
			dao.deleteCar(num);
		}
	
		//사진빼고 수정
		public void udpateCarNoPhoto(CarDto dto)
		{
			dao.udpateCarNoPhoto(dto);
		}
	
}
