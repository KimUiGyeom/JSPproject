function CheckAddFood() {

	var foodID = document.getElementById("foodID");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var description = document.getElementById("description");
	var cal = document.getElementById("cal");

	if (!check(/^KUG[0-9]{2,9}$/, foodID, "[음식 코드]\nKUG와 숫자를 조합하여 3~10자까지 입력하세요\n첫 글자는 반드시 KUG로 시작하세요"))
		return false;

	if(name.value.length<2||name.value.length>10){
		alert("[음식명]\n최소 2자에서 최대 10자까지 입력하세요");
		name.focus();
		return false;
	}
	if(unitPrice.value.length==0||isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.focus();
		return false;
	}
	if(unitPrice.value<0){
		alert("[가격]\n음수를 입력할 수 없습니다.");
		unitPrice.focus();
		return false;
	}
	if(description.value.length<5){
		alert("[상세설명]\n최소 5자 이상 입력하세요");
		description.focus();
		return false;
	}
	if(cal.value.length==0||isNaN(cal.value)){
		alert("[칼로리]\n숫자만 입력하세요");
		cal.focus();
		return false;
	}
	if(cal.value<0){
		alert("[칼로리]\n음수를 입력할 수 없습니다.");
		cal.focus();
		return false;
	}
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	document.newFood.submit();
}
