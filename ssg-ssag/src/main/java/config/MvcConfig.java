package config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.shinsegae.ssgssag"})
@MapperScan(basePackages = {"com.shinsegae.ssgssag"})
public class MvcConfig implements WebMvcConfigurer {
	
	@Value("${db.*}")
	private String driver;
	private String url;
	private String id;
	private String pwd;
	
	// default servlet 설정 (정적 자원(html, css, js, jpg, gif, png, ... ) 처리)
	// 모든 요청을 스프링 서블릿으로 보내는 걸 설정을 바꿔서 상대경로 파일을 가져올 수 있게 함
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	// view resolver 설정
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp"); // WEB_INF 안에 들어가는 순간 컨트롤러 통해서만 접근 가능
	}
	
	@Bean
	public HikariConfig hikariConfig() {
		//hikariConfig란 이름의 메서드를 bean에 등록
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driver); // mysql에 연결
		hikariConfig.setJdbcUrl(url); // @IP:포트번호:서비스ID
		hikariConfig.setUsername(id);
		hikariConfig.setPassword(pwd);
		return hikariConfig;		
	}
	
	// DataSource 개체
	@Bean
	public HikariDataSource dataSource() {
		// 딱 한 번, 처음에 한 번 hikariConfig 메서드를 대입
		HikariDataSource ds = new HikariDataSource(hikariConfig());
		return ds;
				
	}
	
	// SqlSession 객체
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		// SqlSessionFactory는 인터페이스므로 직접 생성 불가능
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource());
		
		//SqlSessionTemplate 방식으로 하는 경우 매퍼 파일(xml)의 위치를 지정
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		ssf.setMapperLocations(resolver.getResources("classpath:/mapper/emp.xml")); // 경로 적어주기
		return ssf.getObject();
	}
	
	// DAO에서 주입 받을 객체 (주입 받으려면 무조건! bean에 등록되어 있어야 한다)
	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		SqlSessionTemplate sst = new SqlSessionTemplate(sqlSessionFactory());
		return sst; 
	}
	
}
