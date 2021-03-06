package com.thinking.machines.school.tags;
import java.sql.*;
import java.io.*;
import com.thinking.machines.school.beans.*;
import com.thinking.machines.school.dao.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
public class TableIteratorTagHandler extends BodyTagSupport
{
private String table;
private String orderBy;
private String name;
private int index;
private Connection connection;
private Statement statement;
private ResultSet resultSet;

public TableIteratorTagHandler()
{
reset();
}

private void reset()
{ 
this.table="";
this.name="";
this.orderBy="";
this.index=0;
this.connection=null;
this.statement=null;
this.resultSet=null;
}

public void setTable(String table)
{
this.table=table;
}
public String getTable()
{
return this.table;
}

public void setOrderBy(String orderBy)
{ 
this.orderBy=orderBy;
}
public String getOrderBy()
{
return this.orderBy;
}

public void setName(String name)
{ 
this.name=name;
}
public String getName()
{
return this.name;
}

public int doStartTag()
{ 
try
{ 
connection=DAOConnection.getConnection();
statement=connection.createStatement();
String sqlStatement="";
if(table.equalsIgnoreCase("city"))
{
sqlStatement="select * from city";
} 
if(table.equalsIgnoreCase("student_view"))
{
sqlStatement="select * from student_view";
} 
if(orderBy!=null && orderBy.trim().length()>0)
{
sqlStatement=sqlStatement+" order by "+orderBy;
}
resultSet=statement.executeQuery(sqlStatement);
if(resultSet.next()==false) return SKIP_BODY;
this.index=0;
setupData();
}catch(Exception e)
{
System.out.println("Hello");
System.out.println(e); // remove after testing
return SKIP_BODY;
}
return EVAL_BODY_INCLUDE;
}


public int doAfterBody()
{ 
try
{ 
if(resultSet.next()==false) return SKIP_BODY;
this.index++;
setupData();
}catch(Exception e)
{
System.out.println("Hello1");
System.out.println(e); // remove after testing
return SKIP_BODY;
}
return EVAL_BODY_AGAIN;
}

private void setupData()
{ 
try
{
pageContext.setAttribute("index",index,PageContext.REQUEST_SCOPE);
if(table.equalsIgnoreCase("city"))
{
CityBean city=new CityBean();
city.setCode(resultSet.getInt("code"));
city.setName(resultSet.getString("name").trim());
pageContext.setAttribute(name,city,PageContext.REQUEST_SCOPE);
}
if(table.equalsIgnoreCase("student_view"))
{
StudentBean student=new StudentBean();
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
pageContext.setAttribute(name,student,PageContext.REQUEST_SCOPE);
}
}
catch(Exception e)
{
System.out.println("Hello2");
System.out.println(e); // remove after testing
}
}

public int doEndTag()
{ 
try
{
resultSet.close();
statement.close();
connection.close();
}catch(Exception e)
{
System.out.println("Hello3");
System.out.println(e); // remove after testing
}
return EVAL_PAGE;
}
}