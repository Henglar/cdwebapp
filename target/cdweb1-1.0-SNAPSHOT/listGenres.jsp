<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Genres</title>
    <style>
    .create-genre-container {
        margin-top: 20px;
    }

    .create-genre-container h1 {
        font-size: 24px;
        margin-bottom: 10px;
    }

    .create-genre-container form {
        display: flex;
        align-items: center;
    }

    .create-genre-container label {
        font-weight: bold;
        margin-right: 10px;
    }

    .create-genre-container input[type="text"] {
        padding: 5px;
        font-size: 14px;
    }

    .create-genre-container input[type="submit"] {
        padding: 5px 10px;
        background-color: #4caf50;
        color: white;
        border: none;
        cursor: pointer;
    }
</style>

</head>
<body>
    <h1>List of Genres</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
            
        <p>${genre.size()}</p>
            <c:forEach var="genre" items="${genres}">
                <tr>
                    <td>${genre.getId()}</td>
                    <td>${genre.getName()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<h1>Create Genre</h1>
    <form method="post" action="GenreServlet">
        <label for="name">Genre Name:</label>
        <input type="text" id="name" name="name" required>
        <input type="submit" value="Create">
    </form>
</body>
</html>