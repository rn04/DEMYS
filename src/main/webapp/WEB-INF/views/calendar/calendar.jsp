<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="com.ducks.demys.boot.vo.Calendar"%>
<c:set var="Calendar" value="${Calendar}" />
<%@include file="../common/mainhead.jsp"%>
<!-- fullcalendar 설정관련 script -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>

<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link rel="stylesheet" href="../resource/css/calendar/caln.css" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- //언어설정을 위한 로드 -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<link rel="stylesheet" href="../resource/css/calendar/calendar.css">





<div id='external-events' ></div>

<div class="button_all"style="width:100%;display:flex;justify-content:flex-end;position:relative;right:120px;margin-top:20px;">
      <div>
            <button class="addbtn" onclick="openModal();" >
                  + 일정추가</button>
      </div>
</div>

<!-- The button to open modal -->
 <!-- 일정추가 모달 -->

  <div id="cal_modal" class="modal_calendar">

    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>일정등록</span>
         </div>
         <div class="cts-title-sub">* 일정을 등록하세요.</div>
         
         <form id="ScheduleForm">
         <input type="hidden" class="MEMBER_NUM" name="MEMBER_NUM" id="MEMBER_NUM" value=${member.MEMBER_NUM } />
         
         <input type="hidden" class="BACKGROUNDCOLOR" name="BACKGROUNDCOLOR" id="BACKGROUNDCOLOR" value=${calendar.BACKGROUNDCOLOR } />
         <input type="hidden" class="TEXTCOLOR" name="TEXTCOLOR" id="TEXTCOLOR" value=${calendar.TEXTCOLOR } />
         <input type="hidden" class="BORDERCOLOR" name="BORDERCOLOR" id="BORDERCOLOR" value=${calendar.BORDERCOLOR } />
         <div style="margin-top:10px;"> 
         <div class="p-modal-serach regist_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="mo_sc_name" for="mo_sc_name" style="font-weight:bold;float:left;width:30%;">일정명</label>
                        <input class="inputModal" style="float:left;width:50%;border:1px solid #ccc;" autocomplete="off" type="text" name="SC_NAME" id="SC_NAME" required="required" />
                  </div> 
         </div>
         <div class="p-modal-serach regist_calendar">
               <div class="time" style="width:100%;">
                        <div>
                           <label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">시작일자</label>
                              <input  style="float:left;width:50%;border:1px solid #ccc;" id="START" name="START" placeholder="시작일을 선택하세요" class="timeSelector" />
                        </div>
                  </div>
         </div>
         <div class="p-modal-serach regist_calendar">
               <div class="time" style="width:100%;">
                        <div>
                              <label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">종료일자</label>
                              <input style="float:left;width:50%;border:1px solid #ccc;" id="END" name="END"placeholder="종료일을 선택하세요" class="timeSelector" />
                        </div>
                  </div>
         </div>
         <div class="p-modal-serach regist_calendar">
               <div class="col-xs-12" style="width:100%;">
               <input type="hidden" class="PJ_NUM" name="PJ_NUM" id="PJ_NUM" value=${calendar.PJ_NUM } />
                        <label class="col-xs-4" for="sc_STATUS" style="font-weight:bold;float:left;width:30%;">구분</label>
                        <select class="sc_STATUS" name="SC_STATUS" id="SC_STATUS" style="float:left;width:50%;border:1px solid #ccc;">
                              <option value=""  style="color: #D25565;">선택</option>
                              <option value="1" style="color: #D25565;" ${calendar.SC_STATUS == '1' ? "selected":""}>프로젝트</option>
                              <option value="2" style="color: #9775fa;" ${calendar.SC_STATUS == '2' ? "selected":""}>개인업무</option>
                        </select>
                  </div>
         </div>
              <!-- 프로젝트 선택 시 프로젝트 조회 버튼 -->
      <div class="p-modal-search regist_calendar" style="display: none;">
         <div class="col-xs-12" style="width:100%;margin-left:40px;">
            <label class="col-xs-4" for="PJ_NAME" style="font-weight:bold;float:left;width:30%;">프로젝트명</label>
            <input readonly class="inputModal" type="text" name="PJ_NAME" id="PJ_NAME" style="float:left;width:40%;border:1px solid #ccc;">
            <a href="javascript:searchPJ();" id="project-search-button" style="display:inline-block;border:1px solid #ccc;width:42px;height:26px;text-align: center;">선택</a>
         </div>
      </div>
         
         <div class="p-modal-serach regist_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_TYPE" style="font-weight:bold;float:left;width:30%;">일정구분</label>
                        <select class="inputModal" name="SC_TYPE" id="SC_TYPE" style="float:left;width:50%;border:1px solid #ccc;">
                              <option value="내부회의" ${calendar.SC_TYPE == '내부회의' ? "selected":""}>내부회의</option>
                              <option value="외부회의" ${calendar.SC_TYPE == '외부회의' ? "selected":""}>외부회의</option>
                              <option value="출장" ${calendar.SC_TYPE == '출장' ? "selected":""}>출장</option>
                              <option value="휴가" ${calendar.SC_TYPE == '휴가' ? "selected":""}>휴가</option>
                              <option value="기타" ${calendar.SC_TYPE == '기타' ? "selected":""}>기타</option>
                        </select>
                  </div>
         </div>
         <div class="p-modal-serach regist_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_IMP" style="font-weight:bold;float:left;width:30%;">중요도</label>
                        <select class="inputModal" name="SC_IMP" id="SC_IMP" style="float:left;width:50%;border:1px solid #ccc;">
                              <option value="">선택</option>
                              <option value="1" ${calendar.SC_IMP == '1' ? "selected":""}>낮음</option>
                              <option value="2" ${calendar.SC_IMP == '2' ? "selected":""}>보통</option>
                              <option value="3" ${calendar.SC_IMP == '3' ? "selected":""}>높음</option>
                        </select>
                  </div>
         </div>
            <div class="p-modal-serach regist_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_PLACE" style="font-weight:bold;float:left;width:30%;">장소</label>
                        <input class="inputModal" type="text" autocomplete="off" name="SC_PLACE" id="SC_PLACE" style="float:left;width:50%;border:1px solid #ccc;" />
                  </div>
         </div>
         <div class="p-modal-serach regist_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="SC_CONTENT" style="font-weight:bold;float:left;width:30%;">내용</label>
                        <textarea rows="4" cols="50" class="textarea textarea-bordered" name="SC_CONTENT" id="SC_CONTENT" style="float:left;width:50%;border:1px solid #ccc;"></textarea>
                  </div>
         </div>
      </div>
         
         <div class="p-regi-modal-bts">
                  <button class="p-regi-modal-bt" type="button"  onclick="addSchedule();">등록</button>
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_MODAL();">취소</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_member_id" ></div>
            </div>
            </form>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>



