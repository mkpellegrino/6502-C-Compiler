%{
#include<stdio.h>
  //#include<string.h>
#include <iostream>

#include<string>
#include<stdlib.h>
#include<ctype.h>
#include<cctype>
#include<vector>
#include"lex.yy.c"
using namespace std;

 int variable_start=828; // 98 2 byte variables
 int code_start=49152;

 // helper function
 string toString( int i )
 {
   return std::to_string(i);
 }
 
 class asm_variable
 {
 public:
   asm_variable( string identifier )
     {
       name=identifier;
       address=variable_start;
       variable_start+=2;
     }
   string getAddress(){ return toString(address); };
   string getName(){ return name; };
 private:
   int address; // somewhere between 0 and 65535
   string name;
 };

 vector<asm_variable*> asm_variables;

 int getIndexOf( string s )
 {
   int return_value=-1;
   for( int i=0; i<asm_variables.size(); i++ )
     {
       if( asm_variables[i]->getName() == s )
	 {
	   return i;
	 }
     }
   return return_value;
 }

 string getAddressOf( int i )
 {
   return asm_variables[i]->getAddress();
 }

 string getAddressOf( string s )
 {
   int i=getIndexOf( s );
   if( i == -1 )
     {
       return string( "[ERROR] - Variable not found in vector" );
     }
   else
     {
       return asm_variables[i]->getAddress();
     }

 }


  // I really should add opcodes to these instructions
  class asm_instruction
  {
  public:
    asm_instruction( string s )
      {
	text=s;
	b_label=false;
	memory_address = 0x0000;
	size=4;
      };
    asm_instruction()
      {
	text=string("NOP");
	b_label=false;
	memory_address = 0x0000;
	size=4;
      };
    ~asm_instruction(){};
    string getString(){ return text; };
    void setString( string s ){ text=s; };
    bool isLabel(){return b_label;};
    void setLabel( bool tf=true ){ b_label = tf; };
    void setAddress( int a ){ memory_address = a; };
    int getAddress(){ return memory_address; };
    void setSize( int s ){ size = s; };
    int getSize(){ return size; };


    friend ostream &operator << (ostream &out, const asm_instruction &a); 

  private:
    string text;
    int memory_address;
    bool b_label;
    int size; // how many bytes the code takes up on the 6502
  };

  ostream & operator << (ostream &out, const asm_instruction &a) 
    {
      if( !a.b_label) out << "\t";
      out << a.text << endl;
      return out;
    }

  
  vector<asm_instruction*> asm_instr;
  
  int asm_line_count = 0;
  
  void addAsm( string s, bool l = false)
  {
    asm_instruction * my_asm = new asm_instruction( s );
    my_asm->setLabel(l);
    my_asm->setSize( 4 ); // this should not ALWAYS be 4, so change this later to calculate the size of the instruction
    my_asm->setAddress( 0 ); // this should be changed later to set the address to some value
    asm_line_count++;
    asm_instr.push_back( my_asm );
    return;
  }
  
  void yyerror(const char *s);
  int yylex();
  int yywrap();
  void add(char);
  void insert_type();
  int search(char *);
  void insert_type();
  void print_tree(struct node*);
  void print_tree_util(struct node*, int);
  void print_inorder(struct node *);
  void check_declaration(char *);
  void check_return_type(char *);
  int check_types(char *, char *);
  char *get_type(char *);
  struct node* mknode(struct node *left, struct node *right, char *token);

  struct dataType {
    char * id_name;
    char * data_type;
    char * type;
    int line_no;
  } symbol_table[50];

  int byte_counter = 0;

  // this is an array that holds all of the
  // Label #'s that are just after coming out
  // of a for-loop.
  int labels[100];

  // this is to see how embedded we are in loops
  int loop_level=0;
  int for_level=0;
  int count=0;
  int q;
  char type[10];
  extern int countn;
  struct node *head;
  int sem_errors=0;
  int ic_idx=0;
  int temp_var=0;
  int label=0;
  int is_for=0;
  char buff[100];
  char errors[10][100];
  char reserved[10][10] = {"int", "float", "char", "void", "if", "else", "for", "main", "return", "include"};
  char icg[50][100];

  struct node { 
    struct node *left; 
    struct node *right; 
    char *token; 
  };

  //  void addAsm()
  // {
  //  addAsm(icg[ic_idx-1], false);
  //  return;
  //}
      
  %}

