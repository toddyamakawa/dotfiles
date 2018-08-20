
" Setup tmhedberg/matchit plugin
let b:match_ignorecase=0
let b:match_words=
	\ '\<begin\>:\<end\>,' .
	\ '\<if\>:\<else\>,' .
	\ '\<module\>:\<endmodule\>,' .
	\ '\<class\>:\<endclass\>,' .
	\ '\<program\>:\<endprogram\>,' .
	\ '\<clocking\>:\<endclocking\>,' .
	\ '\<property\>:\<endproperty\>,' .
	\ '\<sequence\>:\<endsequence\>,' .
	\ '\<package\>:\<endpackage\>,' .
	\ '\<covergroup\>:\<endgroup\>,' .
	\ '\<primitive\>:\<endprimitive\>,' .
	\ '\<specify\>:\<endspecify\>,' .
	\ '\<generate\>:\<endgenerate\>,' .
	\ '\<interface\>:\<endinterface\>,' .
	\ '\<function\>:\<endfunction\>,' .
	\ '\<task\>:\<endtask\>,' .
	\ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
	\ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
	\ '`ifdef\>:`else\>:`endif\>,'