<!-- 달력 -->
<section class="mt-5">
      <div class="container mx-auto px-3">
      
            <div id='calendar'></div>
      </div>
</section>



<!-- 프로젝트 리스트 모달 -->

  <div id="pj_modal" class="search_pj">
<input type="hidden" name="MEMBER_NUM" value="${member.MEMBER_NUM }" />
<%-- <input type="hidden" name="PJ_NUM" value="1" />
 --%>
 <input type="hidden" name="PJ_NAME" value="${projects.PJ_NUM }" />
    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>참여중인 프로젝트</span>
         </div>
         
         <div class="cts-serch-list" style="background-color:#ccc;">
            <table id="calendarList_view" border="1" >
               <!-- projectList나오는 위치 -->

            </table>
         </div>
         <div class="p-regi-modal-bts">
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_mODAL();">선택완료</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_calendar_id" ></div>
            </div>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>






 <!-- 일정 디테일 모달 -->
  <div id="cal_modal" class="modimodal_calendar">
<input type="hidden" name="SC_NUM" value="${calendar.SC_NUM }" />   
    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>일정</span>
         </div>
         
         <form id="modi_ScheduleForm">
         <input type="hidden" class="MEMBER_NUM" name="MEMBER_NUM" id="MEMBER_NUM" value=${member.MEMBER_NUM } />
         <div style="margin-top:40px;"> 
         <div class="p-modal_modi-serach modi_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="mo_sc_name" for="mo_sc_name" style="font-weight:bold;float:left;width:30%;">일정명</label>
                        <input  readonly class="inputModal"  style="float:left;width:50%;border:1px solid #ccc;" type="text" name="sc_NAME" id="sc_NAME" required="required" />
                  </div>
         </div>
         <div class="p-modal_modi-serach modi_calendar">
               <div class="time" style="width:100%;">
                        <div>
                           <label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">시작일자</label>
                              <input readonly value="${calendar.START }" style="float:left;width:50%;border:1px solid #ccc;" id="start" name="start"  />
                        </div>
                  </div>
         </div>
         <div class="p-modal_modi-serach modi_calendar">
               <div class="time" style="width:100%;">
                        <div>
                              <label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">종료일자</label>
                              <input readonly value="${calendar.END }" style="float:left;width:50%;border:1px solid #ccc;" id="end" name="end"  />
                        </div>
                  </div>
         </div>
              <!-- 프로젝트 선택 시 프로젝트 조회 버튼 -->
      
        <div class="p-modal_modi-serach modi_calendar" id="pj_name_hide">
          <div style="width:100%;">
            <div>
              <label class="col-xs-4" for="PJ_NAME" style="font-weight:bold;float:left;width:30%;">프로젝트명</label>
              <input type="hidden" class="inputModal" value="${calendar.PJ_NUN}"  id="pj_NUM" name="pj_NUM" type="text" />
              <input readonly class="inputModal" value="${calendar.PJ_NAME}" style="float:left;width:50%;border:1px solid #ccc;" id="pj_NAME" name="pj_NAME" type="text" />
            </div>
          </div>
        </div>

      
      <div class="p-modal_modi-serach modi_calendar">
               <div style="width:100%;">
                        <div>
                              <label class="col-xs-4" for="sc_TYPE" style="font-weight:bold;float:left;width:30%;">일정구분</label>
                              <input readonly value="${calendar.SC_TYPE }" style="float:left;width:50%;border:1px solid #ccc;" id="sc_TYPE" name="sc_TYPE" type="text"  />
                        </div>
                  </div>
         </div>
         
      
      <div class="p-modal_modi-serach modi_calendar">
               <div style="width:100%;">
                        <div>
                              <label class="col-xs-4" for="sc_IMP" style="font-weight:bold;float:left;width:30%;">중요도</label>
                              <input readonly value="${calendar.SC_IMP }" style="float:left;width:50%;border:1px solid #ccc;" id="sc_IMP" name="sc_IMP" type="text"  />
                        </div>
                  </div>
         </div>
         
    
            <div class="p-modal_modi-serach modi_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_PLACE" style="font-weight:bold;float:left;width:30%;">장소</label>
                        <input readonly value="${calendar.SC_PLACE }" class="inputModal" type="text" name="sc_PLACE" id="sc_PLACE" style="float:left;width:50%;border:1px solid #ccc;" />
                  </div>
         </div>
         <div class="p-modal_modi-serach modi_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="SC_CONTENT" style="font-weight:bold;float:left;width:30%;">내용</label>
                        <textarea readonly value="${calendar.SC_CONTENT }" rows="4" cols="50" class="textarea textarea-bordered" name="sc_CONTENT" id="sc_CONTENT" style="float:left;width:50%;border:1px solid #ccc;"></textarea>
                  </div>
         </div>
      </div>
         
         <div class="p-regi-modal-bts" style="margin-top:20px;">
                  <button class="p-regi-modal-bt" id="p-regi-modal-bt" type="button" onclick="modiSchedule();">수정</button>
                  <button class="p-regi-modal-bt" type="button" onclick="deleteSchedule();">삭제</button>
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_MODAL();">취소</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_member_id" ></div>
            </div>
            </form>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>


