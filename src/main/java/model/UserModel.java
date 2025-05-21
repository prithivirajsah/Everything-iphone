package model;

public class UserModel {
    private int userId;
    private String userName;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String gender;
    private String city;
    private String state;
    private String password;
    private String role;
    private String salt; 

    // Constructors
    public UserModel() {
    }

    public UserModel(int userId, String userName, String fullName, String email, 
                    String phoneNumber, String gender, String city, String state, 
                    String password, String role, String salt) {
        this.userId = userId;
        this.userName = userName;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.city = city;
        this.state = state;
        this.password = password;
        this.role = role;
        this.salt = salt;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }
}