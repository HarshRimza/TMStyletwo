package com.thinking.machines.school.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
public class LoginServlet extends HttpServlet
{
public void doPost(HttpServletRequest request, HttpServletResponse response)
{
try
{
String username=request.getParameter("username").trim();
String dateOfBirth=request.getParameter("dateOfBirth").trim();
boolean found=false;

Connection connection=DAOConnection.getConnection();
Statement statement=connection.createStatement();
ResultSet resultSet=statement.executeQuery("select * from student_login where username='"+username+"' and date_of_birth='"+dateOfBirth+"'");
if(resultSet.next()==true)
{
resultSet.close();
statement.close();
connection.close();
found=true;
StudentNameBean sNBean=new StudentNameBean();
sNBean.setStudentName(username);
request.setAttribute("studentNameBean",sNBean);
RequestDispatcher rd=request.getRequestDispatcher("/student-home.jsp");
rd.forward(request,response);
}

if(found==false)
{
resultSet=statement.executeQuery("select * from admin_login where username='"+username+"' and date_of_birth='"+dateOfBirth+"'");
if(resultSet.next()==true)
{
resultSet.close();
statement.close();
connection.close();
found=true;
RequestDispatcher rd=request.getRequestDispatcher("/admin-home.jsp");
rd.forward(request,response);
}
}

if(found==false)
{
resultSet.close();
statement.close();
connection.close();
MessageBean messageBean=new MessageBean();
messageBean.setMessage("Invalid Username or Date of Birth / you are not registered");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
rd.forward(request,response);
}

}catch(Exception e)
{
System.out.println(e);
}
}
}