<!-- 일정수정모달 -->


  <div id="modi_cal_modal" class="Modify_modal_calendar">

    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>일정수정</span>
         </div>
         <div class="cts-title-sub">* 일정을 수정하세요.</div>
         
         <form id="modi_ScheduleForm">
         <input type="hidden" class="MEMBER_NUM" name="MEMBER_NUM" id="MODMEMBER_NUM" value=${member.MEMBER_NUM } />
         <input type="hidden" class="SC_NUM" name="SC_NUM" id="MODSC_NUM" value=${calendar.SC_NUM } />
         <input type="hidden" class="PJ_NUM" name="PJ_NUM" id="MODPJ_NUM" value=${calendar.PJ_NUM } />
         <div style="margin-top:10px;"> 
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="mo_sc_name" for="mo_sc_name" style="font-weight:bold;float:left;width:30%;">일정명</label>
                        <input class="inputModal" style="float:left;width:50%;border:1px solid #ccc;" autocomplete="off" type="text" name="SC_NAME" id="MODSC_NAME" required="required" />
                  </div>
         </div>
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="time" style="width:100%;">
                        <div>
                           <label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">시작일자</label>
                              <input  style="float:left;width:50%;border:1px solid #ccc;" id="MODSTART" name="START" placeholder="시작일을 선택하세요" class="timeSelector" />
                        </div>
                  </div>
         </div>
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="time" style="width:100%;">
                        <div>
                              <label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">종료일자</label>
                              <input style="float:left;width:50%;border:1px solid #ccc;" id="MODEND" name="END"placeholder="종료일을 선택하세요" class="timeSelector" />
                        </div>
                  </div>
         </div>
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_STATUS" style="font-weight:bold;float:left;width:30%;">구분</label>
                        <select class="sc_STATUS" name="SC_STATUS" id="MODI_SC_STATUS" style="float:left;width:50%;border:1px solid #ccc;">
                              <option value=""  style="color: #D25565;">선택</option>
                              <option value="1" style="color: #D25565;" ${calendar.SC_STATUS == '1' ? "selected":""}>프로젝트</option>
                              <option value="2" style="color: #9775fa;" ${calendar.SC_STATUS == '2' ? "selected":""}>개인업무</option>
                        </select>
                  </div>
         </div>
              <!-- 프로젝트 선택 시 프로젝트 조회 버튼 -->
      <div class="p-Modify_modal-search Modify_calendar" style="display: none;">
         <div class="col-xs-12" style="width:100%;margin-left:40px;">
            <label class="col-xs-4" for="PJ_NAME" style="font-weight:bold;float:left;width:30%;">프로젝트명</label>
            <input readonly class="inputModal" type="text" name="PJ_NAME" id="MODPJ_NAME" style="float:left;width:40%;border:1px solid #ccc;">
            <a href="javascript:searchPJ();" id="project-search-button" style="display:inline-block;border:1px solid #ccc;width:42px;height:26px;text-align: center;">선택</a>
         </div>
      </div>
         
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_TYPE" style="font-weight:bold;float:left;width:30%;">일정구분</label>
                        <select class="inputModal" name="SC_TYPE" id="MODSC_TYPE" style="float:left;width:50%;border:1px solid #ccc;">
                              <option value="내부회의" ${calendar.SC_TYPE == '내부회의' ? "selected":""}>내부회의</option>
                              <option value="외부회의" ${calendar.SC_TYPE == '외부회의' ? "selected":""}>외부회의</option>
                              <option value="출장" ${calendar.SC_TYPE == '출장' ? "selected":""}>출장</option>
                              <option value="휴가" ${calendar.SC_TYPE == '휴가' ? "selected":""}>휴가</option>
                              <option value="기타" ${calendar.SC_TYPE == '기타' ? "selected":""}>기타</option>
                        </select>
                  </div>
         </div>
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_IMP" style="font-weight:bold;float:left;width:30%;">중요도</label>
                        <select class="inputModal" name="SC_IMP" id="MODSC_IMP" style="float:left;width:50%;border:1px solid #ccc;">
                              <option value="">선택</option>
                              <option value="1" ${calendar.SC_IMP == '1' ? "selected":""}>낮음</option>
                              <option value="2" ${calendar.SC_IMP == '2' ? "selected":""}>보통</option>
                              <option value="3" ${calendar.SC_IMP == '3' ? "selected":""}>높음</option>
                        </select>
                  </div>
         </div>
            <div class="p-Modify_modal-serach Modify_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="sc_PLACE" style="font-weight:bold;float:left;width:30%;">장소</label>
                        <input class="inputModal" type="text" autocomplete="off" name="SC_PLACE" id="MODSC_PLACE" style="float:left;width:50%;border:1px solid #ccc;" />
                  </div>
         </div>
         <div class="p-Modify_modal-serach Modify_calendar">
               <div class="col-xs-12" style="width:100%;">
                        <label class="col-xs-4" for="SC_CONTENT" style="font-weight:bold;float:left;width:30%;">내용</label>
                        <textarea rows="4" cols="50" autocomplete="off" class="textarea textarea-bordered" name="SC_CONTENT" id="MODSC_CONTENT" style="float:left;width:50%;border:1px solid #ccc;"></textarea>
                  </div>
         </div>
      </div>
         
         <div class="p-regi-modal-bts">
                  <button class="p-regi-modal-bt" id="modi_ScheduleButton" onclick="modi_Schedule();">완료</button>
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_modi_MODAL();">취소</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_member_id" ></div>
            </div>
            </form>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>


