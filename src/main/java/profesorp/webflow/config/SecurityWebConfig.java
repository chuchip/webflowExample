package profesorp.webflow.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@EnableWebSecurity
public class SecurityWebConfig extends WebSecurityConfigurerAdapter   {
    
    @Autowired
    DataSource dataSource;

   @Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
	       return super.authenticationManagerBean();
	}
	@Override
        protected void configure(AuthenticationManagerBuilder auth)   throws Exception
        {
            auth
            .jdbcAuthentication()
            .dataSource(dataSource)
             .usersByUsernameQuery(
                 "select username,password, enabled from users where username=?")
            .authoritiesByUsernameQuery(
                "select username, role from user_roles where username=?")
                     .passwordEncoder(passwordEncoder());
        }
//    @Bean
//    @Override
//    public UserDetailsService userDetailsService() {
//    	
//    	UserDetails user=User.builder().username("user").password(passwordEncoder().encode("secret")).
//    			roles("USER").build();
//    	UserDetails userAdmin=User.builder().username("admin").password(passwordEncoder().encode("secret")).
//    			roles("ADMIN").build();
//        return new InMemoryUserDetailsManager(user,userAdmin);
//    }
        
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
   @Override
    protected void configure(HttpSecurity http) throws Exception {
        http        	
               .authorizeRequests()                                
            	.antMatchers("/","/index","/webjars/**","/resources/**").permitAll()
//            	.antMatchers("/user").hasRole("USER")
//            	.antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/**").authenticated()
                .anyRequest().denyAll().and()
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/user") // Para que registremos el usuario
                .permitAll()
                .and()
                .logout().logoutSuccessUrl("/index") 
                .permitAll();
    }
}
