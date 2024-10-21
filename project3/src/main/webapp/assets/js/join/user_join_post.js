function ajax(url, param, cb, method) {
	// javascript에서 false는 null, undefined, 0
	// true는 false가 아닌 것으로 정의되어 있음
	if(!method) method = "get";
	
	const xhr = new XMLHttpRequest();
	xhr.open(method, url);
	xhr.setRequestHeader("Content-Type","application/json"); // json 보내줄 거임
	xhr.send(JSON.stringify(param));
	console.log(JSON.stringify(param));
	if(typeof cb == "function") {
		xhr.onload = function(){
			cb(xhr.responseText)
		}
	}
}
document.querySelector("#check_username").addEventListener("click", function(){
	const user_id = document.querySelector("#user_id").value;
	
	const data = {
			"user_id" : user_id
	}
	ajax("check_username", data, function(result) {
        if (result === "exists") {
            alert("사용할 수 없는 아이디입니다. 이미 존재하는 아이디입니다.");
            document.querySelector("#user_id").value = "";
        } else if (result === "available") {
            alert("사용 가능한 아이디입니다.");
        } else {
            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
        }
    }, "post");
})