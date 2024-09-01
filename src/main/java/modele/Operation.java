package modele;

import java.util.Date;

public class Operation {
    private int id;
    private String type;
    private double montant;
    private Date date;
    private int compteId;
    public Operation() {}
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getMontant() {
		return montant;
	}
	public void setMontant(double montant) {
		this.montant = montant;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCompteId() {
		return compteId;
	}
	public void setCompteId(int compteId) {
		this.compteId = compteId;
	}
	@Override
	public String toString() {
		return "Operation [id=" + id + ", type=" + type + ", montant=" + montant + ", date=" + date + ", compteId="
				+ compteId + "]";
	}

}