<!-- (수정) 프로젝트 리스트 모달 -->

  <div id="modi_pj_modal" class="modi_search_pj">
<input type="hidden" name="MEMBER_NUM" value="${member.MEMBER_NUM }" />
<%-- <input type="hidden" name="PJ_NUM" value="1" />
 --%>
 <input type="hidden" name="PJ_NAME" value="${projects.PJ_NUM }" />
    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>참여중인 프로젝트</span>
         </div>
         
         <div class="cts-serch-list" style="background-color:#ccc;">
            <table id="calendarList_view" border="1" >
               <!-- memberList나오는 위치 -->

            </table>
         </div>
         <div class="p-regi-modal-bts">
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="modi_CLOSE_mODAL();">선택완료</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_calendar_id" ></div>
            </div>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>











<script>
//등록폼에서 날짜 유효성체크하기
function validateDate() {
   var startDate = new Date($('#START').val());
   var endDate = new Date($('#END').val());

   if (startDate > endDate) {
      alert('시작일자가 종료일자보다 늦습니다.');
      $('#END').val(''); // 종료일자 입력 필드를 비움
      $('#END').focus(); // 종료일자 입력 필드로 포커스 이동
   }
}

// 시작일자와 종료일자 입력 필드의 값 변경 시 유효성 체크 실행
$('#START, #END').on('change', function() {
   validateDate();
});


