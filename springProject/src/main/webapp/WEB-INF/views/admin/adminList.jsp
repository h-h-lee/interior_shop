<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">
<!-- BootStrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
<!-- 중앙 내용 시작 -->
<div id="admin-main-width">
	<div id="wide-width" class="wide-table">
		<h4 id="header-main">관리자 목록</h4>
		<c:if test="${count == 0}">
			관리자 정보가 없습니다.
		</c:if>
		<c:if test="${count > 0}">
		<table class="table table-hover table-bordered table-sm">
			<thead>
				<tr>
					<th class="c-num">번호</th>
					<th class="c-auth">관리자유형</th>
					<th class="c-id">아이디</th>
					<th class="c-name">이름</th>
					<th class="c-phone">연락처</th>
					<th class="c-email">이메일</th>
					<th class="c-manage">관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="adminMemberVO" items="${list}">
				<tr>
					<td>${adminMemberVO.mem_num}</td>
					<td>
						<c:if test="${adminMemberVO.mem_auth == 3}">일반관리자</c:if>
						<c:if test="${adminMemberVO.mem_auth == 4}">최고관리자</c:if>
					</td>
					<td>${adminMemberVO.mem_id}</td>
					<td>${adminMemberVO.mem_name}</td>
					<td>${adminMemberVO.mem_phone}</td>
					<td>${adminMemberVO.mem_email}</td>
					<td>
						<c:if test="${adminMemberVO.mem_auth == 3}">
						<button class="btn btn-light btn-sm" onclick="location.href='adminDelete.do?mem_num=${adminMemberVO.mem_num}'">
							<i class="bi bi-trash-fill mr-1"></i>삭제
						</button>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center mt-4">${pagingHtml}</div>
		</c:if>
	</div>
</div>
<!-- 중앙 내용 끝 -->