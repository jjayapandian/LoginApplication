<%@ page import="java.sql.*"%>
<%
    Connection connection = null;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://10.142.0.4:3306", "root", "root");
Statement statement = connection.createStatement();
String query = "CREATE DATABASE [IF NOT EXISTS] jwt";
statement.executeUpdate(query);
out.println("Database test created sucessfully.");
Statement statement1 = connection.createStatement();
String query1 = "CREATE TABLE IF NOT EXISTS `USER` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `regdate` date NOT NULL,
  PRIMARY KEY (`id`)
);"
statement1.executeUpdate(query1);
out.println("Table student create sucessfully.");
} 
catch (Exception e) 
{
out.println("An error occurred.");
}
    String userName = request.getParameter("uname");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.142.0.4:3306/jwt",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from USER  where userName='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userid", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
