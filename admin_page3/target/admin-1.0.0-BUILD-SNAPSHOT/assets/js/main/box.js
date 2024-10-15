
let page = document.querySelectorAll(".page");
let icon = document.querySelectorAll(".section1 #pageall .pages .page .material-symbols-outlined")


function hover(){
    for(let i = 0; i < page.length; i++){
        page[i].addEventListener('mouseover', function(){
            console.log("in");
            page[i].style.background = "rgb(106, 170, 82)";
            page[i].style.transition ="all 0.8s";

            icon[i].style.color ="white";
            icon[i].style.transition ="all 0.8s";
        })
    }

    for(let i = 0; i < page.length; i++){
        page[i].addEventListener('mouseout', function(){
            console.log("out");
            page[i].style.background = "white";

            icon[i].style.color ="rgb(106, 170, 82)";
        })
    }
}


hover();