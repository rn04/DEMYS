<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="common/mainhead.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" rel="stylesheet" type='text/css'>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css"   rel="stylesheet" type='text/css'>


		<div style="width: 100%; height: 955px;">
			<div class="flex justify-center items-center" style="width: 100%; height:30%;">
				<div class="flex items-center" style="width: 99%; height:91%; border: 2px solid gray;">
					<div class="flex-col flex justify-center items-center" style="width: 33%; height:85%; border-right: 2px solid gray;">
						<i class="fa-sharp fa-solid fa-pen-to-square" style="font-size:3rem;">총프로젝트</i>
						<div>
							<span style="font-size:2rem; color:red;">13</span>
							<span style="font-size:1.5rem;">건</span>
						</div>
						<div>
							<i class="fa-solid fa-compact-disc" style="color:green;"><span style="color:black;">완료 0 건</span></i>
							<i class="fa-solid fa-compact-disc" style="color:blue;"><span style="color:black;">진행중 12 건</span></i>
							<i class="fa-solid fa-compact-disc" style="color:gold;"><span style="color:black;">지연 0 건</span></i>
							<i class="fa-solid fa-compact-disc" style="color:red;"><span style="color:black;">실패 1 건</span></i>
						</div>
					</div>
					<div class="flex-col flex justify-center items-center" style="width: 34%; height:85%; border-right: 2px solid gray;">
						<i class="fa-sharp fa-solid fa-bars-progress">이번달 종료되는 프로젝트</i>
						<br/>
						<table style="width:90%;">
							<c:forEach begin="0" end="4" step="1">
								<tr>
									<td><div class="badge badge-outline badge-warning gap-2">D-1</div></td>
									<td><i class="fa-solid fa-flag" style="color:red;"></i></td>
									<td>MTQ 프로젝트관리시스템</td>
									<td>진행률</td>
									<td> | </td>
									<td>98%</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="flex-col flex justify-center items-center" style="width: 33%; height:85%; ">
						<i class="fa-regular fa-clock">실시간 이슈</i>
						<br/>
						<table style="width:90%;">
							<c:forEach begin="0" end="4" step="1">
								<tr>
									<td style="display:flex;width:30px;">
										<i class="fa-regular fa-message fa-flip-horizontal" style="font-size:23px;position:relative;"></i>
										<div style="z-index:-1; position:absolute; line-height:17px; font-weight:bolder; color:red;">&nbsp;2</div>
									</td>
									<td>캘린더 구현 ERORR 500 이슈</td>
									<td>김다예</td>
									<td> | </td>
									<td>캘린더 특정날짜에 데이..</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<hr/>
			<div class="flex justify-between" style="width: 100%; height:5%;">
				<div class="flex justify-start items-center">
					&nbsp;&nbsp;<a href="#"><span style=" margin:5px; border-right: 2px solid gray; font-size:15px;">진행현황&nbsp;&nbsp;</span></a>
					<a href="#"><span style="font-size:15px; margin:5px;">이슈현황</span></a>
				</div>
				<div class="flex justify-end items-center">
					<div style="font-size:15px;">상태</div>
						<select class="select select-bordered select-sm w-full max-w-xs" style="width:150px; height:15px; margin:5px;">
						  <option disabled selected>전체프로젝트</option>
						  <option>전체프로젝트</option>
						  <option>담당프로젝트</option>
						</select>
					
					<div style="font-size:15px;">중요도</div>
						<select class="select select-bordered select-sm w-full max-w-xs" style="width:100px; height:15px; margin:5px;">
						  <option disabled selected>전체</option>
						  <option>전체</option>
						  <option>중요</option>
						  <option>보통</option>
						  <option>낮음</option>
						</select>
					
					<div style="font-size:15px;">기간</div>
						<select class="select select-bordered select-sm w-full max-w-xs" style="width:150px; height:15px; margin:5px;">
						  <option disabled selected>마감임박순</option>
						  <option>마감임박순</option>
						  <option>등록일자순</option>
						</select>
				</div>
			</div>
			<hr/>
			<div style="width: 100%; height:4%;">
			
			</div>
			<hr/>
			<div class="flex justify-around" style="width: 100%; height: 59.5%;">

	<div style="width: 32%; height: 100%; border: 1px solid gray; margin-top: 5px; background-color: #e7e7e7;">
		<div class="title" style="margin: 5px; height: 5%;">
			<span>&nbsp;&nbsp;중요 </span>
			<span style="font-weight: bolder">10 </span>
		</div>
		<div class="content flex flex-col items-start" style="height: 95%; margin-left: 5px; overflow: auto;">
			<c:forEach begin="0" end="2" step="1">
				<div class="card card-side bg-base-100 shadow-xl" style="width: 90%; height: 30%; margin: 5px;">
					<figure style="background-color: red; width: 3%; height: 100%;"></figure>
					<div class="card-body" style="width: 97%; height: 100%; margin: 0;">
						<div class="card-title flex justify-between" style="margin: 0;">
							<div class="flex items-start" style="margin: 0;">
								<i class="fa-solid fa-flag" style="color: red;"></i>
								캘린더 구현 ERORR 500 이슈
								<div class="flex" style="position: relative;">
									<i class="fa-regular fa-message" style="font-size: 23px; margin: 0;"></i>
									<div style="z-index: 1; bottom: 1%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;2</div>
								</div>
							</div>
							<div style="margin: 0; padding: 0;">
								<div class="badge badge-success gap-2" style="font-size: 12px; margin: 0;">진행중</div>
							</div>
						</div>
						<div style="font-size: 11px; text-color: gray;">(주)MTQ | MTQ 프로젝트</div>
						<div class="flex">
							<div>
								<img class="w-9 rounded-full" src="/resource/img/imja.jpg" />
							</div>
							<div>이주헌&nbsp;&nbsp;</div>
							<div class="badge badge-outline badge-error gap-2" style="font-weight: bolder; font-size: 12px; margin: 0;">08.18</div>
						</div>
						<div class="flex">
							<c:forEach begin="0" end="4" step="1">
								<div class="w-12 h-5 rounded" style="font-weight: bolder; font-size: 12px; border: 1px solid gray; background-color: #e7e7e7; text-align: center;">김원미</div>&nbsp;
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div style="width: 32%; height: 100%; border: 1px solid gray; margin-top: 5px; background-color: #e7e7e7;">
		<div class="title" style="margin: 5px; height: 5%;">
			<span>&nbsp;&nbsp;보통 </span>
			<span style="font-weight: bolder">10 </span>
		</div>
		<div class="content flex flex-col items-start" style="height: 95%; margin-left: 5px; overflow: auto;">
			<c:forEach begin="0" end="2" step="1">
				<div class="card card-side bg-base-100 shadow-xl" style="width: 90%; height: 30%; margin: 5px;">
					<figure style="background-color: orange; width: 3%; height: 100%;"></figure>
					<div class="card-body" style="width: 97%; height: 100%; margin: 0;">
						<div class="card-title flex justify-between" style="margin: 0;">
							<div class="flex items-start" style="margin: 0;">
								<i class="fa-solid fa-flag" style="color: red;"></i>
								캘린더 구현 ERORR 500 이슈
								<div class="flex" style="position: relative;">
									<i class="fa-regular fa-message" style="font-size: 23px; margin: 0;"></i>
									<div style="z-index: 1; bottom: 1%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;2</div>
								</div>
							</div>
							<div style="margin: 0; padding: 0;">
								<div class="badge badge-info gap-2" style="font-size: 12px; margin: 0;">완료</div>
							</div>
						</div>
						<div style="font-size: 11px; text-color: gray;">(주)MTQ | MTQ 프로젝트</div>
						<div class="flex">
							<div>
								<img class="w-9 rounded-full" src="/resource/img/imja.jpg" />
							</div>
							<div>이주헌&nbsp;&nbsp;</div>
							<div class="badge badge-outline badge-error gap-2" style="font-weight: bolder; font-size: 12px; margin: 0;">08.18</div>
						</div>
						<div class="flex">
							<c:forEach begin="0" end="4" step="1">
								<div class="w-12 h-5 rounded" style="font-weight: bolder; font-size: 12px; border: 1px solid gray; background-color: #e7e7e7; text-align: center;">김원미</div>&nbsp;
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div style="width: 32%; height: 100%; border: 1px solid gray; margin-top: 5px; background-color: #e7e7e7;">
		<div class="title" style="margin: 5px; height: 5%;">
			<span>&nbsp;&nbsp;낮음 </span>
			<span style="font-weight: bolder">10 </span>
		</div>
		<div class="content flex flex-col items-start" style="height: 95%; margin-left: 5px; overflow: auto;">
			<c:forEach begin="0" end="2" step="1">
				<div class="card card-side bg-base-100 shadow-xl" style="width: 90%; height: 30%; margin: 5px;">
					<figure style="background-color: gold; width: 3%; height: 100%;"></figure>
					<div class="card-body" style="width: 97%; height: 100%; margin: 0;">
						<div class="card-title flex justify-between" style="margin: 0;">
							<div class="flex items-start" style="margin: 0;">
								<i class="fa-solid fa-flag" style="color: red;"></i>
								캘린더 구현 ERORR 500 이슈
								<div class="flex" style="position: relative;">
									<i class="fa-regular fa-message" style="font-size: 23px; margin: 0;"></i>
									<div style="z-index: 1; bottom: 1%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;2</div>
								</div>
							</div>
							<div style="margin: 0; padding: 0;">
								<div class="badge badge-warning gap-2" style="font-size: 12px; margin: 0;">중지</div>
							</div>
						</div>
						<div style="font-size: 11px; text-color: gray;">(주)MTQ | MTQ 프로젝트</div>
						<div class="flex">
							<div>
								<img class="w-9 rounded-full" src="/resource/img/imja.jpg" />
							</div>
							<div>이주헌&nbsp;&nbsp;</div>
							<div class="badge badge-outline badge-error gap-2" style="font-weight: bolder; font-size: 12px; margin: 0;">08.18</div>
						</div>
						<div class="flex">
							<c:forEach begin="0" end="4" step="1">
								<div class="w-12 h-5 rounded" style="font-weight: bolder; font-size: 12px; border: 1px solid gray; background-color: #e7e7e7; text-align: center;">김원미</div>&nbsp;
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="common/foot.jsp"%>