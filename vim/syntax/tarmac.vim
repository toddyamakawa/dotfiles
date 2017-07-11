
" :help group

" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif

" --- Timestamps ---
" Display timestamps as comments
hi def link tarmac_ts Comment
syn region tarmac_ts start=/\v^\s*\d/ end=/tic ES/

" --- Opcode ---
"hi def link tarmac_opcode Function
"syn match tarmac_opcode /\v:\zs[0-9a-f0]+\ze\)/

" --- Address ---
hi def link tarmac_addr Statement
syn match tarmac_addr /\v\(\zs[0-9a-f]+\ze:/

" --- Instructions ---
hi def link tarmac_instr Operator
syn keyword tarmac_instr ADC ADCS ADD ADDS ADR ADRP AND ANDS ASR ASR ASRV AT
syn keyword tarmac_instr B BFC BFI BFM BFXIL BIC BICS BL BLR BR BRK
syn keyword tarmac_instr CAS CASA CASAL CASL CASB CASAB CASALB CASLB CASH CASAH CASALH CASLH CASP CASPA CASPAL CASPL
syn keyword tarmac_instr CBNZ CBZ CCMN CCMP CINC CINV
syn keyword tarmac_instr CLREX CLS CLZ CMN CMP CNEG
syn keyword tarmac_instr CRC32B CRC32H CRC32W CRC32X CRC32 CRC32CB CRC32CH CRC32CW CRC32CX CRC32C
syn keyword tarmac_instr CSEL CSET CSETM CSINC CSINV CSNEG
syn keyword tarmac_instr DC DCPS1 DCPS2 DCPS3 DMB DRPS DSB
syn keyword tarmac_instr EON EOR EOR ERET ESB EXTR
syn keyword tarmac_instr HINT HLT HVC
syn keyword tarmac_instr IC ISB
syn keyword tarmac_instr LDADD LDADDA LDADDAL LDADDL
syn keyword tarmac_instr LDADDB LDADDAB LDADDALB LDADDLB
syn keyword tarmac_instr LDADDH LDADDAH LDADDALH LDADDLH
syn keyword tarmac_instr LDAR LDARB LDARH LDAXP LDAXR LDAXRB LDAXRH
syn keyword tarmac_instr LDCLR LDCLRA LDCLRAL LDCLRL
syn keyword tarmac_instr LDCLRB LDCLRAB LDCLRALB LDCLRLB
syn keyword tarmac_instr LDCLRH LDCLRAH LDCLRALH LDCLRLH
syn keyword tarmac_instr LDEOR LDEORA LDEORAL LDEORL
syn keyword tarmac_instr LDEORB LDEORAB LDEORALB LDEORLB
syn keyword tarmac_instr LDEORH LDEORAH LDEORALH LDEORLH
syn keyword tarmac_instr LDLAR LDLARB LDLARH LDNP LDP LDPSW
syn keyword tarmac_instr LDR LDRB LDRH LDRSB LDRSH LDRSW
syn keyword tarmac_instr LDSET LDSETA LDSETAL LDSETL
syn keyword tarmac_instr LDSETB LDSETAB LDSETALB LDSETLB
syn keyword tarmac_instr LDSETH LDSETAH LDSETALH LDSETLH
syn keyword tarmac_instr LDSMAX LDSMAXA LDSMAXAL LDSMAXL
syn keyword tarmac_instr LDSMAXB LDSMAXAB LDSMAXALB LDSMAXLB
syn keyword tarmac_instr LDSMAXH LDSMAXAH LDSMAXALH LDSMAXLH
syn keyword tarmac_instr LDSMIN LDSMINA LDSMINAL LDSMINL
syn keyword tarmac_instr LDSMINB LDSMINAB LDSMINALB LDSMINLB
syn keyword tarmac_instr LDSMINH LDSMINAH LDSMINALH LDSMINLH
syn keyword tarmac_instr LDTR LDTRB LDTRH LDTRSB LDTRSH LDTRSW
syn keyword tarmac_instr LDUMAX LDUMAXA LDUMAXAL LDUMAXL
syn keyword tarmac_instr LDUMAXB LDUMAXAB LDUMAXALB LDUMAXLB
syn keyword tarmac_instr LDUMAXH LDUMAXAH LDUMAXALH LDUMAXLH
syn keyword tarmac_instr LDUMIN LDUMINA LDUMINAL LDUMINL
syn keyword tarmac_instr LDUMINB LDUMINAB LDUMINALB LDUMINLB
syn keyword tarmac_instr LDUMINH LDUMINAH LDUMINALH LDUMINLH
syn keyword tarmac_instr LDUR LDURB LDURH LDURSB LDURSH LDURSW
syn keyword tarmac_instr LDXP LDXR LDXRB LDXRH
syn keyword tarmac_instr LSL LSLV LSR LSRV
syn keyword tarmac_instr MADD MNEG MOV MOVK MOVN MOVZ
syn keyword tarmac_instr MRS MSR MSR MSUB MUL MVN
syn keyword tarmac_instr NEG NEGS NGC NGCS NOP
syn keyword tarmac_instr ORN ORR ORR
syn keyword tarmac_instr PRFM PRFM PRFM PRFM PSB
syn keyword tarmac_instr RBIT RET REV REV16 REV32 REV64 ROR ROR RORV
syn keyword tarmac_instr SBC SBCS SBFIZ SBFM SBFX SDIV SEV SEVL
syn keyword tarmac_instr SMADDL SMC SMNEGL SMSUBL SMULH SMULL
syn keyword tarmac_instr STADD STADDL STADDB STADDLB STADDH STADDLH
syn keyword tarmac_instr STCLR STCLRL STCLRB STCLRLB STCLRH STCLRLH
syn keyword tarmac_instr STEOR STEORL STEORB STEORLB STEORH STEORLH
syn keyword tarmac_instr STLLR STLLRB STLLRH STLR STLRB STLRH
syn keyword tarmac_instr STLXP STLXR STLXRB STLXRH
syn keyword tarmac_instr STNP STP STR STRB STRH
syn keyword tarmac_instr STSET STSETL STSETB STSETLB STSETH STSETLH
syn keyword tarmac_instr STSMAX STSMAXL STSMAXB STSMAXLB STSMAXH STSMAXLH
syn keyword tarmac_instr STSMIN STSMINL STSMINB STSMINLB STSMINH STSMINLH
syn keyword tarmac_instr STTR STTRB STTRH
syn keyword tarmac_instr STUMAX STUMAXL STUMAXB STUMAXLB STUMAXH STUMAXLH
syn keyword tarmac_instr STUMIN STUMINL STUMINB STUMINLB STUMINH STUMINLH
syn keyword tarmac_instr STUR STURB STURH STXP STXR STXRB STXRH
syn keyword tarmac_instr SUB SUBS SVC
syn keyword tarmac_instr SWP SWPA SWPAL SWPL
syn keyword tarmac_instr SWPB SWPAB SWPALB SWPLB
syn keyword tarmac_instr SWPH SWPAH SWPALH SWPLH
syn keyword tarmac_instr SXTB SXTH SXTW SYS SYSL
syn keyword tarmac_instr TBNZ TBZ TLBI TST TST
syn keyword tarmac_instr UBFIZ UBFM UBFX UDIV
syn keyword tarmac_instr UMADDL UMNEGL UMSUBL UMULH UMULL UXTB UXTH
syn keyword tarmac_instr WFE WFI YIELD

" --- End Syntax ---
let b:current_syntax = "tarmac"

