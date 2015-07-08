function validateName(field) {
	if (field == "") return "Please enter a Name.\n\n"
	return ""
}

function validateDob(field) {
	if (field == "") return "Please enter a Date of Birth.\n\n"
	else if (/[^0-9.]/.test(field)) return "DoB is invalid. Format must be: DD.MM.YYYY\n\n"
	else if (field.length != 10) return "DoB is invalid. Format must be: DD.MM.YYYY\n\n"
	else if (!(field.indexOf(".") == 2)) return "DoB is invalid. Format must be: DD.MM.YYYY\n\n"
	return ""
}

function validateAddress(field) {
	if (field == "") return "Please enter a Place of Residence.\n\n"
	return ""
}

function validatePhone(field) {
	if (field == "") return "Please enter a Phone Number.\n\n"
	else if (/[^0-9+-/ ]/.test(field)) return "The Phone Number is invalid.\n\n"
	return ""
}

function validateEmail(field){
	if (field != ""){
		if (!((field.indexOf(".") > 0) && (field.indexOf("@") > 0)) || /[^a-zA-Z0-9.@_-]/.test(field)) return "The Email address is invalid.\n\n"
	}
	return ""
}

function validateReceipt(field) {
	if (field == "") return "Please specify the Receipt Number.\n\n"
	return ""
}

function validateSlip(field) {
	if (field == "") return "Please specify the Slip Number.\n\n"
	return ""
}

function validateAmount(field) {
	if (field == "") return "Please enter an Amount.\n\n"
	if (field <= 0) return "Amount cannot be Zero or below.\n\n"
	return ""
}

function validateOverdraft(field, balance, wd_fee, minsavbal){
	field = (field * 1) + (wd_fee * 1)
	balance = (balance * 1) + (minsavbal * -1)
	if (field > balance) return "No Overdrafts on Savings Account allowed.\n\n The minimum balance is " + minsavbal + " UGX."
	return ""
}

function validateRecipient(field) {
	if (field == "") return "Please enter a Recipient.\n\n"
	return ""
}

function validateVoucher(field) {
	if (field == "") return "Please specify a Voucher Number.\n\n"
	return ""
}

function validateDate(field) {
	if (field == "") return "Please enter a Date.\n\n"
	else if (/[^0-9.]/.test(field)) return "Date is invalid. Format must be: DD.MM.YYYY\n\n"
	else if (field.length != 10) return "Date is invalid. Format must be: DD.MM.YYYY\n\n"
	else if (!(field.indexOf(".") == 2)) return "Date is invalid. Format must be: DD.MM.YYYY\n\n"
	return ""
}

function validatePrincipal(field) {
	if (field == "") return "Please enter a Principal Amount.\n\n"
	return ""
}

function validateInstalment(field) {
	if (field == "") return "Please enter a number of Instalments.\n\n"
	return ""
}

function validateInterest(field) {
	if (field == "") return "Please enter a monthly Interest Rate.\n\n"
	return ""
}

function validateRepaystart(field) {
	if (field == "") return "Please enter a Repay Start Date.\n\n"
	else if (/[^0-9.]/.test(field)) return "Start Date is invalid. Format must be: DD.MM.YYYY\n\n"
	else if (field.length != 10) return "Start Date is invalid. Format must be: DD.MM.YYYY\n\n"
	else if (!(field.indexOf(".") == 2)) return "Start Date is invalid. Format must be: DD.MM.YYYY\n\n"
	return ""
}

function validatePurpose(field) {
	if (field == "") return "Please enter a Purpose for the loan.\n\n"
	return ""
}

function validateSecurity(field) {
	if (field == "") return "Please enter at least one Security.\n\n"
	return ""
}

function validateGuarantors(field1, field2, field3) {
	returnstring = ""
	if (field1 == "") returnstring = "Please choose first Guarantor.\n\n"
	if (field2 == "") returnstring += "Please choose second Guarantor.\n\n"
	if (field3 == "") returnstring += "Please choose third Guarantor.\n\n"
	else if (field1 == field2 || field1 == field3 || field2 == field3) returnstring += "Guarantors must be three distinct customers.\n\n"
	return returnstring
}

function validateUser(field) {
	if (field == "") return "Please enter a Username.\n\n"
	return ""
}

function validatePw(pw, pw_conf) {
	if (pw == "") return "Please enter a Password.\n\n"
	if (pw_conf == "") return "Please reconfirm Password.\n\n"
	if (pw != pw_conf) return "Passwords do not match! Please try again.\n\n"
	return ""
}