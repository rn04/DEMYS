<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/mainhead.jsp"%>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" type='text/css'> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" type='text/css'>

<style>
.card-body {
	padding: 1rem;
}

.mod_modal_bg {
   display: none;
   width: 100%;
   height: 100%;
   position: fixed; 
   top: 0;
   left: 0;
   right: 0;
   background: rgba(0, 0, 0, 0.6);
   z-index: 1300; 

}
   
.mod_modal_wrap {
   display: none;
   position: absolute; 
   top: 50%;
   left: 50%;
   transform:translate(-50%,-50%);
   z-index: 1301;
   background-color:white;

}

.reg_modal_bg {
   display: none;
   width: 100%;
   height: 100%;
   position: fixed; 
   top: 0;
   left: 0;
   right: 0;
   background: rgba(0, 0, 0, 0.6);
   z-index: 1300; 

}
   
.reg_modal_wrap {
   display: none;
   position: absolute; 
   top: 50%;
   left: 50%;
   transform:translate(-50%,-50%);
   z-index: 1301;
   background-color:white;

}

</style>
<div style="width: 100%; height: 955px;">
	<div class="flex items-center" style="width: 100%; height: 100%; background-color: #e7e7e7;">
		<div class="flex justify-evenly" style="width: 100%; height: 90%;">


			<div class="shadow-xl shadow-black rounded-lg" style="width: 30%; height: 98.5%; margin-top: 5px; background-color:white;">
				<div class="title flex justify-around items-center" style="height: 10%;">
					<div style="color:#153A66; font-size:1.5rem; font-weight:bolder;">&nbsp;&nbsp;TO DO </div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm" onclick="javascript:regOpen(1);" data-toggle="modal" data-target="#modifyModal" style="background-color:#153A66; color:white; font-size:1rem;">十 추가</button>
				</div>
				<div id="todo-list" class="content flex flex-col items-center" style="width:98%; height: 89%; margin-top:5px; margin-left: 10px; overflow: auto;">
					
					
					
					
					
				</div>
			</div>
			
			<div class="shadow-xl shadow-black rounded-lg" style="width: 30%; height: 98.5%; margin-top: 5px; background-color:white;">
				<div class="title flex justify-around items-center" style="height: 10%;">
					<div style="color:#153A66; font-size:1.5rem; font-weight:bolder;">&nbsp;&nbsp;IN PROGRESS </div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm" onclick="javascript:regOpen(2);" style="background-color:#153A66; color:white; font-size:1rem;">十 추가</button>
				</div>
				<div id="inprogress-list" class="content flex flex-col items-center" style="width:98%; height: 89%; margin-top:5px; margin-left: 10px; overflow: auto;">
					





				</div>
			</div>
			
			<div class="shadow-xl shadow-black rounded-lg" style="width: 30%; height: 98.5%; margin-top: 5px; background-color:white;">
				<div class="title flex justify-around items-center" style="height: 10%;">
					<div style="color:#153A66; font-size:1.5rem; font-weight:bolder;">&nbsp;&nbsp;DONE </div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm" onclick="javascript:regOpen(3);" style="background-color:#153A66; color:white; font-size:1rem;">十 추가</button>
				</div>
				<div id="done-list" class="content flex flex-col items-center" style="width:98%; height: 89%; margin-top:5px; margin-left: 10px; overflow: auto;">
					



				</div>
			</div>
		</div>
	</div>
</div>