//프로젝트 옵션 선택 이벤트 핸들러 (등록모달)
document.getElementById("SC_STATUS").addEventListener("change", function() {
  var selectedOption = this.value; // 선택된 옵션 값 가져오기
  var projectSearchContainer = document.querySelector(".p-modal-search.regist_calendar");
  var PJ_NUMInput = document.getElementById("PJ_NUM");
  
  if (selectedOption === "1") {
    // 프로젝트 옵션을 선택한 경우 프로젝트 입력란 표시
    projectSearchContainer.style.display = "block";
  } else {
    // 다른 옵션을 선택한 경우 프로젝트 입력란 숨김
    projectSearchContainer.style.display = "none";
    // PJ_NUM 값을 정수형 0으로 초기화
    PJ_NUMInput.value = 0;
  }
});

//개인업무 선택 시 PJ_NUM 값을 정수형으로 변환
$('#SC_STATUS').change(function() {
  var selectedValue = $(this).val();
  if (selectedValue === '2') {
    var PJ_NUM = parseInt($('#PJ_NUM').val());
    // 변환된 PJ_NUM 값을 사용하여 원하는 동작 수행
    // 예: 다른 필드 업데이트, AJAX 요청 등
  }
});
//프로젝트 옵션 선택 이벤트 핸들러(수정모달)
document.getElementById("MODI_SC_STATUS").addEventListener("change", function() {
  var selectedOption = this.value; // 선택된 옵션 값 가져오기
  var projectSearchContainer = document.querySelector(".p-Modify_modal-search.Modify_calendar");

  if (selectedOption === "1") {
    // 프로젝트 옵션을 선택한 경우 프로젝트 입력란 표시
    projectSearchContainer.style.display = "block";
  } else {
    // 다른 옵션을 선택한 경우 프로젝트 입력란 숨김
    projectSearchContainer.style.display = "none";
  }
}); 



