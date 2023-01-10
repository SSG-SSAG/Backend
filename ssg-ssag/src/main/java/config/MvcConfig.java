package config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
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
@PropertySource("classpath:db.properties") // db.properties ���� �ҷ�����
public class MvcConfig implements WebMvcConfigurer {
	
	// DB �α��� ����
	@Value("${db.driver}")
	private String driver;
	@Value("${db.url}")
	private String url;
	@Value("${db.id}")
	private String id;
	@Value("${db.pwd}")
	private String pwd;
	
	// default servlet ���� (���� �ڿ�(html, css, js, jpg, gif, png, ... ) ó��)
	// ��� ��û�� ������ �������� ������ �� ������ �ٲ㼭 ����� ������ ������ �� �ְ� ��
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	// view resolver ����
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp"); // WEB_INF �ȿ� ���� ���� ��Ʈ�ѷ� ���ؼ��� ���� ����
	}
	
	@Bean
	public HikariConfig hikariConfig() {
		//hikariConfig�� �̸��� �޼��带 bean�� ���
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driver); // mysql�� ����
		hikariConfig.setJdbcUrl(url); // @IP:��Ʈ��ȣ:����ID
		hikariConfig.setUsername(id);
		hikariConfig.setPassword(pwd);
		return hikariConfig;		
	}
	
	// DataSource ��ü
	@Bean
	public HikariDataSource dataSource() {
		// �� �� ��, ó���� �� �� hikariConfig �޼��带 ����
		HikariDataSource ds = new HikariDataSource(hikariConfig());
		return ds;
				
	}
	
	// SqlSession ��ü
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		// SqlSessionFactory�� �������̽��Ƿ� ���� ���� �Ұ���
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource());
		
		return ssf.getObject();
	}
	
}
