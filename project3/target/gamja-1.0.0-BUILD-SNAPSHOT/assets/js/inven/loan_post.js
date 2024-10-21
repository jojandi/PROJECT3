let submit = document.querySelectorAll(".submit")

for(let i = 0; i<submit.length; i++){
    submit[i].addEventListener('click', function(){
        ajax(i);
    })
}

let code = document.querySelectorAll(".code");
let select = document.querySelectorAll(".select");
let seq = document.querySelectorAll(".seq");

function ajax(i) {

	console.log("code : " + code[i].value);
    console.log("select : " + select[i].value);
    console.log("seq : " + seq[i].value);

    let url = 'loan';
    
    // ajax
    let xhr = new XMLHttpRequest();
    
    xhr.open("post", url);

    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 

    xhr.send( "ing=" + select[i].value + "&seq=" + seq[i].value + "&code=" + code[i].value);
    
    xhr.onload = function(){
		alert("수정되었습니다. ")
		location.href="loan"; // spring으로 옮길 때 파라미터값 가져와서 링크에 넣어주기 -> 현재페이지 새로고침 효과
    }
}