%union { struct var_name { 
  char name[100]; 
  struct node* nd;
} nd_obj;

  struct var_name2 { 
    char name[100]; 
    struct node* nd;
    char type[5];
  } nd_obj2; 

  struct var_name3 {
    char name[100];
    struct node* nd;
    char if_body[5];
    char else_body[5];
  } nd_obj3;
} 
%token VOID 
%token <nd_obj> CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY INCLUDE RETURN 
%type <nd_obj> headers main body return datatype statement arithmetic relop program else
   %type <nd_obj2> init value expression
      %type <nd_obj3> condition

      %%

      program: headers main '(' ')' '{' body return '}' { $2.nd = mknode($6.nd, $7.nd, "main"); $$.nd = mknode($1.nd, $2.nd, "program"); 
     head = $$.nd;
   } 
;

headers: headers headers { $$.nd = mknode($1.nd, $2.nd, "headers"); }
| INCLUDE { add('H'); } { $$.nd = mknode(NULL, NULL, $1.name); }
;

main: datatype ID { add('F'); }
;

datatype: INT { insert_type(); }
| FLOAT { insert_type(); }
| CHAR { insert_type(); }
| VOID { insert_type(); }
;

body: FOR { add('K'); is_for = 1; } '(' statement ';' condition ';' statement ')' '{' body '}'
{
  
  struct node *temp = mknode($6.nd, $8.nd, "CONDITION"); 
  struct node *temp2 = mknode($4.nd, temp, "CONDITION"); 
  $$.nd = mknode(temp2, $11.nd, $1.name);
  sprintf(icg[ic_idx++], buff);
  // addAsm( "Testing 1 2 3", false );
  addAsm(icg[ic_idx-1], false );

  //addAsm( string( "JUMP to " ) + string( $6.if_body ));
  sprintf(icg[ic_idx++], "JMP %s", $6.if_body);
  addAsm(icg[ic_idx-1], false );

  sprintf(icg[ic_idx++], "LABEL %s:\t\t// END FOR", $6.else_body);
  addAsm(icg[ic_idx-1], true ); // label;

  // END FOR
  {
    addAsm( "PLA" );
    addAsm( "TAY" );
    addAsm( "PLA" );
    addAsm( "TAX" );
    addAsm( "PLP" );
    addAsm( "PLA" );
    sprintf( icg[ic_idx++], "\tPLA\n\tTAY\n\tPLA\n\tTAX\n\tPLP\n\tPLA\n", "" );
  }
}


| IF { add('K'); is_for = 0; } '(' condition ')' { sprintf(icg[ic_idx++], "***LABEL %s:", $4.if_body); addAsm(icg[ic_idx-1], true); } '{' body '}' { sprintf(icg[ic_idx++], "****LABEL %s:", $4.else_body); addAsm(icg[ic_idx-1], true);}
 else
   { 
     struct node *iff = mknode($4.nd, $8.nd, $1.name); 
     $$.nd = mknode(iff, $11.nd, "if-else");
     addAsm( "GOTO next (??? what even IS this instruction?!)" );
     sprintf(icg[ic_idx++], "GOTO next");
 }
| statement ';' { $$.nd = $1.nd; }
| body body { $$.nd = mknode($1.nd, $2.nd, "statements"); }
| PRINTFF { add('K'); } '(' STR ')' ';' { $$.nd = mknode(NULL, NULL, "printf"); }
| SCANFF { add('K'); } '(' STR ',' '&' ID ')' ';' { $$.nd = mknode(NULL, NULL, "scanf"); }
;

 else: ELSE { add('K'); } '{' body '}' { $$.nd = mknode(NULL, $4.nd, $1.name); }
| { $$.nd = NULL; }
;



