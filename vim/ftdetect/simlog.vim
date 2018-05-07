function! s:DetectSimLog()
   if getline(2) =~ '^sim_tb'
     setfiletype simlog
   endif
endfunction
au BufRead,BufNewFile *.log call s:DetectSimLog()
