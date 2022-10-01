%{
#include<stdio.h>
  //#include<string.h>
#include <iostream>

#include<string>
#include<stdlib.h>
#include<ctype.h>
#include<cctype>
#include<vector>
#include <stack>
#include"lex.yy.c"


  // fwd declaration
  //  void addComment( string s );
  
  /* The extra parameter is also given to yyerror */
  void yyerror(FILE* fp, const char* msg);
  

  // compiler internal flags
  bool printf_is_needed = false;
  bool scanf_is_needed = false;
  bool getkey_is_needed = false;
  bool hex2petscii_is_needed = false;
  using namespace std;
  int label=0;
  int label_major=0;

  // command line arguments
  bool arg_memory_locations=false;
  bool arg_show_labels=true;
  bool arg_asm_comments=true;
  bool arg_parser_comments=false;
  
  string current_state;

  int data_start=828; // 98 2 byte variables
  int code_start=2049;
  int current_code_location=0;
  int string_number=0;
  int kbd_bfr_addr = 0xCFE0;

  // helper functions
  
  stack <string> scope_stack;
  stack <string> var_scope_stack;
  stack <int> label_stack;
  vector <int> label_vector;
  
  
  
  // converts an integer into a string
  string itos( int i )
  {
    char buffer[10];
    sprintf( buffer, "%d", i );
    return string( buffer );
  }
  string toString( int i )
  {
    return std::to_string(i);
  }

  string generateNewLabel(bool colon=true)
  {
    string return_value = ( string( "LBL" ) + itos( label_major ) + "L" + itos(label_vector[label_major]));
    
    if( colon )
      {
	return_value += string( ":" );
	label_vector[label_major] = label_vector[label_major]+1;
	//cerr << "scope level: " << label_major << ":" << label_vector[label_major] << endl;
      }
    return return_value;
  }

  string getSpecificLabel( int MAJOR, int MINOR, bool colon=true )
  {
    string return_value = string( "LBL" ) + itos( MAJOR ) + "L" + itos( MINOR );
    if( colon ) return_value += string( ":" );
    return return_value;
  }
  
  string getLabel( char* s, bool colon=true )
  {
    //if( !colon) label_vector[label_major]++;
    string return_value = string( "LBL" ) + itos( label_major ) + "L" + string( s );
    if( colon ) return_value += string( ":" );
    return return_value;
  }

  string getLabel( int i, bool colon=true )
  {
    //if( !colon) label_vector[label_major]++;    
    string return_value = string( "LBL" ) + itos( label_major ) + "L" + itos( i );
    if( colon ) return_value += string( ":" );
    return return_value;
  }
  // converts an integer into a string (in Hexadecimal)
  string toHex( int i )
  {
    if( i == 0 ) return string( "00" );
    int l=0;
    string return_value = string("");
    float f = (float)i;
    while( f > 0 )
      {
	float tmp1=f/16;
	float tmp2=(int) tmp1;
	float rem=16*(tmp1-tmp2);
	if (rem == 0) return_value = string("0") + return_value;
	if (rem == 1) return_value = string("1") + return_value;
	if (rem == 2) return_value = string("2") + return_value;
	if (rem == 3) return_value = string("3") + return_value;
	if (rem == 4) return_value = string("4") + return_value;
	if (rem == 5) return_value = string("5") + return_value;
	if (rem == 6) return_value = string("6") + return_value;
	if (rem == 7) return_value = string("7") + return_value;
	if (rem == 8) return_value = string("8") + return_value;
	if (rem == 9) return_value = string("9") + return_value;
	if (rem == 10) return_value = string("A") + return_value;
	if (rem == 11) return_value = string("B") + return_value;
	if (rem == 12) return_value = string("C") + return_value;
	if (rem == 13) return_value = string("D") + return_value;
	if (rem == 14) return_value = string("E") + return_value;
	if (rem == 15) return_value = string("F") + return_value;
	f=tmp2; l++;
      }

    if( l == 1 || l == 3) return_value = string("0") + return_value;
    return return_value;
  }

  void optimizePHAPLA()
  {
    // TODO:
    // iterate through the code
    // if there is a PHA followed (not necessarily directly) by a PLA
    // and also a PLA
    // then remove both of them.
    //
    // this can only be done if no stack operations are in between
    // and also there can be no RTS's or Operations that modify Acc
    //
    // PHA <<--- can be removed
    // LDX, #$01
    // STX, $C000
    // PLA <<--- can be removed
    //
    // -------
    // PLA <<--- cannot nbe removed
    // LDA #$04
    // PHA <<--- cannot nbe removed

    return;

  }

  class asm_function
  {
  public:
    asm_function( string identifier, string l )
      {
	name=identifier;
	label = l;
	address=0000;
	//cerr << "created a function label: " << name << " " << label << endl; 
      }
    string getIdentifier(){ return name; };
    int getAddressInt(){ return address; };
    string getAddress(){ return toHex( address ); };
    void setAddress( int i ){ address=i; };
    string getLabel(){ return label; };
  private:
    int address;
    string name;
    string label;
  };
  
  vector<asm_function*> asm_functions;


  asm_function * getAsmFunction( string s )
  {
    for( int i=0; i<asm_functions.size(); i++ )
      {
	if( asm_functions[i]->getIdentifier() == s )
	  {
	    return asm_functions[i];
	  }
      }
    return NULL;
  }
  
  string getLabelOfFunction( int i )
  {
    return asm_functions[i]->getLabel();
  }

  string getLabelOfFunction( string s )
  {
    for( int i=0; i<asm_functions.size(); i++ )
      {
	if( asm_functions[i]->getIdentifier() == s )
	  {
	    //cout << ":" << asm_functions[i]->getLabel() << ":" << endl;
	    return asm_functions[i]->getLabel();
	  }
      }
    return NULL;

  }
  int getAddressOfFunction( string s )
  {
    for( int i=0; i<asm_functions.size(); i++ )
      {
	if( asm_functions[i]->getIdentifier() == s )
	  {
	    return asm_functions[i]->getAddressInt();
	  }
      }
    return 0;
  }

  void addFunction( string s, string l )
  {
    asm_function * ptr_function = new asm_function( s, l );
    asm_functions.push_back( ptr_function );
  }
  
  class asm_string
  {
  public:
    asm_string( string identifier, string value, int i=0)
      {
	name=identifier;
	text=value;
	index=i;
      }
    string getAddress(){ return toHex(address); };
    void setAddress( int a ){ address = a; };
    string getH()
    {
#ifdef DEBUG
      cerr << "[ ADDRESS (H): " << address << " => " << toHex( (address & 0xFF00)/0x100 ) << endl;
#endif
      return toHex( (address & 0xFF00)/0x100 );
    };
    
    string getL()
    {
#ifdef DEBUG
      cerr << "[ ADDRESS (L): " << address << " => " << toHex( (address & 0xFF) ) << endl;
#endif
      return toHex( (address & 0x00FF) );
    };
    friend ostream &operator << (ostream &out, const asm_string &a); 
    int getLength()
    {
      int return_value=0;
      for( int i=0; i<text.size(); i++ )
	{
	  if( text[i] == '\\' && text[i+1] == 'n' )
	    {
	      i++;
	    }
	  return_value++;
	}
      return return_value;
    };
    int getIndex(){ return index; };
    void setIndex( int i){ index=i; };
  private:
    int address;
    string name;
    string text;
    // index where this string is referenced in the code (asm vector)
    int index;
  };

  vector<asm_string*> asm_strings;

  void addString( string identifier, string value, int i=0 )
  {
    asm_string * new_asm_string = new asm_string( identifier, value, i );
   
    asm_strings.push_back( new_asm_string ); // add the variable to the list of variables
  }

  ostream & operator << (ostream &out, const asm_string &a) 
    {
      out << "; $" << std::hex << a.address << "\t\t\t\"" << a.text << "\"" << endl;
      out << a.name << ":\n";
      for( int i = 0; i<a.text.size(); i++ )
	{
	  if( a.text[i] == '\\' && a.text[i+1] == 'n')
	    {
	      out << "\t.BYTE #$0D" << endl;
	      i++;
	    }
	  else
	    {
	      out << "\t.BYTE #$" << toHex((int)a.text[i]) << endl;
	    }
	}
      //out << "\t.BYTE #$0D" << endl;
      out << "\t.BYTE #$00" << endl;
      return out;
    }
 
 
  class asm_variable
  {
  public:
    asm_variable( string identifier, int t = 1)
      {
	name=identifier;
	address=data_start;
	type=t;

	switch( t )
	  {
	  case 8:
	    data_start+=4;
	    break;
	  default:
	    data_start+=t;
	  }	   

      }
    string getAddress(){ return toHex(address); };
    string getName(){ return name; };
   
  private:
    int address; // somewhere between 0 and 65535
    string name;
    int type;  // 1: int (8 bits)  2: double (16 bits)  4: float  8: string address (null termed) 
  };

  vector<asm_variable*> asm_variables;

  bool addAsmVariable( string id, int type )
  {
    asm_variable * new_asm_variable = new asm_variable( id, type );
    asm_variables.push_back( new_asm_variable ); // add the variable to the list of variables
  }

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
	return string( "IMM");
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
	size=0;
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

    bool hasLabel(){ return has_label; };
    void hasLabel( bool b ){ has_label = b;  };

    friend ostream &operator << (ostream &out, const asm_instruction &a); 

  private:
    string text;
    int memory_address;
    bool b_label;
    int size; // how many bytes the code takes up on the 6502
    bool has_label;
  };

  ostream & operator << (ostream &out, const asm_instruction &a) 
    {
      if( !a.b_label )
	{
	  out << "\t" << a.text; // the instructions
	  if( arg_memory_locations) out << "; " << toHex(a.memory_address);
	}
      else
	{
	  out << a.text;
	}
      out << endl;
      return out;
    }
  
  vector<asm_instruction*> asm_instr;
  
  void addAsm( string s, int instruction_size, bool l = false)
  {
    asm_instruction * my_asm = new asm_instruction( s );
    my_asm->setLabel(l);
    my_asm->setSize(instruction_size);
    my_asm->setAddress( 0 ); 
    asm_instr.push_back( my_asm );
    return;
  }

  void addParserComment( string s )
  {
    if( arg_parser_comments ) addAsm( string("; ") + s, 0, true );
    return;
  }
  
  void addComment( string s )
  {
    if( arg_asm_comments ) addAsm( string("; ") + s, 0, true );
    return;
  }

  
  void pushScope( string s )
  {
    addParserComment( "=========================================================");
    addParserComment( "                     New Scope " + s );
    addParserComment( "=========================================================");
    scope_stack.push( s );
    var_scope_stack.push(".");
    label_stack.push( label );

    label_major++;

    addParserComment( string("Label Major: ") + itos( label_major ) );
    addParserComment( string("Label Minor: ") + itos( label_vector[label_major] ) );
    //addAsm( generateNewLabel(), 0, true );
  }

  void popScope()
  {
    //addAsm( generateNewLabel(), 0, true );
    string return_value;
    addParserComment( string("Release Scope ") + string( scope_stack.top()) );
    while( var_scope_stack.top() != "." )
      {
	var_scope_stack.pop();
      }
    scope_stack.pop();
    label_stack.pop();
    label_major--;

    addParserComment( string("Label Major: ") + itos( label_major ) );
    addParserComment( string("Label Minor: ") + itos( label_vector[label_major] ) );
    addParserComment( "=========================================================");
  }
  

  
  bool previousAsm( string s )
  {
    if( asm_instr[ asm_instr.size()-1 ]->getString() == s ) return true;
    return false;
  }

  void deletePreviousAsm()
  {
    asm_instr.erase( asm_instr.end()-1 );
    return;
  }

  void ProcessFunctions()
  {
    for( int j=0; j<asm_functions.size(); j++ )
      {
	string current_function = asm_functions[j]->getIdentifier();
	string current_label = asm_functions[j]->getLabel();

	// remove the colon from the end of each label
	current_label.erase( current_label.length()-1, 1 );

	//cerr << "TOP: " << current_function << endl;
	
	for( int i=0; i<asm_instr.size(); i++ )
	  {
	    // Line of Code
	    string current_LOC = asm_instr[i]->getString();

	    // find the string that is to be replaces
	    std::size_t found = current_LOC.find(string( "###" ) + current_function);

	    // if it IS found
	    if( current_LOC == string( "###" ) + current_function )
	      {
		current_LOC.replace( current_LOC.find(string("###")+current_function), (string( "###" ) + current_function).length(), string( "JSR ") + current_label + "; call " + current_function );
		asm_instr[i]->setString( current_LOC );
	      }
	  }

      }
  }
  
  void ProcessMemoryLocationsOfCode()
  {
    for( int i=0; i<asm_instr.size(); i++ )
      {
	
	asm_instr[i]->setAddress( current_code_location  );
	if( asm_instr[i]->getSize() > 0 ) current_code_location+=asm_instr[i]->getSize();
      }
    
  }

  void ProcessStrings()
  {
    // this is all for the ptintf type strings that
    // are associated with a variable.
    
    //current_code_location
    for( int i=0; i<asm_strings.size(); i++ )
      {
	// this puts the strings all after the code segemnt and other builtin functions like the printf function.
	asm_strings[i]->setAddress( current_code_location );
	current_code_location+=asm_strings[i]->getLength()+1; // the +1 is for the null terminated zero

	// Now find where (in the instruction vector) this string is being referenced
	int j = asm_strings[i]->getIndex() -1; 

	int instruction_address = asm_instr[j]->getAddress();

	asm_instr[j+1]->setString( string("LDA #$") + string(asm_strings[i]->getH()));
	asm_instr[j+1]->setSize( 2  );

	asm_instr[j+2]->setString( string( "STA $03") );
	//asm_instr[j+2]->setString( string( "STA $") + getAddressOf( string( "string_tmp_l" )   ));
	asm_instr[j+2]->setSize( 2  );
	
	asm_instr[j+3]->setString( string("LDA #$") + string(asm_strings[i]->getL()));
	asm_instr[j+3]->setSize( 2  );
	asm_instr[j+4]->setString( string( "STA $02"));
	//asm_instr[j+4]->setString( string( "STA $") + getAddressOf( string( "string_tmp_h" )   ));
	asm_instr[j+4]->setSize( 2  );
      }
  }

  void addAsm( string s,  bool l = false)
  {
    asm_instruction * my_asm = new asm_instruction( s );
    my_asm->setLabel(l);
    my_asm->setSize(0);
    if(
       (s == "ASL A") ||
       (s == "BRK" ) ||
       (s == "CLC" ) ||
       (s == "CLD" ) ||
       (s == "CLI" ) ||
       (s == "CLV" ) ||
       (s == "DEX" ) ||
       (s == "DEY" ) ||
       (s == "INX" ) ||
       (s == "INY" ) ||
       (s == "LSR A" ) ||
       (s == "NOP" ) ||
       (s == "PHA" ) ||
       (s == "PHP" ) ||
       (s == "PLA" ) ||
       (s == "PLP" ) ||
       (s == "ROL A" ) ||
       (s == "ROR A" ) ||
       (s == "RTI" ) ||
       (s == "RTS" ) ||
       (s == "SEC" ) ||
       (s == "SED" ) ||
       (s == "SEI" ) ||
       (s == "TAX" ) ||
       (s == "TAY" ) ||
       (s == "TSX" ) ||
       (s == "TXA" ) ||
       (s == "TXS" ) ||
       (s == "TYA" ) )
      {
	my_asm->setSize(1);
      }
    else if (( s.substr(0,3) == "BCC" ) ||
	     ( s.substr(0,3) == "BCS" ) ||
	     ( s.substr(0,3) == "BEQ" ) )
      {
	my_asm->setSize(2);
      }
	 
		
    //my_asm->setAddress( 0 ); // this should be changed later to set the address to some value
    asm_instr.push_back( my_asm );
    return;
  }

  void ProcessLabels()
  {
    // labels should be sorted so that the longest is first
    
    for( int i=0; i<asm_instr.size(); i++ )
      {
  	if( asm_instr[i]->getSize() == 0 )
  	  {
  	    // we (may) have found a label
  	    // all labels have a colon on the far right too
  	    string addr_of_instr = toHex(asm_instr[i]->getAddress());
	    string string_of_instr = asm_instr[i]->getString().substr( 0, asm_instr[i]->getString().length()-1);
	    
	    //cerr << "checking " << string_of_instr << " at " << addr_of_instr << endl;
  	    for( int j = 0; j < asm_instr.size(); j++ )
  	      {
		// now look through all of the instructions and replace the "label" with the address in hex
		if( asm_instr[j]->getSize() != 0 )
		  {
		    // then it must NOT be a label, so we try to replace
		    // the text with the actual address
		    string tmp_string = asm_instr[j]->getString();
		    std::size_t found = tmp_string.find(string_of_instr);
		    
		    if (found!=std::string::npos)
		      {
			tmp_string.replace(found,tmp_string.length(),"$" + addr_of_instr);
			asm_instr[j]->setString( tmp_string );
		      }
		  }
		
  	      }
  	  }
    }
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


  // this is to see how embedded we are in loops
  int count=0;
  int q;
  char type[10];
  extern int countn;
  struct node *head;
  int sem_errors=0;
  int ic_idx=0;
  int temp_var=0;

  char buff[100];
  char errors[10][100];
  char reserved[10][10] = {"int", "float", "char", "void", "if", "else", "for", "main", "return", "include"};

  struct node { 
    struct node *left; 
    struct node *right; 
    char *token; 
  };
      
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


//%parse-param { FILE* fp }

%token VOID 
%token <nd_obj> tPOINTER tJSR tRTS tPOKE NEWLINE CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY INCLUDE RETURN
%type <nd_obj> headers main body return function datatype statement arithmetic relop program else
   %type <nd_obj2> init value expression
      %type <nd_obj3> condition

%%


program: headers main '(' ')' '{' body return '}' function { $2.nd = mknode($6.nd, $7.nd, "main"); $$.nd = mknode($1.nd, $2.nd, "program"); 
     head = $$.nd;
   } 
;

headers: headers headers { $$.nd = mknode($1.nd, $2.nd, "headers"); }
| INCLUDE { add('H'); } { $$.nd = mknode(NULL, NULL, $1.name); }
;

// the beginning of the assembler program
main: datatype ID
{
  addAsm( string( ".org $" ) + toHex( code_start ), 0, true );
  addComment( "======================== main() =========================" );
};

function: function function
| datatype ID '(' ')' '{' { addComment( string("======================== ") + string($2.name) + string(" ========================")); addAsm( generateNewLabel(), 0, true );    addFunction( string($2.name), getLabel( label_vector[label_major]-1 )); addComment( string(getLabel( label_vector[label_major]-1))); } body return '}'
  {
    //cerr << getLabel( label_vector[label_major]-1 ) << endl;
    // add this label to the list of functions and their addresses
    // any time we come across the function with this ID
    // we can JSR to it
    if( !previousAsm("RTS") ){addAsm("RTS");}
  };

| datatype ID '(' ')' '{' { addComment( string("======================== ") + string($2.name) + string(" ========================")); addAsm( generateNewLabel(), 0, true );     addFunction( string($2.name), getLabel( label_vector[label_major] )); } body '}'
  {
    // add this lavel to the list of functions and their addresses
    // any time we come across the function with this ID
    // we can JSR to it
    if( !previousAsm("RTS") ){addAsm("RTS");}
  };
|
;


datatype:
INT { addParserComment( string( "RULE: datatype: ") + string( $$.name )); insert_type();}
|
FLOAT { addParserComment( string( "RULE: datatype: ") + string( $$.name )); insert_type();}
|
CHAR { addParserComment( string( "RULE: datatype: ") + string( $$.name )); insert_type();}
|
VOID { addParserComment( string( "RULE: datatype: ") + string( $$.name )); insert_type();}
;

body:
FOR
{
  pushScope("FOR");
  addComment( "=========================================================");
  addComment( "                        FOR LOOP" );
  addComment( "=========================================================");
  addAsm( generateNewLabel(), 0, true );
  addParserComment( "              initialization goes here" );
  addAsm( "PHA" );
  //addAsm( "TXA" );
  //addAsm( "PHA" );
  //addAsm( "TYA" );
  //addAsm( "PHA" );
  addComment( "---------------------------------------------------------");
}
'(' statement {addComment("---------------------------------------------------------");}
';' condition {addComment("---------------------------------------------------------");}
{
  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
}
';' statement
{
  addAsm( string( "JMP ") + getLabel( label_vector[label_major]-2, false) + string( "; jump to top of FOR" ), 3, false );
  addComment("---------------------------------------------------------");
} ')'
{  addAsm( generateNewLabel(), 0, true ); }
'{' body '}'
{
  addComment( "---------------------------------------------------------" );

  
  addAsm( string( "JMP " ) + getLabel( ((int)label_vector[label_major]-2), false ) + "; jump to iterator ", 3, false );
  
  addAsm( generateNewLabel(), 0, true );
  addAsm( "PLA" );  
  addComment( "---------------------------------------------------------" );
  if( scope_stack.top() != string("FOR") )
    {
      addComment( "ERROR: Scope out of Sync" );
      addComment( scope_stack.top() );
    }
  else
    {
      popScope();
    }
};
| IF
{
  pushScope("IF");
  addComment( "=========================================================");
  addComment( "                        IF STATEMENT" );
  addComment( "=========================================================");  
  addAsm( generateNewLabel(), 0, true );
}
'(' condition ')'
{
  addComment( "---------------------------------------------------------" );
  addComment( "                      THEN:" );
  addAsm( generateNewLabel(), 0, true );
}
'{' body '}'
{
  addComment( "---------------------------------------------------------" );
  addComment( "                      ELSE:" );
  addAsm( string("JMP ") + getLabel( label_vector[label_major]+1, false), 3, false);
  addAsm( generateNewLabel(), 0, true );
}
 else
   {
     addComment( "---------------------------------------------------------" );
     addParserComment( "post-process the ELSE" );
     }
{
  addComment( "---------------------------------------------------------" );
  addParserComment( "             post if-statement" );
  addAsm( generateNewLabel(), 0, true );
    
  if( scope_stack.top() != string("IF") )
    {
      addComment( "ERROR: Scope out of Sync" );
      addComment( scope_stack.top() );
    }
  else
    {
      popScope();
    }
};
| statement ';'
{
  addComment( "=========================================================");    
}
| body body
{
  $$.nd = mknode($1.nd, $2.nd, "statements");
};
/* SCANF(ish) COMMAND!!! */
| SCANFF '(' STR ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                     scanf");
  addComment( "=========================================================");  
  getkey_is_needed=true;
  scanf_is_needed=true;
  addAsm( "JSR SCANF", 3, false );  
};
/* PRINTF COMMAND!!! */
| PRINTFF '(' NUMBER ')' ';'
{
  addComment( "=========================================================");      
  addComment( string("printf(") + string($3.name) + string( ");") );
  addComment( "=========================================================");  
};
| PRINTFF '(' STR ')' ';'
{
    addComment( "=========================================================");      
    addComment( string("printf(") + string($3.name) + string( ");") );
    addComment( "=========================================================");  
 printf_is_needed=true;
  // add the string stripped of its' quotes
		
  addString( string("STRLBL") + itos( string_number++), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );
  // these will later be replaced during Process Strings
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "JSR PRN", 3, false );
};
| tJSR '(' NUMBER ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                 jsr");
  addComment( "=========================================================");  
  addAsm(string( "JSR $") + toHex( atoi( $3.name )), 3, false );
};
| tRTS '(' ')' ';'
{
  addComment( "=========================================================");
  addComment( "                 rts");
  addComment( "=========================================================");  
  addAsm( "RTS" );
};
| tPOKE '(' NUMBER ',' NUMBER ')' ';'
{
    addComment( "=========================================================");  
    addComment( "                     poke");
    addComment( "=========================================================");  
  addComment( string("poke ") + string( $3.name ) + "," + string( $5.name ));
  addAsm( string( "LDA #$" ) + toHex(atoi($5.name)) , 2, false );
  addAsm( string( "STA $" ) + toHex(atoi($3.name)) , 3, false );
  // ??? why was this here?addAsm( "PLA" );
};
| tPOKE '(' NUMBER ',' ID ')' ';'
{
    addComment( "=========================================================");  
    addComment( "                     poke");
    addComment( "=========================================================");  
  $$.nd = mknode(NULL, NULL, "poke");
  //if( previousAsm("PLA") ){deletePreviousAsm();}else{addAsm( "PHA" );}
  int var_index = getIndexOf( $5.name );
  if( var_index == -1 )
    {
      addAsm( string( "; [ERROR] Variable [") +  string($5.name) + string("] not found in vector!"), 0, true );
    }
  else
    { 
      addAsm( string( "LDA $" ) + asm_variables[ var_index ]->getAddress(), 3, false );
    }
  addAsm( string( "STA $" ) + toHex( atoi( $3.name )), 3, false );
  //addAsm( "PLA" );
};
| tPOKE '(' ID ',' ID ')' ';'
{
    addComment( "=========================================================");  
    addComment( "                     poke");
    addComment( "=========================================================");  
  $$.nd = mknode(NULL, NULL, "poke");
  //if( previousAsm("PLA") ){deletePreviousAsm();}else{addAsm( "PHA" );}
  addAsm( string( "LDA $" ) + asm_variables[ getIndexOf( $5.name ) ]->getAddress(), 3, false );
  addAsm( string( "STA $" ) + asm_variables[ getIndexOf( $3.name ) ]->getAddress(), 3, false );
  addAsm( "PLA" );
};




 else: ELSE
	 {
	   add('K');
	 }
