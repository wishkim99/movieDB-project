<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@page import="examples.ProjectConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String mname=request.getParameter("mname");
	String mssn=request.getParameter("mssn");
	String date=request.getParameter("date");
	String lead_actor_num=request.getParameter("lead_actor_num");
	String pro_num=request.getParameter("pro_num");
	String direct_num=request.getParameter("direct_num");
	/* int lead_actor_num=Integer.parseInt(request.getParameter("lead_actor_num"));
	int pro_num=Integer.parseInt(request.getParameter("pro_num"));
	int direct_num=Integer.parseInt(request.getParameter("direct_num")); */
	String actor_assn=request.getParameter("actor_assn");
	String director_dssn=request.getParameter("director_dssn");
	//db에 저장하기
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "insert into movie values(?,?,?,?,?,?,?,? sysdate)";
	int n=0;
	
	try{
		con = ProjectConnection.getCon();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mname);
		pstmt.setString(2, mssn);
		pstmt.setString(3, date);
		pstmt.setString(4, lead_actor_num);
		pstmt.setString(5, pro_num);
		pstmt.setString(6, direct_num);
		/* pstmt.setInt(4, lead_actor_num);
		pstmt.setInt(5, pro_num);
		pstmt.setInt(6, direct_num); */
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
	// 결과 응답하기	
 %>
<script type="text/javascript">
      alert("입력완료!");
      location.href="projectindex.html";//
   
</script>
</body>
</html>