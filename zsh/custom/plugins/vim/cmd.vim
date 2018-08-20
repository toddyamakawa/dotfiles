
nmap <buffer> <Enter> <Plug>SendCommand
nnoremap <silent> <Plug>SendCommand :<C-U>call <SID>SendToCommandLine()<CR>

function s:SendToCommandLine()
	let l:line = getline('.')
	let line = getline('.')
	"echo l:line
	"!echo command: l:line
	"!echo &getline('.')
	" TODO: Figure out how to escape to shell and execute command
	execute '!echo "' . l:line . '"'
	"!echo command: %
endfunction

