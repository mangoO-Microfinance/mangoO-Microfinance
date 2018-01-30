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
	if (field == "") return "Please enter an Address.\n\n"
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

function validateOverdraft(field, balance, wd_fee, minsavbal, fixed){
	fieldTotal = (field * 1) + (wd_fee * 1)
	balanceMin = (balance * 1) + (minsavbal * -1)
	balanceFix = (balance * 1) + (fixed * -1)
	if (fieldTotal > balanceMin) return "Withdrawal not permitted.\nMinimum savings balance is " + minsavbal + "."
	if (fieldTotal > balanceFix) return "Withdrawal not permitted.\nFixed deposits on this account are " + fixed + "."
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

function validateUser(field, usernames, user_id) {
	if (field == "") return "Please enter a Username.\n\n"
	if (user_id == 0){
		for (i = 0, len = usernames.length; i < len; i++){
			if (usernames[i] == field) return "Username already exists.\nPlease choose a different username.\n\n"
		}
	}
	return ""
}

function validatePw(pw, pw_conf) {
	if (pw == "") return "Please enter a password.\n\n"
	if (pw.length < 6) return "Password is too short. Please use at least 6 characters.\n\n"
	if (pw_conf == "") return "Please repeat password for confirmation.\n\n"
	if (pw != pw_conf) return "Passwords do not match.\n\n"
	return ""
}

function validateUsergroup(field, ugroupnames, ugroup_id) {
	if (field == "") return "Please enter a Usergroup name.\n\n"
	if (ugroup_id == 0){
		for (i = 0, len = ugroupnames.length; i < len; i++){
			if (ugroupnames[i] == field) return "Usergroup name already exists.\nPlease choose a different usergroup name.\n\n"
		}
	}
	return ""
}

function validateEmployee(field, employees, empl_current) {
	for (i = 0, len = employees.length; i < len; i++){
		if (employees[i] == field && field != empl_current) return "Employee already associated with another username.\n\n"
	}
	return ""
}
