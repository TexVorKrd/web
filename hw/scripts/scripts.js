
const EMAIL_REGEXP = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/iu;

function onInput() {
    if (isEmailValid(document.getElementById("email").value)) {
        alert("Информация отправлена");
    } else {
        alert("Форат почты неверный")
    }
}

function isEmailValid(value) {
    return EMAIL_REGEXP.test(value);
}
