<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




</head>
<style>
body {
   margin:0;
   padding:0;
}
.navbar-box {
	background-color: #153A66;
}
.navbar-content {
	width: 100%; 
	padding: 0px; 
	min-height: 1rem; 
	height: 50px; 
	line-height:50px;
} 
.navbar-logo {
	color:#ffffff;
	font-weight: bold;
	font-size: 1.5rem;
	padding-left:20px;
}
.register-card-body {
	height : 500px;
}
.input-group {
	width: 100%;
    display: flex;
    justify-content: center;
    margin : 10px auto;
}
.input-group2 {
	 display: flex;
	 float:left;
}
.btn-se {
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:30px;
}
.btn-se:hover {
	background-color:#016FA0;
}
.mailbox-attachment-icon {
	border: 1px solid pink; 
	height: 150px; 
	width: 150px; 
	margin: 0 auto;
	border-radius: 70%;
}
.form-horizontal {
	width: 80%;
	margin: 0 auto;
	border : 1px solid green;
}
option{
	padding-top:10px;
	margin-top:20px;
}
</style>
<body>
	<div class="regist_content">
		<div class="navbar-box">
			<div class="navbar-content">
				<div class="navbar-logo">DEMYS PMS</div>
			</div>	
		</div>
	<!-- form start -->
			<div class="card">
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="regist" method="post">
							 <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
	                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
	                            </div>
	                        </div>
	
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-title">일정명</label>
	                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
	                                    required="required" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-start">시작</label>
	                                <input class="inputModal" type="date" name="edit-start" id="edit-start" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-end">끝</label>
	                                <input class="inputModal" type="date" name="edit-end" id="edit-end" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-type">구분</label>
	                                <select class="inputModal" name="edit-type" id="edit-type">
	                                    <option value="프로젝트">프로젝트</option>
	                                    <option value="개인업무">개인업무</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-sc_status">일정구분</label>
	                                <select class="inputModal" name="sc_status" id="edit-sc_status">
	                                    <option value="내부회의" style="color:#D25565;">내부회의</option>
	                                    <option value="외부회의" style="color:#9775fa;">외부회의</option>
	                                    <option value="출장" style="color:#ffa94d;">출장</option>
	                                    <option value="휴가" style="color:#74c0fc;">휴가</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-desc">내용</label>
	                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
	                                    id="edit-desc"></textarea>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="modal-footer modalBtnContainer-addEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
	                    </div>
	                    <div class="modal-footer modalBtnContainer-modifyEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
	                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
	                    </div>


				
					</form>
				</div>
				<!-- register-card-body -->
			</div>
		</div>

	<!-- /.content -->

<!-- /.content-wrapper -->


<script>	

	
	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
</script>

</body>
</html>