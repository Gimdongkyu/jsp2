<%@page import="board.vo.Comment"%>
<%@page import="board.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CommentDao dao = CommentDao.getInstance();
	
	//댓글을 등록하기 위해 mref 컬럼 값 꼭 필요합니다.
		int mref = Integer.parseInt(request.getParameter("mref"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		Comment vo = new Comment(0,mref,writer,content,null,ip,0);
		dao.insert(vo);
		// 댓글 등록 확인하기 위해 글상세보기 페이지로 이동
		response.sendRedirect("detailAction.jsp?idx="+mref+"&page="+request.getParameter("page"));
		
%>