condition: value relop value
{
  // $1.name = variable
  // $2.name = comparison
  // $3.name = value
  //for( ---; $1 $2 $3; --- )
  //for( ...;  i <  10; ... )
  
  $$.nd = mknode($1.nd, $3.nd, $2.name); 
  if(is_for)
    {
      for_level++;
      // 2022 09 06 - Adding Assembly Instructions
      addAsm( string( "// FOR LOOP variable is: " ) + string( $$.name ), false );
      sprintf(icg[ic_idx++], "\n// FOR LOOP variable is: %s\n (FOR LEVEL: %d)\n", $$.name, for_level  );
      sprintf(icg[ic_idx++], "// push A, X, Y, and Proc. Status onto Stack\n\tPHA\n\tPHP\n\tTXA\n\tPHA\n\tTYA\n\tPHA\n", "" );
      addAsm( "PHA", false);
      addAsm( "PHP", false);
      addAsm( "TXA", false);
      addAsm( "PHA", false);
      addAsm( "TYA", false);
      addAsm( "PHA", false);
      // set the variable for the loop
      // the name is stored in $$.name
      // look that up in the var vactor
      // then (if found) get it's address


      // this is setting a label to show up in the pseudocode
      // this is the label at the top of the loop
      sprintf($$.if_body, "L%d", label++);
      sprintf(icg[ic_idx++], "LABEL %s:\t\t// BEGIN FOR", $$.if_body);
      addAsm(icg[ic_idx-1], true );

      int var_index = getIndexOf( $$.name );
      if( var_index == -1 )
	{
	  cerr << "// [ERROR] Variable [" << $$.name << "] not found in vvector!" << endl;
	  addAsm( "NOP", false );
	  addAsm( "NOP", false );
	  addAsm( "NOP", false );	  
	}
      else
	{ 
	  addAsm( string( "// LDX &" ) + string( $$.name ), false );
	  addAsm( string( "LDX &" ) + asm_variables[ var_index ]->getAddress(), false );
	  sprintf(icg[ic_idx++], "LDX (addr_of_%s)", $$.name );
	}
      
      
      sprintf(icg[ic_idx++], "// if NOT (%s %s %s) jmp to L%d:", $1.name, $2.name, $3.name, label);
      addAsm(icg[ic_idx-1], false );
      sprintf(icg[ic_idx++], "CPX %s", $3.name );
      addAsm(icg[ic_idx-1], false );
      sprintf(icg[ic_idx++], "BCS L%d", label );
      addAsm(icg[ic_idx-1], false);

      
      //sprintf(icg[ic_idx++], "DEX", "" );
      //addAsm(icg[ic_idx-1], false);
      
      sprintf($$.else_body, "L%d", label++);
      labels[label] = 1;
    }
  else
    {
      sprintf(icg[ic_idx++], "if (%s %s %s) GOTO L%d else GOTO L%d // (while)", $1.name, $2.name, $3.name, label, label+1);
      addAsm(icg[ic_idx-1], false);
      sprintf($$.if_body, "L%d", label++);
      sprintf($$.else_body, "L%d", label++);
    }
 }
| TRUE { add('K'); $$.nd = NULL; }
| FALSE { add('K'); $$.nd = NULL; }
| { $$.nd = NULL; }
;

statement: datatype ID { add('V'); } init
{
   
  $2.nd = mknode(NULL, NULL, $2.name); 
  int t = check_types($1.name, $4.type); 
  if(t>0) { 
    if(t == 1) {
      struct node *temp = mknode(NULL, $4.nd, "floattoint"); 
      $$.nd = mknode($2.nd, temp, "declaration"); 
    } 
    else if(t == 2) { 
      struct node *temp = mknode(NULL, $4.nd, "inttofloat"); 
      $$.nd = mknode($2.nd, temp, "declaration"); 
    } 
    else if(t == 3) { 
      struct node *temp = mknode(NULL, $4.nd, "chartoint"); 
      $$.nd = mknode($2.nd, temp, "declaration"); 
    } 
    else if(t == 4) { 
      struct node *temp = mknode(NULL, $4.nd, "inttochar"); 
      $$.nd = mknode($2.nd, temp, "declaration"); 
    } 
    else if(t == 5) { 
      struct node *temp = mknode(NULL, $4.nd, "chartofloat"); 
      $$.nd = mknode($2.nd, temp, "declaration"); 
    } 
    else{
      struct node *temp = mknode(NULL, $4.nd, "floattochar"); 
      $$.nd = mknode($2.nd, temp, "declaration"); 
    }
  } 
  else
    { 
      $$.nd = mknode($2.nd, $4.nd, "declaration"); 
    } 

  // variable initialization

  sprintf(icg[ic_idx++], "// %s = %s", $2.name, $4.name);
  addAsm(icg[ic_idx-1], false );
  
  asm_variable * v = new asm_variable( $2.name );

  asm_variables.push_back( v ); // add the variable to the list of variables

  addAsm( string("LDA ") + string($4.name ) );
  addAsm( string("STA &") + getAddressOf( getIndexOf( $2.name )) + string( " // line 412"));
}

