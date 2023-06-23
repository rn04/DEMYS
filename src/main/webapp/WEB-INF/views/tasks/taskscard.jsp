<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>    
<script type="text/x-handlebars-template"  id="taskcard-template" >
{{#each .}}
	<div id="{{tasks_NUM}}-TC" class="{{area tasks_STATUS }} {{cardborder tasks_ENDDATE }} card bg-base-100 shadow-2xl" style="display: flex; flex-direction: row; width: 90%; height: 120px; margin: 5px; background-color:#CFF4FF;">
		<div class="card-body" style="width: 90%; height: 100%; margin: 0;">
			<div class="card-title" style="margin: 0;">{{tasks_CONTENT }}</div>
			<div class="card-content flex">
				<div>종료일 : </div>
				<div class="tasks_ENDDATE">{{prettifyDate tasks_ENDDATE }}</div>
			</div>
		</div>
		<div class="sideWindow flex flex-col justify-evenly items-center" style="width: 10%; height: 100%;">
				<div class="badge badge-md badge-{{color tasks_IMP }}" ></div>
			<div class="dropdown dropdown-left dropdown-end">
				<label tabindex="0" class="btn btn-ghost btn-sm m-1"><i class="fa-solid fa-arrow-right-arrow-left"></i></label>
				<ul tabindex="0" class="dropdown-content menu shadow bg-base-100 w-52 h-20">
					<li class="h-9 {{todoHidden tasks_STATUS }}" style="font-size:11px; font-weight:bolder;"><a href="javascript:moveCard({{tasks_NUM }} , 1);">TO DO</a></li>
					<li class="h-9 {{inprogressHidden tasks_STATUS }}" style="font-size:11px; font-weight:bolder;"><a href="javascript:moveCard({{tasks_NUM }} , 2);">IN PROGRESS</a></li>
					<li class="h-9 {{doneHidden tasks_STATUS }}" style="font-size:11px; font-weight:bolder;"><a href="javascript:moveCard({{tasks_NUM }} , 3);">DONE</a></li>
				</ul>
			</div>
			<div class="sharefather dropdown dropdown-left dropdown-end">
				<label tabindex="0" class="btn btn-ghost btn-sm m-1"><i class="fa-solid fa-ellipsis-vertical"></i></label>
				<ul tabindex="0" class="dropdown-content menu shadow bg-base-100 w-20 h-50">
					<li class="h-9" style="font-size:11px; font-weight:bolder;"><a href="javascript:modOpen({{tasks_NUM }} );">수정</a></li>
					<li class="h-9" style="font-size:11px; font-weight:bolder;"><a href="javascript:removeCard({{tasks_NUM }});">삭제</a></li>
					<li class="h-9 {{shareHidden tasks_SHARE }}" style="font-size:11px; font-weight:bolder;"><a href="javascript:cardShare({{tasks_NUM }});">공유</a></li>
				</ul>
			</div>
		</div>
	</div>
{{/each }}
</script>

<script>
Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		var hour=('0' + dateObj.getHours()).slice(-2);
		var minute=('0' + dateObj.getMinutes()).slice(-2);
		return year+"년 "+month+"월 "+date+"일 "+hour+"시 "+minute+"분";
	},	
	
	"color":function(TASKS_IMP){
		switch(TASKS_IMP){
		case 1:
			return "error";
		case 2:
			return "warning";
		case 3:
			return "success";
		}
	},
	
	"area":function(TASKS_STATUS){
		switch(TASKS_STATUS){
		case 1:
			return "todocard";
		case 2:
			return "inprogresscard";
		case 3:
			return "donecard";
		}
	},
	
	"todoHidden":function(TASKS_STATUS){
		if(TASKS_STATUS==1)
			return "hidden";
		else
			return "";
	},
	
	"inprogressHidden":function(TASKS_STATUS){
		if(TASKS_STATUS==2)
			return "hidden";
		else
			return "";
	},
	
	"doneHidden":function(TASKS_STATUS){
		if(TASKS_STATUS==3)
			return "hidden";
		else
			return "";
	},
	
	"shareHidden":function(TASKS_SHARE){
		if(TASKS_SHARE==1)
			return "hidden";
		else
			return "";
		
	},
	
	"cardborder":function(TASKS_ENDDATE){
		var today = new Date().getTime();
		var endDate = new Date(TASKS_ENDDATE).getTime();
		if(today>=endDate){
			return "border-4 border-solid border-red-500";
		}else{
			return "";
		}
	}
});

