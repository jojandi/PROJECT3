document.querySelector("#check-username").addEventListener('click', function(){
    ajax();
})

let id = document.querySelector("#username");

function ajax() {

    console.log(id.value);

    let url = 'join';
    
    // ajax
    let xhr = new XMLHttpRequest();
    
    xhr.open("post", url);

    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 

    xhr.send( "username=" + id.value );

    xhr.onload = function(){
    	if(xhr.status===200){    //status = response 상태 코드 반환 : 200 정상응답
        console.log(xhr.responseText);
    	}
    }
    
    xhr.onload = function(){
    	if(xhr.status===200){    //status = response 상태 코드 반환 : 200 정상응답
        	console.log("controller" + xhr.responseText); // controller에서 보내준 거 받기
        	
        	let LO01 = document.querySelector("#LO01");
        	let LO02 = document.querySelector("#LO02");
        	
        	if(xhr.responseText == "code=LO01"){
				console.log("사용가능");
        		LO01.style.display="block";
        		LO02.style.display="none";
        	} else if(xhr.responseText == "code=LO02"){
				console.log("사용불가능");
        		LO01.style.display="none";
        		LO02.style.display="block";
        	}
    	}
    }
    
}