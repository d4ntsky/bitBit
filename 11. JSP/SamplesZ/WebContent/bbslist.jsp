<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// 댓글의 depth와 image를 추가하는 함수		ex) depth = 1 이면 ' '  - >
								//	ex) depth = 2 이면 '  ' - >
								//					 &nbsp
public String arrow(int depth) {
	String rs = "<img src='./image/arrow.png' width='20px' height='20px' />";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i = 0; i < depth; i++) {
		ts += nbsp;
	}
	
	return depth==0?"":ts+rs;	//삼항 연산자
}
%>   
    
<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null) { //session이 끝나서 ... 
	%>
	<script type="text/javascript">
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>
	<%
}
mem = (MemberDto)ologin;

BbsDao dao = BbsDao.getInstance();
List<BbsDto> list = dao.getBbsList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbslist.jsp</title>
</head>
<body>

<h4 align="right" style="background-color: #f0f0f0">
	환영합니다 <%=mem.getId() %>님
</h4>

<h1>게시판</h1>

<div align="center">
<table border="1">
<col width="70"><col width="600"><col width="150">
	<tr>
		<th>번호</th><th>제목</th><th>작성자</th>
	</tr>
	<%
	if(list == null || list.size() == 0) {
		%>
		<tr>
			<td colspan="3">작성된 글이 없습니다</td>
		</tr>
		<%
	}else{
		for(int i = 0; i < list.size(); i++) {
			BbsDto bbs = list.get(i);
		%>
		<tr>
			<th><%=i+1 %></th>
			<td>
				<%=arrow(bbs.getDepth()) %>								<!-- 여백 이미지 추가, 확인!  -->
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>
			</td>
			<td align="center"><%=bbs.getId() %></td>
		</tr>
		<%
		}
	}
	%>
	<tr align="right">
	<td colspan="3">
	<a href="bbswrite.jsp">글 쓰기</a>
	</td>
	</tr>
</table>
</div>
<br>
<br>
<br>

<div align="center">
	<table>
		<col width="30"><col width="50"><col width="50">
		<tr>
		<td>
			<select>
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
			</select>
		</td>
		<td><input type="text"></td>
		<td><button>검색</button></td>
		</tr>
	</table>
</div>

<script type="text/javascript">

//jquery로 document selected랑 input 받아서 검색 버튼 누르면 select로 sql dao 해서 ....

</script>

</body>
</html>