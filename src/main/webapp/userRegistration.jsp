<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
   Connection connection = DriverManager.getConnection("jdbc:mysql://10.142.0.4:3306", "root", "root");
Statement statement = connection.createStatement();
String query = "CREATE DATABASE IF NOT EXISTS jwt";
statement.executeUpdate(query);
out.println("Database test created sucessfully.");
Connection con = DriverManager.getConnection("jdbc:mysql://10.142.0.4:3306/jwt",
            "root", "root");
Statement statement1 = con.createStatement();
String query1 = "CREATE TABLE IF NOT EXISTS USER (`id` int(10) unsigned NOT NULL AUTO_INCREMENT,`first_name` varchar(45) NOT NULL,`last_name` varchar(45) NOT NULL,`email` varchar(45) NOT NULL,`username` varchar(45) NOT NULL,`password` varchar(45) NOT NULL,`regdate` date NOT NULL,PRIMARY KEY (`id`))";
statement1.executeUpdate(query1);
out.println("Table student create sucessfully.");
     Statement st = con.createStatement();
    int i = st.executeUpdate("insert into USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','"
    + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");

    } else {
        response.sendRedirect("index.jsp");
    }
%>
