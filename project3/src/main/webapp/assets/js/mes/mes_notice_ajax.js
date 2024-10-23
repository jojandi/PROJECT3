window.addEventListener("load", function(){
    getList();
});

function ajax(url, param, cb, method) {
    if(!method) method = "get";
    
    const xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.setRequestHeader("Content-Type", "application/json"); // json 보내줄 거임
    xhr.send(JSON.stringify(param));
    console.log(JSON.stringify(param));
    
    if(typeof cb == "function") {
        xhr.onload = function() {
            cb(xhr.responseText);
        }
    }
}

function getList() {
    ajax("listNoti", null, drawList, "get");
}

function getNoticeIdFromUrl() {
    // 현재 URL의 쿼리 스트링에서 notice_id 값을 가져옴
    const params = new URLSearchParams(window.location.search);
    return params.get("notice_id");
}

function drawList(text) {
    try {
        const listNoti = JSON.parse(text);
        const noticeId = getNoticeIdFromUrl(); // URL에서 가져온 notice_id
        
        let html = "";
        
        if (listNoti.length == 0) {
            html = "<tr><td colspan='7'>자료가 없습니다</td></tr>";
        } else {
            for (let i = 0; i < listNoti.length; i++) {
                // target_id와 notice_id가 같은 경우에만 표시
                if (listNoti[i].target_id == noticeId) {
                    html += `
                        <tr>
                            <td class="cm_name">
                                ${listNoti[i].emp_name}
                            </td>
                            <td class="cm_content">
                                ${listNoti[i].cm_content}
                            </td>
                        </tr>
                    `;
                }
            }
        }
        document.querySelector("#list").innerHTML = html;
    } catch (e) {
        console.log("ERROR : drawList", e);
    }
}
