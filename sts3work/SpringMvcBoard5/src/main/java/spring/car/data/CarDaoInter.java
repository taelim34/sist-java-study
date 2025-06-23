package spring.car.data;

import java.util.List;

public interface CarDaoInter {

	public List<CarDto> getAllCarList();
	public void insertMyCar(CarDto dto);
	public void updateMyCar(CarDto dto);
	public CarDto getData(String num);
	public void deleteMyCar(String num);
}
