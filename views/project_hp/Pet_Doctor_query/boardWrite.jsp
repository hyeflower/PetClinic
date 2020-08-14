<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<STYLE>
</style>
<link rel="stylesheet" href="./css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file='../header.jsp'%>
	<div>
		<h1 style="text-align: center; padding: 20px 0px;">게시글 등록하기</h1>
		<form name="frm" action="./board_write" method="post" enctype="multipart/form-data">
			<input type="hidden" name="filename" value="${filename }"> 
			<%-- <input
				type="hidden" name="path" value="${path }"> --%>
			<table class="boardWriteTable">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" class="table-name"
						value="${loginUser.userid }" readonly size="60"> * 필수</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" class="table-pass"
						size="60" style="font-family: gulim;"> * 필수 (게시물 수정 삭제시
						필요합니다.)</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" class="table-email"
						value="${loginUser.email }" readonly size="60"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="101" name="title"
						class="table-title"> * 필수</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="100" rows="20" name="content" id="content"></textarea></td>
				</tr>
			</table>
			<br> <br>
			<div class="boardButtons">
				<input type="button" value="등 록" onclick="boardCheck();updateSe();"
					class="boardBtnApply"
					style="border: none; font-size: 20px; padding: 10px 20px; margin-left: 10px;">
				<input type="reset" value="다시 작성" class="boardBtnRewrite"
					style="border: none; font-size: 20px; padding: 10px 20px; margin-left: 10px;">
				<input type="button" value="목 록" class="boardBtnList"
					style="border: none; font-size: 20px; padding: 10px 20px; margin-left: 10px;"
					onclick="location.href='./board_list'">
			</div>
			<script type="text/javascript" src="./javascript/main.js"></script>
		</form>
	</div>
	<%@ include file='../footer.jsp'%>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "resources/smarteditor2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,

				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				//oEditors.getById["content"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		function pasteHTML(filepath) {
			alert(filepath);

			var sHTML = '<img src="/resources/upload'+filepath+'">';
			oEditors.getById["content"].exec("PASTE_HTML", []);
		}

		function updateSe() {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			// 에디터의 내용에 대한 값 검증은 이곳에서
			// document.getElementById("rev_contents").value를 이용해서 처리한다.

			try {
				document.frm.submit();
			} catch (e) {
			}

		}
		
	</script>

</body>
</html>
