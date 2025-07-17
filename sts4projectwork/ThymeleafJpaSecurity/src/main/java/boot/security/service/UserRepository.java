package boot.security.service;

import org.springframework.data.jpa.repository.JpaRepository;

import boot.security.dto.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Integer>{

	public boolean existsByUsername(String username);
	public UserEntity findByUsername(String username);
}
