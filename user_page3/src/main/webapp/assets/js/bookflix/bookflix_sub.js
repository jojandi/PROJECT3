let bnt = document.querySelector("#fixed-button");

function subOn(){
    bnt.addEventListener("click", function(){
        alert("구독되었습니다!")
    })
}

subOn();