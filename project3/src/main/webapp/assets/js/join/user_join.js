document.getElementById("check_username").addEventListener("click", function() {
    const user_id = document.getElementById("user_id").value;
    if (user_id === "") {
        alert("아이디를 입력하세요.");
        document.getElementById("user_id").focus();
    }
});

document.getElementById("gaip_1").addEventListener("click", function(e) {
    e.preventDefault();

    const name = document.getElementById("name_").value;
    const user_id = document.getElementById("user_id").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirm-password").value;
    const phone = document.getElementById("phone").value;
    const emailUser = document.getElementById("email-user").value;
    const emailDomain = document.getElementById("email-domain").value;
    const addressnum = document.getElementById("addressnum").value;
    const address = document.getElementById("address").value;
    const addressinfo = document.getElementById("addressinfo").value;

    // 비밀번호 메시지 element 가져오기
    const messageElement = document.getElementById("password-message");

    // 모든 필드가 입력되었는지 확인
    if (!name || !user_id || !password || !confirmPassword || !phone || !emailUser || !emailDomain || !addressnum || !address || !addressinfo) {
        alert("모든 필드를 입력하세요.");
        return;
    }

    // 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (password !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    // 비밀번호 규격을 만족하지 않을 때 (메시지가 표시되어 있는 경우) 회원가입 방지
    if (messageElement.style.display !== "none") {
        alert("비밀번호가 규격에 맞지 않습니다. 다시 확인하세요.");
        return;
    }

    // 모든 조건이 충족되었을 때 폼 제출
    const form = document.querySelector("form");
    alert("회원가입이 완료되었습니다.");
    form.submit();
});

function msg() {
    let idmsg = document.querySelector("#user_id-message");
    let pwmsg = document.querySelector("#password-message");
    let pw = document.querySelector("#password");

    pw.addEventListener("input", function() {
        let user_id = document.querySelector("#user_id").value;
        if (user_id === "") {
            idmsg.style.display = "block";  // 아이디가 없을 때 메시지 표시
        } else {
            idmsg.style.display = "none";   // 아이디가 있으면 메시지 숨김
        }
    });

    let conpw = document.getElementById("confirm-password");
    conpw.addEventListener("input", function() {
        let password = document.getElementById("password").value;
        if (password === "") {
            pwmsg.style.display = "block";  // 비밀번호가 없을 때 메시지 표시
        } else {
            pwmsg.style.display = "none";   // 비밀번호가 있으면 메시지 숨김
        }
    });
}

function validatePassword() {
  const password = document.getElementById("password").value;
  const messageElement = document.getElementById("password-message");

  // 최소 8자리 이상
  const minLength = 8;

  // 정규 표현식
  const hasUpperCase = /[A-Z]/;       // 대문자 하나 이상
  const hasLowerCase = /[a-z]/;       // 소문자 하나 이상
  const hasNumber = /[0-9]/;          // 숫자 하나 이상
  const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/; // 특수문자 하나 이상

  // 먼저 콘솔에 비밀번호를 출력해서 함수가 호출되는지 확인
  console.log("Password: ", password);

  // 비밀번호가 입력되지 않았거나 규격을 만족하지 않는 경우 메시지 표시
  if (password.length < minLength) {
    messageElement.textContent = "비밀번호는 최소 8자리여야 합니다.";
    messageElement.style.display = "block";  // 메시지 표시
    return;
  }

  if (!hasUpperCase.test(password)) {
    messageElement.textContent = "비밀번호에 대문자가 하나 이상 포함되어야 합니다.";
    messageElement.style.display = "block";  // 메시지 표시
    return;
  }

  if (!hasLowerCase.test(password)) {
    messageElement.textContent = "비밀번호에 소문자가 하나 이상 포함되어야 합니다.";
    messageElement.style.display = "block";  // 메시지 표시
    return;
  }

  if (!hasNumber.test(password)) {
    messageElement.textContent = "비밀번호에 숫자가 하나 이상 포함되어야 합니다.";
    messageElement.style.display = "block";  // 메시지 표시
    return;
  }

  if (!hasSpecialChar.test(password)) {
    messageElement.textContent = "비밀번호에 특수문자가 하나 이상 포함되어야 합니다.";
    messageElement.style.display = "block";  // 메시지 표시
    return;
  }

  // 모든 조건을 만족하면 메시지를 숨김
  messageElement.textContent = "비밀번호가 규격을 만족합니다!";
  messageElement.style.display = "none";  // 규격을 만족하면 메시지 숨김
}

// 비밀번호 입력 시 규격 체크
document.getElementById("password").addEventListener("input", validatePassword);


function checkPasswordMatch() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirm-password").value;
    const confirmMessageElement = document.getElementById("confirm-password-message");

    // 콘솔 로그로 비밀번호와 확인 비밀번호 값을 확인
    console.log("Password:", password, "Confirm Password:", confirmPassword);

    if (password !== confirmPassword) {
        confirmMessageElement.textContent = "비밀번호가 일치하지 않습니다.";
        confirmMessageElement.style.display = "block";  // 메시지를 표시
    } else {
        confirmMessageElement.textContent = "비밀번호가 일치합니다!";
        confirmMessageElement.style.display = "block";  // 메시지를 표시
    }

    // 조건에 맞게 메시지를 숨기려면 아래처럼 수정 가능
    if (password === confirmPassword && password !== "") {
        confirmMessageElement.style.display = "none";  // 비밀번호가 일치하면 메시지 숨김
    }
}

// 비밀번호 확인 필드에 입력 이벤트 추가
document.getElementById("confirm-password").addEventListener("input", checkPasswordMatch);


document.getElementById("password").addEventListener("input", validatePassword);
document.getElementById("confirm-password").addEventListener("input", checkPasswordMatch);

window.addEventListener("load", msg);




