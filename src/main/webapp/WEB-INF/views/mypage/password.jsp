<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
body{
	margin:0;
	padding:0;
}
</style>

				<div class="flex" style="background-color: #153A66;">
						<div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 50px;">
								<div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">
										&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
						</div>
				</div>

				<div style="position: absolute; top: 35%; left: 50%; transform: translate(-50%, -50%);">
						<i class="fas fa-light fa-triangle-exclamation" style="font-size: 5rem;"></i>
				</div>
				
				<form action="../mypage/modify" method="post">
				
				<div>
						<input type="text" placeholder="비밀번호를 확인하세요" class="input"
								style="border: 2px solid #153A66; width: 400px; height: 50px; position: absolute; top: 60%; left: 50%; transform: translate(-50%, -50%);" />
				</div>

				<div style="display: flex; position: absolute; top: 80%; left: 50%; transform: translate(-50%, -50%);">
						<button type="submit"
								style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px; margin-right: 50px;">확인</button>
						<button id="modal_close_btn"
								style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">취소</button>
				</div>

				</form>
