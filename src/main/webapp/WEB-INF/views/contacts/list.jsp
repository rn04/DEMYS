<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contactsList" value="${dataMap.contactsList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }"/>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<!-- 사이트 공통 JS -->
<script src="/resource/common.js" defer="defer"></script>

</head>
<%@ include file="../common/mainhead.jsp"%>
<style>
.conmain-box {
	width:100%;
	height:945px;
}
.contacts_select2 {
	display:flex;
	margin-top:10px;
	margin-bottom:10px;
	margin-left:20px;
}

.con-se1 {
 	padding-right : 10px;
}
.con-se2 {
	padding-right : 10px;
}

.btn-secondary {
	color:#ffffff;
  	background-color:#153A66;
  	border : none;
}
.input-bordered {
	width: 200px;
}
.btn-se {
	border:none;
	color:#ffffff;
  	background-color:#153A66;
}
.btn-secondary:hover,.btn-se:hover {
	background-color:#016FA0;
}

.list-body {
	margin : 0 20px;
}

.table-bordered > table th, .table-bordered> table td{
	border : 1px solid black;
	height: 40px;
}

.regist-btn {
	margin-left:auto;
	padding-right:20px;
}

.btn-hover {
	border:none;
	background-color:#016FA0;
}

.table>thead {
    background-color: #f5f4f4;
    vertical-align: bottom;
    height: 50px;
}
</style>

  <div class="conmain-box">
  <div class="contacts_select">
  <div class="contacts_select2">
    <div class="con-se1">
      <select class="select select-bordered w-full max-w-xs" id="CT_TYPE" name="CT_TYPE">
        <option value="0" ${cri.CT_TYPE eq '0' ? 'selected' : "" }>전체</option>
        <option value="1" ${cri.CT_TYPE eq '1' ? 'selected' : "" }>협력업체</option>
        <option value="2" ${cri.CT_TYPE eq '2' ? 'selected' : "" }>클라이언트</option>
        <option value="3" ${cri.CT_TYPE eq '3' ? 'selected' : "" }>거래처</option>
      </select>
    </div>
	  <div class="con-se2">
      <select class="select select-bordered w-full max-w-xs" id="searchType" name="searchType">
      	<option value="" ${cri.searchType=='' ? 'selected':"" }>구분</option>
      	<option value="n" ${cri.searchType=='n' ? 'selected':"" }>업체명</option>
		<option value="m" ${cri.searchType=='m' ? 'selected':"" }>담당자</option>
      </select>
    </div>
    <input class="input input-bordered w-full max-w-xs" type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." autocomplete="off" value="${cri.keyword }"/>
    <span class="input-group-apspend">
      <button class="btn btn-se" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
        <i class="fa fa-fw fa-search"></i>
      </button>
    </span>
    <div class="regist-btn">
    	<button type="button" class="btn btn-se" onclick="OpenWindow('regist','신규업체 등록',550,800);" >등 록</button>
    </div>
    </div>
 </div>
 <div class="list-body">
 		<table class="table table-bordered text-center" style="text-align:center;width:100%" >
        <thead>
			<tr>
				<th>업체번호</th>
				<th style="width:100px;">업체명</th>
				<th>대표자명</th>
				<th>대표번호</th>
				<th style="width:140px;">팩스번호</th>
				<th style="width:140px;">대표주소</th>
				<th>담당자명</th>
				<th>담당자연락처</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach items="${contactsList }" var="contacts" >
			<tr class="hover" style="height: 55px;">
				<td>${contacts.CT_NUM }</td>
				<td><a href="javascript:OpenWindow('detail?CT_NUM=${contacts.CT_NUM}', '업체 상세', 550, 800);">${contacts.CT_NAME}</a></td>
				<td>${contacts.CT_CEO }</td>
				<td>${contacts.CT_TEL }</td>
				<td>${contacts.CT_FAX }</td>
				<td>${contacts.CT_ADDR }</td>
				<td>${contacts.CT_MANAGER }</td>
				<td>${contacts.CT_MG_TEL }</td>
			</tr>
		  </c:forEach>
		</tbody>	 
	</table>
</div>

<br/>
 <%@ include file="/WEB-INF/views/module/conpagination.jsp" %>
</div>

	<script>
	
	function list_go(page, url) {
	    if (!url) url = "/contacts/list";
	    
	    var jobForm = $('#jobForm');
	    $("form#jobForm input[name='page']").val(page);
	    $("form#jobForm input[name='searchType']").val($('select[name="searchType"]').val());
	    $("form#jobForm input[name='keyword']").val($('div.contacts_select2>input[name="keyword"]').val());
	    $("form#jobForm input[name='perPageNum']").val($('select[name="perPageNum"]').val(13));
	    $("form#jobForm input[name='CT_TYPE']").val($('select[name="CT_TYPE"]').val());
	    $('form#jobForm').attr({
	        action: url,
	        method: 'get'
	    }).submit();
	}
	
		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
			winleft = (screen.width - WinWidth) / 2;
			wintop = (screen.height - WinHeight) / 2;
			var win = window.open(UrlStr, WinTitle, "scrollbars=yes, location=no, width="+ WinWidth +", height="+ WinHeight +", top="+ wintop +", left="+ winleft +", resizable=yes");
			win.focus() ; 
	}

	//팝업창 닫기
	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
	
 </script>
