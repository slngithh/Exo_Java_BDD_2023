<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    int index = Integer.parseInt(request.getParameter("index"));
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    
    if (tasks != null && index >= 0 && index < tasks.size()) {
        tasks.remove(index); // Supprimer la tâche
    }

    // Sauvegarder la liste mise à jour dans la session
    session.setAttribute("tasks", tasks);

    // Rediriger vers la page d'accueil après suppression
    response.sendRedirect("index.jsp");
%>
