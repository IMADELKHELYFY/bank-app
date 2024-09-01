package controler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.*;
import modele.*;
import javax.servlet.http.HttpSession;

@MultipartConfig()
@WebServlet(name = "ServletGlobal", urlPatterns = {"/", "/ServletAfficherListCompte", "/ServletGlobal",
        "/ServletDepot", "/ServletRetrait", "/ServletVirement", "/ServletListOperation", "/imprimerRIB",
        "/ServletSupprimerCompte", "/ServletAfficherListClient", "/loginServlet", "/rechercherClientParNom",
        "/ServletClientModifier", "/ServletAjouterClientEtCompte", "/consultersolde" , "/ProfileClientServlet"
        ,"/inscrireServlet" , "/ServletAfficherListeDemande" ,"/ServletAccepterouRefuser" ,
        "/ServletAjouterClientEtCompteexistante" ,"/ServletAccepter" ,"/ServletRefuser" ,"/homeServlet" 
        , "/loginAdmin" ,"/ServletRechercheCompte"})

public class ServletGlobal extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO admindao;
    private ClientDAO clientdao;
    private OperationDAO operationdao;
    private CompteBancaireDAO comptedao;
    private DemandeDAO demandedao;

    public void init() throws ServletException {
    	demandedao = new DemandeDAO();
        admindao = new AdminDAO();
        clientdao = new ClientDAO();
        operationdao = new OperationDAO();
        comptedao = new CompteBancaireDAO();
        getServletContext().setAttribute("admindao", admindao);
        getServletContext().setAttribute("clientdao", clientdao);
        getServletContext().setAttribute("operationdao", operationdao);
        getServletContext().setAttribute("comptedao", comptedao);
        getServletContext().setAttribute("demandedao", demandedao);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String path = request.getServletPath();
        if (path.equals("/") || path.equals("/index.jsp")) {
            response.sendRedirect("index.jsp");
        } else if (path.equals("/ServletAfficherListCompte")) {
        	  int totalClients = clientdao.totalClients();
              int totalComptes = comptedao.totalComptes();
              int totalOperations = operationdao.totalOperations();
              int totalDemandes = demandedao.totalDemandes();

              session.setAttribute("totalClients", totalClients);
              session.setAttribute("totalComptes", totalComptes);
              session.setAttribute("totalOperations", totalOperations);
              session.setAttribute("totalDemandes", totalDemandes);
            List<CompteBancaire> listCompte = comptedao.listerComptes();
            request.setAttribute("listCompte", listCompte);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else if (path.equals("/ServletAfficherListClient")) {
        	  int totalClients = clientdao.totalClients();
              int totalComptes = comptedao.totalComptes();
              int totalOperations = operationdao.totalOperations();
              int totalDemandes = demandedao.totalDemandes();

              session.setAttribute("totalClients", totalClients);
              session.setAttribute("totalComptes", totalComptes);
              session.setAttribute("totalOperations", totalOperations);
              session.setAttribute("totalDemandes", totalDemandes);
            List<Client> listClient = clientdao.listerClients();
            request.setAttribute("listClient", listClient);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else if (path.equals("/ServletClientModifier")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Client client = clientdao.getClientById(id);
            request.setAttribute("client", client);
            request.getRequestDispatcher("modifierClient.jsp").forward(request, response);
        } else if (path.equals("/ServletListOperation")) {
        	  int totalClients = clientdao.totalClients();
              int totalComptes = comptedao.totalComptes();
              int totalOperations = operationdao.totalOperations();
              int totalDemandes = demandedao.totalDemandes();

              session.setAttribute("totalClients", totalClients);
              session.setAttribute("totalComptes", totalComptes);
              session.setAttribute("totalOperations", totalOperations);
              session.setAttribute("totalDemandes", totalDemandes);
            List<Operation> operations = OperationDAO.listerOperations();
            request.setAttribute("operations", operations);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else if (path.equals("/ServletGlobal")) {
            String operation = request.getParameter("operation");
            if ("depot".equals(operation)) {
                response.sendRedirect("depot.jsp");
            } else if ("retrait".equals(operation)) {
                response.sendRedirect("retrait.jsp");
            } else if ("virement".equals(operation)) {
                response.sendRedirect("virement.jsp");
            } else {
                response.sendRedirect("home.jsp");
            }
        } else if (path.equals("/rechercherClientParNom")) {
            String nom = request.getParameter("nom");
            List<Client> clients = clientdao.rechercherClientParNom(nom);
            request.setAttribute("clients", clients);
            if (clients.isEmpty()) {
                System.out.println("Aucun client trouvé avec le nom : " + nom);
            } else {
                System.out.println("Nombre de clients trouvés : " + clients.size());
            }
            request.getRequestDispatcher("profilClient.jsp").forward(request, response);
        }else if ("/inscrireServlet".equals(path)) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Demande demande = new Demande();
            demande.setUsername(username);
            demande.setEmail(email);
            demande.setPassword(password);

            if (demandedao.ajouterDemande(demande)) {
            	request.getRequestDispatcher("confirmationdemande.jsp").forward(request, response);
                request.setAttribute("message", "Votre demande a été envoyée avec succès. Veuillez attendre l'approbation de l'administrateur.");
            } else {
                request.setAttribute("message", "Erreur lors de l'envoi de votre demande. Veuillez réessayer.");
            }
            }else if("/ServletAfficherListeDemande".equals(path)) {
            	  int totalClients = clientdao.totalClients();
                  int totalComptes = comptedao.totalComptes();
                  int totalOperations = operationdao.totalOperations();
                  int totalDemandes = demandedao.totalDemandes();

                  session.setAttribute("totalClients", totalClients);
                  session.setAttribute("totalComptes", totalComptes);
                  session.setAttribute("totalOperations", totalOperations);
                  session.setAttribute("totalDemandes", totalDemandes);
           	 List<Demande> demandes = demandedao.listerDemandes();
		        request.setAttribute("demandes", demandes);
		        request.getRequestDispatcher("home.jsp").forward(request, response);
           	 } else if (path.equals("/homeServlet")) {
                 int totalClients = clientdao.totalClients();
                 int totalComptes = comptedao.totalComptes();
                 int totalOperations = operationdao.totalOperations();
                 int totalDemandes = demandedao.totalDemandes();

                 session.setAttribute("totalClients", totalClients);
                 session.setAttribute("totalComptes", totalComptes);
                 session.setAttribute("totalOperations", totalOperations);
                 session.setAttribute("totalDemandes", totalDemandes);
                 request.getRequestDispatcher("home.jsp").forward(request, response);
             }else if(path.equals("/ServletRechercheCompte")) {
            	 String numeroCompte = request.getParameter("numeroCompte");
                 CompteBancaire compte = comptedao.chercherCompteParNumero(numeroCompte);

                 if (compte != null) {
                	 Client client = clientdao.getClientById(compte.getClientId());
                     request.setAttribute("compte", compte);
                     request.setAttribute("client", client);
                     request.getRequestDispatcher("depot.jsp").forward(request, response);
                 }else {
                     request.setAttribute("message", "Compte non trouvé");
                 }
             
             }
        
       
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/ServletClientModifier")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String CNE = request.getParameter("CNE");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            
            Client client = new Client();
            client.setId(id);
            client.setNom(nom);
            client.setPrenom(prenom);
            client.setCNE(CNE);
            client.setEmail(email);
            client.setTel(tel);
            clientdao.mettreAJourClient(client);
            response.sendRedirect("ServletAfficherListClient");
        } else if (path.equals("/ServletAjouterClientEtCompte")) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String CNE = request.getParameter("CNE");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String username = request.getParameter("username");
            String password = request.getParameter("password ");

            Client client = new Client();
            client.setNom(nom);
            client.setPrenom(prenom);
            client.setCNE(CNE);
            client.setEmail(email);
            client.setTel(tel);
            client.setUsername(username); 
            client.setPassword(password); 
            clientdao.ajouterClient(client);
            int clientId = clientdao.getDernierClientID();
            CompteBancaire cc = new CompteBancaire() ; 
            String numero = cc.GenirerNumeroAleatoire() ;
            double solde = Double.parseDouble(request.getParameter("solde"));
            CompteBancaire compte = new CompteBancaire();
            compte.setNumero(numero);
            compte.setSolde(solde);
            compte.setClientId(clientId);
            comptedao.ajouterCompte(compte);

            request.setAttribute("client", client);
            request.setAttribute("compte", compte);

            request.getRequestDispatcher("confirmation.jsp").forward(request, response);
        } else if (path.equals("/ServletSupprimerCompte")) {
        	try {
                // Récupération des paramètres
                int clientId = Integer.parseInt(request.getParameter("clientId"));
                int id = Integer.parseInt(request.getParameter("id"));
                comptedao.supprimerCompte(id);
                if (!comptedao.clientPossedeComptes(clientId)) {
                    clientdao.supprimerClient(clientId);
                }
                request.getRequestDispatcher("confirmerSuppression.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Invalid account or client ID.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while deleting the account.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } else if (path.equals("/ServletDepot")) {
            try {
                int compteId = Integer.parseInt(request.getParameter("compteId"));
                double montant = Double.parseDouble(request.getParameter("montant"));

                // Effectuer le dépôt
                operationdao.depot(montant, compteId);

                // Rediriger vers la page de confirmation ou une autre page appropriée
                response.sendRedirect("confirmationDepot.jsp");

            } catch (NumberFormatException e) {
                e.printStackTrace();
                // Gérer l'exception de format incorrect pour l'id du compte ou le montant
                response.sendRedirect("erreur.jsp"); // Redirection vers une page d'erreur
            }
        }  else if (path.equals("/ServletRetrait")) {
            try {
                int compteId = Integer.parseInt(request.getParameter("compteId"));
                double montant = Double.parseDouble(request.getParameter("montant"));

                // Effectuer le retrait
                operationdao.retrait(montant, compteId);

                // Rediriger vers la page de confirmation
                response.sendRedirect("confirmationRetrait.jsp");

            } catch (NumberFormatException e) {
                e.printStackTrace();
                // Gérer l'exception de format incorrect pour l'id du compte ou le montant
                response.sendRedirect("erreur.jsp"); // Redirection vers une page d'erreur
            }
        } else if (path.equals("/ServletVirement")) {
            try {
                int compteIdSource = Integer.parseInt(request.getParameter("compteIdSource"));
                int compteIdDestination = Integer.parseInt(request.getParameter("compteIdDestination"));
                double montant = Double.parseDouble(request.getParameter("montant"));

                // Effectuer le virement
                operationdao.virement(montant, compteIdSource, compteIdDestination);

                // Rediriger vers la page de confirmation
                response.sendRedirect("confirmationVirement.jsp");

            } catch (NumberFormatException e) {
                e.printStackTrace();
                // Gérer l'exception de format incorrect pour l'id du compte ou le montant
                response.sendRedirect("erreur.jsp"); // Redirection vers une page d'erreur
            }
        } else if ("/loginServlet".equals(path)) {
            String nomUtilisateur = request.getParameter("username");
            String motDePasse = request.getParameter("password");
                Client client = clientdao.verifierClient(nomUtilisateur, motDePasse);
                	int compteid = client.getId();
                	CompteBancaire cc = comptedao.getCompteById(compteid);
                	String numero = cc.getNumero();
                	String RIB = cc.generateRIB(numero);
                	request.setAttribute("numero", numero);
                	request.setAttribute("RIB", RIB);
                	request.setAttribute("client", client);
                    double solde = comptedao.consulterSolde(client.getId());
                    request.setAttribute("solde", solde);
                    String messageBienvenue = "Bienvenue,  " + client.getNom() + " " + client.getPrenom();
                    request.setAttribute("messageBienvenue", messageBienvenue);
                    request.getRequestDispatcher("ClientDashboard.jsp").forward(request, response);
                    return;
                }
              else if (path.equals("/ServletAjouterClientEtCompteexistante")) {
                    String nom = request.getParameter("nom");
                    String prenom = request.getParameter("prenom");
                    String CNE = request.getParameter("CNE");
                    String email = request.getParameter("email");
                    String tel = request.getParameter("tel");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    Client client1 = new Client();
                    client1.setNom(nom);
                    client1.setPrenom(prenom);
                    client1.setCNE(CNE);
                    client1.setEmail(email);
                    client1.setTel(tel);
                    client1.setUsername(username);
                    client1.setPassword(password);
                    clientdao.ajouterClient(client1);

                    int clientId = clientdao.getDernierClientID();

                    String numero = "";
                    double solde = Double.parseDouble(request.getParameter("solde"));

                    CompteBancaire compte = new CompteBancaire();
                    compte.setNumero(numero);
                    compte.setSolde(solde);
                    compte.setClientId(clientId);

                    comptedao.ajouterCompte(compte);

                    request.setAttribute("client", client1);
                    request.setAttribute("compte", compte);

                    request.getRequestDispatcher("confirmation.jsp").forward(request, response);
                }else if (path.equals("/ServletAccepterouRefuser")) {
                    int demandeId = Integer.parseInt(request.getParameter("demandeId"));
                    String action = request.getParameter("action");

                    if ("accepter".equals(action)) {
                    	Demande demande = demandedao.getDemandeById(demandeId);
                        request.setAttribute("demande", demande);
                        request.getRequestDispatcher("ajouterclientetcomptenexiste.jsp").forward(request, response);
                    } else if ("refuser".equals(action)) {
                      demandedao.supprimerDemande(demandeId);
                      
                    }
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                  }else if(path.equals("/loginAdmin")) {
                	  String nomUtilisateur = request.getParameter("username");
                      String motDePasse = request.getParameter("password");
                	  Admin admin = admindao.verifierAdmin(nomUtilisateur, motDePasse);                      
                          HttpSession session = request.getSession();
                          session.setAttribute("userid", admin.getId());
                          request.setAttribute("admin", admin);
                          request.getRequestDispatcher("home.jsp").forward(request, response);
                  }

        }
}   
    
    
