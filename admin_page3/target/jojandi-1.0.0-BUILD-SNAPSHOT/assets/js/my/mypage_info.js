
let pwBnt = document.querySelector("#pwBnt");
let pwerror = document.querySelector("#pwerror");
let pwIn = document.querySelector("#pwIn");

let info1 = document.querySelector("#info1");
let info2 = document.querySelector("#info2");

let out = document.querySelector("#out")
let realout = document.querySelector("#realout")
let bookout = document.querySelector("#bookout")

function logout(){
    out.addEventListener('click', function(){
        let c = confirm("로그아웃 하시겠습니까?");

        if(c){
            window.location.href="main"
        } else{
            window.location.href="mypage_info"
        }
    })

    realout.addEventListener('click', function(){
        let c = confirm("회원 탈퇴 하시겠습니까?");
        if(c){
            
	        alert("탈퇴되었습니다. ")
	        window.location.href="main"
                    
        } else{
            window.location.href="mypage_info"
        }
    })

    bookout.addEventListener('click', function(){
        let c = confirm("북플릭스 회원 탈퇴 하시겠습니까?");

        if(c){
	        alert("탈퇴되었습니다. ")
	        window.location.href="bookflix"

        } else{
            window.location.href="mypage_info"
        }
    })
}

function likeSet(){
    let ri = [];
    ri = document.getElementsByName("like");
    let like = '${ login.like_id }';
    console.log("like" + like);

    for(let i = 0; i < ri.length; i++){
        if(like == (i+1)){
            console.log(ri[i+1]);
            ri[i+1].setAttribute("checked","checked");
        }
    }

}

logout();
likeSet();