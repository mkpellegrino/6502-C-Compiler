%{
#include "y.tab.h"
 int countn=0;
%}
%option yylineno

alpha [a-zA-Z]
digit [0-9]
frmt  [{\t}|{\n}]
unary "++"|"--"

%%
"tofloat"   { strcpy(yylval.nd_obj.name,(yytext)); return tTOFLOAT; }
"touint"   { strcpy(yylval.nd_obj.name,(yytext)); return tTOUINT; }
"cls"           { strcpy(yylval.nd_obj.name,(yytext)); return tCLS; }
"getin"           { strcpy(yylval.nd_obj.name,(yytext)); return tGETIN; }
"mob"               { strcpy(yylval.nd_obj.name,(yytext)); return tMOB; }
"spritexy"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEXY; }
"spritecolour"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITECOLOUR; }
"spriteon"               { strcpy(yylval.nd_obj.name,(yytext)); return tSPRITEON; }
"tan"                    { strcpy(yylval.nd_obj.name,(yytext)); return tTAN; }
"sin"                    { strcpy(yylval.nd_obj.name,(yytext)); return tSIN; }
"cos"                    { strcpy(yylval.nd_obj.name,(yytext)); return tCOS; }
"jsr"                    { strcpy(yylval.nd_obj.name,(yytext)); return tJSR; }
"twos"                   { strcpy(yylval.nd_obj.name,(yytext)); return tTWOS; }
"byte2hex"                   { strcpy(yylval.nd_obj.name,(yytext)); return tBYTE2HEX; }
"rts"                    { strcpy(yylval.nd_obj.name,(yytext)); return tRTS; }
"peek"                    { strcpy(yylval.nd_obj.name,(yytext)); return tPEEK; }
"poke"                    { strcpy(yylval.nd_obj.name,(yytext)); return tPOKE; }
"printf"                    { strcpy(yylval.nd_obj.name,(yytext)); return PRINTFF; }
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
"true"                      { strcpy(yylval.nd_obj.name,(yytext)); return TRUE; }
"false"                     { strcpy(yylval.nd_obj.name,(yytext)); return FALSE; }
[-]?{digit}+\.{digit}+      { strcpy(yylval.nd_obj.name,(yytext)); return FLOAT_NUM; }
[-]?{digit}+                { strcpy(yylval.nd_obj.name,(yytext)); return NUMBER; }
{alpha}({alpha}|{digit})*   { strcpy(yylval.nd_obj.name,(yytext)); return ID; }
{unary}                     { strcpy(yylval.nd_obj.name,(yytext)); return UNARY; }
"<="                        { strcpy(yylval.nd_obj.name,(yytext)); return LE; }
">="                        { strcpy(yylval.nd_obj.name,(yytext)); return GE; }
"=="                        { strcpy(yylval.nd_obj.name,(yytext)); return EQ; }
"!="                        { strcpy(yylval.nd_obj.name,(yytext)); return NE; }
">"	                        { strcpy(yylval.nd_obj.name,(yytext)); return GT; }
"<"	                        { strcpy(yylval.nd_obj.name,(yytext)); return LT; }
"&&"	                    { strcpy(yylval.nd_obj.name,(yytext)); return AND; }
"||"	                    { strcpy(yylval.nd_obj.name,(yytext)); return OR; }
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
