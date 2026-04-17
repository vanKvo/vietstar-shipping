// Sender's Information (Field) //
const first_name = document.getElementById('first_name')
const last_name = document.getElementById('last_name')
const address1 = document.getElementById('address1')
const city = document.getElementById('city')
const zip_code = document.getElementById('zip_code')
const state = document.getElementById('state')
const email = document.getElementById('email')
const phone = document.getElementById('phone')

// Recipient's Information (Field) //
const first_name_r = document.getElementById('first_name_r')
const last_name_r = document.getElementById('last_name_r')
const address_r1 = document.getElementById('address_r1')
/* const email_r = document.getElementById('email_r')
const phone_r = document.getElementById('phone_r') */

// Sender's Information (Error) //
emsg_first_name = document.getElementById('emsg_first_name')
emsg_last_name = document.getElementById('emsg_last_name')
emsg_address1 = document.getElementById('emsg_last_name')
emsg_city = document.getElementById('emsg_city')
emsg_zip_code = document.getElementById('emsg_zip_code')
emsg_state = document.getElementById('emsg_state')
emsg_email = document.getElementById('emsg_email')
emsg_phone = document.getElementById('emsg_phone')

// Recipient's Information (Error) //
emsg_first_name_r = document.getElementById('emsg_first_name_r')
emsg_last_name_r = document.getElementById('emsg_last_name_r')
emsg_address_r1 = document.getElementById('emsg_address_r1')
/* emsg_email_r = document.getElementById('emsg_email_r')
emsg_phone_r = document.getElementById('emsg_phone_r') */



// Validation //

const form = document.getElementById('form')

function check () {
    var valid = true, error = "", field = "";
    
    // Sender's Validation //
    if (!first_name.checkValidity()) {
        valid = false;
        first_name.classList.add("err");
        emsg_first_name.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        first_name.classList.remove("err");
        emsg_first_name.innerHTML = "";
    }

    if (!last_name.checkValidity()) {
        valid = false;
        last_name.classList.add("err");
        emsg_last_name.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        last_name.classList.remove("err");
        emsg_last_name.innerHTML = "";
    }

    if (!address1.checkValidity()) {
        valid = false;
        address1.classList.add("err");
        emsg_address1.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        address1.classList.remove("err");
        emsg_address1.innerHTML = "";
    }

    if (!city.checkValidity()) {
        valid = false;
        city.classList.add("err");
        emsg_city.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        city.classList.remove("err");
        emsg_city.innerHTML = "";
    }

    if (!zip_code.checkValidity()) {
        valid = false;
        zip_code.classList.add("err");
        emsg_zip_code.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        zip_code.classList.remove("err");
        emsg_zip_code.innerHTML = "";
    }

    if (!state.checkValidity()) {
        valid = false;
        state.classList.add("err");
        emsg_state.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        state.classList.remove("err");
        emsg_state.innerHTML = "";
    }

    if (!email.checkValidity()) {
        valid = false;
        email.classList.add("err");
        emsg_email.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        email.classList.remove("err");
        emsg_email.innerHTML = "";
    }

    if (!phone.checkValidity()) {
        valid = false;
        phone.classList.add("err");
        emsg_phone.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        phone.classList.remove("err");
        emsg_phone.innerHTML = "";
    }

    // Recipient's Validation //


    if (!first_name_r.checkValidity()) {
        valid = false;
        first_name_r.classList.add("err");
        emsg_first_name_r.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        first_name_r.classList.remove("err");
        emsg_first_name_r.innerHTML = "";
    }

    if (!last_name_r.checkValidity()) {
        valid = false;
        last_name_r.classList.add("err");
        emsg_last_name_r.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        last_name_r.classList.remove("err");
        emsg_last_name_r.innerHTML = "";
    }

    if (!address_r1.checkValidity()) {
        valid = false;
        address_r1.classList.add("err");
        emsg_address_r1.innerHTML = "Please Complete This Field\r\n";
    }
    else {
        address_r1.classList.remove("err");
        emsg_address_r1.innerHTML = "";
    }

    return valid;
}

/* form.addEventListener('submit', (e) => {
    let messages = []
    if (first_name.value === '' || first_name.value == null) {
        messages.push('error message test')
    }

    if (messages.length > 0) {
        e.preventDefault()
        
    }
}) */
