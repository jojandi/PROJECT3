function popupOn(){
    let popup = document.querySelectorAll(".popup");
    let popupBnt = document.querySelectorAll(".popupBnt");
    let end = document.querySelectorAll(".popup-close");

    for(let i = 0; i < popup.length; i++){
        popupBnt[i].addEventListener('click', function(){
            popup[i].style.display='block';
        })
        end[i].addEventListener('click', function(){
            popup[i].style.display='none';
        })
    }
}

function reviewOn(){
    let review = document.querySelector("#reviewPopup");
    let reviewBnt = document.querySelector("#reviewBnt");
    let end = document.querySelector("#end");
	let review_text = document.querySelector("#reviewPopup");
	let close = document.querySelectorAll(".popup-close");

    reviewBnt.addEventListener('click', function(){
        review.style.display='block';
    })
    for(let i = 0; i < close.length; i++){
	    close[i].addEventListener('click', function(){
	        review.style.display='none';
	    })
    }
    end.addEventListener('click', function(e){
    	
    	e.preventDefault()
    
    	//jQuery로 for문 돌면서 check 된값 배열에 담는다
	    var lists = [];
	    $("input[name='star']:checked").each(function(i){   
	        lists.push($(this).val());
	    });
	    
	    if(lists.length == 0){
	    	alert("모든 필드를 입력해주세요. ");
	    	return;
	    } else{
		    let form = document.querySelector("#form");
	        alert("리뷰 작성이 완료되었습니다. ");
	        form.submit();
	    }
	})
    
}

popupOn();
reviewOn();