<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de caractères</h1>
<form action="#" method="post">
    <p>Saisir une chaîne (du texte avec 6 caractères minimum) : 
        <input type="text" id="inputValeur" name="chaine">
    </p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null && chaine.length() >= 6) { %>

    <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- Extraction du 3° caractère --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaîne est : <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous-chaîne de votre texte : <%= sousChaine %></p>

    <%-- Recherche de la lettre "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en position : <%= position %></p>

<h2>Exercice 1 : Combien de 'e' ?</h2>
<%
    int compteurE = 0;
    for (int i = 0; i < longueurChaine; i++) {
        if (chaine.charAt(i) == 'e') {
            compteurE++;
        }
    }
%>
<p>Le nombre de lettres 'e' dans votre chaîne est : <%= compteurE %></p>

<h2>Exercice 2 : Affichage vertical</h2>
<p>
<% for (int i = 0; i < longueurChaine; i++) { %>
    <%= chaine.charAt(i) %><br>
<% } %>
</p>

<h2>Exercice 3 : Retour à la ligne</h2>
<p>
<% for (int i = 0; i < longueurChaine; i++) {
        if (chaine.charAt(i) == ' ') { %>
            <br>
<%      } else { %>
            <%= chaine.charAt(i) %>
<%      }
   } %>
</p>

<h2>Exercice 4 : Une lettre sur deux</h2>
<p>
<% for (int i = 0; i < longueurChaine; i += 2) { %>
    <%= chaine.charAt(i) %>
<% } %>
</p>

<h2>Exercice 5 : Texte en verlant</h2>
<p>
<% for (int i = longueurChaine - 1; i >= 0; i--) { %>
    <%= chaine.charAt(i) %>
<% } %>
</p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<%
    int voyelles = 0;
    int consonnes = 0;
    String voyellesStr = "aeiouyAEIOUY";
    for (int i = 0; i < longueurChaine; i++) {
        char c = chaine.charAt(i);
        if (Character.isLetter(c)) {
            if (voyellesStr.indexOf(c) != -1) {
                voyelles++;
            } else {
                consonnes++;
            }
        }
    }
%>
<p>Nombre de voyelles : <%= voyelles %></p>
<p>Nombre de consonnes : <%= consonnes %></p>

<% } else if (chaine != null) { %>
    <p style="color: red;">La chaîne doit contenir au moins 6 caractères.</p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
