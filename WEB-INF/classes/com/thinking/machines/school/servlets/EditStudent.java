package com.thinking.machines.school.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
public class EditStudent extends HttpServlet
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
if(resultSet.next()==false)
{
resultSet.close();
statement.close();
connection.close();
MessageBean messageBean=new MessageBean();
messageBean.setMessage("Student with roll number : "+roll_number+" doesn't exist");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
throw new DAOException("Student with roll number : "+roll_number+" doesn't exist.");
}
resultSet.close();
resultSet=statement.executeQuery("select * from student where name='"+name+"' and roll_number<>"+roll_number);
if(resultSet.next()==true)
{
resultSet.close();
statement.close();
connection.close();
MessageBean messageBean=new MessageBean();
messageBean.setMessage("Student : "+name+" already exist");
request.setAttribute("messageBean",messageBean);
RequestDispatcher rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
throw new DAOException("Student : "+name+" exist.");
}

resultSet=statement.executeQuery("select * from student where roll_number="+roll_number);
String oldName="";
if(resultSet.next()==true)
{
oldName=resultSet.getString("name");
}

resultSet.close();
statement.executeUpdate("update student set name='"+name+"',address='"+address+"',gender='"+gender+"',city_code="+city_code+",indian="+indian+",date_of_birth='"+date_of_birth+"' where roll_number="+roll_number);
statement.executeUpdate("update student_login set username='"+name+"',date_of_birth='"+date_of_birth+"' where username='"+oldName+"'");
MessageBean messageBean=new MessageBean();
messageBean.setMessage("Student updated");
request.setAttribute("messageBean",messageBean);
request.setAttribute("scenario","updated");
RequestDispatcher rd=request.getRequestDispatcher("/Students.jsp");
rd.forward(request,response);
statement.close();
connection.close();

}catch(Exception e)
{
System.out.println(e);
}
}
}