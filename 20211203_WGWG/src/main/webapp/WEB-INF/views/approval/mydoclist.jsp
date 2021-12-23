<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 문서함</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/approve.js" ></script> 
<script type="text/javascript" src="./js/paging.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
// 		var active = ${paging.active}
// 		console.log("active : " + active);
// 		if(active == 2){
// 				$('#li1').removeClass('active');
// 				$('#li2').addClass('active');
// 				$('#li3').removeClass('active');
// 				$('#li4').removeClass('active');
			
// 				$('#all').removeClass('active in');
// 				$('#menu1').addClass('active in');
// 				$('#menu2').removeClass('active in');
// 				$('#menu3').removeClass('active in');
				
// 		}else if(active == 3){
// 			$('#li1').removeClass('active');
// 			$('#li2').removeClass('active');
// 			$('#li3').addClass('active');
// 			$('#li4').removeClass('active');
		
			
// 			$('#all').removeClass('active');
// 			$('#menu1').removeClass('active');
// 			$('#menu2').addClass('active');
// 			$('#menu3').removeClass('active');
			
// 		}else if(active == 4){
// 			$('#li1').removeClass('active');
// 			$('#li2').removeClass('active');
// 			$('#li3').removeClass('active');
// 			$('#li4').addClass('active');
		
			
// 			$('#all').removeClass('active');
// 			$('#menu1').removeClass('active');
// 			$('#menu2').removeClass('active');
// 			$('#menu3').addClass('active');
			
// 		}else{
// 			$('#li1').addClass('active');
// 			$('#li2').removeClass('active');
// 			$('#li3').removeClass('active');
// 			$('#li4').removeClass('active');
		
			
// 			$('#all').addClass('active');
// 			$('#menu1').removeClass('active');
// 			$('#menu2').removeClass('active');
// 			$('#menu3').removeClass('active');
			
// 		}
		
		
		var state = '개인';
		
		detailMove(state);
		
// 		search();
	});
</script>

<style>

.container{
	margin-left: 10px;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	width: 150px;
}

#search {
	float: right;
}

#searchbtn {
	width: 50px;
	height: 30px;
	border-radius: 5px;
	font-size: 1.3rem; border : 1px solid #ddd;
	background-color: #073865;
	color: white;
	margin-left: 5px;
	border: 1px solid #ddd
}

#inputsearch{
	border: 1px solid #ddd;
	font-size: 1.3rem;
}

#inputsearch:focus {
	outline:1px solid #073865;
}


.test{
		margin: 0 auto;
		width: 28%;
	}
	

</style>
</head>
<body>
	<div class="container">
		<h1>개인 문서함</h1>
		<br>
		
		<ul class="nav nav-pills" style="height:18px;">
		<c:if test="${paging.active  == 1}">
 			<li id="li1"  val="1" class="active" ><a data-toggle="pill" href="#all" style="font-size: 0.8rem;">전체</a></li>		
		</c:if>
		<c:if test="${paging.active  != 1}">
 			<li id="li1"  val="1" class="active" ><a data-toggle="pill" href="#all" style="font-size: 0.8rem;">전체</a></li>		
		</c:if>
		<c:if test="${paging.active  == 2}">
			<li id="li2" val="2"><a data-toggle="pill" href="#menu1" style="font-size: 0.8rem;">진행</a></li>		
		</c:if>
		<c:if test="${paging.active  != 2}">
			<li id="li2" val="2"><a data-toggle="pill" href="#menu1" style="font-size: 0.8rem;">진행</a></li>		
		</c:if>
		<c:if test="${paging.active  == 3}">
			<li id="li3" val="3"><a data-toggle="pill" href="#menu2" style="font-size: 0.8rem;">완료</a></li>		
		</c:if>
		<c:if test="${paging.active  != 3}">
			<li id="li3" val="3"><a data-toggle="pill" href="#menu2" style="font-size: 0.8rem;">완료</a></li>		
		</c:if>
		<c:if test="${paging.active  == 4}">
			<li id="li4" val="4"><a data-toggle="pill" href="#menu3" style="font-size: 0.8rem;">반려</a></li>		
		</c:if>
		<c:if test="${paging.active  != 4}">
			<li id="li4" val="4"><a data-toggle="pill" href="#menu3" style="font-size: 0.8rem;">반려</a></li>		
		</c:if>
		
			<div id="search">
			<input type="text" placeholder="문서제목으로 검색" id="searchKeyword" name="title" value="${paging.searchkeyword}">
			<input type="button" id="searchbtn" value="검색" onclick="search1();">
			</div>
		</ul>
		
		<hr>
		<div class="tab-content" style="margin-top: 20px;">
			<c:if test="${paging.active  == 1}">
				<div id="all" class="tab-pane active">
			</c:if>
			<c:if test="${paging.active  != 1}">
				<div id="all" class="tab-pane">
			</c:if>
			
					<table class="table table-hover">
						<thead style="text-align:center">
							<tr style="text-align:center">
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>참조</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
								<tr style="text-align:center">
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.ref_emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			<c:if test="${paging.active  == 2}">
				<div id="menu1" class="tab-pane active">
			</c:if>
			<c:if test="${paging.active  != 2}">
				<div id="menu1" class="tab-pane">
			</c:if>
				<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>참조</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
							<c:if test="${doc.app_doc_st eq '진행'}">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.ref_emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
			</div>
			<c:if test="${paging.active  == 3}">
				<div id="menu2" class="tab-pane active">
			</c:if>
			<c:if test="${paging.active  != 3}">
				<div id="menu2" class="tab-pane">
			</c:if>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>참조</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
							<c:if test="${doc.app_doc_st eq '완료'}">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.ref_emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
			</div>
			<c:if test="${paging.active  == 4}">
				<div id="menu3" class="tab-pane active">
			</c:if>
			<c:if test="${paging.active  != 4}">
				<div id="menu3" class="tab-pane">
			</c:if>
				<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>참조</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
							<c:if test="${doc.app_doc_st eq '반려'}">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.ref_emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</div>
		
		
			
			<div class="test">
				<!-- paging 처리 관련 값 -->
				<input type="hidden" name="index" id="index" value="${paging.index}">
				<input type="hidden" name="pageStartNum" id="pageStartNum"
					value="${paging.pageStartNum}"> <input type="hidden"
					name="listCnt" id="listCnt" value="${paging.listCnt}">
					<input type="hidden" name="app_chk" id="app_chk" value="개인"/>

				<div class="center">

					<ul class="pagination">

						<li><a href="#" onclick="pageFirst()">&laquo;</a></li>
						<li><a href="#"
							onclick="pagePre(${paging.pageStartNum},${paging.pageCnt})">&lsaquo;</a></li>

						<!-- 페이지 번호 -->
							<c:forEach var="i" begin="${paging.pageStartNum}"
							end="${paging.pageLastNum}" step="1">
							
							<c:if test="${paging.index+1 == i}">
							<li style="background: #eee;"><a style="background: #eee;" onclick="pageIndex(${i})">${i}</a></li>
							</c:if>
							<c:if test="${paging.index+1 != i}">
							<li><a onclick="pageIndex(${i})">${i}</a></li>
							</c:if>
						</c:forEach>

						<li><a href="#"
							onclick="pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&rsaquo;</a></li>
						<li><a href="#"
							onclick="pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&raquo;</a></li>

					</ul>

				</div>
			</div>
		
		
	</div>
	
</body>
</html>