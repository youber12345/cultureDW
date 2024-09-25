package DTO;

import java.sql.Timestamp;

public class Comment {
    private int commentId;           // Primary Key
    private String comm;             // Comment content
    private int userNum;             // User ID (foreign key)
    private int eventNum;            // Event ID (foreign key)
    private Integer parentCommentId;     // For replies, refers to the parent comment
    private Timestamp createdAt;     // Automatically set
    private String username; // Add this field for the username
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public Integer getParentCommentId() {
		return parentCommentId;
	}
	public void setParentCommentId(Integer parentCommentId) {
		this.parentCommentId = parentCommentId;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
    public String getUsername() { // Getter for the username
        return username;
    }

    public void setUsername(String username) { // Setter for the username
        this.username = username;
    }
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", comm=" + comm + ", userNum=" + userNum + ", eventNum=" + eventNum
				+ ", parentCommentId=" + parentCommentId + ", createdAt=" + createdAt + ", username=" + username + "]";
	}

    
    
}
