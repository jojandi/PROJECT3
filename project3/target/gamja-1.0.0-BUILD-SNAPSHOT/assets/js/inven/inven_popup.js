function popupOn(){
    let popup = document.querySelectorAll(".popup");
    let book = document.querySelectorAll(".bname");
    let end = document.querySelectorAll(".popup-close");

    for(let i = 0; i < book.length; i++){
        book[i].addEventListener('click', function(){
            popup[i].style.display='block';
        })
        end[i].addEventListener('click', function(){
            popup[i].style.display='none';
        })
    }
    
}

function popupOn2(){
    let popup = document.querySelectorAll(".insert");
    let book = document.querySelectorAll(".addBnt");
    let end = document.querySelectorAll(".insert-close");

    for(let i = 0; i < book.length; i++){
        book[i].addEventListener('click', function(){
            popup[i].style.display='block';
        })
        end[i].addEventListener('click', function(){
            popup[i].style.display='none';
        })
    }
    
}

popupOn();
popupOn2();