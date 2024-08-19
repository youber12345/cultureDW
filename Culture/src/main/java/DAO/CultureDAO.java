package DAO;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.stereotype.Repository;


@Repository

public class CultureDAO {
	Connection conn;
	public CultureDAO() {
		try{
			
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			String username="system";
			String password="1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
			
			System.out.println(conn);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public List<CultureEvent> getCultureList(){
		try {
		String sql = "SELECT event_num, event_name, event_sdate, event_edate, event_address, event_poster FROM eventDB ORDER BY event_sdate DESC FETCH FIRST 6 ROWS ONLY";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        List<CultureEvent> list = new ArrayList<CultureEvent>();
        while (rs.next()) {
            int eventNum = rs.getInt("event_num");
            String eventName = rs.getString("event_name");
            String eventSDate = rs.getDate("event_sdate").toString();
            String eventEDate = rs.getDate("event_edate").toString();
            String eventAddress = rs.getString("event_address");
            Blob posterBlob = rs.getBlob("event_poster");

            // Blob 데이터를 Base64로 인코딩
            byte[] posterBytes = posterBlob.getBytes(1, (int) posterBlob.length());
            String base64Poster = java.util.Base64.getEncoder().encodeToString(posterBytes);
            CultureEvent ce = new CultureEvent();
            ce.setEventNum(eventNum);
            ce.setEventSDate(eventSDate);
            ce.setEventEDate(eventEDate);
            ce.setEventAddress(eventAddress);
            ce.setPosterBlob(posterBlob);
            ce.setBase64Poster(base64Poster);
            list.add(ce);
        }
        rs.close();
        stmt.close();
        return list;
        
        
        
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	public CultureEvent getCulture(int eventNum) {
		 CultureEvent gc = new CultureEvent();
		try {
		   String sql = "SELECT event_name, event_sdate, event_edate, event_description, event_ph, event_price, event_homepage FROM eventDB WHERE event_num = ?";
           PreparedStatement stmt = conn.prepareStatement(sql);
           stmt.setInt(1, eventNum);  // event_num이 3인 데이터를 조회
           ResultSet rs = stmt.executeQuery();
          
           
           if (rs.next()) {
               String eventName = rs.getString("event_name");
               String eventSDate = rs.getDate("event_sdate").toString();
               String eventEDate = rs.getDate("event_edate").toString();
               String eventDescription = rs.getString("event_description");
               String eventPhone = rs.getString("event_ph");
               String eventPrice = rs.getString("event_price");
               String eventHomepage = rs.getString("event_homepage");
               
               
               gc.setEventName(eventName);
               gc.setEventSDate(eventSDate);
               gc.setEventEDate(eventEDate);
               gc.setEventDescription(eventDescription);
               gc.setEventPhone(eventPhone);
               gc.setEventPrice(eventPrice);
               gc.setEventHomepage(eventHomepage);
               
               
           }
           rs.close();
           stmt.close();
           return gc;
           
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	
	@Test
	public void test() {
		CultureDAO ce = 
		new CultureDAO();
		System.out.println(ce.getCultureList());
		
	}
}
