<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.pagination {
  width:100%;
  display: flex;
  justify-content: center;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 11px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #153a66;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

<form id="searchForm" method="get">	
	<input type='hidden' name="page" value=""/>
	<input type='hidden' name="perPageNum" value="5"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>


<div class="pagination">
	<a href="javascript:list_go(1);" class="page-link">&laquo;</a>
	<a href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : cri.page });" class="page-link">&lt;</a>
	
	<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<a href="javascript:list_go(${pageNum}, 'main');" class="page-link ${cri.page == pageNum ? 'active' : ''}">${pageNum}</a>
	</c:forEach>
	
	<a href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 : cri.page});" class="page-link">&gt;</a>
	<a href="javascript:list_go(${pageMaker.realEndPage});" class="page-link">&raquo;</a>
</div>