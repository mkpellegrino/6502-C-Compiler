%{
#include "y.tab.h"
 int countn=0;
%}
%option yylineno
halpha[a-fA-F]
alpha [a-zA-Z]
digit [0-9]
frmt  [{\t}|{\n}]

%%
"sprptr"          { strcpy(yylval.nd_obj.name,(yytext)); return tSPRPTR; }
"ptr"             { strcpy(yylval.nd_obj.name,(yytext)); return tPOINTER; }
"irq"              { strcpy(yylval.nd_obj.name,(yytext)); return tIRQ; }
"sidoff"              { strcpy(yylval.nd_obj.name,(yytext)); return tSIDOFF; }
"seed"              { strcpy(yylval.nd_obj.name,(yytext)); return tSEED; }
"memcpy"              { strcpy(yylval.nd_obj.name,(yytext)); return tMEMCPY; }
"NULL"                { strcpy(yylval.nd_obj.name,(yytext)); return tNULL; }
"push"                { strcpy(yylval.nd_obj.name,(yytext)); return tPUSH; }
"pop"                { strcpy(yylval.nd_obj.name,(yytext)); return tPOP; }
"screen"                { strcpy(yylval.nd_obj.name,(yytext)); return tSCREEN; }
"asmcomment"                { strcpy(yylval.nd_obj.name,(yytext)); return tCOMMENT; }
"data"                { strcpy(yylval.nd_obj.name,(yytext)); return tDATA; }
"sidirq"                { strcpy(yylval.nd_obj.name,(yytext)); return tSIDIRQ; }
"foo"                { strcpy(yylval.nd_obj.name,(yytext)); return tFOO; }
"tobit"               { strcpy(yylval.nd_obj.name,(yytext)); return tTOBIT; }
"romout"               { strcpy(yylval.nd_obj.name,(yytext)); return tROMOUT; }
"romin"               { strcpy(yylval.nd_obj.name,(yytext)); return tROMIN; }
"bank"               { strcpy(yylval.nd_obj.name,(yytext)); return tBANK; }
"rol"               { strcpy(yylval.nd_obj.name,(yytext)); return tROL; }
"ror"               { strcpy(yylval.nd_obj.name,(yytext)); return tROR; }
"asl"               { strcpy(yylval.nd_obj.name,(yytext)); return tASL; }
"lsr"               { strcpy(yylval.nd_obj.name,(yytext)); return tLSR; }
"dec"               { strcpy(yylval.nd_obj.name,(yytext)); return tDEC; }
"inc"               { strcpy(yylval.nd_obj.name,(yytext)); return tINC; }
"mob"               { strcpy(yylval.nd_obj.name,(yytext)); return tMOB; }
"plot"              { strcpy(yylval.nd_obj.name,(yytext)); return tPLOT; }
"getbmp_addr"            { strcpy(yylval.nd_obj.name,(yytext)); return tGETBMP; }
"getscr_addr"            { strcpy(yylval.nd_obj.name,(yytext)); return tGETSCR; }
"setscr_addr"            { strcpy(yylval.nd_obj.name,(yytext)); return tSETSCR; }
"getbank_addr"            { strcpy(yylval.nd_obj.name,(yytext)); return tGETBANK; }
"getaddr"             { strcpy(yylval.nd_obj.name,(yytext)); return tGETADDR; }
"getxy"             { strcpy(yylval.nd_obj.name,(yytext)); return tGETXY; }
"spritexy"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEXY; }
"spritex"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEX; }
"spritey"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEY; }
"spritecolour"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITECOLOUR; }
"spritetoggle"     { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITETOGGLE; }
"spriteoff"        { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEOFF; }
"spriteset"        { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITESET; }
"spriteon"         { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEON; }
"spritecollision"  { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITECOLLISION; }
"mobbkgcollision"  { strcpy(yylval.nd_obj.name,(yytext)); return tMOBBKGCOLLISION; }
"rnd"    { strcpy(yylval.nd_obj.name,(yytext)); return tRND; }
"cursorxy"    { strcpy(yylval.nd_obj.name,(yytext)); return tCURSORXY; }
"nop"   { strcpy(yylval.nd_obj.name,(yytext)); return tNOP; }
"strtoword" { strcpy(yylval.nd_obj.name,(yytext)); return tSTRTOWORD; }
"strtofloat" { strcpy(yylval.nd_obj.name,(yytext)); return tSTRTOFLOAT; }
"tofloat"   { strcpy(yylval.nd_obj.name,(yytext)); return tTOFLOAT; }
"touint"   { strcpy(yylval.nd_obj.name,(yytext)); return tTOUINT; }
"cls"           { strcpy(yylval.nd_obj.name,(yytext)); return tCLS; }
"getin"           { strcpy(yylval.nd_obj.name,(yytext)); return tGETIN; }
"getchar"           { strcpy(yylval.nd_obj.name,(yytext)); return tGETCHAR; }
"sqrt"                   { strcpy(yylval.nd_obj.name,(yytext)); return tSQRT; }
"tan"                    { strcpy(yylval.nd_obj.name,(yytext)); return tTAN; }
"sin"                    { strcpy(yylval.nd_obj.name,(yytext)); return tSIN; }
"cos"                    { strcpy(yylval.nd_obj.name,(yytext)); return tCOS; }
"jsr"                    { strcpy(yylval.nd_obj.name,(yytext)); return tJSR; }
"lda"                    { strcpy(yylval.nd_obj.name,(yytext)); return tLDA; }
"jmp"                    { strcpy(yylval.nd_obj.name,(yytext)); return tJMP; }
"twos"                   { strcpy(yylval.nd_obj.name,(yytext)); return tTWOS; }
"byte2hex"                   { strcpy(yylval.nd_obj.name,(yytext)); return tBYTE2HEX; }
"rts"                    { strcpy(yylval.nd_obj.name,(yytext)); return tRTS; }
"peek"                    { strcpy(yylval.nd_obj.name,(yytext)); return tPEEK; }
"getH"                    { strcpy(yylval.nd_obj.name,(yytext)); return tGETH; }
"getL"                    { strcpy(yylval.nd_obj.name,(yytext)); return tGETL; }
"poke"                    { strcpy(yylval.nd_obj.name,(yytext)); return tPOKE; }
"printf"                    { strcpy(yylval.nd_obj.name,(yytext)); return PRINTFF; }
"prints"                    { strcpy(yylval.nd_obj.name,(yytext)); return tPRINTS; }
"scanf"                     { strcpy(yylval.nd_obj.name,(yytext)); return SCANFF; }
"int"                       { strcpy(yylval.nd_obj.name,(yytext)); return INT; }
"float"                     { strcpy(yylval.nd_obj.name,(yytext)); return FLOAT; }
"double"                    { strcpy(yylval.nd_obj.name,(yytext)); return tDOUBLE; }
"word"                    { strcpy(yylval.nd_obj.name,(yytext)); return tWORD; }
"byte"                    { strcpy(yylval.nd_obj.name,(yytext)); return tBYTE; }
"uint"                    { strcpy(yylval.nd_obj.name,(yytext)); return tUINT; }
"char"                      { strcpy(yylval.nd_obj.name,(yytext)); return CHAR; }
"void"                      { strcpy(yylval.nd_obj.name,(yytext)); return VOID; }
"return"                    { strcpy(yylval.nd_obj.name,(yytext)); return RETURN; }
"for"	                    { strcpy(yylval.nd_obj.name,(yytext)); return FOR; }
"while"	                    { strcpy(yylval.nd_obj.name,(yytext)); return WHILE; }
"if"	                    { strcpy(yylval.nd_obj.name,(yytext)); return IF; }
"else"	                    { strcpy(yylval.nd_obj.name,(yytext)); return ELSE; }
^"#include"[ ]*<.+\.h>      { strcpy(yylval.nd_obj.name,(yytext)); return INCLUDE; }
^"#include"[ ]*<.+\.asm>      { strcpy(yylval.nd_obj.name,(yytext)); return INCLUDE; }
^"#include"[ ]*<.+\.c>      { strcpy(yylval.nd_obj.name,(yytext)); return INCLUDE; }
"true"                      { strcpy(yylval.nd_obj.name,(yytext)); return TRUE; }
"false"                     { strcpy(yylval.nd_obj.name,(yytext)); return FALSE; }
"0x"({digit}|{halpha})+      { strcpy(yylval.nd_obj.name,(yytext)); return HEX_NUM; }
[-]?{digit}+\.{digit}+      { strcpy(yylval.nd_obj.name,(yytext)); return FLOAT_NUM; }
[-]?{digit}+                { strcpy(yylval.nd_obj.name,(yytext)); return NUMBER; }
{alpha}({alpha}|{digit})*   { strcpy(yylval.nd_obj.name,(yytext)); return ID; }
"++"                        { strcpy(yylval.nd_obj.name,(yytext)); return tPLUSPLUS; }
"--"                        { strcpy(yylval.nd_obj.name,(yytext)); return tMINUSMINUS; }
"<="                        { strcpy(yylval.nd_obj.name,(yytext)); return LE; }
">="                        { strcpy(yylval.nd_obj.name,(yytext)); return GE; }
"=="                        { strcpy(yylval.nd_obj.name,(yytext)); return EQ; }
"!="                        { strcpy(yylval.nd_obj.name,(yytext)); return NE; }
">"	                        { strcpy(yylval.nd_obj.name,(yytext)); return GT; }
"<"	                        { strcpy(yylval.nd_obj.name,(yytext)); return LT; }
"&"	                    { strcpy(yylval.nd_obj.name,(yytext)); return tbwAND; }
"~"	                    { strcpy(yylval.nd_obj.name,(yytext)); return tbwNOT; }
"|"	                    { strcpy(yylval.nd_obj.name,(yytext)); return tbwOR; }
"&&"	                    { strcpy(yylval.nd_obj.name,(yytext)); return tAND; }
"||"	                    { strcpy(yylval.nd_obj.name,(yytext)); return tOR; }
"+"                         { strcpy(yylval.nd_obj.name,(yytext)); return ADD; }
"-"                         { strcpy(yylval.nd_obj.name,(yytext)); return SUBTRACT; }
"/"                         { strcpy(yylval.nd_obj.name,(yytext)); return DIVIDE; }
"*"                         { strcpy(yylval.nd_obj.name,(yytext)); return MULTIPLY; }
\/\/.*                      { ; }
\/\*(.*\n)*.*\*\/           { ; } 
[ \t]*                      { ; }
[\n]                        { countn++;}

.	                        { return *yytext; }
\"([^\\\"]|\\.)*\"                    { strcpy(yylval.nd_obj.name,(yytext)); return STR; }

['].[']                     { strcpy(yylval.nd_obj.name,(yytext)); return CHARACTER; }
%%

int yywrap() {
    return 1;
}
