<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 제이쿼리 -->

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body {
   margin-top: 5px;
   width: 100%;
   height: calc(930px - 65px - 63px);
   padding: 2px;
}

/* progress bar */

.complete-con, .inProgress-con, .onHold-con, .expected-con{
border:1px solid #e7e7e7;
}

.complete-con, .inProgress-con{
   margin:0 3px 0 3px;
}
.conainer {
  width: 270px; 
  margin:20px;
  height:120px;
/*   padding-left:10px; */
}

.circle_percent {
  font-size:200px; 
  width:.6em; height:.6em; 
  position: relative; 
  background: #eee; 
  border-radius:50%; 
  overflow:hidden; 
  display:inline-block; 

}

.circle_inner {
  position: absolute; 
  left: 0; 
  top: 0; 
  width: .6em; 
  height: .6em; 
  clip:rect(0 .6em .6em .3em);
}



.round_per {
  position: absolute; 
  left: 0; 
  top: 0; 
  width: .6em; 
  height: .6em; 
  background:red;
  clip:rect(0 .6em .6em .3em); 
  transform:rotate(180deg); 
  transition:1.05s;
}

.chart-yellow .round_per, .chart-yellow .percent_more:after {
  background:yellow;
}
.chart-red .round_per, .chart-red .percent_more:after {
  background:reds;
}
.chart-blue .round_per, .chart-blue .percent_more:after {
  background:blue;
}
.chart-green .round_per, .chart-green .percent_more:after {
  background:green;
}


.percent_more .circle_inner {
  clip:rect(0 .3em .6em 0em);
}

.percent_more:after {
  position: absolute; 
  left: .3em; 
  top:0em; 
  background:red;
  right: 0; 
  bottom: 0; 
  content:'';
}

.circle_inbox {
  position: absolute; 
  top: 10px; 
  left: 10px; 
  right: 10px; 
  bottom: 10px; 
  background: #fff; 
  z-index:3; 
  border-radius: 50%;
}

.percent_text {
  position: absolute; 
  font-size: 36px;
  left: 50%; 
  top: 50%; 
  transform: translate(-50%,-50%); 
  z-index: 3;
}

.desc{
 padding-left:30px;
}
.progress-title{
   font-size:2rem;
   padding-bottom:8px;
}

.progress-count, .progress-percent{
   font-size:19px;
}
html {
   font-size: 16px;
   font-family: Arial, Helvetica, sans-serif;
}

.k-gantt-treelist span>strong {
   background: pink;
}

#gantt{
   margin-top:8px !important;
}

</style>