'{' body '}'
{
  $$.nd = mknode(NULL, $4.nd, $1.name);
}
| { $$.nd = NULL; }




condition: value relop value
{
  addComment( "=========================================================");
  addComment( string( "            condition in ") + string( scope_stack.top() ));
  addComment( scope_stack.top() + string(" ")  + string($1.name) + string($2.name) + string($3.name) );
  addComment( "=========================================================");
  //pushScope("COND");
  
  if( scope_stack.top() == "FOR" ) addAsm( generateNewLabel(true) + string( "\t\t\t; Top of FOR Loop"), 0, true );  
  if( scope_stack.top() == "IF" ) addAsm( generateNewLabel(true) + string( "\t\t\t; Top of IF Statement"), 0, true );
  
  
  addAsm( string( "LDA $" ) + getAddressOf( getIndexOf( $1.name )), 3, false);
  addAsm( string( "CMP #$" ) + toHex(atoi( $3.name )), 2, false );
  if( scope_stack.top() == "FOR" || scope_stack.top() == "WHILE") 
    {      
      if( string( $2.name ) == string( "<=" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to THEN" ), 2, false );
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to THEN" ), 2, false );
	}
      else if( string( $2.name ) == string( "==" ) )
	{
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to THEN" ), 2, false );
	}
      else if( string( $2.name ) == string( ">" ) )
	{
	  addAsm( string( ".BYTE #$F0 ; if z==1 SKIP THE BCS" ), 1, false );
	  addAsm( string( ".BYTE #$02 ; 0xF0 0x02 is: BEQ +2" ), 1, false );
	  addAsm( string( "BCS ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to THEN" ), 2, false );
	}
      else if( string( $2.name ) == string( "<" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump to ELSE/out of FOR" ), 3, false );
	}
      else if( string( $2.name ) == string( ">=" ) )
	{
	  addAsm( string( "BCS ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to THEN/BODY of FOR" ), 2, false );
	}
      else /* != ... NOT EQUAL TO */
	{
	  addAsm( string( "BNE ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==0 jump to THEN/BODY of FOR" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump to ELSE/out of FOR" ), 3, false );
	}
    }
  else if( scope_stack.top() == "IF" ) /*                                                                                                               <<<<    IF           */
    {
      if( string( $2.name ) == string( "<=" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major], false) + string( "; if c==0 jump to THEN" ), 2, false );
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major], false) + string( "; if z==1 jump to THEN" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	}   
      else if( string( $2.name ) == string( "==" ) )
	{
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major], false) + string( "; if z==1 jump to THEN" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	}
      else if( string( $2.name ) == string( ">" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to ELSE" ), 2, false );
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to ELSE" ), 2, false );
	}
      else if( string( $2.name ) == string( "<" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major], false) + string( "; if c==0 jump to THEN" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	}
      else if( string( $2.name ) == string( ">=" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to ELSE" ), 2, false );
	}
      else /* != ... NOT EQUAL TO */
	{
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to ELSE" ), 2, false );
	}
    }
  else
    {
      addComment( "           Unknown Conditional" );
    }
  addComment( "=========================================================");  
      
};
| TRUE { add('K'); $$.nd = NULL; }
| FALSE { add('K'); $$.nd = NULL; }
| { $$.nd = NULL; }
;





statement: datatype ID { /*addComment( $2.name ); */} { add('V'); } init
{
  addParserComment( "RULE: statement: datatype ID {} {} init" );
  //addComment( string( $2.name ) + " = " + string( $1.name ) );
  //$2.nd = mknode(NULL, NULL, $2.name); 
  /*
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
      } */
  // variable initialization (for INT type)
  addAsmVariable( $2.name, 1 );
  //addAsm( string("LDA #$") + toHex(atoi($4.name)), 2, false);
  addAsm( string("STA $") + getAddressOf( getIndexOf( $2.name )), 3, false );
}
| ID '(' ')' 
{
  addParserComment( "RULE: statement: ID '(' ')'" );
  //addComment( "Trying to call a function." );
  //addComment( $1.name );
  addParserComment( string( "###" ) + string( $1.name )); 
  // lookup $1.name and get it's address ... then jump to it
  //string l = getLabelOfFunction( string($1.name) );
  //addComment( l );
};
| ID { check_declaration($1.name); } '=' expression
{
  addParserComment( "RULE:statement ID {}  '=' expression" );
  

  addAsm( string( "STA $" ) + string( getAddressOf( string( $1.name ))), 3, false );
  $1.nd = mknode(NULL, NULL, $1.name); 
  char *id_type = get_type($1.name); 
  if(strcmp(id_type, $4.type))
    {
      if(!strcmp(id_type, "int"))
	{
	  if(!strcmp($4.type, "float"))
	    {
	      struct node *temp = mknode(NULL, $4.nd, "floattoint");
	      $$.nd = mknode($1.nd, temp, "="); 
	    }
	  else
	    {
	      struct node *temp = mknode(NULL, $4.nd, "chartoint");
	      $$.nd = mknode($1.nd, temp, "="); 
	    }
	  
	}
      else if(!strcmp(id_type, "float"))
	{
	  if(!strcmp($4.type, "int"))
	    {
	      struct node *temp = mknode(NULL, $4.nd, "inttofloat");
	      $$.nd = mknode($1.nd, temp, "="); 
	    }
	  else
	    {
	      struct node *temp = mknode(NULL, $4.nd, "chartofloat");
	      $$.nd = mknode($1.nd, temp, "="); 
	    }
	  
	}
      else
	{
	  if(!strcmp($4.type, "int"))
	    {
	      struct node *temp = mknode(NULL, $4.nd, "inttochar");
	      $$.nd = mknode($1.nd, temp, "="); 
	    }
	  else
	    {
	      struct node *temp = mknode(NULL, $4.nd, "floattochar");
	      $$.nd = mknode($1.nd, temp, "="); 
	    }
	}
    }
  else
    {
      
      $$.nd = mknode($1.nd, $4.nd, "="); 
    }
  
  // This is where a variable is given the value of a different variable
  //sprintf(icg[ic_idx++], "%s = %s <<==", $1.name, $4.name);
  //addAsm(icg[ic_idx-1], false );
				     }
| ID {  addParserComment( "RULE: statement: ID {} relop expression" ); check_declaration($1.name); } relop expression { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $4.nd, $3.name); }
| ID
{  addParserComment( "RULE: statement: ID {} UNARY" ); check_declaration($1.name); } UNARY { 
  $1.nd = mknode(NULL, NULL, $1.name); 
  $3.nd = mknode(NULL, NULL, $3.name); 
  $$.nd = mknode($1.nd, $3.nd, "ITERATOR");  
  if(!strcmp($3.name, "++"))
    {
      sprintf(buff, "t%d = %s + 1\n%s = t%d\n// 503", temp_var, $1.name, $1.name, temp_var++);
    }
  else
    {
      sprintf(buff, "t%d = %s + 1\n%s = t%d\n// 469", temp_var, $1.name, $1.name, temp_var++);
    }
								   }
| UNARY ID {
  check_declaration($2.name); 
  $1.nd = mknode(NULL, NULL, $1.name); 
  $2.nd = mknode(NULL, NULL, $2.name); 
  $$.nd = mknode($1.nd, $2.nd, "ITERATOR"); 
  if(!strcmp($1.name, "++"))
    {
      sprintf(buff, "t%d = %s + 1\n%s = t%d\n// 479", temp_var, $2.name, $2.name, temp_var++);
    }
  else
    {
      sprintf(buff, "t%d = %s - 1\n%s = t%d\n// 482", temp_var, $2.name, $2.name, temp_var++);
    }				     }
;

init: '=' expression
{
  addParserComment( "RULE: init: '=' expression" );
  //addAsm( string( "LDA #$" ) + string($2.name), 2, false  );
}
|
'=' value
{
  addParserComment( "RULE: init: '=' value" );
  $$.nd = $2.nd; 
  sprintf($$.type, $2.type);
  strcpy($$.name, $2.name);
  addAsm( string( "LDA #$" ) + toHex(atoi($2.name)), 2, false  );
}
|
{
  addParserComment( "RULE: init:" );
  sprintf($$.type, "null");
  $$.nd = mknode(NULL, NULL, "0");
  strcpy($$.name, "0");
  addAsm( string( "LDA #$00" ), 2, false  );
}
;

expression: expression arithmetic expression
{
  addParserComment( "RULE: expression: expression arithmetic expression" );
  addParserComment( string( $1.name ) + string( $2.name ) + string( $3.name ) );  
  // here is where we should check to see if the
  // variable ($$.name) is already in use (in _this_ scope).
  // .. but we don't yet

  addAsm( generateNewLabel(), 0, true );

  
  /* if they're BOTH IMM's */
  if( getAddressOf( string( $1.name )) == "IMM" && getAddressOf( string( $3.name )) == "IMM")
    {
      addParserComment( "IMM + IMM" );
      /* then this is a compile-time arithetic operation */
      strcpy( $$.name, toHex( atoi($1.name) + atoi($3.name)).c_str());
      if( string( $2.name ) == "+" ) addAsm( string("LDA $#") + toHex(atoi( $1.name) + atoi( $3.name )), 2, false);
      if( string( $2.name ) == "-" ) addAsm( string("LDA $#") + toHex(atoi( $1.name) - atoi( $3.name )), 2, false);
      if( string( $2.name ) == "*" ) addAsm( string("LDA $#") + toHex(atoi( $1.name) * atoi( $3.name )), 2, false);
      if( string( $2.name ) == "/" ) addAsm( string("LDA $#") + toHex(atoi( $1.name) / atoi( $3.name )), 2, false);
    }
  else if( getAddressOf( string( $1.name )) == "IMM" )
    {
      addParserComment( "IMM + ID" );

      addAsm( string("LDA $") + getAddressOf(string($3.name )), 3, false);
      if( string($2.name) == "+" )
	{
	  addAsm( "CLC" );
	  addAsm( string("ADC #$") + toHex(atoi($1.name )),2, false);
	}
      else if ( string($2.name) == "-" )
	{
	  addAsm( "SEC" );
	  addAsm( string("SBC #$") + toHex(atoi($1.name )),2, false);
	}
      else
	{
	  addComment( "unknown state" );
	}
    }
    else if( getAddressOf( string( $3.name )) == "IMM" )
    {
      addParserComment( "ID + IMM" );

      addAsm( string("LDA $") + getAddressOf(string($$.name )), 3, false);
      if( string($2.name) == "+" )
	{
	  addAsm( "CLC" );
	  addAsm( string("ADC #$") + toHex(atoi($3.name )),2, false);
	}
      else if ( string($2.name) == "-" )
	{
	  addAsm( "SEC" );
	  addAsm( string("SBC #$") + toHex(atoi($3.name )),2, false);
	}
      else
	{
	  addComment( "unknown state" );
	}
    }
  else
    {
      addParserComment( "ID + ID" );

      //addAsm( generateNewLabel(), 0, true );

      addAsm( string("LDA $") + getAddressOf(string($1.name )), 3, false);
      if( string($2.name) == "+" )
	{
	  addAsm( "CLC" );
	  addAsm( string("ADC $") + getAddressOf(string($3.name )),3, false);
	}
      else if ( string($2.name) == "-" )
	{
	  addAsm( "SEC" );
	  addAsm( string("SBC #$") + toHex(atoi($3.name )),2, false);
	}
      else
	{
	  addComment( "unknown state" );
	}
      //addAsm( string("STA $") + getAddressOf($1.name), 3, false);
      //addAsm( "CLC" );
    }
};
| value { addParserComment( "RULE: expression: value" );   }
| INT { addParserComment("RULE: expression: INT");  strcpy( $$.name, $1.name ); }
| ID { addParserComment("RULE: expression ID");  strcpy( $$.name, $1.name );  }
|
;

arithmetic: ADD { addParserComment( "RULE: arithmetic ADD" );  current_state = string("+"); }
| SUBTRACT {  addParserComment( "RULE: arithmetic SUBTRACT" );  current_state = string("-"); }
| MULTIPLY {  addParserComment( "RULE: arithmetic MULTIPLY" ); current_state = string("*"); }
| DIVIDE {  addParserComment( "RULE: arithmetic DIVIDE" ); current_state = string("/"); }
;

relop: LT { current_state = string( "LT" ); }
| GT { current_state = string( "GT" ); }
| LE { current_state = string( "LE" ); }
| GE { current_state = string( "GE" ); }
| EQ { current_state = string( "EQ" ); }
| NE { current_state = string( "NE" ); }
;

value:
NUMBER
{
  addParserComment( "RULE: value: NUMBER" );
  strcpy($$.name, $1.name);
  sprintf($$.type, "int");
  add('C');
  $$.nd = mknode(NULL, NULL, $1.name);
}
| FLOAT_NUM
{
  addParserComment( "RULE: value: FLOAT_NUM" );
  strcpy($$.name, $1.name);
  sprintf($$.type, "float");
  add('C');
  $$.nd = mknode(NULL, NULL, $1.name);
}
| CHARACTER
{
  addParserComment( "RULE: value: CHARACTER" );
  strcpy($$.name, $1.name);
  sprintf($$.type, "char");
  add('C');
  $$.nd = mknode(NULL, NULL, $1.name); }
| ID
{
    addParserComment( "RULE: value: ID" );

  strcpy($$.name, $1.name);
  char *id_type = get_type($1.name);
  sprintf($$.type, id_type);
  check_declaration($1.name);
  $$.nd = mknode(NULL, NULL, $1.name);
  /* addComment( "return value here" ); */
  // copy value at address 1 to address 2
}
;

return: RETURN {}  value ';'
  {
    addParserComment( "RULE: return: RETURN {} value ';'" );

    addAsm("RTS");
    check_return_type($3.name);
    $1.nd = mknode(NULL, NULL, "return");
    $$.nd = mknode($1.nd, $3.nd, "RETURN");
  }
| RETURN {} ';'
{
    addParserComment( "RULE: return: RETURN {} ';'" );
    addAsm( "RTS" );
}
 |
{
  addParserComment( "RULE: return:" );
  $$.nd = NULL;
}
 ;

%%


int main(int argc, char *argv[])
{
  label_major=0;
  //pushScope("MAIN");
  label_vector.push_back(0);
  label_vector.push_back(0);
  label_vector.push_back(0);
  label_vector.push_back(0);
  int dbg_count=1;
  
  string input_file_name;
  
  if(argc == -1)
    {
      cerr << "usage:" << endl << argv[0] << " --memory-locations inputfile.c outputfile.asm" << endl;
      cerr << "\t--help\tfor more help" << endl;
      exit(-1);
    }
  

  // process arguments
  for( int i=1; i<argc; i++ )
    {
      string a=string(argv[i]);
#ifdef DEBUG
      cerr << "command line arg: " << i << " " << a << endl;
#endif
      if( a == "--memory-locations" ) arg_memory_locations  = true;
      if( a == "--no-asm-comments" ) arg_asm_comments = false;
      if( a == "--parser-comments" ) arg_parser_comments = true;
      if( a == "--no-labels" ) arg_show_labels = false;
      if( a == "--code-segment" )
	{
	  code_start = atoi( argv[i+1] );
	  i++;
	}
      if( a == "--data-segment" )
	{
	  data_start = atoi( argv[i+1] );
	  i++;
	}
      if( a == "-i" )
	{
	  // then the next value is the filename
	  // can I use "(i++)+1"?
	  input_file_name = string( argv[i+1] );
	  i++;
	}
      if( a == "--help" )
	{
	  cerr << "\n\nusage:" << endl << argv[0] << " --memory-locations inputfile.c outputfile.asm\n\n"
	       << "\t--memory-locations\twill show the memory addresses of the assembler instructions\n" 
	       << "\t--no-labels\t\twill supress the labels (and turn them into memory addresses)\n" 
	       << "\t--no-asm-comments\twill supress most comments pertaining to flow of control\n" 
	       << "\t--parser-comments\twill show the comments intended to help debug the parser\n" 
	       << "\t--code-segment address\tsets the start of code segment to a memory addres (default is 49152)\n"
	       << "\t--data-segment address\tsets the start of data segment to a memory addres (default is 828)\n\n" << endl;
	  exit(-1);
	}
    }


  
  //  FILE* file_pointer = fopen(input_file_name.c_str(), "a");
 



  // --------------------------------

  current_state = string("unknown" );
  current_code_location = code_start;
  
  // temp storage for the printf routine
  //addAsmVariable( "print_tmp_l", 1 );
  //addAsmVariable( "print_tmp_h", 1 );

  //addAsmVariable( "string_tmp_l", 1 );
  //addAsmVariable( "string_tmp_h", 1 );
  
  addAsmVariable( "buffer_tmp_l", 1 );
  addAsmVariable( "buffer_tmp_h", 1 );

  addAsmVariable( "hex2petscii_tmp_l", 1 );
  addAsmVariable( "hex2petscii_tmp_h", 1 );
  
  yyparse(); 
  

  int i=0;
  for(i=0;i<count;i++){free(symbol_table[i].id_name);free(symbol_table[i].type);}


  //print_tree(head); 
  
  if(sem_errors>0)
    {
      printf("; *** Semantic analysis completed with %d errors\n", sem_errors);
      for(int i=0; i<sem_errors; i++)
	{
	  printf("\t - %s", errors[i]);
	}
  }
  else
    {
      //printf("Semantic analysis completed with no errors");
    }

  // a built-in-function that will convert an integer into a null-terminated
  // buffer of PETSCII displayable characters.
  if( hex2petscii_is_needed )
    {
      addAsm( "HEX2PETSCII:", 0, true );
      addAsm( string( "LDA $") + getAddressOf( string( "hex2petscii_tmp_l" ) ), 3, false );
      addAsm( "AND #$0F", 2, false );
      addAsm( "CMP #$0A", 2, false );
      addAsm( ".BYTE B0", 1, false ); // skip the adding of 0x41
      addAsm( ".BYTE 03", 1, false );
      addAsm( "ADD #$0B", 2, false );
      addAsm( "ADD #$30", 2, false );
      addAsm( "RTS" );

    }
  if( printf_is_needed )
    {
      /* a Simple printf */
      
      addAsm( "PRN:", 0, true );
      //addAsm( string( "LDA $") + getAddressOf( string( "string_tmp_l" ) ), 3, false );
      //addAsm( "STA $03", 2, false );
      //addAsm( string( "LDA $") + getAddressOf( string( "string_tmp_h" ) ), 3, false );
      //addAsm( "STA $02", 2, false );
      addAsm( "LDY #$00", 2, false);
      addAsm( "PRN_LOOP:", 0, true );
      addAsm( "LDA ($02),Y", 2, false);
      addAsm( "CMP #$00", 2, false );
      addAsm( "BEQ PRN_END", 2, false );
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "INY" );
      addAsm( "JMP PRN_LOOP", 3, false );
      addAsm( "PRN_END:", 0, true );
      addAsm( "RTS", 1, false );
    }
  
  if( scanf_is_needed )
    {
      /* a WICKED Simple Scanf */
      addAsm( "SCANF:", 0, true );
      
      addAsm( "LDX #$00", 2, false );
      addAsm( "STX $CFDE", 3, false ); // initialise the # of bytes read

      addAsm( "SCANFTOP:", 0, true );
      addAsm( "JSR $FF9F", 3, false );
      addAsm( "JSR $FFE4", 3, false );
      addAsm( "BEQ SCANFTOP", 2, false );
      addAsm( "CMP #$0D", 2, false ); // compare acc with a carriage return
      addAsm( "BEQ SCANFEND", 2, false);
      addAsm( "CMP #$14", 2, false ); // compare acc with delete
      addAsm( "BEQ BKSPC", 2, false );
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "LDX $CFDE", 3, false ); // 
      addAsm( "STA $CFE0,X", 3, false );
      addAsm( "INX" );

      /* $CFDE cas chosen to store */
      /* the # of bytes read because */
      /* it's right before the getkey */
      /* byte that gets read */
      addAsm( "STX $CFDE", 3, false );

      addAsm( "CPX #$10", 2, false ); // only a 16 byte kbd buffer!
      addAsm( "BEQ SCANFEND", 2, false );
      addAsm( "JMP SCANFTOP", 3, false );

      addAsm( "SCANFEND:", 0, true );
      addAsm( "RTS", 1, false );

      /* if backspace/delete was pressed */
      addAsm( "BKSPC:", 0, true );
      addAsm( "LDX $CFDF", 3, false );
      addAsm( "DEX" );
      addAsm( "STX $CFDF", 3, false );

      /* TODO: we probably need to read the cursor position, */
      /* move it to the left one, and then clear that spot */
      
      addAsm( "JMP SCANFTOP", 3, false );
      
    }
  if( getkey_is_needed )
    {

      // puts a keypress on the stack
      addAsm( "GETKEY:", 0, true );
      addAsm( "JSR $FFCF", 3, false );
      addAsm( "CMP #$00", 2, false );
      addAsm( "BEQ GETKEY", 2, false );
      /* this memory loc could be anywhere */
      /* I chose $CFDF because it's right */
      /* before the input buffer for "scanf" */
      addAsm( "STA $CFDF", 3, false );

      
      addAsm( "RTS" );
    }
  
  /*  set all memory locations of code (according to instruction size) */
  /* starting at the .org address */

  ProcessFunctions();
  ProcessMemoryLocationsOfCode();
  ProcessStrings();
  current_code_location = code_start;  // reset the memory counter
  
  ProcessMemoryLocationsOfCode();
  ProcessStrings();
  
  /* replace labels with addresses */
  if( !arg_show_labels ) ProcessLabels();
  
  /* dump all of the assembler instructions */
  for(int i=0; i<asm_instr.size(); i++){cout << *asm_instr[i];}
  
  //cout << "ending memory location: " << current_code_location << endl;
  /* dump all the strings */
  for( int i=0; i<asm_strings.size(); i++){ cout << *asm_strings[i];}
  //cout << " bytes: " << current_code_location-code_start << endl;
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
