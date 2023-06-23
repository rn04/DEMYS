<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.ducks.demys.boot.vo.Calendar"%>
<c:set var="calendar" value="${calendar}" />
<%@include file="../common/mainhead.jsp"%>
<!-- fullcalendar 설정관련 script -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>

<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link rel="stylesheet" href="../resource/css/calendar/caln.css" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- //html 하단에 순서로 로드 -->
<script src="js/flatpickr.js"></script>
 
<!-- //언어설정을 위한 로드 -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>



<style>
.fc-event {
	margin-top: 5px;
	cursor: move;
}

#calendar {
	height: 500px;
	min-height: 600px;
	width: 80%;
	float: right;
	margin-top: 50px;
}

.modal-box {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
	padding: 0;
	width: 400px;
}

.modal-title {
	font-weight: bold;
	font-size: 1.2rem;
	margin-bottom: 20px;
}

.modal-row {
	margin-bottom: 15px;
}

.modal-label {
	font-weight: bold;
	width: 30%;
	padding-right: 10px;
}

.modal-input {
	width: 70%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.modal-select {
	width: 70%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	color: #333;
}

.modal-action {
	text-align: right;
	margin-top: 20px;
}

.modal-action .btn {
	cursor: pointer;
	padding: 8px 16px;
	background-color: #153A66;
	color: #fff;
	border-radius: 4px;
	font-weight: bold;
}

.modal-action .btn:hover {
	background-color: #122c53;
}
</style>

<div id='external-events' style="margin-top: 50px; float: left; width: 20%; padding-right: 30px; padding-left: 20px;">
		<p>
				<strong>드래그로 달력에 표시</strong>
		</p>

		<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>프로젝트</div>
		</div>
		<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>개인업무</div>
		</div>


		<p>
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>드래그 앤 드롭후 제거</label>
		</p>

		<!-- DB에 저장하기위해서는 전체저장이 필요하다 -->
		<div class="button_all">
				<div>
						<button onclick="allSave();" style="cursor: pointer; width: 100px; height: 35px; background-color: #ccc;">전체
								저장</button>

						<div id="contextMenu" class="dropdown dropdown-right">
								<label tabindex="0" class="btn m-1">Click</label>
								<ul tabindex="0" class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-52" role="menu"
										aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px;">
										<label for="my-modal">
												<a tabindex="-1" href="#"></a>
												일정등록
										</label>
										<li>
												<a tabindex="-1" href="#" data-role="close">Close</a>
										</li>
								</ul>
						</div>
				</div>
		</div>
</div>







<!-- The button to open modal -->

<!-- 모달 -->
<!-- Put this part before </body> tag -->
<input type="checkbox" id="my-modal" class="modal-toggle" />
<div class="modal">
		<!-- 모달바디 -->
		<div class="modal-box">
				<div class="flex" style="background-color: #153A66;">
						<div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 50px;">
								<div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">
										&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
						</div>
				</div>



				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="mo_sc_name">일정명</label>
								<input class="inputModal" type="text" name="edit-title" id="edit-title" required="required" />
						</div>
				</div>

				<div class="row">
						<div class="time">
								<div>
										<p>시작일</p>
										<input  id="mo_sc_stdate" name="mo_sc_stdate" placeholder="시작일을 선택하세요" class="timeSelector" />
								</div>
						</div>
				</div>

				<div class="row">
						<div class="time">
								<div>
										<p>종료일</p>
										<input id="mo_sc_enddate" name="mo_sc_enddate"placeholder="종료일을 선택하세요" class="timeSelector" />
								</div>
						</div>
				</div>

				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="edit-allDay">종일</label>
								<input class='mo_allDay' id="mo_allDay" type="checkbox">
						</div>
				</div>


				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="mo_sc_status">구분</label>
								<select class="mo_sc_type" name="mo_sc_status" id="mo_sc_status">
										<option value="" style="color: #D25565;">선택</option>
										<option value="1" style="color: #D25565;">프로젝트</option>
										<option value="2" style="color: #9775fa;">개인업무</option>
								</select>
						</div>
				</div>

				<!-- 프로젝트 선택 시 프로젝트 조회 버튼 -->
				<div id="projectNameContainer" style="display: none;">
						<div class="row">
								<div class="col-xs-12">
										<label class="col-xs-4" for="mo_project-name">프로젝트명</label>
										<input class="inputModal" type="text" name="mo_project-name" id="mo_project-name">
										<button id="project-search-button">조회</button>
								</div>
						</div>
				</div>

				<!-- 프로젝트 조회 모달 창 -->
				<div id="projectModal" class="modal" style="display: none;">
						<div class="modal-box">
								<!-- 모달 내용 -->
								<!-- 프로젝트 조회 관련 내용을 추가하세요 -->

								<!-- 모달 닫기 버튼 -->
								<div class="modal-action">
										<label for="projectModal" class="btn">닫기</label>
								</div>
						</div>
				</div>

				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="mo_sc_type">일정구분</label>
								<select class="inputModal" name="mo_sc_type" id="mo_sc_type">
										<option value="내부회의">내부회의</option>
										<option value="외부회의">외부회의</option>
										<option value="출장">출장</option>
										<option value="휴가">휴가</option>
										<option value="기타">기타</option>
								</select>
						</div>
				</div>
				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="mo_sc_imp">중요도</label>
								<select class="inputModal" name="mo_sc_imp" id="mo_sc_imp">
										<option value="">선택</option>
										<option value="1">낮음</option>
										<option value="2">보통</option>
										<option value="3">높음</option>
								</select>
						</div>
				</div>
				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="mo_sc_place">장소</label>
								<input class="inputModal" type="text" name="mo_sc_place" id="mo_sc_place"  />
						</div>
				</div>
				<div class="row">
						<div class="col-xs-12">
								<label class="col-xs-4" for="mo_sc_content">내용</label>
								<textarea rows="4" cols="50" class="textarea textarea-bordered" name="mo_sc_content" id="mo_sc_content"></textarea>

						</div>
				</div>





				<!-- 모달닫기버튼  -->
				<div class="modal-action">
						<label for="my-modal" class="btn">Yay!</label>
				</div>
		</div>
</div>

<section class="mt-5">
		<div class="container mx-auto px-3">
				<div id='calendar'></div>
		</div>
</section>



<script>
// 타임피커 생성
var dateSelector = document.querySelector('.timeSelector');
dateSelector.flatpickr();
//언어설정
flatpickr.localize(flatpickr.l10ns.ko);
flatpickr(dateSelector);
dateSelector.flatpickr({
    local: 'ko'
});
//시간설정
$(".timeSelector").flatpickr({
	  enableTime: true,
	});
</script>


<!-- 달력 -->
<script>


$(function() {
		$('#edit-type').on('change', function() {
			var selectedValue = $(this).val();
			if (selectedValue === '1') {
				$('#projectNameContainer').show();
			} else {
				$('#projectNameContainer').hide();
			}
		});
	});

	$(function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(
				calendarEl,
				{
					headerToolbar : {
						left : 'prev,next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,listWeek'
					},
					businessHours : false,
					navLinks : true,
					editable : true,
					selectable : true,
					locale : 'ko',
					nowIndicator : true,
					dayMaxEvents : true,
					select : function(info) {
						var SC_NAME = prompt('일정을 입력해주세요.');
						if (SC_NAME) {
							var event = {
								sc_NAME : SC_NAME,
								start : info.startStr,
								end : info.endStr,
								sc_NUM : info.sc_NUM,
							};
							calendar.addEvent(event);
							saveData(event);
						}
					},
					//타이틀 클릭해서 삭제
					eventClick : function(info) {
						if (confirm('일정을 삭제하시겠습니까?')) {
							var SC_NUM = info.event.extendedProps.sc_NUM;
							//alert(SC_NUM);
							$
									.ajax({
										type : 'POST',
										url : '/calendar/removeCalendar',
										data : {
											sc_NUM : SC_NUM
										},
										dataType : 'json',
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										success : function(data) {
											if (data.success) {
												info.event.remove();
												alert(data.msg);
											} else {
												if (data.msg) {
													alert(data.msg);
												}
											}
										},
										error : function(xhr, status, error) {
											alert('삭제가 완료되었습니다. ');
											window.location.reload();
										}
									});
						}
					},
					//달력에 리스트 출력
					events : function(info, successCallback, failureCallback) {
						var url = "/calendar/getCalendar";
						$
								.ajax({
									type : 'GET',
									cache : false,
									url : url,
									dataType : 'json',
									contentType : "application/x-www-form-urlencoded; charset=UTF-8",
									success : function(param) {
										console.log(param);
										var events = [];
										$.each(param, function(index, date) {
											events.push({
												title : date.sc_NAME,
												start : date.sc_STARTDATE,
												end : date.sc_ENDDATE,
												sc_NUM : date.sc_NUM
											});
										});

										successCallback(events);
									},
									error : function(xhr, status, error) {
										failureCallback(xhr, status, error);
									}
								});
					}
				});
		//등록하기
		function saveData(event) {
			var url = "/calendar/registCalendar";
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(event),
				contentType : "application/json",
				success : function(data) {
					alert("일정이 등록되었습니다.");
				},
				error : function(xhr, status, error) {
					alert("에러 발생: " + error);
				}
			});
		}
		calendar.render();
	});
</script>





