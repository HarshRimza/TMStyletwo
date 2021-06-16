<jsp:useBean id='studentBean' scope='request' class='com.thinking.machines.school.beans.StudentBean' />
<jsp:setProperty name='studentBean' property='rollNumber' />
<jsp:setProperty name='studentBean' property='name' />
<jsp:forward page='/deleteStudent' />