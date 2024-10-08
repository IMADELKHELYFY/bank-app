package modele;

public class Demande {
    private int id;
    private String username;
    private String email;
    private String password;

    public Demande() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Demande [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password + "]";
    }
}
