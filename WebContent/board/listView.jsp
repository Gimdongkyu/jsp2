<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 동네 커뮤니티</title>
<!-- 절대 경로 request.getContexPath()을  el로 표시  -->
<link rel="stylesheet"
 href="${pageContext.request.contextPath }//css/freeboard.css?v=3">
</head>
<body>
<h3>우리동네 커뮤니티</h3>
<hr>
<div style="margin:auto;">
<ul id="main">
	<li>
		<ul  class="row">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>작성일</li>
		</ul>
	</li>
 	<c:forEach var="vo" items="${list}"> 
	<li>
	<ul  class="row">
		<li>${vo.idx }</li>
		<li><a href="detailAction.jsp?idx=${vo.idx}&page=${page}" class="title">${vo.subject }</a>
	 		...<span style="color:orange;font-size: 80%;">(${vo.commentCount })
	 		</span></li>
		<li>${vo.writer }</li>
		<li>${vo.readCount }</li>
		<li>
		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" var="wdate"/>
		<!-- 오늘 작성한 글은 시간으로 표시 -->
		<c:if test='${wdate == today}'>
		<fmt:formatDate value="${vo.wdate }" type="time"/>
		</c:if>
		<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
		<c:if test='${wdate != today}'>
		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/>
		</c:if>
		</li>

		

	</ul>

	</li>

 	</c:forEach>

</ul>
 <div style="float:right; margin:40px;">
 <a href="insertView.jsp?page=${page }" class="button">글쓰기</a></div>
</div>
<!-- 페이지 버튼을 클릭하면 url http://192.168.1.254:8080/jsp2/board/listAction.jsp는 동일하고
	 page 파라미터만 변경됩니다. 이런경우 앞의 부분을 생략하고 ? 부터 작성. 
-->
<div style="width:700px; margin:auto; text-align: center;">
	전체 글 갯수 : <c:out value="${pagelist.totalCount}"></c:out>
	<a class="pagenum" href="?pgae=1">&lt;&lt;</a>
	<a class="pagenum" href="?page=${pagelist.startPage-1 }" 
		style='<c:if test="${pagelist.startPage==1 }">display:none;</c:if>'>&lt;</a>

<c:forEach var ="i" begin="${pagelist.startPage}" end="${pagelist.endPage}">
	<a class="pagenum" href="?page=${i}"> <c:out value="${i}"/></a>
</c:forEach>

	<a class="pagenum" href="?page=${pagelist.endPage+1 }"
	style='<c:if test="${pagelist.endPage==pagelist.totalPage }">display:none;</c:if>'>&gt;</a>
	<a class="pagenum" href="?page=${pagelist.totalPage }">&gt;&gt;</a>
</div>

</body>
</html>