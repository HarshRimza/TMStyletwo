package com.thinking.machines.school.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
public class DeleteStudent extends HttpServlet
{
public void doPost(HttpServletRequest request, HttpServletResponse response)
{
try
{
StudentBean studentBean=(StudentBean)request.getAttribute("studentBean");
int rollNumber=studentBean.getRollNumber();
String name=studentBean.getName();
System.out.println("Delete Servlet : "+name);
Connection connection=DAOConnection.getConnection();
Statement statement=connection.createStatement();
ResultSet resultSet=statement.executeQuery("select * from student where roll_number="+rollNumber);
if(resultSet.next()==false)
{
resultSet.close();
statement.close();
connection.close();
MessageBean messageBean;
messageBean=new MessageBean();
messageBean.setMessage("Student with roll number : "+rollNumber+" doesn't exist");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd;
rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
throw new DAOException("Invalid student roll number : "+rollNumber);
}

resultSet.close();
statement.executeUpdate("delete from student where roll_number="+rollNumber);
statement.executeUpdate("delete from student_login where username='"+name+"'");

MessageBean messageBean;
messageBean=new MessageBean();
messageBean.setMessage("Student with roll number : "+rollNumber+" deleted");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd;
rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);

statement.close();
connection.close();
}catch(Exception e)
{
System.out.println(e);
}
}
}