<div class="">
      <div class="">
            <!-- project작업공간 -->
            <div class="">
                  <!-- 총 프로젝트 진행률 시작-->
                  <div class="project-con w-full flex row" style="height: 160px;">
                        <div class="project-card col-sm" style="background-color: #e6f2fc; width: 20%; height: inherit;">
                              <span class="flex" style="padding: 40px 7px; flex-direction: column;">
                                    <span style="font-size: 18px; color: #4d4d4d;text-align:center;">
                                          <b>프로젝트 <br/> 진행률</b>
                                    </span>
                                    <span style="font-size: 20px; color: #046fc7;text-align:center;">
                                          <b>37.5%</b>
                                    </span>
                              </span>
                        </div>
                        <!-- 총 프로젝트 진행률 끝-->


                        <!-- 프로젝트 프로그래스바 부분 시작-->
                        <!-- 완료 -->
                        
                         <c:forEach var="unitwork" items="${unitWorkList}">
                      <c:if test="${unitwork.UW_STATUS == 1}">
                          <c:set var="sum" value="${sum + unitwork.UW_PERCENT}" />
                          <c:set var="count" value="${count + 1}" />
                      </c:if>
                  </c:forEach>
                        <div class="complete-con">
                              <div class="conainer flex chart-green">
                                    <div class="circle_percent" data-percent=30>
                                          <div class="circle_inner">
                                                <div class="round_per round1"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>완료</b>
                                          </p>
                                          <c:set var="average" value="${(count > 0) ? (sum / count) : 0}" />
                                         <p class="desc progress-percent">진행률: ${Math.ceil(average * 100)}%</p>



                                    </div>
                              </div>

                        </div>
                        <!-- 진행중 -->
                        <c:forEach var="unitwork" items="${unitWorkList}">
                      <c:if test="${unitwork.UW_STATUS == 2}">
                          <c:set var="sum" value="${sum + unitwork.UW_PERCENT}" />
                          <c:set var="count" value="${count + 1}" />
                      </c:if>
                  </c:forEach>
                        <div class="inProgress-con">
                              <div class="conainer flex chart-blue">
                                    <div class="circle_percent" data-percent=30>
                                          <div class="circle_inner">
                                                <div class="round_per round2"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>진행중</b>
                                          </p>
                              <c:set var="average" value="${(count > 0) ? (sum / count) : 0}" />
                                      <p class="desc progress-percent">진행률: ${Math.ceil(average * 100)}%</p>


                                    </div>
                              </div>
                        </div>

                        <!-- 지연 -->
                        <c:forEach var="unitwork" items="${unitWorkList}">
                      <c:if test="${unitwork.UW_STATUS == 3}">
                          <c:set var="sum" value="${sum + unitwork.UW_PERCENT}" />
                          <c:set var="count" value="${count + 1}" />
                      </c:if>
                  </c:forEach>
                        <div class="inProgress-con">
                              <div class="conainer flex chart-yellow">
                                    <div class="circle_percent" data-percent=45>
                                          <div class="circle_inner">
                                                <div class="round_per round2"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>보류</b>
                                          </p>
                              <c:set var="average" value="${(count > 0) ? (sum / count) : 0}" />
                                       <p class="desc progress-percent">진행률: ${Math.ceil(average * 100)}%</p>


                                    </div>
                              </div>
                        </div>

                        <!-- 예정 -->
                       <c:forEach var="unitwork" items="${unitWorkList}">
                      <c:if test="${unitwork.UW_STATUS == 4}">
                          <c:set var="sum" value="${sum + unitwork.UW_PERCENT}" />
                          <c:set var="count" value="${count + 1}" />
                      </c:if>
                  </c:forEach>
                        <div class="inProgress-con">
                              <div class="conainer flex chart-red">
                                    <div class="circle_percent" data-percent=45>
                                          <div class="circle_inner">
                                                <div class="round_per round2"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>지연</b>
                                          </p>
                              <c:set var="average" value="${(count > 0) ? (sum / count) : 0}" />
                                      <p class="desc progress-percent">진행률: ${Math.ceil(average * 100)}%</p>


                                    </div>
                              </div>
                        </div>
                        <!-- 프로젝트 프로그래스바 부분 끝-->



                  </div>
               
                  <!-- gantt chart markup -->
                  <div id="gantt"></div>
                  <!-- gantt chart markup -->

            </div>

      </div>
