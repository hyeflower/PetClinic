<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<link rel="stylesheet" href="./css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../header.jsp'%>

	<div>
		<h1 style="text-align: center; padding: 20px;">게시글 상세보기</h1>

		<table class="boardViewTable">

			<tr>

				<th>작성자</th>
				<td width="15%"><input type="text" name="news_name"
					value="${newsVo.news_name}" style="border: none; outline: none;"
					readonly></td>
				<th>작성일</th>
				<td width="15%">${newsVo.news_date}</td>
				<th>조회수</th>
				<td width="15%">${newsVo.news_hit }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5"><input type="text" size="101" name="news_title"
					class="table-title" value="${newsVo.news_title }" readonly></td>

			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3">${newsVo.news_content }</td>
			</tr>

		</table>
		<c:choose>
			<c:when test="${empty loginUser }">
				<div class="boardViewBtn">
					<br> <br> <br> <br> <input type="button"
						value="게시글 리스트" class="boardViewBtnList"
						onclick="location.href='./news_list'">
				</div>
			</c:when>
			<c:when test="${loginUser.usertype eq 'mem' }">
				<div class="boardViewBtn">
					<br> <br> <br> <br> <input type="button"
						value="게시글 리스트" class="boardViewBtnList"
						onclick="location.href='./news_list'">
				</div>
			</c:when>
			<c:when test="${loginUser.usertype eq 'doc' }">
				<div class="boardViewBtn">
					<br> <br> <br> <br> <input type="button"
						value="게시글 리스트" class="boardViewBtnList"
						onclick="location.href='./news_list'">
				</div>
			</c:when>
			<c:otherwise>
				<div class="boardViewBtn">
					<br> <br> <br> <br> <input type="button"
						value="게시글 수정" class="boardViewBtnUpdate"
						onclick="location.href='./news_update_form?news_num=${newsVo.news_num}'">

					<input type="button" value="게시글 삭제" class="boardViewBtnDelete"
						onclick="location.href='./news_delete?news_num=${newsVo.news_num}'">

					<input type="button" value="게시글 리스트" class="boardViewBtnList"
						onclick="location.href='./news_list'"> <input
						type="button" value="게시글 등록" class="boardViewBtnApply"
						onclick="location.href='./news_write_form'">
				</div>
			</c:otherwise>
		</c:choose>

	</div>

	<%@ include file='../footer.jsp'%>
	<script type="text/javascript" src="./javascript/main.js"></script>

</body>
</html>