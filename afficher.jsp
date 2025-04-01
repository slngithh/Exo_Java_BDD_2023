<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Task"%>

<html>
<head>
    <title>Afficher les tâches</title>
</head>
<body bgcolor="white">
    <h1>Liste des tâches</h1>

    <%
        // Récupération des tâches depuis la session
        List<Task> taches = (List<Task>) session.getAttribute("taches");

        if (taches == null) {
            taches = new ArrayList<>();
            session.setAttribute("taches", taches);
        }
    %>

    <h2>Tâches enregistrées :</h2>
    <ul>
        <% 
            if (taches.isEmpty()) {
        %>
            <li>Aucune tâche enregistrée.</li>
        <% 
            } else {
                for (Task tache : taches) {
        %>
            <li><%= tache.getNom() %></li>
        <% 
                }
            }
        %>
    </ul>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
