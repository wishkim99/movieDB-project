<%@page import="examples.ProjectConnection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
<h2>movie</h2>
<table border="1" width="600">
	<tr>
		<td>영화</td>
		<td>일련번호</td>
		<td>개봉일</td>
		<td>주연배우 수</td>
		<td>제작자 수</td>
		<td>감독 수</td>
		<td>배우 주민번호</td>
		<td>감독 주민번호</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	<%
		//db 에서 회원목록 얻어와 테이블에 출력하기.
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			con = ProjectConnection.getCon();
			String sql="select * from movie";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
	
				String mname=rs.getString("mname");
				String mssn=rs.getString("mssn");
				String date=rs.getString("date");
				String lead_actor_num=rs.getString("lead_actor_num");
				String pro_num=rs.getString("pro_num");
				String direct_num=rs.getString("direct_num");
				/* int lead_actor_num=Integer.parseInt(rs.getString("lead_actor_num"));
				int pro_num=Integer.parseInt(request.getParameter("pro_num"));
				int direct_num=Integer.parseInt(request.getParameter("direct_num")); */
				String actor_assn=rs.getString("actor_assn");
				String director_dssn=rs.getString("director_dssn");
	

%>
	<tr>
		<td><%=mname %></td>
		<td><%=mssn %></td>
		<td><%=date %></td>
		<td><%=lead_actor_num %></td>
		<td><%=pro_num %></td>
		<td><%=direct_num %></td>
		<td><%=actor_assn %></td>
		<td><%=director_dssn %></td>
		<td><a href="projectupdate.jsp?mname=<%=mname%>" >수정</a></td>
		<td><a href="projectdelete.jsp?mname=<%=mname%>" >삭제</a></td>
	</tr>
<%
			}
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}finally{
			try{
				if(rs!=null)  rs.close();
				if(pstmt!=null)  pstmt.close();
				if(con!=null)  con.close();
			}catch(SQLException se){
				System.out.println(se.getMessage());
			}
		}
	%>
</table>
</body>
</html>