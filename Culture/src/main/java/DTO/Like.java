package DTO;

public class Like {

    private int likeNum;  // like_num 필드
    private int userNum;
    private int eventNum;  // eventNum 필드

    // 생성자 수정: eventNum을 사용
    public Like(int userNum, int eventNum) {
        this.userNum = userNum;
        this.eventNum = eventNum;
    }

    // 모든 필드를 포함하는 생성자
    public Like(int likeNum, int userNum, int eventNum) {
        this.likeNum = likeNum;
        this.userNum = userNum;
        this.eventNum = eventNum;
    }

    // Getter와 Setter들
    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
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

    @Override
    public String toString() {
        return "Like [likeNum=" + likeNum + ", userNum=" + userNum + ", eventNum=" + eventNum + "]";
    }
}
