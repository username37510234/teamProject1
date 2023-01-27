package today.whatdo.festival.festivalinfo.api;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.yaml.snakeyaml.util.UriEncoder;

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.LinkedData.LinkedBindingsVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.LinkedData.LinkedResponseVO;

@Component
@Slf4j
@PropertySource("classpath:env.properties")
public class ApiLinkedOpenData {
	@Autowired
	private ApiCall apiCall;
	@Value("${datavisit.url}")
	private String url;
	
	public List<LinkedBindingsVO> getLinkedOpenData(String title) {
		title = title.replaceAll("\"", "");	// 문자에서 따옴표 제거(오류방지)
		String uri = "PREFIX skos: <http://www.w3.org/2004/02/skos/core#>\r\n"
				+ "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n"
				+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n"
				+ "PREFIX dc: <http://purl.org/dc/elements/1.1/>\r\n"
				+ "PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n"
				+ "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n"
				+ "PREFIX vi: <http://www.saltlux.com/transformer/views#>\r\n"
				+ "PREFIX kto: <http://data.visitkorea.or.kr/ontology/>\r\n"
				+ "PREFIX ktop: <http://data.visitkorea.or.kr/property/>\r\n"
				+ "PREFIX ids: <http://data.visitkorea.or.kr/resource/>\r\n"
				+ "PREFIX wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>\r\n"
				+ "PREFIX foaf: <http://xmlns.com/foaf/0.1/>\r\n"
				+ "PREFIX geo: <http://www.saltlux.com/geo/property#>\r\n"
				+ "PREFIX pf: <http://www.saltlux.com/DARQ/property#>"
				+ "SELECT *\r\n"
				+ "WHERE {\r\n"
				+ " ?resource a kto:Event ;\r\n"
				+ "	rdfs:label ?name;\r\n"
				+ "	ktop:showTime ?showTime;\r\n"
				+ "	dc:description ?description;\r\n"
				+ "	foaf:depiction ?depiction;\r\n"
				+ " 	 FILTER (contains(?name, \""
				+ title
				+ "\") )\r\n"
				+ "} LIMIT 10";
		try {
			uri = URLEncoder.encode(uri,"UTF-8"); // 쿼리문을 URL인코딩으로 파싱
			LinkedResponseVO result = apiCall.getDataToAPI(url+uri, LinkedResponseVO.class); // LINKEDAPI 호출
			if(result.getResults().getBindings().size()==0) { // 이미지가 없을경우 검색이 되지 않음
				uri = UriEncoder.decode(uri);
				uri = uri.replace("foaf:depiction ?depiction;", "");
				uri = URLEncoder.encode(uri,"UTF-8"); // 인코딩한 URI에서 이미지 검색문을 지운 후 다시 인코딩
				result = apiCall.getDataToAPI(url+uri, LinkedResponseVO.class);
				log.info("결과가 뭔지 보여줘 result=>{}",result);
				return result.getResults().getBindings(); // 값만 반환
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