//일정추가 모달열기
function openModal() {
    $(".modal_calendar").css('display',"block");
   }
   function CLOSE_MODAL(){
      $(".modal_calendar").css('display', "none");
   }
//일정디테일 모달열기
function open_detailModal() {
    $(".modimodal_calendar").css('display',"block");
   }
   function CLOSE_detailMODAL(){
      $(".modimodal_calendar").css('display', "none");
   }

//일정수정 모달열기
function modiSchedule() {
    $(".Modify_modal_calendar").css('display',"block");
      
      var sc_NAME =  $('#sc_NAME').val();
     $('#MODSC_NAME').val(sc_NAME);
     
     var start =  $('#start').val();
     $('#MODSTART').val(start);

     var end =  $('#end').val();
     $('#MODEND').val(end);
     
     var sc_TYPE =  $('#sc_TYPE').val();
     $('#MODSC_TYPE').val(sc_TYPE);
     
     var sc_PLACE =  $('#sc_PLACE').val();
     $('#MODSC_PLACE').val(sc_PLACE);

     var sc_CONTENT =  $('#sc_CONTENT').val();
     $('#MODSC_CONTENT').val(sc_CONTENT);
     
     var pj_NAME =  $('#pj_NAME').val();
     $('#MODPJ_NAME').val(pj_NAME);
     
   }
   function CLOSE_modi_MODAL(){
      $(".Modify_modal_calendar").css('display', "none");
   }
   
   
//=====================================================================
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
//================================================================================
var SC_PK="";
   
   $(function() {
      
      
      var calendarEl = document.getElementById('calendar');
      var Draggable = FullCalendar.Draggable;
      var containerEl = document.getElementById('external-events');
      var checkbox = document.getElementById('drop-remove'); 
      
      
       // initialize the external events
       // -----------------------------------------------------------------

        new Draggable(containerEl, {
         itemSelector: '.fc-event',
         eventData: function(eventEl) {
           return {
             title: eventEl.innerText
           };
         }
       }); 
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
               //타이틀 클릭해서
               eventClick : function(info) {
                  //alert("click");
                  open_detailModal();
                  
                    // AJAX 요청 보내기
                  var SC_NUM = info.event.extendedProps.sc_NUM;
                  SC_PK = SC_NUM;
                    $.ajax({
                      url: "/calendar/getCalendardetail?SC_NUM="+SC_NUM,  // 요청할 경로 설정
                      type: "GET",  // 요청 방식 (GET 또는 POST)
                      dataType: "json",  // 응답 데이터 타입 설정
                      success: function(data) {
                        // AJAX 요청이 성공했을 때 실행되는 콜백 함수
                       // alert('성공');  // 응답 데이터를 콘솔에 출력
                        var detail_sc_NAME = data.sc_NAME;  // 응답 데이터에서 원하는 속성 값 가져오기
                        var detail_START = data.start;  
                        var detail_END = data.end;  
                        var detail_sc_TYPE = data.sc_TYPE;  
                        var detail_sc_IMP = data.sc_IMP;  //중요도
                        var detail_sc_PLACE = data.sc_PLACE;  
                        var detail_sc_CONTENT = data.sc_CONTENT;  
                        var detail_pj_NAME = data.pj_NUM;  
                        
                        // 가져온 값으로 input의 value 설정
                        $('#sc_NAME').val(detail_sc_NAME);
                        $('#start').val(detail_START);
                        $('#end').val(detail_END);
                        $('#sc_TYPE').val(detail_sc_TYPE);
                        $('#sc_IMP').val(detail_sc_IMP); //중요도
                        $('#sc_PLACE').val(detail_sc_PLACE);
                        $('#sc_CONTENT').val(detail_sc_CONTENT);
                        $('#pj_NAME').val(detail_pj_NAME);
                        
                     // 프로젝트명이 null이 아닐 때 input 칸 보이기
                        if (detail_pj_NAME !== null) {
                           $('#pj_NAME').val(detail_pj_NAME);
                           $('#pj_NAME').show();
                        }

                     //프로젝트 num대신 name이 나오도록하기
                        if (detail_pj_NAME !== null) {
                      if (detail_pj_NAME === 1) {
                          $('#pj_NAME').val('MTQ 프로젝트 관리 사업');
                          $('#pj_NAME').show();
                      } else if (detail_pj_NAME === 2) {
                          $('#pj_NAME').val('더존비즈온 프로젝트 관리 사업');
                          $('#pj_NAME').show();
                      }
                  }
                        
                     
                        if (detail_pj_NAME === 0) {
                            $('#pj_name_hide').hide();
                        }
                     
                     // 중요도 값에 따라 텍스트 설정
                        var scImpInfo = document.getElementById('sc_IMP');
                        scImpInfo.value = detail_sc_IMP;
                        if (detail_sc_IMP === 1) {
                           scImpInfo.value = '낮음';
                        } else if (detail_sc_IMP === 2) {
                           scImpInfo.value = '보통';
                        } else if (detail_sc_IMP === 3) {
                           scImpInfo.value = '높음';
                        }
                                              
                      },
                      error: function(xhr, status, error) {
                        // AJAX 요청이 실패했을 때 실행되는 콜백 함수
                       alert("에러 발생: " + error); // 에러 메시지를 콘솔에 출력

                        // TODO: 에러 처리 로직을 작성
                      }
                    });
                   
               },
               
               //달력에 리스트 출력
               events : 
                  
                  function(info, successCallback, failureCallback) {
                   var MEMBER_NUM = $('input[name="MEMBER_NUM"]').val();
                  var url = "/calendar/getCalendar?MEMBER_NUM=" + MEMBER_NUM;
                  $.ajax({
                           type : 'GET',
                           cache : false,
                           url : url,
                           dataType : 'json',
                           contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                           success : function(param) {
                              /* console.log(param); */
                              var events = [];
                              $.each(param, function(index, date) {
                                 console.log(date);
                                 events.push({
                                    title : date.sc_NAME,
                                    start : date.sc_STARTDATE,
                                    end : date.sc_ENDDATE,
                                    sc_NUM : date.sc_NUM,
                                    backgroundColor : date.backgroundcolor,
                                    textColor: date.textcolor,
                                    borderColor: date.bordercolor
                                 });
                              });

                              successCallback(events);
                           },
                           error : function(xhr, status, error) {
                              failureCallback(xhr, status, error);
                           }
                        });
               },
            });
      calendar.render();
   });
