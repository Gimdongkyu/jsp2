<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 출력 포멧 사용하기 위한 태그라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 문자열 함수 사요아기 위한 태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css?v=3">
</head>
<body>
	<!-- 문서가 생성될때 실행 -->
	<h3>동아리 커뮤니티</h3>
	<hr>
	<div style="width: 80%; margin: auto;max-width: 700px;">
		<ul id="main">
			<li>
				<ul class="row">
					<li>제목</li>
					<li>${bean.subject}</li>
					<li>조회수</li>
					<li>${bean.readCount}</li>
				</ul>
			</li>
			<li>
				<ul class="row">
					<li>작성자</li>
					<li>${bean.writer}<span
				style="font-size: 70%; padding-left: 30px;">(${bean.ip})</span></li>
					<li>작성날짜</li>
					<li><fmt:formatDate value="${bean.wdate }" type="both"/></li>
					<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
				</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>			
					<!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다.
					     브라우저 출력은 줄바꿈은 <br> 태그 해결1) pre 태그, 해결2) \n을 <br>로 대치-->	
					<li>
						<pre>${bean.content}</pre>
					</li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
		<a class="button" href="updateAction.jsp?idx=${bean.idx}">수정</a>
		<a class="button" onclick="deleteSet()">삭제</a>
		<a class="button" href="listAction.jsp?page=${page }">목록</a>
	</div>
	<!-- 메인글 출력 끝 -->
</div>
	<hr>
	<!--댓글 등록  -->
	<form action="commentAction.jsp" method="post">
	<!-- 필요한 파라미터 이지만 화면에는 표시안함. 2개 필요 : 메인글의 idx, 현재글의 페이지 번호 -->
	<input type="hidden" name="mref" value="${bean.idx }">
	<input type="hidden" name="pgae" value="${page }">
		<div>
		<span>댓글</span>
		<span>[${bean.commentCount}]</span>	<!--댓글 갯수  --> 		
		</div>
		<hr>
		
		<ul id ="main">
				<li> 
					<ul class="row">
					<li>작성자 </li>	<!-- 1)로그인한 사용자가 작성할때는 로그인 이메일, 닉네임 가져와서 표시 -->
					<li><input name="writer" class="input"></li>
					<li>글 비밀번호 </li> <!-- 댓글 삭제: 1)록인한 사용자가 본인글 삭제 또는 2)글 비밀번호 사용 -->
					<li> <input name="password" calss="input" type="password"></li>
				</ul>
			</li>		
			<li> 
				<ul class="row">
					<li> 
							<textarea rows="5" cols="60" name="content"
							style="resize:none;" placeholder="댓글을 작성하세요" class="input"></textarea>
					</li>
					<li>
						<input type="submit" value ="저장" class="button small"> 
						<input type ="reset" value ="취소" class="button samll"> 
					</li>
				</ul>
			</li>
			<!-- 댓글 목록 -->
		 <c:forEach var="cmt" items="${cmtlist}">
		 <li> 
		 	<ul>
		 		<li>${cmt.writer } </li>
		 		<li>${cmt.ip } </li>
		 		<li>${cmt.wdate } </li>
		 		<li><a href="">삭제</a></li>
		 	</ul>
		 </li>
		 <li> 
		 	<pre>${cmt.content }</pre>
		 </li>
		 </c:forEach>
			
			
			
			
			
		</ul>
	</form>
	
	
	
</body>
</html>









