package modele;

import dao.ClientDAO;

public class Client {
    private int id;
    private String nom;
    private String prenom;
    private String CNE ; 
    private String email;
    private String tel;
    private String username ; 
    private String password ; 
    
    public String getCNE() {
		return CNE;
	}
	public void setCNE(String cNE) {
		CNE = cNE;
	}

    
    public Client() {}
    

   
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int totalclient() {
		ClientDAO clientdao = new ClientDAO(); 
		int total = clientdao.totalClients();
		return total ; 
	}


  
}
