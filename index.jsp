<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<html>
<head>
    <title>Mini Gestionnaire de Tâches Collaboratif</title>
</head>
<body>
    <h1>Bienvenue dans le gestionnaire de tâches</h1>

    <!-- Formulaire pour ajouter une tâche -->
    <form action="addTask.jsp" method="post">
        <label for="title">Titre de la tâche:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br><br>
        
        <label for="dueDate">Date d'échéance:</label>
        <input type="date" id="dueDate" name="dueDate" required><br><br>
        
        <input type="submit" value="Ajouter la tâche">
    </form>

    <hr>

    <!-- Affichage des tâches -->
    <h2>Liste des Tâches</h2>
    <ul>
        <%
            // Récupérer les tâches stockées dans la session
            ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
            if (tasks != null) {
                for (Task task : tasks) {
        %>
                    <li>
                        <strong><%= task.getTitle() %></strong><br>
                        <%= task.getDescription() %><br>
                        Échéance: <%= task.getDueDate() %><br>
                        <%= task.isCompleted() ? "Terminé" : "Non terminé" %><br>
                        <a href="completeTask.jsp?index=<%= tasks.indexOf(task) %>">Marquer comme terminé</a> | 
                        <a href="deleteTask.jsp?index=<%= tasks.indexOf(task) %>">Supprimer</a>
                    </li>
        <%
                }
            } else {
        %>
                <p>Aucune tâche ajoutée.</p>
        <%
            }
        %>
    </ul>
</body>
</html>
