<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.*" %>
<!DOCTYPE html>

<%
    int userId = 0;
    if (session.getAttribute("user_id") != null)
        userId = (Integer) session.getAttribute("user_id");

    int categoryId = 0;
    if (request.getParameter("categoryId") != null)
        categoryId = Integer.parseInt(request.getParameter("categoryId"));


    ArrayList<Blog> blogs = new ArrayList<Blog>();

    blogs = BlogsDao.getBlogsByCategoryId(categoryId);
%>

<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" media="screen" href="css/index.css">
    <title>BlogChain</title>
</head>

<body>

    <div class="navbar-container">
        <div class="navbar-category-label">Categories</div>
        <% if (userId == 0) { %>
        <a href="/register">Register</a>
        <a href="/login">Login</a>
        <% } else { %>
        <a href="/logout">Logout</a>
        <a href="/UserHomePage/?userId=<%=userId%>" > Rati </a>
        <img src="icons/blue.svg" alt="profile">
        <% } %>
    </div>

    <div class="blogs-categories-sidebar">
<%--        <% for (Category category : categories) { %>--%>
<%--            <div class="sidebar-category"><%=category.getName()%></div>--%>
<%--        <% } %>--%>
        <div class="sidebar-category">Travel</div>
        <div class="sidebar-category">Science</div>
        <div class="sidebar-category">Sport</div>
        <div class="sidebar-category">Nature</div>

    </div>

    <div class="blogs-list-container">
        <% for (Blog blog : blogs) { %>
            <div class="blog-list-container">
                <div id="blog-container">
                    <div class="blog-title"> <%= blog.getTitle() %> </div>
                    <div class="blog-category"> <%= blog.getCategory_id() %> </div>
                    <div class="blog-created-by">
                        <a href="/UserHomePage/?userId=<%=blog.getCreated_by()%>"><%= blog.getCreated_by() %> </a>
                    </div>
                    <div class="blog-created-at"> <%= blog.getCreated_at() %> </div>
                    <div class="blog-body"> <%= blog.getText() %> </div>
                </div>
            </div>
        <% } %>
    </div>

</body>

</html>