</script>



<script>

function printData(dataMap,templateObject){
	var template=Handlebars.compile(templateObject.html());	
		$('.todocard').remove();
		$('.inprogresscard').remove();
		$('.donecard').remove();
	var todohtml = template(dataMap.todoList);
	var inprogresshtml = template(dataMap.inprogressList);
	var donehtml = template(dataMap.doneList);

	$('#todo-list').html(todohtml);
	$('#inprogress-list').html(inprogresshtml);
	$('#done-list').html(donehtml);
}

function showTaskList(){
	$.getJSON('<%=request.getContextPath()%>/tasks/cardlist',function(data){
		printData(data,$('#taskcard-template'));

		MemberPictureThumb('<%=request.getContextPath()%>');
		console.log(data)
	});
}

window.onload=function(){
	showTaskList();
	
}

function moveCard(tasks_NUM,tasks_STATUS){
	
	var sendData={
			"tasks_NUM":tasks_NUM,
			"tasks_STATUS":tasks_STATUS
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/tasks/moveCard",
		type:"post",
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(){
			showTaskList();
		},
		error:function(error){
			alert("실패했습니다.");
		}
	});
}

</script>

<script>
function regOpen(TASK_STATUS) {
    var modalPop = $('.reg_modal_wrap');
    var modalBg = $('.reg_modal_bg');
    
    $('#reg_tasks_STATUS').val(TASK_STATUS);

    $(modalPop).show();
    $(modalBg).show();

}


function regClose() {
	
	$('#reg_tasks_CONTENT').val("");
	$('#reg_tasks_IMP').val("");
	$('#reg_tasks_ENDDATE_date').val("");
	$('#reg_tasks_ENDDATE_time').val("18:00");
	$('#reg_tasks_SHARE').prop("checked", false);
	$('#reg_tasks_STATUS').val("");
   var modalPop = $('.reg_modal_wrap');
   var modalBg = $('.reg_modal_bg');

   $(modalPop).hide();
   $(modalBg).hide();

}
 
function modClose() {
	$('#mod_tasks_NUM').val("");
	$('#mod_tasks_CONTENT').val("");
	$('#mod_tasks_IMP').val("");
	$('#mod_tasks_ENDDATE_date').val("");
	$('#mod_tasks_ENDDATE_time').val("");
	$('#mod_tasks_SHARE').prop("checked", false);
	$('#mod_tasks_STATUS').val("");
	   var modalPop = $('.mod_modal_wrap');
	   var modalBg = $('.mod_modal_bg');

	   $(modalPop).hide();
	   $(modalBg).hide();

}
function reg_go(){
	var tasks_CONTENT=$('#reg_tasks_CONTENT').val();
	var tasks_IMP=parseInt($('#reg_tasks_IMP').val());
	var tasks_ENDDATE=$('#reg_tasks_ENDDATE_date').val()+" "+$('#reg_tasks_ENDDATE_time').val()+":00";
	var tasks_SHARE=$('#reg_tasks_SHARE').is(":checked") ? 1 : 0;
	var tasks_STATUS=parseInt($('#reg_tasks_STATUS').val());
	var member_NUM=parseInt($('#reg_member_NUM').val());
	
	var task={
			"tasks_CONTENT":tasks_CONTENT,
			"tasks_IMP":tasks_IMP,
			"string_ENDDATE":tasks_ENDDATE,
			"tasks_SHARE":tasks_SHARE,
			"tasks_STATUS":tasks_STATUS,
			"member_NUM":member_NUM
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/tasks/regist",
		type:"post",
		data:JSON.stringify(task),
		contentType:"application/json",
		success:function(){
			alert('일정이 등록되었습니다.');
			$('#reg_tasks_CONTENT').val("");
			$('#reg_tasks_IMP').val("");
			$('#reg_tasks_ENDDATE_date').val("");
			$('#reg_tasks_ENDDATE_time').val("18:00");
			$('#reg_tasks_SHARE').prop("checked", false);
			$('#reg_tasks_STATUS').val("");

			var modalPop = $('.reg_modal_wrap');
			var modalBg = $('.reg_modal_bg');
			
			$(modalPop).hide();
			$(modalBg).hide();
			
			showTaskList();
		},
		error:function(error){
			alert("실패했습니다.");
		}
	});
}

