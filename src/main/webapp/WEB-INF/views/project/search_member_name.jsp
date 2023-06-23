<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

 <!-- 모달창-프로젝트메니저  -->
    <div id="modal_2" class="modal_member_name">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="cts-title">
					<span>프로젝트 매니저</span>
				</div>
				<div class="cts-title-sub">* 담당매니저를 선택하세요.</div>
				<div class="p-modal-serach">
					<select class="select select-bordered p-cts-select">
						  <option disabled selected>선택 </option>
						  <option>매니저명</option>
						  <option>담당부서</option>
					</select>
					<div class="p-modal-searchbar">
						<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input"/>
						<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
					</div>
				</div>
				<div class="cts-serch-list">
					<table border="1">
						<c:forEach var="member" items="${member }" >
							<tr>
								<td>${member.MEMBER_NAME }</td>
								<td>${member.MEMBER_DEP }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt">등록</button>
	                  <button id="modal_close_btn2" class="p-regi-modal-bt">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>	
