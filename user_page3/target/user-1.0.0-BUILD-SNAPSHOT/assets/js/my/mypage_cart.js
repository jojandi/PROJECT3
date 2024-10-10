let chk = document.querySelectorAll(".chk");
let chkall = document.querySelector("#chkall")


function chkallOn(){
    
    chkall.addEventListener('click', function(){
        let ischk = chkall.hasAttribute("checked");

        if(ischk){
            console.log(ischk);
            
            chkall.removeAttribute("checked");
            console.log("전체 선택 해제!");

            for(let i = 0; i < chk.length; i++){
                chk[i].removeAttribute("checked");
            }
            
        } else{
            console.log(ischk);
            
            chkall.setAttribute("checked", "checked");
            console.log("전체 선택!");

            for(let i = 0; i < chk.length; i++){
                chk[i].setAttribute("checked", "checked");
            }
        }
    })

    for(let i = 0; i < chk.length; i++){
        chk[i].addEventListener('click', function(){
            let ischk = chk[i].hasAttribute("checked");

            if(ischk){
                chk[i].setAttribute("checked", "checked");
            } else{
                chk[i].removeAttribute("checked");
            }
        });
    }
    
}


chkallOn();

