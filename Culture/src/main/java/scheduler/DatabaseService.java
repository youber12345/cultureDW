package scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class DatabaseService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void updateDatabase(Document document) {
        // XML에서 'row' 태그를 가진 데이터를 모두 가져옴
        NodeList nList = document.getElementsByTagName("row");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < nList.getLength(); i++) {
            Node node = nList.item(i);

            if (node.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) node;

                // 필요한 데이터 추출
                String codename = getTagValue("CODENAME", element);
                String guname = getTagValue("GUNAME", element);
                String title = getTagValue("TITLE", element);
                String place = getTagValue("PLACE", element);
                String useFee = getTagValue("USE_FEE", element);
                String orgLink = getTagValue("ORG_LINK", element);
                String mainImg = getTagValue("MAIN_IMG", element);
                String strtDateRaw = getTagValue("STRTDATE", element);
                String endDateRaw = getTagValue("END_DATE", element);
                String latitude = getTagValue("LAT", element);
                String longitude = getTagValue("LOT", element);

                // 날짜 처리: 시간 정보 제거 (YYYY-MM-DD 형식)
                String strtDate = null;
                String endDate = null;
                try {
                    if (strtDateRaw != null && !strtDateRaw.isEmpty()) {
                        Date start = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(strtDateRaw);
                        strtDate = dateFormat.format(start);
                    }
                    if (endDateRaw != null && !endDateRaw.isEmpty()) {
                        Date end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endDateRaw);
                        endDate = dateFormat.format(end);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // 데이터가 없는 경우 기본값 설정
                if (useFee == null || useFee.isEmpty()) {
                    useFee = "무료";
                }

                // address 생성
                String eventAddress = "서울시 " + guname + " " + place;

                // 중복 확인 로직 추가 (이름과 시작 날짜 기준)
                String checkSql = "SELECT COUNT(*) FROM eventDB WHERE event_name = ? AND event_sdate = TO_DATE(?, 'YYYY-MM-DD')";
                int count = jdbcTemplate.queryForObject(checkSql, new Object[]{title, strtDate}, Integer.class);

                // 중복되지 않은 경우에만 삽입
                if (count == 0) {
                    String sql = "INSERT INTO eventDB (event_num, event_name, event_price, event_guname, event_address, event_sdate, event_edate, event_ph, event_tag, event_lot, event_lat, event_homepage, event_description, event_poster) "
                            + "VALUES (event_seq.NEXTVAL, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, ?)";

                    jdbcTemplate.update(sql, title, useFee, guname, eventAddress, strtDate, endDate, null, codename, longitude, latitude, orgLink, codename, mainImg);
                }
            }
        }
    }

    // XML에서 태그 값 가져오기
    private String getTagValue(String tag, Element element) {
        NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
        Node node = nodeList.item(0);
        return node != null ? node.getNodeValue() : "";
    }
}

