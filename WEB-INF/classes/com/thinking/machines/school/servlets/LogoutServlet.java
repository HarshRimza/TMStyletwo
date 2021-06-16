package com.thinking.machines.school.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
public class LogoutServlet extends HttpServlet
{
public void doGet(HttpServletRequest request, HttpServletResponse response)
{
try
{
RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
rd.forward(request,response);
}catch(Exception e)
{
System.out.println(e);
}
}
}