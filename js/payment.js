function validatePayment(){
    let price = document.forms['formPayment']['price'].value;
    let payment = document.forms['formPayment']['payment'].value;
    let diff = payment - price;

    let errPayment = document.getElementById('errPayment');
    if(payment == null || payment == ""){
        errPayment.style.display = "block";
        return false;
    }
    else errPayment.style.display = "none";

    if(diff < 0){
        alert("Maaf Pembayaran anda gagal karena payment yang anda masukan kurang " + (price - payment));
        return false;
    }
    else if(diff > 0) {
        let text = "Payment yang anda masukan lebih. Apakah anda tetap ingin melanjutkan pembayaran? Payment yang lebih akan masuk kedalam saldo anda yaitu sebesar " + diff;
        if (confirm(text) == true){
            return true;
        }
        else return false;
    }
    else {
        return true;
    }
}