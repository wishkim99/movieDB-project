<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
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
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	try{
		con = ProjectConnection.getCon();
		String sql="select * from movie where mname=?";
    
		pstmt = con.prepareStatement(sql);
        pstmt.setString(1, mname);
		rs = pstmt.executeQuery();

		String mssn=rs.getString("mssn");
		String date=rs.getString("date");
	    String lead_actor_num=rs.getString("lead_actor_num");
		String pro_num=rs.getString("pro_num");
		String direct_num=rs.getString("direct_num");
	/* 	int lead_actor_num=Integer.parseInt(rs.getString("lead_actor_num"));
		int pro_num=Integer.parseInt(request.getParameter("pro_num"));
		int direct_num=Integer.parseInt(request.getParameter("direct_num"));*/
		String actor_assn=rs.getString("actor_assn");
		String director_dssn=rs.getString("director_dssn"); 
 
%>
<form name='frm' method='post' action='projectupdateSuccess.jsp'>
<table>
	<tr>
		<td>영화</td>
		<td><%=mname %><input type="hidden" name="mname" value="<%=mname%>"/></td>
	</tr>
	<tr>
		 <%-- <td>개봉일</td>
		<td><input type="text" name="date" value="<%=date %>"/></td> 
	</tr>
	<tr>   --%>
		 <td>일련번호</td>
		<td><input type="text" name="mssn" value="<%=mssn %>"/></td>
	</tr>
	<tr>
		<td>개봉일</td>
		<td><input type="text" name="date" value="<%=date %>"/></td>
	</tr>
	<tr>
		<td>주연배우 수 </td>
		<td><input type="text" name="lead_actor_num" value="<%=lead_actor_num%>"/></td>
	</tr>
	<tr>
		<td>제작자 수 </td>
		<td><input type="text" name="pro_num" value="<%=pro_num%>"/></td>
	</tr>
	<tr>
		<td>감독 수 </td>
		<td><input type="text" name="direct_num" value="<%=direct_num%>"/></td>
	</tr>
	<tr>
		<td>배우 주민번호 </td>
		<td><input type="text" name="actor_assn" value="<%=actor_assn%>"/></td>
	</tr>
	<tr>
		<td>감독 주민번호 </td>
		<td><input type="text" name="director_dssn" value="<%=director_dssn%>"/></td> 
	</tr>
	<tr> 
		<td colspan="2" align="center">
		<input type="button" name="btn1" value="저장" onclick="javascript:frm.submit();"/>
		<input type="button" name="btn2" value="목록" onclick="javascript:location.href='projectlist.jsp';"/>
		</td>
	</tr>
</table>
</form>		
<%
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
<script type="text/javascript">
	function update(){
		document.frm.submit();
	}
	function list(){
		location.href="projectlist.jsp";
	}
</script>
</body>
</html>