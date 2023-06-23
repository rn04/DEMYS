<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
var result = confirm("댓글을 삭제하시겠습니까?");

if(result == true) {
   alert("댓글을 삭제하였습니다.");
   history.go(-1);
   history.go();
} else {
   history.go(-1);
}
</script>
