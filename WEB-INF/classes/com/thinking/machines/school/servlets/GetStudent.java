package com.thinking.machines.school.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.*;
import java.sql.*;
import com.google.gson.*;
import com.thinking.machines.school.beans.*;
import com.thinking.machines.school.dao.*;
public class GetStudent extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
{
try
{

String name=request.getParameter("name").trim();
Connection connection=DAOConnection.getConnection();
Statement statement=connection.createStatement();
ResultSet resultSet=statement.executeQuery("select * from student_view where name='"+name+"'");
StudentBean student=null;
if(resultSet.next())
{
student=new StudentBean();
student.setRollNumber(resultSet.getInt("roll_number"));
student.setName(resultSet.getString("name").trim());
String address=resultSet.getString("address").trim();
address=address.replaceAll("\n"," ");
address=address.replaceAll("\t"," ");
address=address.replaceAll("\r"," ");
address=address.replaceAll(" +"," ");
student.setAddress(address);
student.setGender(resultSet.getString("gender").trim());
student.setIndian(resultSet.getBoolean("indian"));
student.setCityCode(resultSet.getInt("city_code"));
student.setCityName(resultSet.getString("city_name").trim());
Date date_of_birth=resultSet.getDate("date_of_birth");
String string_date_of_birth=(date_of_birth.getYear()+1900)+"-"+(date_of_birth.getMonth()+1)+"-"+date_of_birth.getDate();
student.setDateOfBirth(string_date_of_birth);
}
AJAXResponse ajaxResponse=new AJAXResponse();
ajaxResponse.setResponse(student);
ajaxResponse.setSuccess(true);
ajaxResponse.setException("");
response.setContentType("application/json");
PrintWriter pw=response.getWriter();
Gson gson=new Gson();
String responseString=gson.toJson(ajaxResponse);
pw.print(responseString);
}catch(Exception e)
{
System.out.println(e);
}
}
}