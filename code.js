// code for login page 
const loginForm = document.getElementById('loginForm');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const emailError = document.getElementById('emailError');
const passwordError = document.getElementById('passwordError');


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

function validateLoginPassword(){
    const value = passwordInput.value;
    if (value.length < 6 ){
        passwordInput.classList.remove('valid');
        passwordInput.classList.add('error');
        passwordError.textContent = 'Password must be at least 6 characters.';
        return false;

    } 
    else{
        passwordInput.classList.remove('error');
        passwordInput.classList.add('valid');
        passwordError.textContent = '';
        return true;
    }
}

emailInput.addEventListener('input',validateLoginEmail);
passwordInput.addEventListener('input',validateLoginPassword);

loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const Usernameemail=validateLoginEmail();
    const PasswordValid = validateLoginPassword();

    if(Usernameemail && PasswordValid){
        window.location.href = "index.html";
    }
});

// // code for sign up page 

// const signupForm = document.getElementById('signupForm');
// const signupUsername = document.getElementById('signupUsername');
// const signupPassword = document.getElementById('signuppassword');
// const confiremPassssword = document.getElementById('confirmPassword');
// const avatarSpace = document.getElementById('avatar');

// const signupUsernameError = document.getElementById('signupUsernameError');
// const signuppasswordError = document.getElementById('signuppasswordError');
// const confirmPasswordError = document.getElementById('confirmPasswordError');
// const avatarError = document.getElementById('avatarError');

// function validatesignupUsername(){
//     const value = signupUsername.value.trim();
//     const regex = /^\w+$/
//      if(value === ''){      
//         signupUsername.classList.remove('valid');
//         signupUsername.classList.add('error');
//         signupUsernameError.textContent = 'Screen name is required.';
//         return false;
//      }
//      else if(!regex.test(value) ){ //  add a condition for checking space and uncharacter word error 
//         signupUsername.classList.remove('valid');
//         signupUsername.classList.add('error');
//         signupUsernameError.textContent = 'Screen name must not contain space or non-word characters.';
//         return false;
        
//      }
//      else {
//         signupUsername.classList.add('valid');
//         signupUsername.classList.remove('error');
//         signupUsernameError.textContent = '';
//         return true;
//      }

// }


// function validateSignupPassword(){
//     const value = signupPassword.value.trim();
//     const regex =/[^A-Za-z]/
//      if(value.length < 6 ){       //add a non character conditiion 
//         signupUsername.classList.remove('valid');
//         signupUsername.classList.add('error');
//         signupUsernameError.textContent = 'Password must be atleast 6 characters long. ';
//         return false;
//      }
//      else if(!regex.test(value)){
//         signupUsername.classList.remove('valid');
//         signupUsername.classList.add('error');
//         signupUsernameError.textContent = 'Password must include at least one non-letter character.';
//         return false;

//      }
//      else{
//         signupUsername.classList.add('valid');
//         signupUsername.classList.remove('error');
//         signupUsernameError.textContent = '';
//         return true;
//      }

// }

// function validconfiremPassssword(){
//     const passwordvalue =  signupPassword.value;
//     const confirmvalue = confiremPassssword.value;

//     if(confirmvalue != passwordvalue || confirmvalue === ''){
//         confiremPassssword.classList.remove('valid');
//         confirmPasswordError.classList.add('error');
//         confirmPasswordError.textContent = 'Password do not match';
//         return false;

//     }
//     else{
//         confiremPassssword.classList.add('valid');
//         confirmPasswordError.classList.remove('error');
//         confirmPasswordError.textContent = '';
//         return true;
//     }
// }

// function avatarValidation(){
//     const file = avatarSpace.files[0];
//     if (!file){
//         avatarSpace.classList.remove('valid');
//         avatarSpace.classList.add('error');
//         avatarError.textContent = 'Please select an image file.';
//         return false;

//     }
//     else if(!file.type.startsWith('image/')){
//         avatarSpace.classList.remove('valid');
//         avatarSpace.classList.add('error');
//         avatarError.textContent = 'Only image file is allowed.';
//         return false;
//     }
//     else{
//         avatarSpace.classList.add('valid');
//         avatarSpace.classList.remove('error');
//         avatarError.textContent = '';
//         return true;
//     }
// }

// signupUsername.addEventListener('input',validatesignupUsername);
// signupPassword.addEventListener('input',validateLoginPassword);
// confiremPassssword.addEventListener('input',validconfiremPassssword);
// avatarSpace.addEventListener('input',avatarValidation);


// signupForm.addEventListener('submit', function(e){
//     e.preventDefault();

//     const validemmail = validateLoginEmail();
//     const validUsername = validatesignupUsername();
//     const validPassword = validateLoginPassword();
//     const validConfirmPassword = validconfiremPassssword();
//     const vaildavatar = avatarValidation();
//     if( validemmail && validUsername && validPassword  && validConfirmPassword && vaildavatar){
//         alert('Sign up successful!');
//         window.location.href = "login.html";
//     }
// })
