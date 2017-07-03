<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('roadAddress').value = fullRoadAddr;
				document.getElementById('jibunAddress').value = data.jibunAddress;

				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					//예상되는 도로명 주소에 조합형 주소를 추가한다.
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

				} else {
					document.getElementById('guide').innerHTML = '';
				}
			}
		}).open();
	}
</script>
</head>
<body>
	<form action="/shop/member/join_action" method="post">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" id="mem_id" name="mem_id"></td>
		<tr>
				<td>비밀번호 :</td>
				<td><input type="password" id="mem_passwd1" name="mem_passwd1"></td>
			</tr>
			<tr>
				<td>비밀번호 확인 :</td>
				<td><input type="password" id="mem_passwd2" name="mem_passwd2"></td>
			</tr>
			<tr>
				<td>핸드폰 번호 :</td>
				<td><input type="text" id="mem_phone" name="mem_phone"></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" id="mem_email" name="mem_email"></td>
			</tr>
			<tr>
				<td>생년월일 :</td>
				<td><input type="date" id="mem_birth" name="mem_birth"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="chk_admin"
					value="seller">판매자 <input type="radio" name="chk_admin"
					value="buyer" checked="checked">구매자</td>
			</tr>

			<tr>
				<td><input type="text" id="postcode"  name="postcode"placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
					<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
					 <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소"> <span id="guide"
					style="color: #999"></span></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="가입"></td>
			</tr>
		</table>

	</form>
</body>

</html>