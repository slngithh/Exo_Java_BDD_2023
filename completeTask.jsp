<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    int index = Integer.parseInt(request.getParameter("index"));
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    
    if (tasks != null && index >= 0 && index < tasks.size()) {
        Task task = tasks.get(index);
        task.setCompleted(true); // Marquer la tâche comme terminée
    }

    // Rediriger vers la page d'accueil après modification
    response.sendRedirect("index.jsp");
%>
