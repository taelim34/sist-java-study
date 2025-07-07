package boot.jpa.dto;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "food")
@Data
public class ShopDto {
	//테이블이름은 jpashop으로 만들것!!!
	//seq없이 auto인걸로 해보세요	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	
	@Column
	private String foodname;
	
	@Column
	private int foodprice;
	
	@Column
	private String foodphoto;
	
	@CreationTimestamp
	private String ipgoday;
	
	
}
