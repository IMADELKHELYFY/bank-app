package modele;

import java.util.Random;

public class CompteBancaire {
    private int id;
    private String numero;
    private double solde;
    private int clientId;

    public CompteBancaire() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public double getSolde() {
        return solde;
    }

    public void setSolde(double solde) {
        this.solde = solde;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public String generateRIB(String numero) {
        String codeBanque = "12345";
        String codeGuichet = "67890";
        String cleRIB = "12";
        return codeBanque + codeGuichet + numero + cleRIB;
    }
    public String GenirerNumeroAleatoire() {
        Random random = new Random();
        StringBuilder numero = new StringBuilder(11);
        for (int i = 0; i < 11; i++) {
            numero.append(random.nextInt(10)); 
        }
        return numero.toString();
    }
}
