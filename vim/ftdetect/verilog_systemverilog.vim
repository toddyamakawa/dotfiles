" Vim filetype plugin file
" plugin only contains: *.v,*.vh,*.vp,*.sv,*.svi,*.svh,*.svp
au! BufNewFile,BufRead *.sva,*.svrb,*.tdf,*.vc,*.vh setfiletype verilog_systemverilog
