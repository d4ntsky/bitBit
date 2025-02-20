<%@page import="java.util.Calendar"%>
<%@page import="calendarEx.CalendarDao"%>
<%@page import="util.UtilEx"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

MemberDto mem = (MemberDto)session.getAttribute("login");//세션에서 문제생김

System.out.println(year + " " + " " + month + " " + day);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	<!-- 버전 확인! -->

</head>
<body>

<!-- 펜 모양을 누르면 일정을 입력할 수 있는 jsp -->

<%
//범위를 설정하는 기준
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1; //0~11까지라 +1
int tday = cal.get(Calendar.DATE);
int thour =  cal.get(Calendar.HOUR_OF_DAY);	//경매 사이트
int tmin = cal.get(Calendar.MINUTE);		//경매 사이트	경매사이트는 초까지
%>

<h1>일정 추가</h1>

<div align="center">

<form action="calwriteAf.jsp" method="post">
<table border="1">
	<col width="200"><col width="500">
	<tr>
		<th>ID</th>
		<td>
			<%=mem.getId() %>
			<input type="hidden" name="id" value="<%=mem.getId() %>">
		</td>
	</tr>

	<tr>
		<th>제목</th>
		<td>
		<input type="text" size="60" name="title">
		</td>
	</tr>

	<tr>
		<th>일정</th>
		<td>
			<select name="year">
			<%
			for(int i = tyear - 5; i < tyear + 5; i++) {
				%>
				<option <%=year.equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
			</select>년
			
			<select name="month">
			<%
			for(int i = 1; i <= 12; i++) {
				%>
				<option <%=month.equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
			</select>월
			
			<select name="day">
			<%
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
				%>
				<option <%=day.equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
			</select>일
			
			<select name="hour">
			<%
			for(int i = 0; i < 24; i++) {
				%>
				<option <%=(thour + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
			</select>시
			
			<select name="min">
			<%
			for(int i = 0; i < 60; i++) {
				%>
				<option <%=(tmin + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
			</select>분
			
		</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>
		<textarea name="content" rows="20" cols="80"></textarea>
		</td>
	</tr>
	
	<tr align="right">
		<td colspan="2">
		<input type="submit" value="일정추가">
		</td>
	</tr>
	

</table>
</form>
</div>

<script type="text/javascript">

$("select[name='day']").val("<%=day %>");	//오늘 날짜로 바꿀수 있다


$(document).ready(function() {
	$("select[name='month']").change( setday );
});

function setday() {
	//해당 년도의 월을 통해서 마지막 날을 구한다 - 윤년...//getActuallyMaximum
	let year = $("select[name='year']").val();
	let month = $("select[name='month']").val();
	
	let lastday = (new Date(year,month,0)).getDate();
	alert(lastday);
	
	//날짜 적용
	let str = "";
	for(i = 1; i <= lastday; i++) {
		str += "<option value '" + i + "'>" + i + "</option>";
	}
	
	$("select[name='day']").html( str );
		

}

</script>
 
</body>
</html>