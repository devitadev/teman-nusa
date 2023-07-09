function validateLogin(){
    let email = document.forms['formLogin']['email'].value;
    let password = document.forms['formLogin']['password'].value;
    let validate = true;

    let errEmail = document.getElementById('errEmail');
    if(email == null || email == ""){
        errEmail.style.display = 'block';
        validate = false;
    } 
    else errEmail.style.display = 'none';

    let errPassword = document.getElementById('errPassword');
    if(password == null || password == ""){
        errPassword.style.display = 'block';
        validate = false;
    } 
    else errPassword.style.display = 'none';

    return validate;
}