package DTO;

public class SearchEvent {
    private String event_address;
    private String event_tag;
    private String searchdate;

    public SearchEvent() {
		// TODO Auto-generated constructor stub
	}

    
	public SearchEvent(String event_address,	String event_tag, String searchdate) {
		this.event_address = event_address;
		this.event_tag = event_tag;
		this.searchdate = searchdate;
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

	public String getSearchdate() {
		return searchdate;
	}

	public void setSearchdate(String searchdate) {
		this.searchdate = searchdate;
	}


	@Override
	public String toString() {
		return "SearchEvent [event_address=" + event_address + ", event_tag=" + event_tag
				+ ", searchdate=" + searchdate + "]";
	}


	   
    
    
    

	// 날짜 포맷을 위한 SimpleDateFormat
    //private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    // Getter와 Setter 메서드들...

    // String 형태의 날짜를 Date로 변환하여 설정하는 메서드
    //public void setEvent_sdate(String event_sdate) throws ParseException {
    //    this.event_sdate = dateFormat.parse(event_sdate);
    //}

 

   // public void setEvent_edate(Date event_edate) {
   // 	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
    	
    	// Date를 yyyy-MM-dd 형식의 문자열로 변환
   // 	searchDate = formatter.format(event_edate);    	
    //    this.event_edate = event_edate;
   // }

	// String 형태의 날짜를 Date로 변환하여 설정하는 메서드
    //public void setEvent_edate(String event_edate) throws ParseException {
     //   this.event_edate = dateFormat.parse(event_edate);
    //}

  
    // Date 객체를 yyyy-MM-dd 형식의 String으로 변환하는 메서드
    //public String getFormattedEvent_sdate() {
     //   return dateFormat.format(event_sdate);
   // }

    //public String getFormattedEvent_edate() {
    //    return dateFormat.format(event_edate);
   // }
    
    


    
}
