package user;

public class User {
    private int userNum;
    private String id;
    private String password;
    private String email;
    private String name;
    private String gender;
    private String phone;
    private int admin;  // admin 필드를 int로 변경

    // Getter와 Setter
    public int getUserNum() {
        return userNum;
    }

    public void setUserNum(int userNum) {
        this.userNum = userNum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAdmin() {  // Getter 메서드를 int 타입으로 변경
        return admin;
    }

    public void setAdmin(int admin) {  // Setter 메서드를 int 타입으로 변경
        this.admin = admin;
    }
}