| ID { check_declaration($1.name); } '=' expression {
  $1.nd = mknode(NULL, NULL, $1.name); 
  char *id_type = get_type($1.name); 
  if(strcmp(id_type, $4.type)) {
    if(!strcmp(id_type, "int")) {
      if(!strcmp($4.type, "float")){
	struct node *temp = mknode(NULL, $4.nd, "floattoint");
	$$.nd = mknode($1.nd, temp, "="); 
      }
      else{
	struct node *temp = mknode(NULL, $4.nd, "chartoint");
	$$.nd = mknode($1.nd, temp, "="); 
      }
			
    }
    else if(!strcmp(id_type, "float")) {
      if(!strcmp($4.type, "int")){
	struct node *temp = mknode(NULL, $4.nd, "inttofloat");
	$$.nd = mknode($1.nd, temp, "="); 
      }
      else{
	struct node *temp = mknode(NULL, $4.nd, "chartofloat");
	$$.nd = mknode($1.nd, temp, "="); 
      }
			
    }
    else{
      if(!strcmp($4.type, "int")){
	struct node *temp = mknode(NULL, $4.nd, "inttochar");
	$$.nd = mknode($1.nd, temp, "="); 
      }
      else{
	struct node *temp = mknode(NULL, $4.nd, "floattochar");
	$$.nd = mknode($1.nd, temp, "="); 
      }
    }
  }
  else {
    $$.nd = mknode($1.nd, $4.nd, "="); 
  }

  // This is where a variable is given the value of a different variable
  sprintf(icg[ic_idx++], "%s = %s <<==", $1.name, $4.name);
  addAsm(icg[ic_idx-1], false );
				     }
| ID { check_declaration($1.name); } relop expression { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $4.nd, $3.name); }
| ID { check_declaration($1.name); } UNARY { 
  $1.nd = mknode(NULL, NULL, $1.name); 
  $3.nd = mknode(NULL, NULL, $3.name); 
  $$.nd = mknode($1.nd, $3.nd, "ITERATOR");  
  if(!strcmp($3.name, "++")) {
    sprintf(buff, "t%d = %s + 1\n%s = t%d\n// 466", temp_var, $1.name, $1.name, temp_var++);
  }
  else {
    sprintf(buff, "t%d = %s + 1\n%s = t%d\n// 469", temp_var, $1.name, $1.name, temp_var++);
  }
				     }
| UNARY ID { 
  check_declaration($2.name); 
  $1.nd = mknode(NULL, NULL, $1.name); 
  $2.nd = mknode(NULL, NULL, $2.name); 
  $$.nd = mknode($1.nd, $2.nd, "ITERATOR"); 
  if(!strcmp($1.name, "++")) {
    sprintf(buff, "t%d = %s + 1\n%s = t%d\n// 479", temp_var, $2.name, $2.name, temp_var++);
  }
  else {
    sprintf(buff, "t%d = %s - 1\n%s = t%d\n// 482", temp_var, $2.name, $2.name, temp_var++);

  }
				     }
;

init: '=' value { $$.nd = $2.nd; sprintf($$.type, $2.type); strcpy($$.name, $2.name); }
| { sprintf($$.type, "null"); $$.nd = mknode(NULL, NULL, "NULL"); strcpy($$.name, "NULL"); }
;

expression: expression arithmetic expression
{
  addAsm( "// expression arithmetic expression", false );
  if(!strcmp($1.type, $3.type))
    {
      sprintf($$.type, $1.type);
      $$.nd = mknode($1.nd, $3.nd, $2.name); 
    }
  else
    {
      if(!strcmp($1.type, "int") && !strcmp($3.type, "float"))
	{
	  struct node *temp = mknode(NULL, $1.nd, "inttofloat");
	  sprintf($$.type, $3.type);
	  $$.nd = mknode(temp, $3.nd, $2.name);
	}
      else if(!strcmp($1.type, "float") && !strcmp($3.type, "int"))
	{
	  struct node *temp = mknode(NULL, $3.nd, "inttofloat");
	  sprintf($$.type, $1.type);
	  $$.nd = mknode($1.nd, temp, $2.name);
	}
      else if(!strcmp($1.type, "int") && !strcmp($3.type, "char"))
	{
	  struct node *temp = mknode(NULL, $3.nd, "chartoint");
	  sprintf($$.type, $1.type);
	  $$.nd = mknode($1.nd, temp, $2.name);
	}
      else if(!strcmp($1.type, "char") && !strcmp($3.type, "int"))
	{
	  struct node *temp = mknode(NULL, $1.nd, "chartoint");
	  sprintf($$.type, $3.type);
	  $$.nd = mknode(temp, $3.nd, $2.name);
	}
      else if(!strcmp($1.type, "float") && !strcmp($3.type, "char"))
	{
	  struct node *temp = mknode(NULL, $3.nd, "chartofloat");
	  sprintf($$.type, $1.type);
	  $$.nd = mknode($1.nd, temp, $2.name);
	}
      else
	{
	  struct node *temp = mknode(NULL, $1.nd, "chartofloat");
	  sprintf($$.type, $3.type);
	  $$.nd = mknode(temp, $3.nd, $2.name);
	}
    }
  sprintf($$.name, "t%d //", temp_var);
  temp_var++;

  addAsm( "// Place 1", true );
  //addAsm( "// create a new temporary variable", true );
  

  // here is where we should check to see if the
  // variable ($$.name) is already in use (in _this_ scope).
  // .. but we don't yet
  //asm_variable * v = new asm_variable( $$.name );
  //asm_variables.push_back( v );
  
  
  addAsm( string("LDA &") + getAddressOf(string($1.name )));

  addAsm( string("ADC ") + string($3.name ) );
  
  addAsm( string("STA &") + getAddressOf($1.name) );
  
  
  sprintf(icg[ic_idx++], "%s = %s %s %s <<???",  $$.name, $1.name, $2.name, $3.name);
  //addAsm(icg[ic_idx-1], false );
 }

