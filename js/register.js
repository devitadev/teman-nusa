function validateRegister(){
    let nama = document.forms['formRegister']['nama'].value;
    let profesi = document.forms['formRegister']['profesi'].value;
    let usernameLinkedin = document.forms['formRegister']['usernameLinkedin'].value;
    let email = document.forms['formRegister']['email'].value;
    let nomorHandphone = document.forms['formRegister']['nomorHandphone'].value;
    let gender = document.forms['formRegister']['gender'].value;
    let bidangPekerjaan = document.querySelectorAll('input[type="checkbox"]:checked');
    let password = document.forms['formRegister']['password'].value;
    let confirmPassword= document.forms['formRegister']['confirmPassword'].value;

    let validate = true;

    let errNama = document.getElementById('errNama');
    if(nama == null || nama == ""){
        errNama.style.display = 'block';
        validate = false;
    }
    else errNama.style.display = 'none';

    let errProfesi = document.getElementById('errProfesi');
    if(profesi == null || profesi == ""){
        errProfesi.style.display = 'block';
        validate = false;
    }
    else errProfesi.style.display = 'none';

    let errUsernameLinkedin = document.getElementById('errUsernameLinkedin');
    if(usernameLinkedin == null || usernameLinkedin == ""){
        errUsernameLinkedin.style.display = 'block';
        validate = false;
    }
    else errUsernameLinkedin.style.display = 'none';
   
    let errEmail = document.getElementById('errEmail');
    if(email == null || email == ""){
        errEmail.style.display = 'block';
        validate = false;
    } 
    else errEmail.style.display = 'none';

    let errNomorHandphone1 = document.getElementById('errNomorHandphone1');
    if(nomorHandphone == null || nomorHandphone == ""){
        errNomorHandphone1.style.display = 'block';
        validate = false;
    }
    else errNomorHandphone1.style.display = 'none';

    let errNomorHandphone2 = document.getElementById('errNomorHandphone2');
    const numbers = /^[0-9]+$/;
    if(!numbers.test(nomorHandphone)){
        errNomorHandphone2.style.display = 'block';
        validate = false;
    }
    else errNomorHandphone2.style.display = 'none';

    let errGender = document.getElementById('errGender');
    if(gender != "laki-laki" && gender != "perempuan"){
        errGender.style.display = 'block';
        validate = false;
    } 
    else errGender.style.display = 'none';

    let errBidangPekerjaan = document.getElementById('errBidangPekerjaan');
    if (bidangPekerjaan.length < 3) {
        errBidangPekerjaan.style.display = 'block';
        validate = false;
    }else{
        errBidangPekerjaan.style.display = 'none';
    }

    let errPassword = document.getElementById('errPassword');
    if(password == null || password == ""){
        errPassword.style.display = 'block';
        validate = false;
    } 
    else errPassword.style.display = 'none';

    let errConfirmPassword = document.getElementById('errConfirmPassword');
    if(confirmPassword != password){
        errConfirmPassword.style.display = 'block';
        validate = false;
    } 
    else errConfirmPassword.style.display = 'none';

    return validate;
}