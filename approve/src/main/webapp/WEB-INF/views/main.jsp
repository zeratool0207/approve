<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script type="text/javascript">

	var sessionChk = '${detailMap}';
	if(sessionChk == null || sessionChk ==''){
		alert('로그인 후 이용하세요');
		location.href="loginf";
	}
	
	function fncGoDetail(seq){
		location.href="detail?seq="+seq;
	}
	
	$(function(){
		var proxSh = '${memInfo.memRank}';
		if(proxSh == 'ga'||proxSh == 'ba'){
			$('#proxAppBtn').show();
		}
		
		$('#logoutBtn').click(function(){
			location.href="logout";
		});
		
		$('#schBtn').click(function(){
			$('#searchFrm').attr('action','main').attr('method','post').submit();
		});
		
		$("#searchStatus").change(function(){
			$.ajax({
				url : "searchList",
				data : $("#searchFrm").serialize(),
				type : "post",
				success : function(data){
					alert("검색완료");
					$("#tContent").html(data);
				},
				error :function(data){
					alert("에러");
				}
			});
		});
	});

</script>
<style type="text/css">
#report1:hover tbody tr:hover td {
    background: skyblue;
    color: white;
}
</style>
<title>main</title>
</head>
<body>
	<div>
		<div>
			${sessionScope.detailMap.memName }(${sessionScope.detailMap.memRankKor })님 환영합니다.
			<input type="button" name="logoutBtn" id="logoutBtn" value="로그아웃">
		</div>
		<div>
			<input type = "button" name = "writeBtn" id = "writeBtn" value = "글쓰기" onclick = "location.href = 'write'">
			<input type = "button" name = "proxAppBtn" id = "proxAppBtn" value = "대리결재" style = "display: none;">
		</div>
		<form name = "searchFrm" id = "searchFrm">
			<div>
				<select name = "searchType" id = "searchType">
					<option>전체</option>
					<option value = "writeName">작성자</option>
					<option value = "appSubject">제목</option>
					<option value = "apperName">결재자</option>
				</select> 
				<input type = "text" name = "searchTxt" id = "searchTxt" placeholder="검색어를 입력하세요">
				<select name = "searchStatus" id = "searchStatus">
					<option value = "stEmp">결재상태</option>
					<option value = "tmp">임시저장</option>
					<option value = "wait">결재대기</option>
					<option value = "ing">결재중</option>
					<option value = "end">결재완료</option>
					<option value = "ret">반려</option>
				</select>
				<br>
				<input type = "date" name = "stDate" id = "stDate"> ~
				<input type = "date" name = "enDate" id = "enDate">
				<input type = "button" name = "schBtn" id = "schBtn" value = "검색">
			</div>
		</form>
		
		<div>
				<table border = "1" class="table" id = "report1"> 
					<thead>
						<tr>
							<th>글번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th>결재일</th>
							<th>결재자</th>
							<th>결재상태</th>
						</tr>
					</thead>
					
					<tbody id = "tContent">
						<c:choose>
							<c:when test="${empty apprList}">
								<tr>
									<td colspan="7">검색된 데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${apprList }" var = "list">
									<tr onclick="fncGoDetail(${list.seq})">
										<td>${list.seq }</td>
										<td>${list.writeName }</td>
										<td>${list.apprSubject }</td>
										<td>${list.apprRegDate }</td>
										<td>${list.apprDate }</td>
										<td>${list.apperName }</td>
										<td>${list.apprStatusKor }</td>
									</tr>
								</c:forEach>	
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
	</div>
</body>
</html>