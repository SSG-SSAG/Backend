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
		
		//SqlSessionTemplate ������� �ϴ� ��� ���� ����(xml)�� ��ġ�� ����
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		ssf.setMapperLocations(resolver.getResources("classpath:/mapper/emp.xml")); // ��� �����ֱ�
		return ssf.getObject();
	}
	
	// DAO���� ���� ���� ��ü (���� �������� ������! bean�� ��ϵǾ� �־�� �Ѵ�)
	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		SqlSessionTemplate sst = new SqlSessionTemplate(sqlSessionFactory());
		return sst; 
	}
	
}
