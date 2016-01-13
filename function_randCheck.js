function randCheck(){
	captcha = (Math.random() + 1).toString(36).substring(2, 8);
	check = prompt('To confirm deletion type: ' + captcha);
	if (check == captcha) return true;
	else { alert('Confirmation unsuccessful. Entry will not be deleted!'); return false; }
}