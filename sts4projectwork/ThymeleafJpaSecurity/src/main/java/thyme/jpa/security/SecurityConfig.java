package thyme.jpa.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean //암호화에 대한 빈 추가
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		
		return new BCryptPasswordEncoder();
	}
	

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http,
			CustomLoginSuccessHandler loginSuccessHandler,
			CustomLogoutHandler logoutHandler) throws Exception{

		http
			.authorizeHttpRequests((auth) -> auth  
					.requestMatchers("/", "/login","/join","/joinProc").permitAll() 
					.requestMatchers("/admin").hasRole("ADMIN")
					.requestMatchers("/my/**").hasAnyRole("ADMIN", "USER")
					.anyRequest().authenticated() 
					);
		
		//admin-->login
		http
		   .formLogin((auth)->auth.loginPage("/login")
				   .loginProcessingUrl("/loginProc")
				   //.defaultSuccessUrl("/my/mypage") 자동으로
				   .successHandler(loginSuccessHandler)  //커스텀한 로그인 메서드 호출
				   .permitAll()
				   )
		   .logout(logout -> logout
				   .logoutUrl("/logout")
				   .logoutSuccessUrl("/")
				   .addLogoutHandler(logoutHandler)
				   );
		
		//다중로그인허용
		http
		
			.sessionManagement((auth)->auth   //중복로그인 설정
					
					.maximumSessions(3)  //최대 3개까지 허용
					.maxSessionsPreventsLogin(true)
					
					);
		
		//접근불가 페이지 오류 띄우기
		http
			.exceptionHandling((t)->t
					.accessDeniedPage("/access-denied")
					
					);
		
		//csrf 공격에 대한 옵션 꺼두기
		http
			.csrf((auth) -> auth.disable()); //csrf 비활성화
		
		return http.build();
		
	}
	
	
}
