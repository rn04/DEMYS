<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="/resource/css/project/regist.css" />

<div class="p-body-header">
	 	 	
	   <!-- project작업공간 -->
		<div class="p-main-body">
   			
   			<div class="p-regist-view">
   				<div class="p-regi">
   					<span class="p-regi_1">프로젝트 등록</span>
   					<span class="p-regi_2">신규 프로젝트를 등록하세요.</span>
   				</div>
   				<div class="p-regi-2">
   					<div class="p-regi-made">
   						Step1. 프로젝트 만들기
   						<i class="fa-regular fa-circle-right"></i>
   					</div>
   					<div class="p-regi-detail">
   						Step2. 상세정보 등록
   						<i class="fa-regular fa-circle-right"></i>
   					</div>
   				</div>
   				<span style="font-weight:bold;">* 진행할 프로젝트 유형을 선택하세요.</span>
   				<div class="p-type-select">
   					<div class="p-type-in p-type" data-pj-type="1" onclick="javascript:selectPJ_TYPE(1);">
   						<img src="/resource/img/list_regist.png" class="p-type-in-icon"/>
   						<span>내부 프로젝트</span>
   					</div>
   					<div class="p-type-out p-type" data-pj-type="2"onclick="javascript:selectPJ_TYPE(2);">
   						<img src="/resource/img/list_regist.png" class="p-type-in-icon"/>
   						<span>외부 프로젝트</span>
   					</div>
   				</div>
   				<input type="hidden" id="PJ_TYPE_VALUE" />
   				<div class="p-type-bt">
   					<button class="p-type-bt-1" onclick="PJ_REGI_F1();">취소</button>
   					<button class="p-type-bt-1" onclick="javascript:registNext_go();">다음</button>
   				</div>
   				
   			</div>
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<script>
function selectPJ_TYPE(PJ_TYPE){
	$('#PJ_TYPE_VALUE').val(PJ_TYPE);
	$(".p-type").css('border',"3px solid #797979").css('color',"#797979");
	$(".p-type[data-pj-type='"+PJ_TYPE+"']").css('border',"4px solid #1ECAF0").css('color',"black");
}

function registNext_go(){
	
	var PJ_TYPE=$('#PJ_TYPE_VALUE').val();

	$.ajax({
		url:"regist_PJTYPE?PJ_TYPE="+PJ_TYPE,
		type:"get",
		dataType: "text",
		success: function(data){
			$(".pjbody").html(data);
			$(".p-body").css('background-color', "white");
			
		}
	});
}
function PJ_REGI_F1(){
	   history.go();
	}
</script>







