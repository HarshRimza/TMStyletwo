package com.thinking.machines.school.beans;
public class StudentBean implements java.io.Serializable
{
private int rollNumber;
private String name;
private String realName;
private String address;
private String gender;
private CityBean city;
private boolean indian;
private String dateOfBirth;

public StudentBean()
{
rollNumber=0;
name="";
realName="";
address="";
gender="";
city=new CityBean();
indian=false;
dateOfBirth="";
}

public void setRollNumber(int rollNumber)
{
this.rollNumber=rollNumber;
}
public int getRollNumber()
{
return this.rollNumber;
}

public void setName(String name)
{
this.name=name;
}
public String getName()
{
return this.name;
}

public void setRealName(String realName)
{
this.realName=realName;
}
public String getRealName()
{
return this.realName;
}


public void setAddress(String address)
{
this.address=address;
}
public String getAddress()
{
return this.address;
}

public void setGender(String gender)
{
this.gender=gender;
}
public String getGender()
{
return this.gender;
}

public void setCityCode(int cityCode)
{
this.city.setCode(cityCode);
}
public int getCityCode()
{
return this.city.getCode();
}

public void setCityName(String cityName)
{
this.city.setName(cityName);
}
public String getCityName()
{
return this.city.getName();
}

public CityBean getCity()
{
return this.city;
}

public void setIndian(boolean indian)
{
this.indian=indian;
}
public boolean getIndian()
{
return this.indian;
}

public void setDateOfBirth(String dateOfBirth)
{
this.dateOfBirth=dateOfBirth;
}
public String getDateOfBirth()
{
return this.dateOfBirth;
}

}