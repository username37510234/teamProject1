package today.whatdo.userinfo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan
public class WhattodayApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhattodayApplication.class, args);
	}

}
