package community.model.dao;
import static common.JdbcTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CommunityImgDao {
	private Properties prop = new Properties();
	
	public CommunityImgDao() {
		String fileName = KnowhowDao.class.getResource("/sql/community-img.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
