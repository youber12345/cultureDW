package DTO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Event {
    private int event_num;
    private String event_name;
    private Date event_sdate;
    private Date event_edate;
    private String event_description;
    private String event_ph;
    private String event_price;
    private String event_homepage;
    private String event_poster;
    private String event_address;
    private String event_tag;
    private String event_guName;
    private String event_lat;
    private String event_lot;


	// 날짜 포맷을 위한 SimpleDateFormat
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    // Getter와 Setter 메서드들...

    public int getEvent_num() {
        return event_num;
    }

    public void setEvent_num(int event_num) {
        this.event_num = event_num;
    }

    public String getEvent_name() {
        return event_name;
    }

    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    public Date getEvent_sdate() {
        return event_sdate;
    }

    public void setEvent_sdate(Date event_sdate) {
        this.event_sdate = event_sdate;
    }

    // String 형태의 날짜를 Date로 변환하여 설정하는 메서드
    public void setEvent_sdate(String event_sdate) throws ParseException {
        this.event_sdate = dateFormat.parse(event_sdate);
    }

    public Date getEvent_edate() {
        return event_edate;
    }

    public void setEvent_edate(Date event_edate) {
        this.event_edate = event_edate;
    }

    // String 형태의 날짜를 Date로 변환하여 설정하는 메서드
    public void setEvent_edate(String event_edate) throws ParseException {
        this.event_edate = dateFormat.parse(event_edate);
    }

    public String getEvent_description() {
        return event_description;
    }

    public void setEvent_description(String event_description) {
        this.event_description = event_description;
    }

    public String getEvent_ph() {
        return event_ph;
    }

    public void setEvent_ph(String event_ph) {
        this.event_ph = event_ph;
    }

    public String getEvent_price() {
        return event_price;
    }

    public void setEvent_price(String event_price) {
        this.event_price = event_price;
    }

    public String getEvent_homepage() {
        return event_homepage;
    }

    public void setEvent_homepage(String event_homepage) {
        this.event_homepage = event_homepage;
    }

    public String getEvent_poster() {
        return event_poster;
    }

    public void setEvent_poster(String event_poster) {
        this.event_poster = event_poster;
    }

    public String getEvent_address() {
        return event_address;
    }

    public void setEvent_address(String event_address) {
        this.event_address = event_address;
    }

    public String getEvent_tag() {
        return event_tag;
    }

    public void setEvent_tag(String event_tag) {
        this.event_tag = event_tag;
    }

    public String getEvent_guName() {
        return event_guName;
    }

    public void setEvent_guName(String event_guName) {
        this.event_guName = event_guName;
    }

    // Date 객체를 yyyy-MM-dd 형식의 String으로 변환하는 메서드
    public String getFormattedEvent_sdate() {
        return dateFormat.format(event_sdate);
    }

    public String getFormattedEvent_edate() {
        return dateFormat.format(event_edate);
    }
    
    public String getEvent_lat() {
		return event_lat;
	}

	public void setEvent_lat(String event_lat) {
		this.event_lat = event_lat;
	}

	public String getEvent_lot() {
		return event_lot;
	}

	public void setEvent_lot(String event_lot) {
		this.event_lot = event_lot;
	}

	@Override
	public String toString() {
		return "Event [event_num=" + event_num + ", event_name=" + event_name + ", event_lat=" + event_lat
				+ ", event_lot=" + event_lot + "]";
	}
    
    
}