function modOpen(TASKS_NUM) {
    var data = {
        "tasks_NUM": TASKS_NUM
    };
    
    $.ajax({
        url: "/tasks/getTask",
        type: "post",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (sendData) {
            $('#mod_tasks_NUM').val(sendData.tasks_NUM);
            $('#mod_tasks_CONTENT').val(sendData.tasks_CONTENT);
            $('#mod_tasks_IMP').val(sendData.tasks_IMP);
            var result1 = sendData.string_ENDDATE.substr(0, 10);
            var result2 = sendData.string_ENDDATE.substr(11);
            $('#mod_tasks_ENDDATE_date').val(result1);
            $('#mod_tasks_ENDDATE_time').val(result2);
            if(sendData.tasks_SHARE==1){
            	$('#mod_tasks_SHARE').prop('checked',true);
            }
            else{
            	$('#mod_tasks_SHARE').prop('checked',false);
            }
            $('#mod_tasks_STATUS').val(sendData.tasks_STATUS);
            
            var modalPop = $('.mod_modal_wrap');
            var modalBg = $('.mod_modal_bg');
            
            $(modalPop).show();
            $(modalBg).show();
        },
        error: function (error) {
            alert("실패했습니다.");
        }
    });
}

function mod_go() {
	var tasks_NUM = $('#mod_tasks_NUM').val();
	var tasks_CONTENT = $('#mod_tasks_CONTENT').val();
	var tasks_IMP = parseInt($('#mod_tasks_IMP').val());
	var tasks_ENDDATE = $('#mod_tasks_ENDDATE_date').val() + " " + $('#mod_tasks_ENDDATE_time').val();
	var tasks_SHARE = $('#mod_tasks_SHARE').is(":checked") ? 1 : 0;
	var tasks_STATUS = parseInt($('#mod_tasks_STATUS').val());
	var member_NUM = parseInt($('#mod_member_NUM').val());

	var data = {
		"tasks_NUM": parseInt(tasks_NUM),
		"tasks_CONTENT": tasks_CONTENT,
		"tasks_IMP": tasks_IMP,
		"string_ENDDATE": tasks_ENDDATE,
		"tasks_SHARE": tasks_SHARE,
		"tasks_STATUS": tasks_STATUS,
		"member_NUM": member_NUM
	};

	$.ajax({
		url: "/tasks/modify",
		type: "post",
		data: JSON.stringify(data),
		contentType: "application/json",
		success: function () {
			alert('일정이 수정되었습니다.');
			$('#mod_tasks_NUM').val("");
			$('#mod_tasks_CONTENT').val("");
			$('#mod_tasks_IMP').val("");
			$('#mod_tasks_ENDDATE_date').val("");
			$('#mod_tasks_ENDDATE_time').val("");
			$('#mod_tasks_SHARE').prop("checked", false);
			$('#mod_tasks_STATUS').val("");

			var modalPop = $('.mod_modal_wrap');
			var modalBg = $('.mod_modal_bg');

			$(modalPop).hide();
			$(modalBg).hide();

			showTaskList();
		},
		error: function (error) {
			alert("실패했습니다.");
		}
	});
}

function removeCard(TASKS_NUM){

	if (!confirm("해당 일정을 정말 삭제하시겠습니까?")) {
		alert("취소되었습니다.");
	} else {
		var data = {
		        "tasks_NUM": TASKS_NUM
		    };
		    
		    $.ajax({
		        url: "/tasks/removeCard",
		        type: "post",
		        data: JSON.stringify(data),
		        contentType: "application/json",
		        success: function (TASKS_NUM) {
		        	$('#'+TASKS_NUM+'-TC').remove();
		        	showTaskList();
		        	alert("삭제되었습니다.");
		        },
		        error: function (error) {
		            alert("실패했습니다.");
		        }
		    });
	}
}

function cardShare(TASKS_NUM){
	if (!confirm("해당 일정을 캘린더에 공유하시겠습니까?")) {
		alert("취소되었습니다.");
	} else {
		var data = {
		        "tasks_NUM": TASKS_NUM,
		        "tasks_SHARE": 1
		    };
		    
		    $.ajax({
		        url: "/tasks/shareCard",
		        type: "post",
		        data: JSON.stringify(data),
		        contentType: "application/json",
		        success: function () {
		        	
		        	showTaskList();
		        	alert("공유되었습니다.");
		        },
		        error: function (error) {
		            alert("실패했습니다.");
		        }
		    });
	}
}

</script>