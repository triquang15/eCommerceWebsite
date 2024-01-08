package com.triquang.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.triquang.security.oauth.CustomerOAuth2UserService;
import com.triquang.security.oauth.OAuth2LoginSuccessHandler;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

	@Autowired private CustomerOAuth2UserService oAuth2UserService;
	@Autowired private OAuth2LoginSuccessHandler oauth2LoginHandler;
	@Autowired private DatabaseLoginSuccessHandler databaseLoginHandler;
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	SecurityFilterChain configureHttpSecurity(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests(auth -> auth
			.requestMatchers("/account_details", "/update_account_details", "/orders/**",
					"/cart", "/address_book/**", "/checkout", "/place_order", "/reviews/**", 
					"/process_paypal_order", "/write_review/**", "/post_review",
					"/ask_question/**", "/post_question/**", "/customer/questions/**").authenticated()
			.anyRequest().permitAll()
			)
			.formLogin(f -> f
				.loginPage("/login")
				.usernameParameter("email")
				.successHandler(databaseLoginHandler)
				.permitAll())
			.oauth2Login(oauth2 -> oauth2
				.loginPage("/login")
				.userInfoEndpoint(u -> u
				.userService(oAuth2UserService))
				.successHandler(oauth2LoginHandler))
			
			.logout(l -> l.permitAll())
			
			.rememberMe(r -> r
				.key("1234567890_aBcDeFgHiJkLmNoPqRsTuVwXyZ")
				.tokenValiditySeconds(14 * 24 * 60 * 60))
				.sessionManagement(s -> s.sessionCreationPolicy(SessionCreationPolicy.ALWAYS))
			;	
		return http.build();
	}

	@Bean
	WebSecurityCustomizer configureWebSecurity() throws Exception {
		return (web) ->  web.ignoring().requestMatchers("/images/**", "/js/**", "/scss/**", "/css/**", "/vendor/**", "/webjars/**");
	}

	@Bean
	UserDetailsService userDetailsService() {
		return new CustomerUserDetailsService();
	}
	
	@Bean
	DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();

		authProvider.setUserDetailsService(userDetailsService());
		authProvider.setPasswordEncoder(passwordEncoder());

		return authProvider;
	}	
}