</script>


<!-- handlebars 사용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>    
<script type="text/x-handlebars-template"  id="calendar-template" >
{{#each .}}
        <tr data-calendar-num="{{pj_NUM}}">
         <td>{{pj_NAME}}</td>
      </tr>
{{/each }}

</script>

<script>
//==========================================================================//
//모달안에서 프로젝트 선택 모달열기
function searchPJ(){
    $(".search_pj").css('display',"block");
    var MEMBER_NUM = $('input[name="MEMBER_NUM"]').val();
   //alert(MEMBER_NUM);
    $.ajax({
          url: "getModal_PJList",
          type: "get",
          dataType: "json",
          data: {
              "member_NUM": MEMBER_NUM,
          },
          success: function (projectList) {
              var table = $('#calendarList_view');
              table.empty();

              let template = Handlebars.compile($("#calendar-template").html());
              let html = template(projectList);
              table.append(html);
              table.find('tr').click(function () {
                 var PJ_NUM = parseInt($(this).data('calendar-num'));
                  var PJ_NAME = $(this).find('td:first-child').text();

                  var input_pjnum = '<input id="pj_num" type="hidden" value="' + PJ_NUM + '" />';
                  var input_pjname = '<input id="pj_name" type="hidden" value="' + PJ_NAME + '" />';

                  var addCalendarId = $('.add_calendar_id');

                  if (addCalendarId.length) {
                      addCalendarId.empty();
                  }
                  addCalendarId.append(input_pjnum);
                  addCalendarId.append(input_pjname);

                  table.find('tr>td:last-child').each(function () {
                      if ($(this).text() == PJ_NAME) {
                          $(this).parent('tr').css('background-color', "#e7e7e7e7");
                      } else {
                          $(this).parent('tr').css('background-color', "#ffffff");
                      }
                  });

                  // 선택된 값이 input 요소에 들어가도록 처리
                  $("#PJ_NAME").val(PJ_NAME);
                  $("#PJ_NAME").attr("data-pj-num", PJ_NUM);
                  $("#PJ_NUM").val(PJ_NUM);
                  $("#PJ_NUM").attr("data-pj-num", PJ_NUM);
                  
                  $("#MODPJ_NAME").val(PJ_NAME);
                  $("#MODPJ_NAME").attr("data-pj-num", PJ_NUM);
                  $("#MODPJ_NUM").val(PJ_NUM);
                  $("#MODPJ_NUM").attr("data-pj-num", PJ_NUM);
                  
                  
                  

                  // 모달 창 닫기
                 // $(".search_pj").css('display', "none");
              });
          }
      }); 
} 



function CLOSE_mODAL(){
      $(".search_pj").css('display', "none");
   }
//=======================================================================//
//1번모달에서 나머지 정보 입력후 최종 등록
function addSchedule() {
   var MEMBER_NUM = $('input[name="MEMBER_NUM"]').val();
   var PJ_NUM = parseInt($('input[name="PJ_NUM"]').val());
      var jobForm = $('#ScheduleForm');
   

    jobForm.attr('action', 'registCalendar?MEMBER_NUM=' + MEMBER_NUM);
    jobForm.attr('method', 'post');
    jobForm.submit();
    
    alert('등록이 완료되었습니다.');
    
   }
   
//=============================================================================//
//수정

// modi_Schedule function
function modi_Schedule() {
    var MEMBER_NUM = parseInt($('#MODMEMBER_NUM').val());
       var SC_NUM = SC_PK;
       var SC_NAME = $('#MODSC_NAME').val();
       var SC_STARTDATE = $('#MODSTART').val();
       var SC_ENDDATE = $('#MODEND').val();
       var SC_STATUS = parseInt($('#MODI_SC_STATUS').val());
       var PJ_NUM = parseInt($('#MODPJ_NUM').val());
       var SC_TYPE = $('#MODSC_TYPE').val();
       var SC_IMP = parseInt($('#MODSC_IMP').val());
       var SC_PLACE = $('#MODSC_PLACE').val();
       var SC_CONTENT = $('#MODSC_CONTENT').val();
       
       
       
       var data = {
           "member_NUM": MEMBER_NUM,
           "sc_NUM": SC_NUM,
           "sc_NAME": SC_NAME,
           "start": SC_STARTDATE,
           "end": SC_ENDDATE,
           "sc_STATUS": SC_STATUS,
           "pj_NUM": PJ_NUM,
           "sc_TYPE": SC_TYPE,
           "sc_IMP": SC_IMP,
           "sc_PLACE": SC_PLACE,
           "sc_CONTENT": SC_CONTENT
       };
       
    $.ajax({
        url: "<%=request.getContextPath()%>/calendar/modifyCalendar",
        type: "POST",
        data:JSON.stringify(data),
        contentType: "application/json",
        success: function (data) {
            alert('수정이 완료되었습니다.');
            console.log(data);
         //alert(data.sc_STARTDATE);
         //alert(data.START);
        },
        error: function (xhr) {
         console.log("콘솔: ",data);
            alert('수정에 실패했습니다.');
           // console.log(xhr.responseText);
        }
    });
}


//==============================================================================
//일정 삭제   
function deleteSchedule() {
     alert('일정을 삭제하시겠습니까?');
    var SC_NUM = SC_PK;
     //alert(SC_NUM);
    $.ajax({
       type: 'POST',
       url: '/calendar/removeCalendar',
       data: {
          sc_NUM: SC_NUM
       },
       dataType: 'json',
       success: function(data) {
          if (data.success) {
             info.event.remove();
             alert(data.msg);
          } else {
             if (data.msg) {
                alert(data.msg);
             }
          }
       },
         error: function(xhr, status, error) {
            alert('삭제가 완료되었습니다.');
            window.location.reload();
         }
      });
   }

//==============================================================================


</script>