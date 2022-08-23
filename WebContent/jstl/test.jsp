<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>
</head>
<body>
<h3>jstl</h3>
<hr>
<ul>
<li>javaServer pages Standard Tag Library</li>
<li>scriptrit java code조각 html 문서 사이에 존재할때 가독성</li>
<li>for if tag</li>
<li>jstl must have libraries</li>
<li>el uses $&#123;$#125;
el is used as <%-- <%= %> --%>with getAttribute and print  

</li>
<li>jstl is used with el (el can be used without lib) </li>

</ul>
<h4>save like java var </h4>
<c:set var="age" value="16"/>
age : ${age} <br>
<hr>
<h4>if : test </h4>
<c:if test="${age < 20 }">
<div style="color: green;">청소년입니다</div>
</c:if>
<c:if test="${age >= 20 }">
<div style="color: blue;">adult
</div></c:if>
<h4>
c:choose 
</h4>

<c:choose>
<c:when test="${age < 15 }">
<div style="color: pink;">child
</div>
</c:when>
<c:when test="${age < 23 }">
<div style="color: violet;">lad
</div>
</c:when>
<c:otherwise>
<div style="color: blue;">adult</div>
</c:otherwise>
</c:choose>
<button onclick="test()">test</button>
<script type="text/javascript">
function test() {
	alert('${age}'); //el
}
</script>

<h4>for each</h4>
<c:forEach var="i" begin="1" end="10">
<c:out value="${i }"/>,
<c:out value="${i*10}"/><br>
</c:forEach>

<c:forEach var="x" begin="10" end="30" step="2" varStatus="status"> 
<c:out value="${x}"></c:out>, index=
<c:out value="${status.count}"/>
</c:forEach>

<h4>forTokens</h4>
<c:set var="twice" value="sana,nayun,dahyun,momo"/>
<ul>
<c:forTokens items="${twice }" var="member" delims=",">
<li>
	<c:out value="${member }"></c:out>
</li>
</c:forTokens>
</ul>

</body>

</html>