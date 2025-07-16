package thyme.data.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "jpacar_comment")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarCommentDto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idx;
	
	@ManyToOne
	@JoinColumn(name = "num")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private CarDto car;
	
	@Column
	private String comment;
	
	@CreationTimestamp
	@Column(updatable = false)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/seoul")
	private Timestamp writeday;
}