<div class="reg_modal_bg" onClick="javascript:regClose();"></div>
<div class="reg_modal_wrap" style="width:800px; height:500px;">
	<div class="modal-content">
		<div class="modal-header flex" style="background-color: #153A66;">
			<div class="navbar text-neutral-content modal-head">
				<div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
			</div>
		</div>
		<div class="modal-body m-10">
			<div class="modal-title flex justify-center mb-3">
				<span style="font-size:2rem;">개인업무 등록</span>
			</div>
			<input id="reg_member_NUM" type="hidden" name="MEMBER_NUM" value="${member.MEMBER_NUM }"/>
			<input id="reg_tasks_STATUS" type="hidden" name="tasks_STATUS" />
			<hr/>
			<div class="mt-3 ml-3">내용</div>
			<input id="reg_tasks_CONTENT" name="tasks_CONTENT" type="text" placeholder="내용을 입력하세요." class="input input-bordered input-lg mt-2 ml-3" style="width:700px;"/>
			<div class="task-modal-serach mt-6 flex justify-center">
				<select id="reg_tasks_IMP" class="tasks-modal-impsearch select select-bordered">
					<option disabled selected>중요도 </option>
					<option value=1 style="color:#F87272;">&#xf111; 긴급</option>
					<option value=2 style="color:#FBBD23;">&#xf111; 중요</option>
					<option value=3 style="color:#36D399;">&#xf111; 보통</option>
				</select>
				<div class="task-modal-datesearch ml-8 flex items-center" style="font-size:1.2rem;">
					종료일 : &nbsp;
					<input id="reg_tasks_ENDDATE_date" name="tasks_ENDDATE_date" type="date" style="border:solid 2px gray;" />&nbsp;&nbsp;
					종료시간 :&nbsp;
					<input id="reg_tasks_ENDDATE_time" name="tasks_ENDDATE_time" type="time" value="18:00" style="border:solid 2px gray;"/>					
				</div>
			</div>
			<div class="task-modal-share flex justify-center">
				캘린더에 표시 :&nbsp;<input id="reg_tasks_SHARE" name="tasks_SHARE" type="checkbox" class="checkbox checkbox-error" value="on"/>
			</div>
		</div>
		<div class="modal-footer flex justify-center">
			<button type="button" class="btn btn-accent" data-dismiss="modal" onclick="javascript:reg_go();">확인</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="close btn btn-error" data-dismiss="modal" aria-label="Close" onclick="javascript:regClose();">
				<span aria-hidden="true">닫기</span>
			</button>
		</div>
	</div>
</div>

<div class="mod_modal_bg" onClick="javascript:modClose();"></div>
<div class="mod_modal_wrap" style="width:800px; height:500px;">
	<div class="modal-content">
		<div class="modal-header flex" style="background-color: #153A66;">
			<div class="navbar text-neutral-content modal-head">
				<div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
			</div>
		</div>
		<div class="modal-body m-10">
			<div class="modal-title flex justify-center mb-3">
				<span style="font-size:2rem;">개인업무 수정</span>
			</div>
			<input id="mod_member_NUM" type="hidden" name="tasks_NUM" value="${member.MEMBER_NUM }"/>
			<input id="mod_tasks_NUM" type="hidden" name="tasks_NUM" />
			<input id="mod_tasks_STATUS" type="hidden" name="tasks_STATUS" />
			<hr/>
			<div class="mt-3 ml-3">내용</div>
			<input id="mod_tasks_CONTENT" name="tasks_CONTENT" type="text" placeholder="내용을 입력하세요." class="input input-bordered input-lg mt-2 ml-3" style="width:700px;"/>
			<div class="task-modal-serach mt-6 flex justify-center">
				<select id="mod_tasks_IMP" class="tasks-modal-impsearch select select-bordered">
					<option disabled selected>중요도 </option>
					<option value=1 style="color:#F87272;">&#xf111; 긴급</option>
					<option value=2 style="color:#FBBD23;">&#xf111; 중요</option>
					<option value=3 style="color:#36D399;">&#xf111; 보통</option>
				</select>
				<div class="task-modal-datesearch ml-8 flex items-center" style="font-size:1.2rem;">
					종료일 : &nbsp;
					<input id="mod_tasks_ENDDATE_date" name="tasks_ENDDATE_date" type="date" style="border:solid 2px gray;" />&nbsp;&nbsp;
					종료시간 :&nbsp;
					<input id="mod_tasks_ENDDATE_time" name="tasks_ENDDATE_time" type="time" style="border:solid 2px gray;"/>					
				</div>
			</div>
			<div class="task-modal-share flex justify-center">
				캘린더에 표시 :&nbsp;<input id="mod_tasks_SHARE" name="tasks_SHARE" type="checkbox" class="checkbox checkbox-error" />
			</div>
		</div>
		<div class="modal-footer flex justify-center">
			<button type="button" class="btn btn-accent" data-dismiss="modal" onclick="javascript:mod_go();">확인</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="close btn btn-error" data-dismiss="modal" aria-label="Close" onClick="javascript:modClose();">
				<span aria-hidden="true">닫기</span>
			</button>
		</div>
	</div>
</div>

<%@ include file="taskscard.jsp"%>

<%@ include file="../common/foot.jsp"%>