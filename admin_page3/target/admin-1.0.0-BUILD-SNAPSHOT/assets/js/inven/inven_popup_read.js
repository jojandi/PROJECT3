function popupOn(){
    let popup = document.querySelectorAll("#popup");
    let book = document.querySelectorAll(".bname");
    let end = document.querySelectorAll("#popup-close");

    for(let i = 0; i < book.length; i++){
        book[i].addEventListener('click', function(){
            popup.style.display='block';
        })
        end.addEventListener('click', function(){
            popup.style.display='none';
        })
    }
    
}

popupOn();