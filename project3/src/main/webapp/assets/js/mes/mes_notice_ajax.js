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

