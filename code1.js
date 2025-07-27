// code for sign up page 

const signupForm = document.getElementById('signupForm');
const signupUsername = document.getElementById('signupUsername');
const signupPassword = document.getElementById('signupPassword');
const confirmPassword = document.getElementById('confirmPassword');
const avatarSpace = document.getElementById('avatar');

const signupUsernameError = document.getElementById('signupUsernameError');
const signuppasswordError = document.getElementById('signupPasswordError');
const confirmPasswordError = document.getElementById('confirmPasswordError');
const avatarError = document.getElementById('avatarError');

const emailInput = document.getElementById('email');
const emailError = document.getElementById('emailError');

function validateLoginEmail() {

    const value = emailInput.value.trim();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (value === ''){
        emailInput.classList.remove('valid');
        emailInput.classList.add('error');
        emailError.textContent = 'Email is required.';
        return false;
    }
    else if(!emailRegex.test(value)){
        emailInput.classList.remove('valid');
        emailInput.classList.add('error');
        emailError.textContent = 'Please enter a valid email.';
    }
    else{
        emailInput.classList.remove('error');
        emailInput.classList.add('valid');
        emailError.textContent = '';
        return true;

    }
}

function validatesignupUsername(){
    const value = signupUsername.value.trim();
    const regex = /^\w+$/
     if(value === ''){      
        signupUsername.classList.remove('valid');
        signupUsername.classList.add('error');
        signupUsernameError.textContent = 'Screen name is required.';
        return false;
     }
     else if(!regex.test(value) ){ //  add a condition for checking space and uncharacter word error 
        signupUsername.classList.remove('valid');
        signupUsername.classList.add('error');
        signupUsernameError.textContent = 'Screen name must not contain space or non-word characters.';
        return false;
        
     }
     else {
        signupUsername.classList.add('valid');
        signupUsername.classList.remove('error');
        signupUsernameError.textContent = '';
        return true;
     }

}


function validateSignupPassword(){
    const value = signupPassword.value;
    const regex =/[^A-Za-z]/
     if(value.length < 6 ){       //add a non character conditiion 
        signupPassword.classList.remove('valid');
        signupPassword.classList.add('error');
        signuppasswordError.textContent = 'Password must be atleast 6 characters long. ';
        return false;
     }
     else if(!regex.test(value)){
        signupPassword.classList.remove('valid');
        signupPassword.classList.add('error');
        signuppasswordError.textContent = 'Password must include at least one non-letter character.';
        return false;

     }
     else{
        
        signupPassword.classList.remove('error');
        signupPassword.classList.add('valid');
        signuppasswordError.textContent = '';
        return true;
     }

}

function validconfirmPassword(){
    const passwordvalue =  signupPassword.value;
    const confirmvalue = confirmPassword.value;

    if(confirmvalue !== passwordvalue || confirmvalue === ''){
        confirmPassword.classList.remove('valid');
        confirmPassword.classList.add('error');
        confirmPasswordError.textContent = 'Password do not match';
        return false;

    }
    else{ 
        confirmPassword.classList.remove('error');
        confirmPassword.classList.add('valid');
        confirmPasswordError.textContent = '';
        return true;
    }
}

function avatarValidation(){
    const file = avatarSpace.files[0];
    if (!file){
        avatarSpace.classList.remove('valid');
        avatarSpace.classList.add('error');
        avatarError.textContent = 'Please select an image file.';
        return false;

    }
    else if(!file.type.startsWith('image/')){
        avatarSpace.classList.remove('valid');
        avatarSpace.classList.add('error');
        avatarError.textContent = 'Only image file is allowed.';
        return false;
    }
    else{
        
        avatarSpace.classList.remove('error');
        avatarSpace.classList.add('valid');
        avatarError.textContent = '';
        return true;
    }
}

emailInput.addEventListener('input',validateLoginEmail);
signupUsername.addEventListener('input',validatesignupUsername);
signupPassword.addEventListener('input',validateSignupPassword);
confirmPassword.addEventListener('input',validconfirmPassword);
avatarSpace.addEventListener('change',avatarValidation);


signupForm.addEventListener('submit', function(e){
    e.preventDefault();

    const Usernameemail=validateLoginEmail();
    const validUsername = validatesignupUsername();
    const validPassword = validateSignupPassword();
    const validConfirm = validconfirmPassword();
    const vaildavatar = avatarValidation();

    if( Usernameemail && validUsername && validPassword  && validConfirm && vaildavatar){
        alert('Sign up successful!');
        window.location.href = "login.html";
    }

});
