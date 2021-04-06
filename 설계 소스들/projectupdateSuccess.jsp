<%@page import="java.sql.SQLException"%>
<%@page import="examples.ProjectConnection"%> 
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
request.setCharacterEncoding("utf-8");
String mname=request.getParameter("mname");
//String mssn=request.getParameter("mssn");
String date=request.getParameter("date");
/*  int lead_actor_num=Integer.parseInt(request.getParameter("lead_actor_num"));
int pro_num=Integer.parseInt(request.getParameter("pro_num"));
int direct_num=Integer.parseInt(request.getParameter("direct_num")); */
String lead_actor_num=request.getParameter("lead_actor_num");
String pro_num=request.getParameter("pro_num");
String direct_num=request.getParameter("direct_num");
String actor_assn=request.getParameter("actor_assn");
String director_dssn=request.getParameter("director_dssn");
   
	//db에 저장하기
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = //"update mname set date=? where mname=?" ;
	"update mname set mssn=?,date=? , lead_actor_num=?, pro_num=?, direct_num=?, actor_assn=?, director_dssn=? where mname= ?";
	int n=0;
	
	try{
		con = ProjectConnection.getCon();
		pstmt = con.prepareStatement(sql);
		//pstmt.setString(1, mname);
		//pstmt.setString(2, mssn);
		pstmt.setString(3, date);
		pstmt.setString(4, lead_actor_num);
		pstmt.setString(5, pro_num);
		pstmt.setString(6, direct_num);
		pstmt.setString(7, actor_assn);
		pstmt.setString(8, director_dssn); 
		n = pstmt.executeUpdate();
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
%>

<script type="text/javascript">
	if(<%=n%>>0 ){
		alert("수정완료");
		location.href="projectlist.jsp";
	}else{
		alert("수정 실패");
		history.go(-1);
	}
</script>
</body>
</html>

