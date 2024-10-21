// 로그인 필요
document.querySelectorAll('.loginFilter').forEach(function(login) {
    login.addEventListener('click', function(){
        console.log("로그인 필요!");
        alert("로그인이 필요한 페이지입니다. ");
    })
})