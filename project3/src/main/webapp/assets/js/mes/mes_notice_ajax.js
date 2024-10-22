
window.addEventListener("load", function(){
		getList()
	})


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
	function getList(){
		ajax("listNoti", null, drawList, "get")
	}

	function drawList(text) {
		try{
			const listNoti = JSON.parse(text);
			
			let html = "";
			
			if(listNoti.length == 0){
				html = "<tr><td colspan='7'>자료가 없습니다</td></tr>"
			} else {
				for(let i=0; i<listNoti.length; i++){
					
					
					html += `
							<tr>
								<td class="cm_name">
									${listNoti[i].emp_name}
								</td>
								<td class="cm_content">
									${listNoti[i].cm_content}
								</td>
							</tr>
						`;
					
				}
					
			}
			document.querySelector("#list").innerHTML = html;
		}catch(e){
			console.log("ERROR : drawList", e);
		}
	}
