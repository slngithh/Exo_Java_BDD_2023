<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Partie 2 : les conditions</h1>
<form action="#" method="post">
    <p>Saisir une valeur 1 : <input type="text" id="inputValeur" name="valeur1"></p>
    <p>Saisir une valeur 2 : <input type="text" id="inputValeur" name="valeur2"></p>
    <p>Saisir une valeur 3 : <input type="text" id="inputValeur" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<% String valeur1 = request.getParameter("valeur1"); %>
<% String valeur2 = request.getParameter("valeur2"); %>
<% String valeur3 = request.getParameter("valeur3"); %>

<% if (valeur1 != null && valeur2 != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeur1 = Integer.parseInt(valeur1); %>
    <% int intValeur2 = Integer.parseInt(valeur2); %>
        
    <%-- Condition if pour comparer les valeurs --%>
    <% if (intValeur1 > intValeur2) { %>
        <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
        <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
        <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>

<h2>Exercice 1 : Comparaison </h2>
<% if (valeur3 != null) { 
       int intValeur3 = Integer.parseInt(valeur3);
       // Trouver A et B peu importe l'ordre
       int min = Math.min(intValeur1, intValeur2);
       int max = Math.max(intValeur1, intValeur2);
%>
    <p>A = <%= min %>, B = <%= max %>, C = <%= intValeur3 %></p>
    <% if (intValeur3 > min && intValeur3 < max) { %>
        <p>C est compris entre A et B.</p>
    <% } else { %>
        <p>C n'est pas compris entre A et B.</p>
    <% }
} %>

<h2>Exercice 2 : Paire ou Impaire ?</h2>
<%
    // Vérifier si valeur1 et valeur2 sont pair ou impair
    String pairOuImpair1 = (intValeur1 % 2 == 0) ? "paire" : "impaire";
    String pairOuImpair2 = (intValeur2 % 2 == 0) ? "paire" : "impaire";
%>
<p> La première valeur (<%= intValeur1 %>) est : <%= pairOuImpair1 %>.</p>
<p> La deuxième valeur (<%= intValeur2 %>) est : <%= pairOuImpair2 %>.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
