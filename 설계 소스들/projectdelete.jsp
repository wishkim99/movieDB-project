<%@page import="examples.ProjectConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//삭제할 아이디
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String mname = request.getParameter("mname");
	int n=0;
	try{
		con = ProjectConnection.getCon();
		String sql="delete from movie where mname=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mname);
		
		n = pstmt.executeUpdate();
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
	response.sendRedirect("projectlist.jsp");
%>
</body>
</html>