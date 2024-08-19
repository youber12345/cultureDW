package DAO;

import java.sql.Blob;

public class CultureEvent{
	int eventNum;
	String eventName;
	String eventSDate;
	String eventEDate;
	String eventAddress;
	Blob posterBlob;
	String base64Poster;
	
	String eventDescription;
	String eventPhone;
	String eventPrice;
	String eventHomepage;
	
	public CultureEvent() {
		// TODO Auto-generated constructor stub
	}

	public CultureEvent(int eventNum, String eventName, String eventSDate, String eventEDate, String eventAddress,
			Blob posterBlob) {
		super();
		this.eventNum = eventNum;
		this.eventName = eventName;
		this.eventSDate = eventSDate;
		this.eventEDate = eventEDate;
		this.eventAddress = eventAddress;
		this.posterBlob = posterBlob;
	}
	
	

	public CultureEvent(int eventNum, String eventName, String eventSDate, String eventEDate, String eventAddress,
			Blob posterBlob, String base64Poster, String eventDescription, String eventPhone, String eventPrice,
			String eventHomepage) {
		super();
		this.eventNum = eventNum;
		this.eventName = eventName;
		this.eventSDate = eventSDate;
		this.eventEDate = eventEDate;
		this.eventAddress = eventAddress;
		this.posterBlob = posterBlob;
		this.base64Poster = base64Poster;
		this.eventDescription = eventDescription;
		this.eventPhone = eventPhone;
		this.eventPrice = eventPrice;
		this.eventHomepage = eventHomepage;
	}
	
	

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getEventPhone() {
		return eventPhone;
	}

	public void setEventPhone(String eventPhone) {
		this.eventPhone = eventPhone;
	}

	public String getEventPrice() {
		return eventPrice;
	}

	public void setEventPrice(String eventPrice) {
		this.eventPrice = eventPrice;
	}

	public String getEventHomepage() {
		return eventHomepage;
	}

	public void setEventHomepage(String eventHomepage) {
		this.eventHomepage = eventHomepage;
	}

	public String getBase64Poster() {
		return base64Poster;
	}

	public void setBase64Poster(String base64Poster) {
		this.base64Poster = base64Poster;
	}

	public int getEventNum() {
		return eventNum;
	}

	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventSDate() {
		return eventSDate;
	}

	public void setEventSDate(String eventSDate) {
		this.eventSDate = eventSDate;
	}

	public String getEventEDate() {
		return eventEDate;
	}

	public void setEventEDate(String eventEDate) {
		this.eventEDate = eventEDate;
	}

	public String getEventAddress() {
		return eventAddress;
	}

	public void setEventAddress(String eventAddress) {
		this.eventAddress = eventAddress;
	}

	public Blob getPosterBlob() {
		return posterBlob;
	}

	public void setPosterBlob(Blob posterBlob) {
		this.posterBlob = posterBlob;
	}

	@Override
	public String toString() {
		return "Event [eventNum=" + eventNum + ", eventName=" + eventName + ", eventSDate=" + eventSDate
				+ ", eventEDate=" + eventEDate + ", eventAddress=" + eventAddress + ", posterBlob=" + posterBlob + "]";
	}
	
	
	
	
	}
