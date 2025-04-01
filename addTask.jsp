<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    Task newTask = new Task(title, description, dueDate);
    
    // Récupérer la liste des tâches depuis la session
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
    }

    // Ajouter la nouvelle tâche à la liste
    tasks.add(newTask);

    // Sauvegarder la liste mise à jour dans la session
    session.setAttribute("tasks", tasks);

    // Rediriger vers la page d'accueil après l'ajout
    response.sendRedirect("index.jsp");
%>
