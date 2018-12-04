/**
 * 
 */
function validateLogin() {
	var form = document.forms["login"];
	var email = form["email"]
	var password = form["password"];
	
	if (email.value == "") {
		window.alert("Please enter your email address.");
		email.focus();
		return false;
	}
	
	if (password.value == "") {
		window.alert("Please enter your password.");
		password.focus();
		return false;
	}
	return true;
}

function validateSignUp() {
	var form = document.forms["signup"];
	var firstName = form["firstName"];
	var lastName = form["lastName"];
	var age = form["age"];
	
	var username = form["username"];
	var email = form["email"];
	var pass1 = form["pass1"];
	var pass2 = form["pass2"];
	
	var address1 = form["address1"];
	var address2 = form["address2"];
	var city = form["city"];
	var state = form["state"];
	var zipcode = form["zipcode"];
	var phoneNumber = form["phone"];
	
	if (firstName.value == "") {
		window.alert("Please enter your first name.");
		firstName.focus();
		return false;		
	}
	
	if (lastName.value == "") {
		window.alert("Please enter your last name.");
		lastName.focus();
		return false;		
	}
	
	if (age.value == "") {
		window.alert("Please enter your age.");
		age.focus();
		return false;		
	}
	
	if (username.value == "") {
		window.alert("Please enter a username.");
	}
	
	if (email.value == "") {
		window.alert("Please enter your E-Mail address.");
		email.focus();
		return false;		
	}
	
	if (pass1.value == "") {
		window.alert("Please enter a valid password.");
		pass1.focus();
		return false;		
	}
	
	if (pass2.value == "") {
		window.alert("Please repeat your password.");
		pass2.focus();
		return false;		
	}
	
	if (pass1.value != pass2.value) {
		window.alert("Passwords do not match!");
		pass1.focus();
		pass2.focus();
		return false;
	}
	
	if (address1.value == "") {
		window.alert("Please enter an address.");
		address1.focus();
		return false;		
	}
	
	if (city.value == "") {
		window.alert("Please enter a city.");
		city.focus();
		return false;		
	}
	
	if (state.value == "") {
		window.alert("Please enter a state");
		pass1.focus();
		return false;		
	}
	
	if (zipcode.value == "") {
		window.alert("Please enter a valid zip code.");
		zipcode.focus();
		return false;		
	}
	
	if (phoneNumber.value == "") {
		window.alert("Please enter a valid phone number.");
		phoneNumber.focus();
		return false;		
	}
	return true;
}

function validatePayment() {
	var form = document.forms["payment"];
	var creditCardCCV = form["creditCardCCV"];
	var creditCardNumber = form["creditCardNumber"];
	var cardHolderFirstName = form["cardHolderFirstName"];	
	var cardHolderLastName = form["cardHolderLastName"];
	var expYear = form["expYear"];
	var expMonth = form["expMonth"];
	var ccType = form["ccType"];
	
	if (creditCardCCV.value == "") {	
		window.alert("Please enter your creditCardCCV.");
		creditCardCCV.focus();
		return false;
	}
	if (creditCardNumber.value == "") {
		window.alert("Please enter your creditCardNumber.");
		creditCardNumber.focus();
		return false;
	}
	if (cardHolderFirstName.value == "") {
		window.alert("Please enter your cardHolderFirstName.");
		cardHolderFirstName.focus();
		return false;
	}
	if (cardHolderLastName.value == "") {
		window.alert("Please enter your cardHolderLastName.");
		cardHolderLastName.focus();
		return false;
	}
	if (expYear.value == "") {
		window.alert("Please enter your expYear.");
		expYear.focus();
		return false;
	}
	if (expMonth.value == "") {
		window.alert("Please enter your expMonth.");
		expMonth.focus();
		return false;
	}
	if (ccType.value == "") {
		window.alert("Please select your ccType.");
		ccType.focus();
		return false;
	}
	return true;
}

function validateReview() {
	var form = document.forms["review"];
	var reviewtext = form["reviewtext"];
	
	if (reviewText.value == "") {
		window.alert("Review cannot be blank!");
		reviewtext.focus();
		return false;
	}
	return true;

}