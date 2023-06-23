<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>계정 등록 완료</title>
  <script>
    window.onload = function() {
      // 오픈 윈도우를 닫고 로그인 페이지로 이동
      window.close();
      window.opener.location.href = "/member/login";
    }
  </script>
</head>
<body>
	<div class="regist_content">
		<div class="navbar-box">
			<div class="navbar-content">
				<div class="navbar-logo">DEMYS PMS</div>
			</div>	
		</div>
		</div>
  <h1>계정 등록이 완료되었습니다.</h1>
  <p>창이 자동으로 닫힙니다. 로그인 페이지로 이동하시려면 <a href="/member/login">여기</a>를 클릭하세요.</p>
</body>
</html>