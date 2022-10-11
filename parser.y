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
#include <sstream>
#include"lex.yy.c"


  // fwd declaration
  //  void addComment( string s );
  
  /* The extra parameter is also given to yyerror */
  void yyerror(FILE* fp, const char* msg);
  

  // compiler internal flags
  bool signed_comparision_is_needed=true;
  bool twos_complement_is_needed = false;
  bool pbin_is_needed = false;
  bool byte2hex_is_needed = false;
  bool printf_is_needed = false;
  bool scanf_is_needed = false;
  bool getkey_is_needed = false;
  bool hex2petscii_is_needed = false;
  bool symbol_table_is_needed = false;
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
  int current_variable_type=-1;
  int current_variable_base_address=-1;


  // helper functions
  
  stack <string> scope_stack;
  stack <string> var_scope_stack;
  stack <int> label_stack;
  vector <int> label_vector;

  int hexToDecimal( string s )
  {
    if( s[0] == '$' ) s[0] = ' ';
    if( s[0] == '#' ) s[0] = ' ';
    if( s[1] == '$' ) s[1] = ' ';
    int return_value = 0;
    std::stringstream ss;
    ss << std::hex <<  s;
    ss >> return_value;
    return return_value;
  }
  
  bool isAddress( string s )
  {
    bool return_value = false;
    if( s[0] == '$' ) return_value = true;
    return return_value;
  }

  bool isByte( string s )
  {
    bool return_value = false;
    if( s[0] == '#' && s[1] == '$' ) return_value = true;
    return return_value;
  }

  bool isInteger( string s )
  {
    bool return_value = false;
    if( s[0] != '#' && s[0] != '$' ) return_value = true;
    return return_value;
  }
  
  void addCompilerMessage(string msg, int level = 0)
  {
    /* level 0 - info */
    /* level 1 - warning */
    /* level 2 - error */
    /* level 3 - critical */
    switch( level )
      {
      case 0:
	cerr << "*** message *** line: " << countn+1 << " *** " << msg << " ***" << endl;
	break;
      case 1:
	cerr << "*** warning *** line: " << countn+1 << " *** " << msg << " ***" << endl;
	break;
      case 2:
	cerr << "*** ERROR *** line: " << countn+1 << " *** " << msg << " ***" << endl;
	break;
      case 3:
	cerr << "***  C R I T I C A L   E R R O R  *** line: " << countn+1 << " *** " << msg << " ***" << endl;
	exit(-1);
	break;
      }
    return;
  }


  int get_word_H(int x )
  {
    int return_value = 0;
    if( x > 65535 )
      {
	addCompilerMessage( "value too large for type", 2 );
	return (-1);
      }
    return_value = ( x & 0xFF00 )/0x100;
    return return_value;
  }
  
  int get_word_L(int x )
  {
    int return_value = 0;
    if( x > 65535 )
      {
	addCompilerMessage( "value too large for type", 2 );
	return (-1);
      }
    return_value = ( x & 0x00FF );
    return return_value;
  }


  int twos_complement( int x )
  {
    // for an 8 bit byte
    return ( abs( x ) ^ 255 ) + 1;
  }
    
  
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
      return toHex( (address & 0xFF00)/0x100 );
    };
    
    string getL()
    {
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
    string getText(){ return text; };
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
 

  /* ASM VARIABLE TYPES & SIZES */
  /* 0 - unsigned int - 1 bytes */
  /* 1 - signed int - 1 bytes */
  /* 2 - word - 2 bytes */
  /* 4 - double - 2 bytes */
  /* 8 - float - 4 bytes */
  class asm_variable
  {
  public:
    asm_variable( string identifier, int t = 0)
      {
	
	name=identifier;
	address=data_start;
	type=t;

	switch( t )
	  {
	  case 0:
	    // uint
	    data_start += 1;
	    break;
	  case 1:
	    // signed int
	    data_start += 1;
	    break;
	  case 2:
	    // word
	    data_start += 2;
	    break;
	  case 4:
	    // double
	    data_start += 2;
	    break;
	  case 8:
	    // float
	    data_start += 4;
	    break;
	  default:
	    data_start += 1;
	  }	   

      }
    string getAddress(){ return toHex(address); };
    int getAddressAsInt() { return address; };
    string getIdentifier(){ return name; };
    void setData( string s ){ data = s; };
    int getType(){ return type; };
    string getPrintableType()
    {
      switch( type )
	{
	case 0:
	  return string( "uint" );
	case 1:
	  return string( "int" );
	case 2:
	  return string( "word" );
	case 4:
	  return string( "double" );
	case 8:
	  return string( "float" );
	}

    };
  private:
    string data;
    int address; // somewhere between 0 and 65535
    string name;
    int type;  // 0: uint (8 bits) 1: int (8 bits)  2: double (16 bits)  4: float  8: string address (null termed) 
  };

  vector<asm_variable*> asm_variables;


  int getIndexOf( string s )
  {
    int return_value=-1;
    for( int i=0; i<asm_variables.size(); i++ )
      {
	if( asm_variables[i]->getIdentifier() == s )
	  {
	    return i;
	  }
      }
    return return_value;
  }

  string getNameOf( int a )
  {
    string return_variable = string( "" );
    
    for( int i = 0; i<asm_variables.size(); i++ )
      {
	if( asm_variables[i]->getAddressAsInt() == a )
	  {
	    return asm_variables[i]->getIdentifier();
	  }
      }
    return string( "" );
  }

int getAddressOf( string s )
  {
    int i=getIndexOf( s );
    if( i == -1 )
      {
	return -1;
      }
    else
      {
	return asm_variables[i]->getAddressAsInt();
      }
  }

int getTypeOf( string s )
  {
    int i=getIndexOf( s );
    if( i == -1 )
      {
	return -1;
      }
    else
      {
	return asm_variables[i]->getType();
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
    cerr << s << endl;
    if( arg_parser_comments ) addAsm( string("; ") + s, 0, true );
    return;
  }
  
  void addComment( string s )
  {
    if( arg_asm_comments ) addAsm( string("; ") + s, 0, true );
    return;
  }

  bool addAsmVariable( string id, int t )
  {
    string s;

    switch( t )
      {
      case 0:
	s = string( "uint" );
	break;
      case 1:
	s = string( "signed int" );
	break;
      case 2:
	s = string( "word" );
	break;
      case 4:
	s = string( "double" );
	break;
      case 8:
	s = string( "float" );
	break;
      default:
	s = string( "unknown_type" );	    
      }	   

    addParserComment( string( "Adding: " ) + string(id) + string(" of type: ") + s  );
    asm_variable * new_asm_variable = new asm_variable( id, t );
    asm_variables.push_back( new_asm_variable ); // add the variable to the list of variables
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

  void SymbolTable()
  {
    cerr << "SYMBOLS: " << endl;
    cerr << "\tFunctions" << endl;
    for( int i=0; i<asm_functions.size(); i++ )
      {
	cerr << "\t\t" << asm_functions[i]->getIdentifier() << " : " << asm_functions[i]->getLabel() << " : " <<  asm_functions[i]->getAddress() << endl;
      }
    cerr << "\tVariables" << endl;
    for( int i=0; i<asm_variables.size(); i++ )
      {
	cerr << "\t\t$" <<  asm_variables[i]->getAddress() << " : "  << asm_variables[i]->getIdentifier() << " : " << asm_variables[i]->getPrintableType() << endl;
      }
    cerr << "\tStrings" << endl;
    for( int i=0; i<asm_strings.size(); i++ )
      {
	cerr << "\t\t$" << asm_strings[i]->getAddress() << " : \"" << asm_strings[i]->getText() << "\"" <<  endl;
      }
    
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
		current_LOC.replace( current_LOC.find(string("###")+current_function), (string( "###" ) + current_function).length(), string( "JSR ") + current_label + "; " + current_function + "()" );
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
       (s == "ASL") ||
       (s == "BRK" ) ||
       (s == "CLC" ) ||
       (s == "CLD" ) ||
       (s == "CLI" ) ||
       (s == "CLV" ) ||
       (s == "DEX" ) ||
       (s == "DEY" ) ||
       (s == "INX" ) ||
       (s == "INY" ) ||
       (s == "LSR" ) ||
       (s == "NOP" ) ||
       (s == "PHA" ) ||
       (s == "PHP" ) ||
       (s == "PLA" ) ||
       (s == "PLP" ) ||
       (s == "ROL" ) ||
       (s == "ROR" ) ||
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
%token <nd_obj> tWORD tBYTE tDOUBLE tUINT tPOINTER tJSR tBYTE2HEX tTWOS tRTS tPEEK tPOKE NEWLINE CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD SUBTRACT MULTIPLY DIVIDE  UNARY INCLUDE RETURN
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
| datatype ID '(' ')' '{' { addComment( string("======================== ") + string($2.name) + string(" ========================")); addAsm( generateNewLabel(), 0, true );    addFunction( string($2.name), getLabel( label_vector[label_major]-1 ));  } body return '}'
  {
    //cerr << current_code_location << endl;
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
INT { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=1; /* insert_type();*/}
|
tBYTE { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=1; /* insert_type();*/}
|
tWORD { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=2; /* insert_type();*/}
|
tDOUBLE { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=2; /* insert_type();*/}
|
tUINT { addParserComment( string( "RULE: datatype: ") + string( $$.name ));current_variable_type=0; /* insert_type();*/}
|
FLOAT  { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=8; /* insert_type(); */}
|
CHAR { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=0; /* insert_type();*/}
|
VOID { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=16; /*insert_type();*/}
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
  addComment( "---------------------------------------------------------");
}
'(' statement {addComment("---------------------------------------------------------");}
';' condition {addComment("---------------------------------------------------------");}
{
  // addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
  addAsm( generateNewLabel(), 0, true );
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
  addComment( "6---------------------------------------------------------" );
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
// this doesn't work when the expression is expression arithmetic expression
| tBYTE2HEX '(' expression ')' ';'
{
  addParserComment( "RULE: body: tBYTE2HEX '(' expression ')' ';'" );
  byte2hex_is_needed = true;

  addComment( "=========================================================");  
  addComment( string("                 byte2hex(") + string( $3.name ) + string(")"));
  addComment( "=========================================================");
  if( $3.name[0] == '#' )
    {
      addAsm( string("LDA ") + string($3.name), 2, false );
    }
  else
    {
      addAsm( string("LDA ") + string($3.name), 3, false );
    }
  
  addComment("Push the argument onto the stack before function call" );
  addAsm( "PHA" );
  addAsm( "JSR BYTE2HEX", 3, false );
}
| tTWOS '(' ID ')' ';'
{
  twos_complement_is_needed = true;
  addComment( "=========================================================");  
  addComment( string("                 twos(") + string( $3.name ) + string(")"));
  addComment( "=========================================================");

  addAsm( string("LDA $") + toHex(getAddressOf( string( $3.name ))), 3, false );
  addAsm( "PHA" );
  addAsm( "JSR TWOS", 3, false );
  addAsm( "PLA" );
  addAsm( string("STA $") + toHex(getAddressOf( string( $3.name ))), 3, false );
}
| tTWOS '(' NUMBER ')' ';'
{
  twos_complement_is_needed = true;
  addComment( "=========================================================");  
  addComment( string("                 twos(") + string( $3.name ) + string(")"));
  addComment( "=========================================================");
  addAsm( string("LDA $") + toHex(atoi( $3.name )), 3, false );
  addAsm( "PHA" );
  addAsm( "JSR TWOS", 3, false );
  addAsm( "PLA" );
}
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
};
| tPOKE '(' NUMBER ',' ID ')' ';'
{
    addComment( "=========================================================");  
    addComment( "                     poke");
    addComment( "=========================================================");  
  $$.nd = mknode(NULL, NULL, "poke");
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
}
| tPOKE '(' ID ',' ID ')' ';'
{
    addComment( "=========================================================");  
    addComment( "                     poke");
    addComment( "=========================================================");  
  $$.nd = mknode(NULL, NULL, "poke");
  addAsm( string( "LDA $" ) + asm_variables[ getIndexOf( $5.name ) ]->getAddress(), 3, false );
  addAsm( string( "STA $" ) + asm_variables[ getIndexOf( $3.name ) ]->getAddress(), 3, false );
  addAsm( "PLA" );
}
| ID '(' expression ')' ';'
{
  addAsm( string( "###") + string($1.name), 3, false);
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




condition: expression relop expression
{
  addComment( "=========================================================");
  addComment( string( "            condition in ") + string( scope_stack.top() ));
  addComment( scope_stack.top() + string(" ")  + string($1.name) + string($2.name) + string($3.name) );
  addComment( "=========================================================");
  
  if( scope_stack.top() == "FOR" ) addAsm( generateNewLabel(true) + string( "\t\t\t; Top of FOR Loop"), 0, true );  


  // at this point, we need to look at the type of the variable that is located
  // at the $1.name address, so we know how to compare it with another number
  if( $1.name[0] == '$' )
    {
      // then it's already an address
      addAsm( string( "LDA " ) + string($1.name), 3, false);
    }
  else
    {
      addAsm( string( "LDA $" ) + toHex(getAddressOf( $1.name )), 3, false);

    }
  addAsm( "PHA" );
  
  /* When comparing Negatives and Positives, please take special care! */
  /* check bit 7 of A and B... if they are the same then continue, otherwise */
  /* undo two's complement in the one where 7 is set */
  

  // if it's ID < IMM
  if( $3.name[0] == '#'  )
    {

      addAsm( string( "LDA " ) + string( $3.name ), 2, false );
    }
  // otherwise
   else
     {

       if( getTypeOf( $1.name )  !=  getTypeOf( $3.name ) )
	 {
	   cerr << "type mismatch error line: " << countn+1 << endl;
	   exit(-1);
	 }
       addAsm( string( "LDA $" ) + toHex(getAddressOf( $3.name )), 3, false );
     }
   addAsm( "PHA" );
   addAsm( "JSR SIGNEDCMP", 3, false );
   addAsm( "PLP" );



  if( scope_stack.top() == "FOR" || scope_stack.top() == "WHILE") 
    {
      if( string( $2.name ) == string( "<=" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 2, false );
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to BODY" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	  
	}
      else if( string( $2.name ) == string( "==" ) )
	{
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to BODY" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	}
      else if( string( $2.name ) == string( ">" ) )
	{
	  addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+2, false) + string( "; if z==1 jump out of FOR" ), 2, false );
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+2, false) + string( "; if c==0 jump out of FOR" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to body of FOR" ), 3, false );
	}
      else if( string( $2.name ) == string( "<" ) )
	{
	  addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	}
      else if( string( $2.name ) == string( ">=" ) )
	{
	  addAsm( string( "BCS ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to BODY" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	}
      else /* != ... NOT EQUAL TO */
	{
	  addAsm( string( "BNE ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==0 jump to BODY" ), 2, false );
	  addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
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


statement: datatype ID init
{
  addParserComment( "RULE: statement: datatype ID init" );
  addParserComment( string($1.name) + " " + string( $2.name ) + "=" + string($3.name) );

  string my_type = string($1.name);

  /* this is where we set the types */
  if( my_type == "int" )
    {
      current_variable_type == 1;
    }

  addAsmVariable( $2.name, current_variable_type );
  
  
  current_variable_base_address = getAddressOf( $2.name );
  addParserComment( toString(current_variable_base_address) );
  if( isAddress($3.name)) 
    {
      // then it's an address
      addAsm( string("LDA ") + string($3.name), 3, false );
    }
  else if( isByte($3.name) )
    {
      // then it's a byte
      string tmp_string = string( $3.name).substr( 2, 2 );

      
      addParserComment( tmp_string );
      addAsm( string("LDA #$") + toHex(atoi(tmp_string.c_str())), 2, false );
    }
  else if( isInteger($3.name) )
    {
      // this must be a literal

      addAsm( "; \t\t\t\tHUH?" , 0, false );
      addAsm( string( "LDA #$" ) + toHex( atoi($3.name) ), 2, false);
      //addAsm( "LDA #$00", 2, false );
      
    }
  else
    {
      addAsm( "; \t\t\t\tUnknown Value in Source Code" , 0, false );
    }
  
  if( current_variable_type == 1 )
  {
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
  }
  else if( string($1.name) == "uint" )
    {
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
    }
  else if( current_variable_type == 2 )
    {
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );
    }
  //current_variable_type = -1;
  //current_variable_base_address=-1;
  
  
}
| ID '=' expression
{
  addParserComment( "RULE: statement ID '=' expression" );
  addParserComment( string($1.name) + string(" = ") + string($3.name) );
  
  current_variable_base_address = getAddressOf( $1.name );
  addParserComment( toString(current_variable_base_address) );
  if( isAddress($3.name))
    {
      // then it's an address
      //addAsm( string("LDA ") + string($3.name), 3, false );
    }
  else
    {
      // then it's a byte
      addAsm( string("LDA #$") + toHex(atoi($3.name)) + string("; Line 1431"), 2, false );
    }
  
  if( current_variable_type == 1 )
  {
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
  }
  else if( string($1.name) == "uint" )
    {
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
    }
  else if( current_variable_type == 2 )
    {
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );
    }
  //current_variable_type = -1;
  //current_variable_base_address=-1;


  //addParserComment( string($1.name) + string(" = ") + string($3.name) );

  //if( $3.name[0] == '#' )
  //  {     
  //    addAsm( string( "LDA " ) + string( $3.name ), 2, false );
  //  }
  //else if( $3.name[0] == '$' )
  //  {
  //    addAsm( string( "LDA " ) + string( $3.name ), 3, false );
  //  }
  
  //addAsm( string( "STA " ) + toHex(getAddressOf($1.name)), 3, false );

  
  // This is where a variable is given the value of a different variable
  //sprintf(icg[ic_idx++], "%s = %s <<==", $1.name, $4.name);
  //addAsm(icg[ic_idx-1], false );
 
}
| ID { addParserComment( "RULE: statement: ID {} relop expression" ); } relop expression
{
  $1.nd = mknode(NULL, NULL, $1.name);
  $$.nd = mknode($1.nd, $4.nd, $3.name);

}
| ID
{
  addParserComment( "RULE: statement: ID {} UNARY" ); check_declaration($1.name); } UNARY { 
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
  strcpy( $$.name, toHex(getAddressOf( $1.name )).c_str() );
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
  addParserComment( string( "RULE: init: '=' expression [" ) + string( $2.name ) + string( " -> itself" ));
  int v = atoi( $2.name );
  
  if( v < 0 )
  {
      addComment( "Two's Complement" );
      v=twos_complement(v);
    }
  //addAsm( string( "LDA #$" ) + toHex(v), 2, false  );
  //strcpy( $$.name, $2.name );
  strcpy( $$.name, toString( v ).c_str() );
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
  addParserComment( string( $1.name ) + string( " " ) + string( $2.name ) + string( " " ) + string( $3.name ) );
  
  // here is where we should check to see if the
  // variable ($$.name) is already in use (in _this_ scope).
  // .. but we don't yet

  /* if they're BOTH IMM's */
  if( isInteger( $1.name ) && isInteger( $3.name ))
    {
      addParserComment( "IMM + IMM" );
      int tmp_int1 = atoi( $1.name );
      int tmp_int2 = atoi( $3.name );

      /* then this is a compile-time arithetic operation */
      if( string( $2.name ) == "+"  )
        {
	  strcpy( $$.name, toString( tmp_int1 + tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "-" )
	{
	  strcpy( $$.name, toString( tmp_int1 - tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "*" )
	{
	  strcpy( $$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "/" )
	{
	  strcpy( $$.name, toString( tmp_int1 / tmp_int2 ).c_str() );
	}
      else
	{

	  addParserComment( string( "I am unable to recognize [") + string($2.name) + string("]" ));
	  strcpy( $$.name, string("unknown").c_str() );
	}


    }
  else if( isByte( $1.name ) && isByte( $3.name ) )
    {
      addParserComment( "IMM + IMM" );
      int tmp_int1;
      int tmp_int2;

      std::stringstream ss;
      ss << std::hex <<  string($1.name).substr( 2, 2 );
      ss >> tmp_int1;
      ss << std::hex <<  string($3.name).substr( 2, 2 );
      ss >> tmp_int2;
      
      /* then this is a compile-time arithetic operation */
      if( string( $2.name ) == "+"  )
        {
	  strcpy( $$.name, toString( tmp_int1 + tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "-" )
	{
	  strcpy( $$.name, toString( tmp_int1 - tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "*" )
	{
	  strcpy( $$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "/" )
	{
	  strcpy( $$.name, toString( tmp_int1 / tmp_int2 ).c_str() );
	}
      else
	{

	  addParserComment( string( "I am unable to recognize [") + string($2.name) + string("]" ));
	  strcpy( $$.name, string("unknown").c_str() );
	}


    }
  else if( isByte( $1.name ) && isAddress( $3.name ))
    {
      addParserComment( "IMM + ID" );
     
      int tmp_int1;
      
      std::stringstream ss;
      ss << std::hex <<  string($1.name).substr( 2, 2 );
      ss >> tmp_int1;

      int tmp_size = 2;
      if( isAddress( $3.name ) )
	{
	  tmp_size = 3;
	  addAsm( string("LDA ") + string( $3.name ), tmp_size, false);
	}
      else if( isByte( $3.name ) )
	{
	  tmp_size = 2;
	  addAsm( string("LDA ") + string( $3.name ), tmp_size, false);
	}
      else if( isInteger( $3.name ) )
	{
	  // then it's an integer
	  tmp_size = 2;
	  addAsm( string("LDA #$") + toHex( atoi($3.name) ), tmp_size, false);

	}
      else
	{
	  addAsm( "\t\t\t; Unknown numeric type!", 0, false );
	}
      
      if( string($2.name) == "+" )
	{
	  addAsm( "CLC" );
	  addAsm( string("ADC ") + string( $1.name ),2, false);
	}
      else if ( string($2.name) == "-" )
	{
	  addAsm( "SEC" );
	  addAsm( string("SBC ") + string( $1.name ),2, false);
	}
      else
	{
	  addComment( "unknown state" );
	}
    }
  else if( isByte( $3.name ) )
    {
      addParserComment( "ID + IMM" );

      int tmp_size = 2;
      string tmp_string;
      if( $1.name[0] == '$' )
	{
	  tmp_size = 3;
	  //tmp_string = string($1.name).substr( 2, 4 );
	  tmp_string = string($1.name);
	}
      else if( $1.name[0] == '#' && $1.name[1] == '$' )
	{
	  tmp_size = 2;
	  tmp_string = string($1.name).substr( 2, 4 );
	}
      addAsm( string("LDA ") + tmp_string, tmp_size, false);

      if( string($2.name) == "+" )
	{
	  addAsm( "CLC" );
	  addAsm( string("ADC ") + string( $3.name ),2, false);
	}
      else if ( string($2.name) == "-" )
	{
	  addAsm( "SEC" );
	  addAsm( string("SBC ") + string( $3.name ),2, false);
	}
      else
	{
	  addComment( "unknown state" );
	}
    }
  else
    {
      addParserComment( "ID + ID" );
      if( string( $2.name ) == "+" )
	{
	  if( isByte( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC ") + string($1.name),2, false);
	    }
	  else if( isInteger( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC #$") + toHex(atoi($1.name)),2, false);
	    }
	  else if(  isAddress( $1.name ) && isByte( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC ") + string($3.name),2, false);
	    }
	  else if(  isAddress( $1.name ) && isInteger( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC #$") + toHex(atoi($3.name)),2, false);
	    }
	  else if( isAddress( $1.name ) && isAddress( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC ") + string($3.name),3, false);
	    }
	  else
	    {
	      addCompilerMessage( "math error", 3);
	    }
	}
      else if( string( $2.name ) == "-" )
	{

	  if( isByte( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC ") + string($1.name),3, false);
	    }
	  else if( isInteger( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC #$") + toHex(atoi($1.name)),2, false);
	    }
	  else if(  isAddress( $1.name ) && isByte( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC ") + string($3.name),2, false);
	    }
	  else if(  isAddress( $1.name ) && isInteger( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC #$") + toHex(atoi($3.name)),2, false);
	    }
	  else if( isAddress( $1.name ) && isAddress( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC ") + string($3.name),3, false);
	    }

	  else
	    {
	      addCompilerMessage( "math error", 3);
	    }

	}
      
    }
  // store the result in the "return_value" variable
  // or - maybe in the future push it onto the stach
  //addAsm( string( "STA $" ) + toHex(getAddressOf("function_return_value")), 3, false );
  //strcpy( $$.name, string( "x" ).c_str() );
  
}
| value
{
  addParserComment( "RULE: expression: value" );
  addParserComment( string( $1.name ) );
  strcpy( $$.name, $1.name);
}
| ID
{
  // send up the address of the ID
  addParserComment(string( "RULE: expression ID : ") + string($1.name ));
  int base_address = getAddressOf($1.name);
  int t = getTypeOf( $1.name );
  
  //addParserComment( string( "Type: " ) + string( toHex( t ) ) + string(" ") +  string( $1.name)  + string( " " ) + toHex(getAddressOf($1.name )) ); 
  strcpy( $$.name, (string( "$" ) + toHex(getAddressOf($1.name ))).c_str() );
  //strcpy( $$.name, (string( "$" ) + string($1.name )).c_str() );
}
|
;

arithmetic:
ADD
{
  addParserComment( "RULE: arithmetic ADD" );
  current_state = string("+");
  strcpy( $$.name, "+" );  
}
| SUBTRACT
{
  addParserComment( "RULE: arithmetic SUBTRACT" );
  current_state = string("-");
  strcpy( $$.name, "-" );
}
| MULTIPLY {  addParserComment( "RULE: arithmetic MULTIPLY" ); current_state = string("*"); strcpy( $$.name, "*" );}
| DIVIDE {  addParserComment( "RULE: arithmetic DIVIDE" ); current_state = string("/"); strcpy( $$.name, "/" );}
;

relop: LT { current_state = string( "LT" );  }
| GT { current_state = string( "GT" ); }
| LE { current_state = string( "LE" ); }
| GE { current_state = string( "GE" ); }
| EQ { current_state = string( "EQ" ); }
| NE { current_state = string( "NE" ); }
;

value:
NUMBER
{
  /* ASM VARIABLE TYPES & SIZES */
  /* 0 - unsigned int - 1 bytes */
  /* 1 - signed int - 1 bytes */
  /* 2 - word - 2 bytes */
  /* 4 - double - 2 bytes */
  /* 8 - float - 4 bytes */

  addParserComment(string("RULE: expression: NUMBER :") +  string($1.name ));

  int v = atoi( $1.name );

  switch( current_variable_type )
    {
    case -1:
      addParserComment("no type for value");
      addCompilerMessage("no type for value", 2 );
      /* ERROR  - NO TYPE */
      break;
    case 0:
      addComment( "unsigned int" );
      if( v > 255 )
	{
	  addCompilerMessage("type overflow", 2 );
	}
      
      break;
      
    case 1:
      addComment( "signed int" );
      if( v > 127 )
	{
	  addCompilerMessage("type overflow", 2 );
	}
      else if( v < -128 )
	{
	  addCompilerMessage("type underflow", 2 );
	}
      else if( v < 0 )
	{
	  addComment( "Two's Complement" );
	  v=twos_complement(v);
	}
      //addAsm( string( "LDA #$" ) + toHex(v), 2, false  );
      break;
    case 2:
      if( v > 65535 )
	{
	  addCompilerMessage("type overflow", 2 );
	}
      //addAsm( string( "LDA #$" ) + toHex(get_word_L(v)), 2, false  );
      //addAsm( string( "LDX #$" ) + toHex(get_word_H(v)), 2, false  );
      
      break;
    case 4:
      break;
    case 8:
      break;
    default:
      break;
    }
  
  strcpy( $$.name, (toString( v )).c_str()  );
  //strcpy( $$.name, ( string( "#$" ) + toHex( v )).c_str()  );
  //strcpy( $$.name, ( string( "#$" ) + toHex( v )).c_str()  );
  //strcpy( $$.name, $1.name );
}
| INT
{
  addParserComment(string("RULE: expression: INT :") +  string($1.name ));
  strcpy( $$.name, $1.name );
}
|
FLOAT_NUM
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
  //sprintf($$.type, "char");
  //add('C');
  $$.nd = mknode(NULL, NULL, $1.name);
}
;

return: RETURN ';'
{
    addParserComment( "RULE: return: RETURN {} ';'" );
    addComment( "Returning 'void' ... 'return_value' is unchanged." );
    addAsm( "RTS" );
}
| RETURN {} expression ';'
  {
    addParserComment( "RULE: return: RETURN {} expression ';'" );
    addAsm( string( "STA $" ) + toHex(getAddressOf("function_return_value")), 3, false );
    addAsm("RTS");
  }
| RETURN {} value ';'
  {
    addParserComment( "RULE: return: RETURN {} value ';'" );

    //cerr << "return: " << $3.name << endl;
    addComment( "Whatever value is in Accumulator when return is called is stored in 'return_value'" );
    addAsm( string( "STA $" ) + toHex(getAddressOf("function_return_value")), 3, false );

    addAsm("RTS");
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
      if( a == "--symbol-table" ) symbol_table_is_needed = true;
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
  
  // temp storage for return values from expressions
  addAsmVariable( "function_return_value", 1 );
  addAsmVariable( "op1", 1 );

  
  //addAsmVariable( "print_tmp_h", 1 );

  //addAsmVariable( "string_tmp_l", 1 );
  //addAsmVariable( "string_tmp_h", 1 );

  if( scanf_is_needed)
    {
      addAsmVariable( "buffer_tmp_l", 1 );
      addAsmVariable( "buffer_tmp_h", 1 );
    }

  addAsmVariable( "hex2petscii_tmp_l", 1 );
  addAsmVariable( "hex2petscii_tmp_h", 1 );
  
  addAsmVariable( "hex2petscii_tmp_byte", 1 );


  addAsmVariable( "return_address_1", 1 );
  addAsmVariable( "return_address_2", 1 );
  // technically, this is the processor status register value
  addAsmVariable( "return_address_3", 1 );
  
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
 
  //if( hex2petscii_is_needed )
  if( false )
    {
      // function for just one digit
      addAsm( "H2PDIGIT:", 0, true );
      
      addAsm( string( "LDA $") + toHex(getAddressOf( "hex2petscii_tmp_byte" ) ), 3, false );
      
      addAsm( "AND #$0F", 2, false );
      addAsm( "CLC", 1, false );
      addAsm( "ADC #$1E", 2, false );
      addAsm( "CMP #$28", 2, false );
      addAsm( ".BYTE #$90", 1, false );
      addAsm( ".BYTE #$03", 1, false );
      addAsm( "CLC", 1, false );
      addAsm( "ADC #$19", 2, false );
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "RTS", 1, false );


      // function for values > than 1 digit
      addAsm( "H2PMANY:", 0, true );
      addAsm( "LDX #$00", 2, false );
      addAsm( "H2PMANY1:\t\t;top of H2PMANY loop #1", 0, true );
      addAsm( string( "LDA $") + toHex( getAddressOf( "hex2petscii_tmp_l" ) ) + string( ",X"), 3, false );

      addAsm( "AND #$0F", 2, false );
      addAsm( "PHA", 1, false );
      addAsm( string( "LDA $") + toHex(getAddressOf( "hex2petscii_tmp_l" ) )+ string( ",X"), 3, false );
      addAsm( "AND #$F0", 2, false );
      addAsm( "LSR", 1, false );
      addAsm( "LSR", 1, false );
      addAsm( "LSR", 1, false );
      addAsm( "LSR", 1, false );
      addAsm( "PHA", 1, false );
      addAsm( "CPX #$01", 2, false );
      addAsm( ".BYTE #$F0", 1, false );
      addAsm( ".BYTE #$04", 1, false );
      addAsm( "INX", 1, false );
      addAsm( "JMP H2PMANY1", 3, false );
	      
      addAsm( "LDX #$04", 2, false );
      addAsm( "H2PMANY2:\t\t;top of H2PMANY loop #2", 0, true );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "hex2petscii_tmp_byte" )), 3, false );
      addAsm( "JSR H2PDIGIT", 3, false );
      addAsm( "CPX #$00", 2, false );
      addAsm( ".BYTE #$90", 1, false );
      addAsm( ".BYTE #$03", 1, false );
      addAsm( "JMP H2PMANY2", 3, false );
      addAsm( "RTS", 1, false );
    }
  if( signed_comparision_is_needed )
    {
      addAsm( ".BYTE #$00;\tTemporary storage for comparison", 1, false );
      addAsm( ".BYTE #$00;\tMore temporary storage for comparison", 1, false );
      addAsm( "SIGNEDCMP:\t\t;Signed Comparison", 0, true );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "return_address_1" )), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      // ==================================================================================
      addAsm( "PLA" );
      addAsm( "STA $02", 2, false ); 
      addAsm( "PLA" ); // OP2
      addAsm( "STA $03", 2, false ); 
      addAsm( "EOR $02", 2, false);
      addAsm( "ROL" ); // C is now set (if warrented)
      addAsm( "BCS SGNCMPSKIP", 2, false );
      addAsm( "LDA $02", 2, false );
      addAsm( "PHA" );
      addAsm( "LDA $03", 2, false );
      addAsm( "STA $02", 2, false );
      addAsm( "PLA" );
      addAsm( "STA $03", 2, false );
      addAsm( "SGNCMPSKIP:", 0, true );
      addAsm( "LDA $02", 2, false );
      addAsm( "CMP $03", 2, false );
      addAsm( "PHP" );// push the status register to the stack with the correct values after cmp
      // ==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" ) ), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" ) ), 3, false );
      addAsm( "PHA" );
      addAsm( "RTS" );
    }
  if( byte2hex_is_needed )
    { 
      addAsm( "BYTE2HEX:\t\t;Display a Hexadecimal Byte", 0, true );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "return_address_2" ) ), 3, false );
      // =================================================================================
      addAsm( "CLD" );
      addAsm( "PLA" );
      addAsm( "TAX" );
      addAsm( "AND #$F0", 2, false );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "CMP #$0A", 2, false);
      addAsm( ".BYTE #$90", 1, false);
      addAsm( ".BYTE #$03", 1, false);
      addAsm( "CLC" );
      addAsm( "ADC #$07", 2, false);
      addAsm( "ADC #$30", 2, false);
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "TXA" );
      addAsm( "AND #$0F", 2, false);
      addAsm( "CMP #$0A", 2, false);
      addAsm( ".BYTE #$90", 1, false);
      addAsm( ".BYTE #$03", 1, false);
      addAsm( "CLC" );
      addAsm( "ADC #$07", 2, false);
      addAsm( "ADC #$30", 2, false);
      addAsm( "JSR $FFD2", 3, false );

      // =================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" ) ), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" ) ), 3, false );
      addAsm( "PHA" );
      addAsm( "RTS" );
      
    }
  if( pbin_is_needed )
    {
      addAsm( "PBIN:\t\t;Display a binary Number", 0, true );

      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );

      
      
      
      // put the return address back onto the stack
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );
  
      addAsm( "RTS" );

      
    }
  if( twos_complement_is_needed )
    {

      addAsm( "TWOS:\t\t;Two's Complement Function", 0, true );
      
      // get the return address and status flag from the stack
      // save return address
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );

      addComment( "The argument is pulled off of the stack here" );
      addAsm( "PLA" );
      addAsm( "CLC" );
      addAsm( "EOR #$FF", 2, false );
      addAsm( "ADC #$01", 2, false );

      addComment( "The return value is put on the stack here" );
      addAsm( "PHA" );
      
      addAsm( string( "LDA $" ) + toHex(getAddressOf( string( "return_address_2" ) )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( string( "return_address_1" ) )), 3, false );
      addAsm( "PHA" );
  
      addAsm( "RTS" );

    }
  if( printf_is_needed )
    {
      /* a Simple printf */      
      addAsm( "PRN:", 0, true );
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

  if( symbol_table_is_needed) SymbolTable();
  
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
