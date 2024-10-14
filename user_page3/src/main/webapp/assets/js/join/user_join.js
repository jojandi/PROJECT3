document.getElementById("check-username").addEventListener("click", function() {
    const username = document.getElementById("username").value;
    if (username === "") {
        alert("아이디를 입력하세요.");
        document.getElementById("username").focus();
    // } else {    
    // 	idChk();
    }
});

// function idChk(){
// 	let id = document.getElementById("username").value;
// 	console.log("id : " + id);
// 	if(id_impass == "LO02"){
// 		id = "";
// 	}
// }


document.getElementById("gaip_1").addEventListener("click", function(e) {
    e.preventDefault();
    
    const name = document.getElementById("name_").value;
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirm-password").value;
    const phone = document.getElementById("phone").value;
    const emailUser = document.getElementById("email-user").value;
    const emailDomain = document.getElementById("email-domain").value;
    const addressnum = document.getElementById("addressnum").value;
    const address = document.getElementById("address").value;
    const addressinfo = document.getElementById("addressinfo").value;

    console.log("이름 :" + name)
    console.log("아이디 :" + username)
    console.log("비번 :" + password)
    console.log("비번 확인 :" + confirmPassword)
    console.log("전화번호 :" + phone)
    console.log("우편주소 :" + addressnum)
    console.log("기본주소 :" + address)
    console.log("상세주소 :" + addressinfo)
    console.log("이메일 :" + emailUser)
    console.log("이메일 도매인 :" + emailDomain)
    

    if (!name || !username || !password || !confirmPassword || !phone || !emailUser || !emailDomain 
        || !addressnum || !address || !addressinfo) {
        alert("모든 필드를 입력하세요.");
        return;
    }

    if (password !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    alert("회원가입이 완료되었습니다.");
    form.submit();
});

function msg(){

    let idmsg = document.querySelector("#username-message");
    let pw = document.querySelector("#password");
    
    pw.addEventListener("focus", function(){
        let username = document.querySelector("#username").value;
        // console.log("아이디 : " + username)
        if(username == ""){
            console.log(username);
            idmsg.style.display="block";
        }
    })
    

    let conpw = document.getElementById("confirm-password");
    let pwmsg = document.querySelector("#password-message");
    
    conpw.addEventListener("focus", function(){
        let password = document.getElementById("password").value;
        // console.log("비번 : " + password)
        if(password == ""){
            pwmsg.style.display="block";
        }
    })
}

msg();



