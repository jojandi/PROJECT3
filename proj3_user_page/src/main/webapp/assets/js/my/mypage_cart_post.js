
document.querySelector("#reserchk").addEventListener('click', function(){
    ajax_reschk();
})
document.querySelector("#delall").addEventListener('click', function(){
    ajax_del('post');
})
document.querySelector("#reserall").addEventListener('click', function(){
    ajax_resall('post');
})


function ajax_reschk() {

    //jQuery로 for문 돌면서 check 된값 배열에 담는다
    var lists = [];
    var cart = [];
    $("input[name='cart_chk']:checked").each(function(i){   
        lists.push($(this).val());
    });
    
    $("input[name='cart_chk']:checked").each(function(i){   
        cart.push($(this).val());
    });
    

    console.log(lists);
    console.log("code=" + lists + "&user=" + user + "&cart=" + cart);
    
    
    if(lists.length > 0){
        let url = 'reschk';
        
        // ajax
        let xhr = new XMLHttpRequest();
        
        xhr.open('post', url);
        
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
    
        xhr.send( "code=" + lists + "&user=" + user + "&cart=" + cart);
        
        xhr.onload = function(){
			alert("선택 도서가 예약되었습니다. ")

            xhr = new XMLHttpRequest();
        
            xhr.open('get', res);
            
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
        
            xhr.send( "seq=" + user );
	    }
    
    } else{
        alert("도서를 선택해주세요. ")
    }
}

function ajax_del(method) {

    let seqs = [];

    $("input[name='cart']").each(function(i){   
        seqs.push($(this).val());
    });

    console.log(seqs);
    
    console.log("code=" + seqs + "&user=" + user )
    
    if(seqs.length > 0){
	    let url = 'delall';
	    
	    // ajax
	    let xhr = new XMLHttpRequest();
	    
	    xhr.open(method, url);
	    
	    if(method == 'get'){			
	        xhr.send();
	    } else{
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
	    
	        xhr.send( "seq=" + seqs + "&user=" + user);
	        
	    }
	
	
	    xhr.onload = function(){
			alert("삭제되었습니다. ")

            xhr = new XMLHttpRequest();
        
            xhr.open('get', mypage_cart);
            
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
        
            xhr.send( "seq=" + user );
	    }
	}
    
}

function ajax_resall(method) {

    let seqs = [];
    let cart = [];

    $("input[name='cart_chk']").each(function(i){   
        seqs.push($(this).val());
    });
    
    $("input[name='cart']").each(function(i){   
        cart.push($(this).val());
    });

    console.log(seqs);
    
    console.log("code=" + seqs + "&user=" + user + "&cart=" + cart);
    
    if(seqs.length > 0){
	    let url = 'resAll';
	    
	    // ajax
	    let xhr = new XMLHttpRequest();
	    
	    xhr.open(method, url);
	    
	    if(method == 'get'){			
	        xhr.send();
	    } else{
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
	    
	        xhr.send( "code=" + seqs + "&user=" + user + "&cart=" + cart);
	        
	    }
	
	
	    xhr.onload = function(){
			alert("예약이 완료되었습니다. ")

            xhr = new XMLHttpRequest();
        
            xhr.open('get', res);
            
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
        
            xhr.send( "seq=" + user );
		}
	}
}



