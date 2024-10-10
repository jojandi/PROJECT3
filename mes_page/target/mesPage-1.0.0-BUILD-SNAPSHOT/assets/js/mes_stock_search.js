document.addEventListener('DOMContentLoaded', function () {
	// bom 검색구현
    document.getElementById('searchBom').addEventListener('keyup', function() {
    let filter = this.value.toUpperCase();
    let table = document.getElementById('main_library');
    let tr = table.getElementsByTagName('tr');

	    // 테이블의 각 행을 반복하여 검색어와 일치하는 도서명을 가진 행만 표시
	    for (let i = 1; i < tr.length; i++) { // Skip the first row (header)
	        let td = tr[i].getElementsByTagName('td')[1]; // Search only in the second column (제품명)
	        if (td) {
	            let txtValue = td.textContent || td.innerText;
	            if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                tr[i].style.display = "";
	            } else {
	                tr[i].style.display = "none";
	            }
	        }
	    }
	});

	//도서명 검색
	document.getElementById('searchInput').addEventListener('keyup', function() {
	    let filter = this.value.toUpperCase();   
	    let table = document.getElementById('main_library2'); 
	    let tr = table.getElementsByTagName('tr');
	
	    for (let i = 1; i < tr.length; i++) { 
	        let td = tr[i].getElementsByTagName('td')[1]; 
	        
	      
	        if (td) {
	            let txtValue = td.textContent || td.innerText;
	            if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                tr[i].style.display = "";
	            } else {
	                tr[i].style.display = "none";
	            }
	        }
	    }
	});
	
	

});