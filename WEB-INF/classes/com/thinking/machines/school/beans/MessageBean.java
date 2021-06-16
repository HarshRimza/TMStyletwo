package com.thinking.machines.school.beans;
public class MessageBean implements java.io.Serializable
{
private String message;
public MessageBean()
{ 
this.message="";
}
public void setMessage(String message)
{ 
this.message=message;
}
public String getMessage()
{
return this.message;
}
}