
function! SimlogFolds()
	let line = getline(v:lnum)
	let nextline = getline(v:lnum + 1)
	let prevline = getline(v:lnum - 1)

	" Reset fold level
	if match(line, '\v^# UVM_INFO [^:]') > -1
		return '>0'
	elseif match(line, '\v^# UVM_FATAL') > -1
		return '>0'
	elseif match(line, '\v^# --- UVM Report Summary ---') > -1
		return '>0'

	" Set foldlevel=1 if previous line is UVM_INFO
	elseif match(prevline, '\v^# UVM_INFO [^:]') > -1
		return '>1'

	" Keep current fold level
	else
		return '='
	endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=SimlogFolds()

