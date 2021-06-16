package com.thinking.machines.school.beans;
public class StudentNameBean implements java.io.Serializable
{
private String studentName;
public StudentNameBean()
{ 
this.studentName=" ";
}
public void setStudentName(String studentName)
{ 
this.studentName=studentName;
}
public String getStudentName()
{
return this.studentName;
}
}