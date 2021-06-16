package com.thinking.machines.school.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
public class AddStudent extends HttpServlet
{
public void doPost(HttpServletRequest request, HttpServletResponse response)
{
try
{
StudentBean studentBean=(StudentBean)request.getAttribute("studentBean");
int roll_number=studentBean.getRollNumber();
String name=studentBean.getName();
String address=studentBean.getAddress().trim();
address=address.replace("\n"," ");
address=address.replace("\r"," ");
address=address.replace("\t"," ");
address=address.replace(" +"," ");
int city_code=studentBean.getCityCode();
String gender=studentBean.getGender();
boolean indian=studentBean.getIndian();
String date_of_birth=studentBean.getDateOfBirth().trim();
System.out.println(name+address+gender+city_code+indian+"bas");
System.out.println(date_of_birth);
//data accepted

Connection connection=DAOConnection.getConnection();
Statement statement=connection.createStatement();

ResultSet resultSet=statement.executeQuery("select * from student where roll_number="+roll_number);
if(resultSet.next()==true)
{
resultSet.close();
statement.close();
connection.close();
MessageBean messageBean=new MessageBean();
messageBean.setMessage("Student with roll number : "+roll_number+" already exists");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
throw new DAOException("Student with roll number : "+roll_number+" already exists");
}
resultSet.close();
resultSet=statement.executeQuery("select * from student where name='"+name+"'");
if(resultSet.next()==true)
{
resultSet.close();
statement.close();
connection.close();
MessageBean messageBean=new MessageBean();
messageBean.setMessage("Student : "+name+" already exists");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
throw new DAOException("Student : "+name+" already exists.");
}
resultSet.close();
statement.executeUpdate("insert into student (roll_number,name,address,city_code,gender,indian,date_of_birth) values("+roll_number+",'"+name+"','"+address+"',"+city_code+",'"+gender+"',"+indian+",'"+date_of_birth+"')");
statement.executeUpdate("insert into student_login(username,date_of_birth) values('"+name+"','"+date_of_birth+"')");
statement.close();
connection.close();

MessageBean messageBean=new MessageBean();
messageBean.setMessage("Student added");
request.setAttribute("messageBean",messageBean);
request.setAttribute("scenario","added");
RequestDispatcher rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);

}catch(Exception e)
{
System.out.println(e);
}
}
}