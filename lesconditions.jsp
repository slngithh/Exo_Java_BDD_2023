<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1"></p>
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2"></p>
    <p>Saisir la valeur 3 (pour l'exercice 1) : <input type="text" id="inputValeur" name="valeur3"></p>
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

<h2>Exercice 1 : Comparaison 1</h2>
<% if (valeur3 != null) { 
       int intValeur3 = Integer.parseInt(valeur3);
       // Trouver A et B peu importe l'ordre
       int min = Math.min(intValeur1, intValeur2);
       int max = Math.max(intValeur1, intValeur2);
%>
    <p>A = <%= min %>, B = <%= max %>, C = <%= intValeur3 %></p>
    <% if (intValeur3 > min && intValeur3 < max) { %>
        <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <% }
} %>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<%
    // Vérifier si valeur1 et valeur2 sont pair ou impair
    String pairOuImpair1 = (intValeur1 % 2 == 0) ? "pair" : "impair";
    String pairOuImpair2 = (intValeur2 % 2 == 0) ? "pair" : "impair";
%>
<p>Valeur 1 (<%= intValeur1 %>) est <%= pairOuImpair1 %>.</p>
<p>Valeur 2 (<%= intValeur2 %>) est <%= pairOuImpair2 %>.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