</div>

      <script>
      var PJ_NUM = PJ_NUM;

          var tasksDataSource = new kendo.data.GanttDataSource({
            transport: {
               read: {
                url:"/project/unitworkPA?PJ_NUM=" + PJ_NUM,
                dataType: "json"
              },
              update: {
                url:"/project/unitwork/update",
                dataType: "json"
              },
              destroy: {
                url:"/project/unitwork/destroy",
                dataType: "json"
              },
              create: {
                url:"/project/unitwork/create",
                dataType: "json"
              }
            },
            schema : {
            model : {
               id : "num",
               fields : {
                  num : {
                     from : "uw_NUM",
                     type : "int"
                  },
                  title : {
                     from : "uw_NAME",
                     type : "String"
                  },
                  start : {
                     from : "uw_STARTDATE",
                     type : "date"
                  },
                  end : {
                     from : "uw_ENDDATE",
                     type : "date"
                  },
                  percentComplete : {
                     from : "uw_PERCENT",
                     type : "int"
                  },
                  status : {
                     from : "uw_STATUS",
                     type : "int"
                  },
                  note : {
                     from : "uw_NOTE",
                     type : "String"
                  },
                  member : {
                     from : "member_NAME",
                     type : "String"
                  },
                  pjNum : {
                     from : "pj_NUM",
                     type : "int"
                  },
                  summary : {
                     from : "Summary",
                     type : "boolean",
                     defaultValue : true
                  },
                  expanded : {
                     from : "Expanded",
                     type : "boolean",
                     defaultValue : true
                  }
               }
            }
         }
      });

          var dependenciesDataSource = new kendo.data.GanttDependencyDataSource({
            transport: {
               read: {
                    url:"/project/unitworkPA?PJ_NUM=" + PJ_NUM,
                    dataType: "json"
                  },
                   update: {
                   url:"/project/unitwork/update",
                  dataType: "json"
                },
                destroy: {
                  url:"/project/unitwork/destroy",
                  dataType: "json"
                },
                create: {
                  url: "/project/unitwork/create",
                  dataType: "json"
                }
            },
            schema : {
            model : {
               id : "num",
               fields : {
                  num : {
                     from : "uw_NUM",
                     type : "int"
                  },
                  title : {
                     from : "uw_NAME",
                     type : "String"
                  },
                  start : {
                     from : "uw_STARTDATE",
                     type : "date"
                  },
                  end : {
                     from : "uw_ENDDATE",
                     type : "date"
                  },
                  percentComplete : {
                     from : "uw_PERCENT",
                     type : "int"
                  },
                  status : {
                     from : "uw_STATUS",
                     type : "int"
                  },
                  note : {
                     from : "uw_NOTE",
                     type : "String"
                  },
                  member : {
                     from : "member_NAME",
                     type : "String"
                  },
                  pjNum : {
                     from : "pj_NUM",
                     type : "int"
                  },
                  summary : {
                     from : "Summary",
                     type : "boolean",
                     defaultValue : true
                  },
                  expanded : {
                     from : "Expanded",
                     type : "boolean",
                     defaultValue : true
                  }
               }
            }
         }
      });

          var gantt = $("#gantt").kendoGantt({
            dataSource: tasksDataSource,
            dependencies: dependenciesDataSource,
            views: [
              "week",
              "month",
              { type: "year", selected: true }
            ],
            columns : [ 
            {field : "num",title : "번호",width : 50,sortable : true}, 
            {field : "title",title : "단위업무명",width : 300,editable : true,sortable : true}, 
            {field : "member",title : "담당자",width : 100}, 
            {field : "start",title : "시작일",format : "{0:yyyy-MM-dd}",width : 130,editable : true}, 
            {field : "end",title : "종료일",format : "{0:yyyy-MM-dd}",width : 130,editable : true}, 
            {field : "percentComplete",title : "진행률",format : "{0:0.##%}",width : 65,editable : true},
            {field : "note",title : "비고",width : 300,editable : true} 
            ],
            height: 628,
            showWorkHours: true,
            showWorkDays: true,
            snap: true,
            
            add: addTask,
            edit : editTask,
            remove : removeTask
          }).data("kendoGantt");
 
         
           function addTask(e) {
                 console.log("Add", e.task.title);
               };
          
         function editTask(e) {
            var clickHandler = function(e) {

               console.log("Save button is clicked");

               $(this).off("click", clickHandler);
               UNITWORK_go();
            };

            $(e.container).find(".k-gantt-update")
                  .on("click", clickHandler);
         };
         

           function removeTask(e) {
                $(document).on("click", ".k-gantt-delete", function(e) {
                  e.preventDefault();
                  console.log("Remove button is clicked");
                  UNITWORK_go();
                });
              }

         
         $(document).keyup(function(event) {
            if (window.event.keyCode == 13) {   
               UNITWORK_go();
            }
         });
         
          $(document).bind("kendo:skinChange", function() {
            gantt.refresh();
          });
          
    

      </script>
  

<%@ include file="../common/foot.jsp"%>