function openthewindow(url, newName) {

	if (!newName) {
		window.open(url,'newwindow',
						'height=490, width=590,  toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
	} else {
		window.open(url,newName,
						'height=490, width=590,  toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
	}
}
function openthewindow2(url, newName) {

	if (!newName) {
		window.open(url,'newwindow',
						'height=570, width=590,  toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
	} else {
		window.open(url,newName,
						'height=570, width=590,  toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
	}
}

function closethewindow(url) { // 要刷新的窗口
	opener.document.location.reload();
	window.close();
}