| value { strcpy($$.name, $1.name); sprintf($$.type, $1.type); $$.nd = $1.nd;} 
;

arithmetic: ADD 
| SUBTRACT 
| MULTIPLY
| DIVIDE
;

relop: LT
| GT
| LE
| GE
| EQ
| NE
;

value: NUMBER { strcpy($$.name, $1.name); sprintf($$.type, "int"); add('C'); $$.nd = mknode(NULL, NULL, $1.name); }
| FLOAT_NUM { strcpy($$.name, $1.name); sprintf($$.type, "float"); add('C'); $$.nd = mknode(NULL, NULL, $1.name); }
| CHARACTER { strcpy($$.name, $1.name); sprintf($$.type, "char"); add('C'); $$.nd = mknode(NULL, NULL, $1.name); }
| ID { strcpy($$.name, $1.name); char *id_type = get_type($1.name); sprintf($$.type, id_type); check_declaration($1.name); $$.nd = mknode(NULL, NULL, $1.name); }
;

return: RETURN { add('K'); } value ';' { check_return_type($3.name); $1.nd = mknode(NULL, NULL, "return"); $$.nd = mknode($1.nd, $3.nd, "RETURN"); }
| { $$.nd = NULL; }
;

%%

int main() {
  yyparse();
  printf("\n\n");
  printf("\t\t\t\t\t\t\t\t PHASE 1: LEXICAL ANALYSIS \n\n");
  printf("\nSYMBOL   DATATYPE   TYPE   LINE NUMBER \n");
  printf("_______________________________________\n\n");
  int i=0;
  for(i=0; i<count; i++) {
    printf("%s\t%s\t%s\t%d\t\n", symbol_table[i].id_name, symbol_table[i].data_type, symbol_table[i].type, symbol_table[i].line_no);
  }
  for(i=0;i<count;i++) {
    free(symbol_table[i].id_name);
    free(symbol_table[i].type);
  }
  printf("\n\n");
  printf("\t\t\t\t\t\t\t\t PHASE 2: SYNTAX ANALYSIS \n\n");
  print_tree(head); 
  printf("\n\n\n\n");
  printf("\t\t\t\t\t\t\t\t PHASE 3: SEMANTIC ANALYSIS \n\n");
  if(sem_errors>0) {
    printf("Semantic analysis completed with %d errors\n", sem_errors);
    for(int i=0; i<sem_errors; i++){
      printf("\t - %s", errors[i]);
    }
  } else {
    printf("Semantic analysis completed with no errors");
  }
  printf("\n\n");
  printf("\t\t\t\t\t\t\t   PHASE 4: INTERMEDIATE CODE GENERATION \n\n");

  // dump all the asm instructions that were added to the vector
  for(int i=0; i<asm_instr.size(); i++){cout << *asm_instr[i];}
  cout << endl << endl;
}

int search(char *type) {
  int i;
  for(i=count-1; i>=0; i--) {
    if(strcmp(symbol_table[i].id_name, type)==0) {
      return -1;
      break;
    }
  }
  return 0;
}

