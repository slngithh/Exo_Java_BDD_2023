<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body bgcolor="white">
    <h1>Saisir une tâche</h1>

    <form action="ajouter.jsp" method="post">
        <label for="inputValeur">Saisir le nom d'une tâche : </label>
        <input type="text" id="inputValeur" name="valeur" required>
        <input type="submit" value="Enregistrer">
    </form>

    <%
        // Classe représentant une tâche
        class Task {
            private String nom;

            public Task(String nom) {
                this.nom = nom;
            }

            public String getNom() {
                return nom;
            }
        }

        // Récupération de la liste des tâches depuis la session
        List<Task> taches = (List<Task>) session.getAttribute("taches");

        if (taches == null) {
            taches = new ArrayList<>();
            session.setAttribute("taches", taches);
        }

        // Si une valeur est reçue via POST, ajout d'une nouvelle tâche
        String valeur = request.getParameter("valeur");
        if (valeur != null && !valeur.isEmpty()) {
            Task tache = new Task(valeur);
            taches.add(tache);
        }
    %>

    <h2>Liste des tâches :</h2>
    <ul>
        <% 
            for (Task tache : taches) {
        %>
            <li><%= tache.getNom() %></li>
        <% 
            }
        %>
    </ul>
</body>
</html>
