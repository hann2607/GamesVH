package com.gamevh.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.gamevh.service.UserService;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebSecurity
public class AuthConfig {
	@Autowired
	UserService userService;

	// Quản lý dữ liệu người dùng
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}

	// Phân quyền sử dụng và hình thức đăng nhập
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		// CSRF, CORS
		http.csrf().disable().cors().disable();

		// Phân quyền sử dụng
		http.authorizeRequests(auth -> {
			// Phân quyền truy cập tài nguyên hệ thống
			auth.requestMatchers("/login/**", "/resources/**", "/static/**", "/assets/**", "/lib/**", "/popup/**")
					.permitAll();

			// Phân quyền trang admin
//			auth.requestMatchers("/admin/**").hasAnyRole("DIRE", "STAF");

			// Phân quyền trang người dùng
			auth.requestMatchers("/account", "/checkout").hasAnyRole("CUST");
			
			// Tất cả đường dẫn còn lại đều được truy cập
			auth.anyRequest().permitAll();
		});

		// Điều khiển lỗi truy cập không đúng vai trò
		http.exceptionHandling().accessDeniedPage("/login/access/denied"); // [error]

		// Cấu hình form login
		http.formLogin().loginPage("/login/form").loginProcessingUrl("/login").defaultSuccessUrl("/", false)
				.failureUrl("/login/error").usernameParameter("username").passwordParameter("password").permitAll();

		// Nhớ đăng nhập
		http.rememberMe().rememberMeParameter("remember").userDetailsService(userService);

		// Cấu hình đăng xuất
		http.logout().logoutUrl("/logout").logoutSuccessUrl("/login/form").permitAll();

		// OAuth2 - Đăng nhập từ mạng xã hội
		http.oauth2Login()
			.loginPage("/login/form")
			.defaultSuccessUrl("/oauth2/login/success", true)
			.failureUrl("/login/error")
			.authorizationEndpoint()
			.baseUri("/oauth2/authorization");
		return http.build();
	}
}