void check_declaration(char *c) {
  q = search(c);
  if(!q) {
    sprintf(errors[sem_errors], "Line %d: Variable \"%s\" not declared before usage!\n", countn+1, c);
    sem_errors++;
  }
}

void check_return_type(char *value) {
  char *main_datatype = get_type("main");
  char *return_datatype = get_type(value);
  if((!strcmp(main_datatype, "int") && !strcmp(return_datatype, "CONST")) || !strcmp(main_datatype, return_datatype)){
    return ;
  }
  else {
    sprintf(errors[sem_errors], "Line %d: Return type mismatch\n", countn+1);
    sem_errors++;
  }
}

int check_types(char *type1, char *type2){
  // declaration with no init
  if(!strcmp(type2, "null"))
    return -1;
  // both datatypes are same
  if(!strcmp(type1, type2))
    return 0;
  // both datatypes are different
  if(!strcmp(type1, "int") && !strcmp(type2, "float"))
    return 1;
  if(!strcmp(type1, "float") && !strcmp(type2, "int"))
    return 2;
  if(!strcmp(type1, "int") && !strcmp(type2, "char"))
    return 3;
  if(!strcmp(type1, "char") && !strcmp(type2, "int"))
    return 4;
  if(!strcmp(type1, "float") && !strcmp(type2, "char"))
    return 5;
  if(!strcmp(type1, "char") && !strcmp(type2, "float"))
    return 6;
}

char *get_type(char *var){
  for(int i=0; i<count; i++) {
    // Handle case of use before declaration
    if(!strcmp(symbol_table[i].id_name, var)) {
      return symbol_table[i].data_type;
    }
  }
}

void add(char c) {
  if(c == 'V'){
    for(int i=0; i<10; i++){
      if(!strcmp(reserved[i], strdup(yytext))){
	sprintf(errors[sem_errors], "Line %d: Variable name \"%s\" is a reserved keyword!\n", countn+1, yytext);
	sem_errors++;
	return;
      }
    }
  }
  q=search(yytext);
  if(!q) {
    if(c == 'H') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup(type);
      symbol_table[count].line_no=countn;
      symbol_table[count].type=strdup("Header");
      count++;
    }
    else if(c == 'K') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup("N/A");
      symbol_table[count].line_no=countn;
      symbol_table[count].type=strdup("Keyword\t");
      count++;
    }
    else if(c == 'V') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup(type);
      symbol_table[count].line_no=countn;
      symbol_table[count].type=strdup("Variable");
      count++;
    }
    else if(c == 'C') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup("CONST");
      symbol_table[count].line_no=countn;
      symbol_table[count].type=strdup("Constant");
      count++;
    }
    else if(c == 'F') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup(type);
      symbol_table[count].line_no=countn;
      symbol_table[count].type=strdup("Function");
      count++;
    }
  }
  else if(c == 'V' && q) {
    sprintf(errors[sem_errors], "Line %d: Multiple declarations of \"%s\" not allowed!\n", countn+1, yytext);
    sem_errors++;
  }
}

struct node* mknode(struct node *left, struct node *right, char *token) {	
  struct node *newnode = (struct node *)malloc(sizeof(struct node));
  char *newstr = (char *)malloc(strlen(token)+1);
  strcpy(newstr, token);
  newnode->left = left;
  newnode->right = right;
  newnode->token = newstr;
  return(newnode);
}

// mkpellegrino
struct node* createNode( char *token )
{
  struct node* Node = (struct node*) malloc( sizeof(struct node));
  Node->token = token;
  Node->left = NULL;
  Node->right = NULL;
  return( Node );

}

void print_tree(struct node* tree) {
  //print_tree_util(tree, 0);
  //printf("\n\nInorder traversal of the Parse Tree is: \n\n");
  //print_inorder(tree);
}

// 2022 09 06 - mkpellegrino
void print_inorder(struct node* tree)
{
  if( tree == NULL ) return;
  int i;
  if (tree->left)
    {
      print_inorder(tree->left);
    }
  printf("%s, ", tree->token);
  if (tree->right)
    {
      print_inorder(tree->right);
    }
}

void print_tree_util(struct node *root, int space) {
  if(root == NULL)
    return;
  space += 7;
  print_tree_util(root->right, space);
  for (int i = 7; i < space; i++)
    printf(" ");
  printf("%s\n", root->token);
  print_tree_util(root->left, space);
}

void insert_type() {
  strcpy(type, yytext);
}

void yyerror(const char* msg) {
  fprintf(stderr, "%s\n", msg);
}
