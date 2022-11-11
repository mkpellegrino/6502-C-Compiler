%{
#include<stdio.h>
#include <iostream>

#include<string>
#include<stdlib.h>
#include<ctype.h>
#include<cctype>
#include<vector>
#include <stack>
#include <sstream>
#include <cmath>
#include"lex.yy.c"


  using namespace std;

  // fwd declaration
  //  void addComment( string s );
  
  /* The extra parameter is also given to yyerror */
  void yyerror(FILE* fp, const char* msg);

  /* forward declarations */
  void addAsm( string s, int instruction_size, bool l);
  void addDebugComment( string s );
 


  // compiler internal flags
  bool split_byte_is_needed=false;
  bool decimal_digit_is_needed=false;
  bool modulus_is_needed=false;
  bool div10_is_needed=false;
  bool return_addresses_needed=true;
  bool umul_is_needed=false;
  bool cls_is_needed=false;
  bool memcpy_is_needed=false;
  bool mobcpy_is_needed=false;
  bool signed_comparison_is_needed=false;
  bool twos_complement_is_needed = false;
  bool byte2hex_is_needed = false;
  bool byt2str_is_needed = false;
  bool printf_is_needed = false;
  bool scanf_is_needed = false;
  bool getkey_is_needed = false;
  bool symbol_table_is_needed = false;
  bool sidrnd_is_needed = false;
  bool sidrnd_is_initialised = false;
  bool long_branches = true;
  
  bool debug_comments_are_needed = false;
  bool debug_flag_is_on = false;


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
  vector <int> mob_vector;
  vector <string> mobs;
  
  string stripFirst( string s )
  {
    return s.substr( 1, s.length()-1);
  }
  
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

  bool isMob( string s )
  {
    bool return_value = false;
    if( s[0] == 'm' ) return_value = true;
    return return_value;
  }
  
  bool isFloat( string s )
  {
    bool return_value = false;
    if( s[0] == 'f' ) return_value = true;
    return return_value;
  }

  bool isUint( string s )
  {
    bool return_value = false;
    if( s[0] == 'u' ) return_value = true;
    return return_value;
  }
  
  bool isWord( string s )
  {
    bool return_value = false;
    if( s[0] == 'w' ) return_value = true;
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
    //if( s[0] != '#' && s[0] != '$' ) return_value = true;
    if( s[0] == 'i' ) return_value = true;
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

  void dumpA()
  {
    if( debug_flag_is_on )
      {
	byte2hex_is_needed = true;
	/* DEBUG */
	addAsm( "PHA; DEBUG", 1, false);
	addAsm( "PHA; DEBUG", 1, false);
	addAsm( "JSR BYTE2HEX; DEBUG", 3, false );
	addAsm( "PLA; DEBUG", 1, false);
	/* DEBUG */
      }
    return;
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
    string return_value = string( "LBL" ) + itos( label_major ) + "L" + string( s );
    if( colon ) return_value += string( ":" );
    return return_value;
  }

  string getLabel( int i, bool colon=true )
  {
    string return_value = string( "LBL" ) + itos( label_major ) + "L" + itos( i );
    if( colon ) return_value += string( ":" );
    return return_value;
  }

  string binaryToHex( string s )
  {
    string return_value;

    string b;
    for( int i = 0; i < s.length(); i+=4 )
      {
	b = s.substr( i, 4 );
	if( b == "0000" ) return_value+="0";
	if( b == "0001" ) return_value+="1";
	if( b == "0010" ) return_value+="2";
	if( b == "0011" ) return_value+="3";
	if( b == "0100" ) return_value+="4";
	if( b == "0101" ) return_value+="5";
	if( b == "0110" ) return_value+="6";
	if( b == "0111" ) return_value+="7";
	if( b == "1000" ) return_value+="8";
	if( b == "1001" ) return_value+="9";
	if( b == "1010" ) return_value+="A";
	if( b == "1011" ) return_value+="B";
	if( b == "1100" ) return_value+="C";
	if( b == "1101" ) return_value+="D";
	if( b == "1110" ) return_value+="E";
	if( b == "1111" ) return_value+="F";
      }
    
    return return_value;
  }

 string fractionalToBinary( double value )
  {
    string binary_value;
    int count=0;
    while( count < 31  )
      {
	value*=2;
	if( value >= 1 ) 
	  {
	    binary_value = binary_value + string("1");
	    value = value - 1;
	  }
	else
	  {
	    binary_value = binary_value + string("0");
	  }
	count++;
      }
   
    return binary_value;
  }

 string integerToBinary( int value, int s = 8)
  {
    value = abs(value);
    string binary_value;
    while( value > 0 )
      {
	if( (value % 2) == 1 ) 
	  {
	    binary_value = string("1")+ binary_value;
	  }
	else
	  {
	    binary_value = string("0")+ binary_value;
	  }
	
	value /= 2;
      }
    while( binary_value.length() < s )
      {
	binary_value = string("0")+ binary_value;
      }
    return binary_value;
  }
	    
  string toBinaryFloat( double value )
  {

    // special case
    if( value == 0 ) return string( "0000000000" );
    string sign;
    string exponent;

    string return_value;

    if( value < 0 )
      {
	sign="1";
      }
    else
      {
	sign="0";
      }
    value = abs(value);
    double integral_part = floor(value);
    double fractional_part = value - integral_part;


    // as of right now (10/14/2022) floating point (excess-128) numbers
    // that are read in are only correct if they are >1
    // if they are <1, they seem to be shifted right 1 bit (divided by 2)
    
    int l2 = 1+floor(log2( value )); //  1023 is the bias for 64 bit fp numbers
    int exp = 128 + l2;      // on C64 FP's the bias is 63
    
    exponent = integerToBinary( exp );

    
    // find first binary 1 starting from left most bit in integer portion.
    // if there are no 1's move on to fractional part

    string nmb = integerToBinary(integral_part) + fractionalToBinary(fractional_part);

    int first_one = nmb.length();
    
    for( int i = 0; i < nmb.length(); i++ )
      {
	if( nmb[i] == '1' )
	  {
	    first_one = i;
	    break;
	  }
      }

    first_one++;
    
    nmb = nmb.substr( first_one, nmb.length() );
    

    nmb = exponent + sign + nmb;
     while( nmb.length() < 40 )
      {
	nmb+="0";
      }
     while( nmb.length() > 40 )
      {
	nmb = nmb.substr(0, nmb.length()-1);
      }

     //cerr << nmb << endl;  

     return_value = binaryToHex( nmb );
    return return_value;
  }


  // converts an integer into a string (in Hexadecimal)
  // (the hard way)
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

  // convert a string to an inline-float
  void inlineFloat( string s, int addr=105)
  {
    addDebugComment( "=========== IMM -> FAC ==========" );
    string sign;
    addDebugComment( string("Base address: ") + toHex(addr)  );
    
    string stripped_float= stripFirst( s.c_str() );

    string fp_in_hex = toBinaryFloat( atof( stripped_float.c_str() ) );

    if( atof( stripped_float.c_str() ) == 0 ) fp_in_hex=string("0000000000");

    int size_of_instruction=3;
    if( addr < 255 ) size_of_instruction-=1;
    int v=0;
    for( int i=0; i<5; i++ )
      {
	addAsm( string( "LDA #$" ) + fp_in_hex[v] + fp_in_hex[v+1], 2, false );
	addAsm( string( "STA $" ) + toHex( addr+i ), size_of_instruction, false );
	v+=2;
      }

    if( addr == 105 )
      {
	addAsm( "LDA #$69", 2, false );
	addAsm( "LDY #$00", 2, false );
	addAsm( "JSR $BBA2; RAM -> FAC", 3, false );
      }
    addDebugComment( "=================================" );
    return;
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
	type=1;
      }
    string getIdentifier(){ return name; };
    int getAddressInt(){ return address; };
    string getAddress(){ return toHex( address ); };
    void setAddress( int i ){ address=i; };
    string getLabel(){ return label; };
    int getType(){ return type; };
    void setType( int i ){ type = i; };
  private:
    int address;
    string name;
    string label;
    int type; // (return type)
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
    // index where this string is referenced in the code vector
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
      out << a.name << ":\n\t.BYTE ";
      for( int i = 0; i<a.text.size(); i++ )
	{
	  if( a.text[i] == '\\' && a.text[i+1] == 'n')
	    {
	      out << "#$0D, ";
	      i++;
	    }
	  else
	    {
	      out << "#$" << toHex((int)a.text[i]) << ", ";
	    }
	 
	}
      out << "#$00" << endl;
      return out;
    }


  /* ASM VARIABLE TYPES & SIZES */
  /* 0 - unsigned int - 1 bytes */
  /* 1 - signed int - 1 bytes */
  /* 2 - word - 2 bytes */
  /* 4 - double - 2 bytes */
  /* 8 - float - 5 bytes */
  /* 16 - mob - 63 bytes */
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
	    data_start += 5;
	    break;
	  case 16:
	    // mob
	    //data_start += 63;
	    // not stored in typical variable space
	     break;
	  default:
	    data_start += 1;
	  }	   

      }
    string getAddress(){ return toHex(address); };
    int getAddressAsInt() { return address; };
    string getIdentifier(){ return name; };
    void setData( string s ){ data = s; };
    void setAddress( int i ){ address = i; };
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
	case 16:
	  return string( "mob" );
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
    string addr_string;
    if( s[0] == '$' )
      {
	addr_string=s.substr(1,s.length()-1);
	//cerr << "[" << search_string << "]" << endl;
	for( int i=0; i<asm_variables.size(); i++ )
	  {
	    if( asm_variables[i]->getAddress() == addr_string )
	      {
		return i;
	      }
	  }
      }
    else
      {
	for( int i=0; i<asm_variables.size(); i++ )
	  {
	    if( asm_variables[i]->getIdentifier() == s )
	      {
		return i;
	      }
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
    //cerr << s << endl;
    if( arg_parser_comments ) addAsm( string("; ") + s, 0, true );
    return;
  }
  
  void addDebugComment( string s )
  {
    //cerr << s << endl;
    if( debug_comments_are_needed ) addAsm( string("; ") + s, 0, true );
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
      case 16:
	s = string( "mob" );
	break;
      default:
	s = string( "unknown_type" );	    
      }	   

    // first, make sure that it isn't alread in there.
    for( int i=0; i<asm_variables.size(); i++ )
      {
	if( asm_variables[i]->getIdentifier() == id )
	  {
	    addCompilerMessage( "you cannot re-declare variables", 3 );
	  }
      }
    if( t == 0 | t == 1 || t == 2 || t == 4 || t == 8 )
      {
	addDebugComment( string( "Adding: " ) + string(id) + string(" of type: ") + s  );
	asm_variable * new_asm_variable = new asm_variable( id, t );
	asm_variables.push_back( new_asm_variable ); // add the variable to the list of variables
      }
    else
      {
	addDebugComment( string( "NOT Adding: " ) + string(id) + string(" of type: ") + s  );
      }
  }

  void pushScope( string s )
  {
    addParserComment( "=========================================================");
    addParserComment( "                     New Scope (" + s + ")" );
    scope_stack.push( s );
    var_scope_stack.push(".");
    label_stack.push( label );

    label_major++;

  }

  void popScope()
  {
    string return_value;
    addParserComment( string("                    Release Scope (") + string( scope_stack.top()) + string( ")" ));
    while( var_scope_stack.top() != "." )
      {
	var_scope_stack.pop();
      }
    scope_stack.pop();
    label_stack.pop();
    label_major--;

    addParserComment( "=========================================================");
  }
  

  
  bool previousAsm( string s )
  {
    int i=asm_instr.size()-1;
    
    while( asm_instr[ i ]->getString().c_str()[0] == ';' )
      {
	i--;
      }
    if( asm_instr[ i ]->getString() == s ) return true;
    //if( asm_instr[ asm_instr.size()-1 ]->getString() == s ) return true;
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

	cout << "; " << asm_variables[i]->getPrintableType() << " : " << asm_variables[i]->getIdentifier() << " : $" << asm_variables[i]->getAddress() << " (" << asm_variables[i]->getAddressAsInt() << ")" << endl;
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
	asm_instr[j+2]->setSize( 2  );
	
	asm_instr[j+3]->setString( string("LDA #$") + string(asm_strings[i]->getL()));
	asm_instr[j+3]->setSize( 2  );
	asm_instr[j+4]->setString( string( "STA $02"));
	asm_instr[j+4]->setSize( 2  );
      }
  }

  void ProcessMobs()
  {
    int first_location = 12288;
    for( int i=0; i<mobs.size(); i++ )
      {
	// get identifier
	string id = string("");
	string bytes = string("");
	string tmp_string = mobs[i];
	std::size_t found = tmp_string.find(string("."));

	//addAsm( string(".org $") + string(  toHex(64*(192+i))), 0, true );
	if (found!=std::string::npos)
	  {
	    id = tmp_string.substr(0, found );
	    //	    cerr << id << endl;
	    //tmp_string.replace(found,tmp_string.length(),"$");
	    bytes = tmp_string.substr( found, tmp_string.length() );
	    //asm_instr[j]->setString( tmp_string );
	    //cerr << found << endl;
	  }
	
	int j = getIndexOf( id.c_str() );

	//asm_variables[j]->setAddress( current_code_location );
	addAsm( string("MOBLBL")+id+string(":"), 0, true );	
	addAsm( bytes, 63, false);
	//current_code_location+=63; // the +1 is for the null terminated zero
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
%token <nd_obj> tSPRITECOLLISION tGETIN tSPRITEXY tSPRITEX tSPRITEY tSPRITECOLOUR tSPRITEON tWORD tBYTE tDOUBLE tUINT tPOINTER tSIN tCOS tTAN tMOB tTOFLOAT tTOUINT tJSR tASL tLSR tSPRITESET tSPRITEON tSPRITEOFF tSPRITETOGGLE tRND tJMP tCURSORXY tNOP tCLS tBYTE2HEX tTWOS tRTS tPEEK tPOKE NEWLINE CHARACTER PRINTFF SCANFF INT FLOAT CHAR WHILE FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD SUBTRACT MULTIPLY DIVIDE  UNARY INCLUDE RETURN
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
INT { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=1; strcpy( $$.name, "INT" );}
|
tBYTE { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=1; strcpy( $$.name, "BYTE" );}
|
tWORD { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=2; strcpy( $$.name, "WORD" );}
|
tDOUBLE { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=2; strcpy( $$.name, "DOUBLE" );}
|
tUINT { addParserComment( string( "RULE: datatype: ") + string( $$.name ));current_variable_type=0; strcpy( $$.name, "UINT" );}
|
FLOAT  { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=8;strcpy( $$.name, "FLOAT" );}
|
CHAR { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=0;strcpy( $$.name, "CHAR" );}
|
tMOB { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=16;strcpy( $$.name, "MOB" );}
|
VOID { addParserComment( string( "RULE: datatype: ") + string( $$.name )); current_variable_type=32;strcpy( $$.name, "VOID" );}
;



body: WHILE
{
  pushScope("WHILE");

  addComment( "=========================================================");
  addParserComment( "                        WHILE LOOP" );
  addComment( "=========================================================");
  addAsm( "PHA" );
  addAsm( generateNewLabel(), 0, true );
  addComment( "---------------------------------------------------------");
}
'(' condition
{
    addAsm( generateNewLabel(), 0, true );


}
')' '{' body
{


  addAsm( string( "JMP ") + getLabel( label_vector[label_major]-2, false) + string( "; jump to top of FOR" ), 3, false );
  addAsm( generateNewLabel(), 0, true );
  addAsm( "PLA" );
  popScope();
}
'}'

| FOR
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
  addAsm( string("JMP ") + getLabel( label_vector[label_major]+1, false), 3, false);
  addAsm( generateNewLabel(), 0, true );

  addComment( "---------------------------------------------------------" );
  addComment( "                      ELSE:" );
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
| tSPRITEON '(' expression ')' ';'
{
  addParserComment( "statement: tSPRITEON '(' expression ')' ';' " );
  
  if( isInteger($3.name) || isUint( $3.name ) )
    {
      int x = atoi( stripFirst( $3.name ).c_str() );
      addAsm( string( "LDA #$") + toHex( x ), 2, false );
      addAsm( "ORA $D015", 3, false );
    }
  else
    {
      int x = getAddressOf( $3.name );
      addAsm( "LDA $D015", 3, false );
      addAsm( string( "ORA $") + toHex( x ), 3, false );
    }
  addAsm( "STA $D015", 3, false );
};
| tSPRITEOFF '(' expression ')' ';'
{
  addParserComment( "statement: tSPRITEOFF '(' expression ')' ';' " );
  if( isInteger($3.name) || isUint( $3.name ) )
    {
      int x = atoi( stripFirst( $3.name ).c_str() );
      addAsm( string( "LDA #$") + toHex( x ), 2, false );
    }
  else
    {
      int x = getAddressOf( $3.name );
      addAsm( string( "LDA $") + toHex( x ), 3, false );
    }
  addAsm( "EOR #$FF", 2, false );
  addAsm( "AND $D015", 3, false );
  addAsm( "STA $D015", 3, false );
};
| tSPRITETOGGLE '(' expression ')' ';'
{
  addParserComment( "statement: tSPRITETOGGLE '(' expression ')' ';' " );
  if( isInteger($3.name) || isUint( $3.name ) )
    {
      int x = atoi( stripFirst( $3.name ).c_str() );
      addAsm( string( "LDA #$") + toHex( x ), 2, false );
    }
  else
    {
      int x = getAddressOf( $3.name );
      addAsm( string( "LDA $") + toHex( x ), 3, false );
    }
  addAsm( "EOR $D015", 3, false );
  addAsm( "STA $D015", 3, false );
};
| tSPRITESET '(' expression ')' ';'
{
  addParserComment( "statement: tSPRITESET '(' expression ')' ';' " );
  if( isInteger($3.name) || isUint( $3.name ) )
    {
      int x = atoi( stripFirst( $3.name ).c_str() );
      addAsm( string( "LDA #$") + toHex( x ), 2, false );
    }
  else
    {
      int x = getAddressOf( $3.name );
      addAsm( string( "LDA $") + toHex( x ), 3, false );
    }
  addAsm( "STA $D015", 3, false );
};
| tSPRITEXY '(' expression ',' expression ',' expression ')' ';'
{
  addComment( string( "spritexy( ") + string( $3.name ) + string(", ") + string( $5.name ) + string( ", " ) + string( $7.name ) + string( " );" ) );


  int base_address = 53248;
  int sprite_address = 0;
  int x_coord = 0;
  int y_coord = 0;
  if( isInteger( $3.name ) && isInteger( $5.name ) && isInteger( $7.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDA #$" ) + toHex( x_coord) , 2, false );
      addAsm( string( "STA $" ) + toHex( sprite_address ), 3, false );
      y_coord = atoi( stripFirst( $7.name ).c_str() );
      addAsm( string( "LDA #$" ) + toHex( y_coord) , 2, false );
      addAsm( string( "STA $" ) + toHex( sprite_address+1 ), 3, false );
    }
  else if( isInteger( $3.name ) && isInteger( $5.name ) && isAddress( $7.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDA #$" ) + toHex( x_coord) , 2, false );
      addAsm( string( "STA $" ) + toHex( sprite_address ), 3, false );
      //y_coord = atoi( stripFirst( $7.name ).c_str() );
      addAsm( string( "LDA " ) + string($7.name) , 3, false );
      addAsm( string( "STA $" ) + toHex( sprite_address+1 ), 3, false );
    }
  else if( isInteger( $3.name ) && isAddress( $5.name ) && isAddress( $7.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      //x_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDA " ) + string($5.name) , 3, false );
      addAsm( string( "STA $" ) + toHex( sprite_address ), 3, false );
      //y_coord = atoi( stripFirst( $7.name ).c_str() );
      addAsm( string( "LDA " ) + string($7.name) , 3, false );
      addAsm( string( "STA $" ) + toHex( sprite_address+1 ), 3, false );
    }
  else if( isInteger( $3.name ) && isAddress( $5.name ) && isInteger( $7.name ))
    {
       
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      //x_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDA " ) + string($5.name), 3, false );
      addAsm( string( "STA $" ) + toHex( sprite_address ), 3, false );
      y_coord = atoi( stripFirst( $7.name ).c_str() );
      addAsm( string( "LDA #$" ) + toHex( y_coord), 2, false );
      addAsm( string( "STA $" ) + toHex( sprite_address+1 ), 3, false );
    }
  else if( isAddress( $3.name ) && isAddress( $5.name ) && isAddress( $7.name ))
    {
      addComment( "All 3 parameters are variables" );
      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
      addAsm( "CLC" );
      addAsm( "ASL" ); // 2x
      addAsm( "TAX" );
      addAsm( string( "LDA " ) + string($5.name), 3, false );
      addAsm( string( "STA $D000,X; set the x-coord" ), 3, false );

      addAsm( "INX" );
      addAsm( string( "LDA " ) + string($7.name), 3, false );
      addAsm( string( "STA $D000,X; set the y-coord" ), 3, false );
      
    }
  else if( isAddress( $3.name ) && isInteger( $5.name ) && isInteger( $7.name ))
    {
      addComment( "All 3 parameters are variables" );
      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
      addAsm( "CLC" );
      addAsm( "ASL" ); // 2x
      addAsm( "TAX" );
      addAsm( string( "LDA #$" ) + stripFirst(string($5.name)), 2, false );
      addAsm( string( "STA $D000,X; set the x-coord" ), 3, false );

      addAsm( "INX" );
      addAsm( string( "LDA #$" ) + stripFirst(string($7.name)), 2, false );
      addAsm( string( "STA $D000,X; set the y-coord" ), 3, false );
      
    }
  else
    {
      addComment( "Use all Variables for parameters" );
    }

};
| tSPRITEX '(' expression ',' expression ')' ';'
{
  addComment( string( "spritex( ") + string( $3.name ) + string(", ") + string( $5.name ) + string( " );" ) );


  int base_address = 53248;
  int sprite_address = 0;
  int x_coord = 0;
  int y_coord = 0;
  if( isInteger( $3.name ) && isInteger( $5.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDA #$" ) + toHex( x_coord) , 2, false );
      addAsm( string( "STA $" ) + toHex( sprite_address ), 3, false );
    }
  else if( isInteger( $3.name ) && isAddress( $5.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( string( "LDA " ) + string($5.name) , 3, false );
      addAsm( string( "STA $" ) + toHex( sprite_address ), 3, false );
    }
  else if( isAddress( $3.name ) && isAddress( $5.name ) )
    {
      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
      addAsm( "CLC" );
      addAsm( "ASL" ); // 2x
      addAsm( "TAX" );
      addAsm( string( "LDA " ) + string($5.name), 3, false );
      addAsm( string( "STA $D000,X; set the x-coord" ), 3, false );
      
    }
  else if( isAddress( $3.name ) && isInteger( $5.name ))
    {
      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
      addAsm( "CLC" );
      addAsm( "ASL" ); // 2x
      addAsm( "TAX" );
      addAsm( string( "LDA #$" ) + stripFirst(string($5.name)), 2, false );
      addAsm( string( "STA $D000,X; set the x-coord" ), 3, false );
    }
  else
    {
      addCompilerMessage( "spritex error", 1 );
    }

};
| tSPRITEY '(' expression ',' expression ')' ';'
{
  addComment( string( "spritey( ") + string( $3.name ) + string(", ") + string( $5.name ) + string( " );" ) );


  int base_address = 53248;
  int sprite_address = 0;
  int x_coord = 0;
  int y_coord = 0;
  if( isInteger( $3.name ) && isInteger( $5.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDA #$" ) + toHex( x_coord) , 2, false );
      addAsm( string( "STA $" ) + toHex( sprite_address + 1 ), 3, false );
    }
  else if( isInteger( $3.name ) && isAddress( $5.name ))
    {
      sprite_address = atoi( stripFirst( $3.name ).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( string( "LDA " ) + string($5.name) , 3, false );
      addAsm( string( "STA $" ) + toHex( sprite_address +1 ), 3, false );
    }
  else if( isAddress( $3.name ) && isAddress( $5.name ) )
    {
      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
      addAsm( "CLC" );
      addAsm( "ASL" ); // 2x
      addAsm( "TAX" );
      addAsm( string( "LDA " ) + string($5.name), 3, false );
      addAsm( string( "STA $D001,X; set the x-coord" ), 3, false );
      
    }
  else if( isAddress( $3.name ) && isInteger( $5.name ))
    {
      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
      addAsm( "CLC" );
      addAsm( "ASL" ); // 2x
      addAsm( "TAX" );
      addAsm( string( "LDA #$" ) + stripFirst(string($5.name)), 2, false );
      addAsm( string( "STA $D001,X; set the x-coord" ), 3, false );
    }
  else
    {
      addCompilerMessage( "spritex error", 1 );
    }

};
| tSPRITECOLOUR '(' expression ',' expression ')' ';'
{
  addParserComment( "statement: tSPRITECOLOUR '(' expression ',' expression ')' ';'" );

  /* $3.name is the sprite # */
  /* $5.name is the colour */

  int base_addr = 53248;
  int sprite_number = 0;
  int sprite_colour = 0;

  if( isInteger( $5.name ) || isUint( $5.name ))
    {
      sprite_colour = atoi( stripFirst( $5.name ).c_str() ); // the sprite #
      addAsm( string( "LDA #$" ) + toHex( sprite_colour ), 2, false );
    }
  else if( isAddress( $5.name ) )
    {
      sprite_colour = getAddressOf( $5.name );
      addAsm( string( "LDA $" ) + toHex( sprite_colour ), 3, false );
    }

  if( isInteger( $3.name ) || isUint( $5.name ))
    {
      sprite_number = atoi( stripFirst( $3.name ).c_str() ); // the sprite #
      addAsm( string( "STA $" + toHex( base_addr+sprite_number+39 )), 3, false );
    }
  else if( isAddress( $3.name ) )
    {
      sprite_number = getAddressOf( $3.name );
      addAsm( string( "LDX $" ) + toHex( getAddressOf( $3.name ) ), 3, false );
      addAsm( string( "STA $D027,X" ), 3, false );
    } 
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
| PRINTFF '(' expression ')' ';'
{
  addComment( "=========================================================");      
  addComment( string("printf(") + string($3.name) + string( ");") );
  addComment( "=========================================================");  
  addParserComment( string("printf(") + string($3.name) + string( ");") );
  if( getTypeOf( $3.name ) == 0 )
    {
      byt2str_is_needed = true;
      pushScope( "PRINTF" );
      addAsm( string("LDA ") + string($3.name), 3, false );
      addAsm( "PHA" );
      addAsm( "JSR BYT2STR", 3, false );
      addAsm( "PLA" );
      addAsm( "TAX" );
      addAsm( "PLA" );
      addAsm( "TAY" );
      addAsm( "PLA" );
      addAsm( "CMP #$30", 2, false );
      addAsm( string( "BEQ " ) + getLabel( label_vector[label_major]+2,false), 2, false ); // BNE AA
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "TYA" );
      addAsm( generateNewLabel() + string( "\t\t\t; Just Two Bytes"), 0, true ); // LABEL BB
      addAsm( "JSR $FFD2", 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t; Only One Byte"), 0, true ); // LABEL CC
      addAsm( "TXA" );
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "; jump to label below ", 0, true );
      addAsm( string( "JMP " ) + getLabel( label_vector[label_major]+1,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t; Label CMP2"), 0, true ); // LABEL AA
      addAsm( "TYA" );
      addAsm( "CMP #$30", 2, false );
      addAsm( string( "BEQ " ) + getLabel( label_vector[label_major]-2,false), 2, false );
      addAsm( string( "JMP " ) + getLabel( label_vector[label_major]-3,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t; Done"), 0, true );
      popScope();
    }
  else if( getTypeOf( $3.name ) == 1 )
    {
      byt2str_is_needed = true;
      
      pushScope( "PRINTF" );
      //addAsm( "LDA #$00", 2, false );
      //addAsm( "LDA #$7F", 2, false );
      //addAsm( "PHA" );
      addAsm( string("LDA ") + string($3.name), 3, false );
      addAsm( "PHA" );
      
      addAsm( "CMP #$7F", 2, false );
      addAsm( string( "BCC " ) + getLabel( label_vector[label_major],false), 2, false ); // BCC Skip
      addAsm( string("LDA ") + string($3.name), 3, false );
      //addAsm( "SEC" );
      // addAsm( string("STA ") + string($3.name), 3, false );
      //addAsm( "JSR BYTE2HEX", 3, false ); byte2hex_is_needed = true;
      addAsm( "LDA #$2D", 2, false );
      addAsm( "JSR $FFD2", 3, false );
      
      // put it into two's complement
      addAsm( "PLA" );

      addAsm( "SEC" );
      addAsm( "SBC #$01", 2, false );
      addAsm( "EOR #$FF", 2, false );
      addAsm( "PHA" );
      
      
      addAsm( generateNewLabel() , 0, true ); // LABEL BB      

      //addAsm( string("LDA ") + string($3.name), 3, false );
      //addAsm( "PHA" );
      

      addAsm( "JSR BYT2STR", 3, false );
      addAsm( "PLA" );
      addAsm( "TAX" );
      addAsm( "PLA" );
      addAsm( "TAY" );
      addAsm( "PLA" );
      addAsm( "CMP #$30", 2, false );
      addAsm( string( "BEQ " ) + getLabel( label_vector[label_major]+2,false), 2, false ); // BNE AA
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "TYA" );
      addAsm( generateNewLabel() + string( "\t\t\t; Just Two Bytes"), 0, true ); // LABEL BB
      addAsm( "JSR $FFD2", 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t; Only One Byte"), 0, true ); // LABEL CC
      addAsm( "TXA" );
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "; jump to label below ", 0, true );
      addAsm( string( "JMP " ) + getLabel( label_vector[label_major]+1,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t; Label CMP2"), 0, true ); // LABEL AA
      addAsm( "TYA" );
      addAsm( "CMP #$30", 2, false );
      addAsm( string( "BEQ " ) + getLabel( label_vector[label_major]-2,false), 2, false );
      addAsm( string( "JMP " ) + getLabel( label_vector[label_major]-3,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t; Done"), 0, true );
      popScope();



    }
  else if( string($3.name ) == string("A") )
    {
      byte2hex_is_needed = true;
      addAsm( "PHA" );
      addAsm( "JSR BYTE2HEX", 3, false );
    }
  else if( string($3.name) == string("ARG") )
    {
      addAsm( "LDA #$69; ARG_L", 2, false );
      addAsm( "LDY #$00; ARG_H", 2, false );
      addAsm( "JSR $BBA2; RAM -> FAC", 3, false ); // FP ->FAC
      addAsm( "JSR $BDDD; FAC -> PETSCII ($0100)", 3, false );
      addAsm( "LDA #$00", 2, false );
      addAsm( "STA $02", 2, false );
      addAsm( "LDA #$01", 2, false );
      addAsm( "STA $03", 2, false );
      addAsm( "JSR PRN", 3, false); printf_is_needed = true;

      

      // call the FOUT
      
      //addAsm( "JSR $AABC; FAC -> CRT", 3, false ); // FP --> CRT
    }
  else if( string($3.name) == string("FAC") )
    {
      addAsm( "JSR $BDDD; FAC -> PETSCII ($0100)", 3, false );
      addAsm( "LDA #$00", 2, false );
      addAsm( "STA $02", 2, false );
      addAsm( "LDA #$01", 2, false );
      addAsm( "STA $03", 2, false );
      addAsm( "JSR PRN", 3, false); printf_is_needed = true;
      //addAsm( "JSR $AABC; FAC -> CRT", 3, false ); // FP --> CRT
    }
  else if( getTypeOf( $3.name ) == 8)
    {
      current_variable_base_address = getAddressOf( $3.name );

      addAsm( string("LDA #$") + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( string("LDY #$") + toHex( get_word_H( current_variable_base_address )), 2, false );
      
      // load it into FAC
      addAsm( "JSR $BBA2; RAM -> FAC", 3, false ); // FP ->FAC
      // call the FOUT

      addAsm( "JSR $BDDD; FAC -> PETSCII ($0100)", 3, false );
      addAsm( "LDA #$00", 2, false );
      addAsm( "STA $02", 2, false );
      addAsm( "LDA #$01", 2, false );
      addAsm( "STA $03", 2, false );
      addAsm( "JSR PRN", 3, false ); printf_is_needed = true;





      //addAsm( "JSR $AABC; FAC -> CRT", 3, false ); // FP --> CRT
    }
  else if( getTypeOf( $3.name ) == 2 )
    {
      current_variable_base_address = getAddressOf( $3.name );
      int base_address_op1 = hexToDecimal( $3.name );
      int inst_size = 3;
      if( base_address_op1 < 256 ) inst_size--;
      // store the word  as a float
      addAsm( string("LDY $") + toHex( ( base_address_op1 )), inst_size, false );

      if( base_address_op1+1 >= 256 ) inst_size++;
      addAsm( string("LDA $") + toHex( ( base_address_op1+1 )), inst_size, false );
      addAsm( "JSR $B391", 3, false );

      // print out the float in FAC
      addAsm( "JSR $AABC; FAC -> CRT", 3, false );

    }
};
| PRINTFF '(' STR ')' ';'
{
  addComment( "=========================================================");      
  addComment( string("printf(") + string($3.name) + string( ");") );
  addComment( "=========================================================");  
  // add the string stripped of its' quotes
		
  addString( string("STRLBL") + itos(string_number++), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );
  // these will later be replaced during Process Strings
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "NOP ; to be replaced", 1, false);
  addAsm( "JSR PRN", 3, false ); printf_is_needed = true;
};
| tBYTE2HEX '(' expression ')' ';'
{
  addParserComment( "RULE: body: tBYTE2HEX '(' expression ')' ';'" );
  byte2hex_is_needed = true;
  int t;
  if( string($3.name) == "A" )
    {
      addAsm( "PHA" );
      addAsm( "JSR BYTE2HEX", 3, false );
      t = -1;
    }
  else
    {
      t = getTypeOf( $3.name );
    }

  addComment( "=========================================================");  
  addComment( string("                 byte2hex(") + string( $3.name ) + string(")"));
  addComment( "=========================================================");


  addParserComment( $3.name  );
  if( t == 0 || t == 1 )
    {
      // uint and int
      addParserComment( "t == 0 || t == 1" );
      addAsm( string("LDA $") + toHex(getAddressOf($3.name )).c_str(), 3, false );
      addAsm( "PHA" );
      addAsm( "JSR BYTE2HEX", 3, false );
    }
  else if( isWord($3.name) /* == 'w'*/ )
    {
      addParserComment( "t == word" );
      $3.name[0] = ' ';
      int tmp = atoi( $3.name );
      addAsm( string( "LDA #$" ) + toHex( get_word_L( atoi( $3.name ))), 2, false );
      addAsm( "PHA" );
      addAsm( string( "LDA #$" ) + toHex( get_word_H( atoi( $3.name ))), 2, false );      
      addAsm( "PHA" );
      addAsm( "JSR BYTE2HEX", 3, false );
      addAsm( "JSR BYTE2HEX", 3, false );
 
    }
  else if( t == 2 || t == 4 )
    {
      addParserComment( "t == 2 || t == 4" );

      addAsm( string("LDA $") + toHex(getAddressOf($3.name )).c_str(), 3, false );
      addDebugComment("Push the argument onto the stack before function call" );
      addAsm( "PHA" );
      addAsm( string("LDA $") + toHex(getAddressOf($3.name )+1).c_str(), 3, false );
      addDebugComment("Push the argument onto the stack before function call" );
      addAsm( "PHA" );
      
      addAsm( "JSR BYTE2HEX", 3, false );
      addAsm( "JSR BYTE2HEX", 3, false );
    }
  else if( isFloat( string($3.name ) ))
    {
      addCompilerMessage( "cannot byte2hex a float... try printf", 2 );
      addComment("cannot byte2hex a float");
    }
  else if( string( $3.name) != "A" )
    {
      addDebugComment( "Straight from Acc register" );
      addAsm( string("LDA ") + string($3.name), 3, false );
      addDebugComment("Push the argument onto the stack before function call" );
      addAsm( "PHA" );
      addAsm( "JSR BYTE2HEX", 3, false );
    }
}
| tCURSORXY '(' expression ',' expression ')' ';'
{
  addComment( "=========================================================");  
  addComment( string("           cursorxy(") + string($3.name) + string(",") + string( $5.name ) + string( ")" ));
  addComment( "=========================================================");



  addAsm( "CLC" );


  if( getTypeOf( $3.name ) > 1 || getTypeOf( $5.name ) > 1 )
    {
      addCompilerMessage( "cursorxy arguments must be uint or int", 3 );
    }
  if( atoi( $3.name ) < 0 || atoi( $5.name ) < 0 )
    {
      addCompilerMessage( "cursorxy arguments must be > 0", 3 );
    }

  
  if( isInteger( $3.name ) || isUint( $3.name ))
    {
      int x_coord = atoi( stripFirst( $3.name ).c_str() );
      addAsm( string( "LDY #$" ) + toHex( x_coord ), 2, false );
    }
  else if( isAddress( $3.name ) )
    {
      int x_coord = getAddressOf( $3.name );
      addAsm( string( "LDY $" ) + toHex( x_coord ), 3, false );
    }
  else
    {
      addCompilerMessage( string( "unknown type: ") + string( $3.name ) , 3 );
    }



  if( isInteger( $5.name ) || isUint( $5.name ))
    {
      int y_coord = atoi( stripFirst( $5.name ).c_str() );
      addAsm( string( "LDX #$" ) + toHex( y_coord ), 2, false );
    }
  else if( isAddress( $5.name ) )
    {
      int y_coord = getAddressOf( $5.name );
      addAsm( string( "LDX $" ) + toHex( y_coord ), 3, false );
    }
  else
    {
      addCompilerMessage( string( "unknown type: ") + string( $5.name ) , 3 );
    }


  
  addAsm( "JSR $FFF0", 3, false );
};
| tCLS '(' ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                 cls()");
  addComment( "=========================================================");  
  cls_is_needed = true;
  addAsm( "JSR CLS; cls()", 3, false );
  //addAsm( "JSR $FF81; cls()", 3, false );

};
| tCLS '(' expression ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                 cls()");
  addComment( "=========================================================");  
  //cls_is_needed = true;
  //addAsm( "JSR CLS; cls()", 3, false );
  addAsm( "JSR $FF81; kernal cls()", 3, false );

};
| tLSR '(' expression ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                 lsr(expression)");
  addComment( "=========================================================");  
  
  int x = getAddressOf( $3.name );
  addAsm( string( "LSR $") + toHex( x ), 3, false );
  
};
| tASL '(' expression ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                 asl(expression)");
  addComment( "=========================================================");  
  
  int x = getAddressOf( $3.name );
  addAsm( string( "ASL $") + toHex( x ), 3, false );
  
};
| tJSR '(' NUMBER ')' ';'
{
  addComment( "=========================================================");  
  addComment( "                 jsr");
  addComment( "=========================================================");  
  addAsm(string( "JSR $") + toHex( atoi( $3.name )), 3, false );
};
| tJMP '(' NUMBER ')' ';'
{
  addComment( "=========================================================");  
  addComment( string( "                 jmp $") + toHex( atoi($3.name) ));
  addComment( "=========================================================");  
  addAsm(string( "JMP $") + toHex( atoi( $3.name )), 3, false );
};
| tNOP '(' ')' ';'
{
  addAsm("NOP", 1, false );
};
| tRTS '(' ')' ';'
{
  addComment( "=========================================================");
  addComment( "                 rts");
  addComment( "=========================================================");  
  addAsm( "RTS" );
};
| tPOKE '(' expression ',' expression ')' ';'
{
  addParserComment( "=========================================================");  
  addParserComment( string("                   *  poke ") + string($3.name) + string( ", ") + string( $5.name)  );
  addParserComment( "=========================================================");  
  addAsm( string( "LDA #$" ) + toHex(atoi($5.name)) , 2, false );
  addAsm( string( "STA $" ) + toHex(atoi($3.name)) + string( "; ") + getNameOf( hexToDecimal($3.name) ) , 3, false );
};
| tPOKE '(' NUMBER ',' NUMBER ')' ';'
{
  addParserComment( "=========================================================");
  addParserComment( string("               poke ") + string($3.name) + string( ", ") + string( $5.name)  );
  addParserComment( "=========================================================");
  addAsm( string( "LDA #$" ) + toHex(atoi($5.name)) , 2, false );
  //addAsm( string( "STA $" ) + toHex(atoi($3.name)) , 3, false );
  addAsm( string( "STA $" ) + toHex(atoi($3.name)) + string( "; ") + getNameOf( hexToDecimal($3.name)) , 3, false );

};
| tPOKE '(' NUMBER ',' ID ')' ';'
{
  addParserComment( "=========================================================");
  addParserComment( string("               poke ") + string($3.name) + string( ", ") + string( $5.name)  );
  addParserComment( "=========================================================");
  int addr = getAddressOf( $5.name );
  addAsm( string( "LDA $" ) + toHex(addr), 3, false );
  //addAsm( string( "STA $" ) + toHex( atoi( $3.name )), 3, false );
  addAsm( string( "STA $" ) + toHex(atoi($3.name)) + string( "; ") + getNameOf( hexToDecimal($3.name)) , 3, false );

};
| tPOKE '(' ID ',' ID ')' ';'
{
  addParserComment( "=========================================================");
  addParserComment( string("   ID ID       poke ") + string($3.name) + string( ", ") + string( $5.name)  );
  addParserComment( "=========================================================");
  pushScope( "POKE" );

  int addr = getAddressOf( $3.name );
  int addr2 = getAddressOf( $5.name );
  //cerr << addr << endl;
  addAsm( string( "LDA $" ) + toHex(addr),  3, false );
  addAsm( string( "STA " ) + getLabel( label_vector[label_major],false), 3, false );
  addAsm( string( "LDA $" ) + toHex(addr+1),  3, false );
  addAsm( string( "STA " ) + getLabel( label_vector[label_major]+1,false), 3, false );
  addAsm( string( "LDA $" ) + toHex( addr2 ) + string( "; ") + getNameOf( addr2 ) , 3, false );
  addAsm( ".BYTE #$8D;\t  <-- STA absolute", 1, false );
  addAsm( generateNewLabel() + string( "\t\t\t; <-- low byte"), 0, true );
  addAsm( ".BYTE #$00", 1, false );
  addAsm( generateNewLabel() + string( "\t\t\t; <-- hi byte"), 0, true );
  addAsm( ".BYTE #$00", 1, false );

  popScope();
};
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
  addDebugComment( "=========================================================");
  addDebugComment( string( "            condition in ") + string( scope_stack.top() ));
  addParserComment( scope_stack.top() + string(" ")  + string($1.name) + string($2.name) + string($3.name) );
  addDebugComment( "=========================================================");
  
  if( scope_stack.top() == "FOR" ) addAsm( generateNewLabel() + string( "\t\t\t; Top of FOR Loop"), 0, true );  
  if( scope_stack.top() == "WHILE" ) addAsm( generateNewLabel() + string( "\t\t\t; Top of WHILE Loop"), 0, true );  

  
  // at this point, we need to look at the type of the variable that is located
  // at the $1.name address, so we know how to compare it with another number

  if( getTypeOf( $3.name ) == 8 && isFloat($1.name)) // MEM vs. IMM
    {
      addParserComment( "FLOAT v. FLOAT (imm)" );
      // FP Operations
      inlineFloat( $1.name, 105);

      current_variable_base_address = getAddressOf( $3.name );
      addAsm( string("LDA #$") + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( string("LDY #$") + toHex( get_word_H( current_variable_base_address )), 2, false );

      addAsm( "JSR $BBA2; RAM -> FAC", 3, false );
      addAsm( "LDA #$69", 2, false );
      addAsm( "LDY #$00", 2, false );
      addAsm( "JSR $BC5B; CMP(FAC, RAM)", 3, false );

      /* DEBUG */
      dumpA();
      /* DEBUG */
    }
  else if( getTypeOf( $1.name ) == 8 && isFloat($3.name)) // MEM vs. IMM
    {
      addParserComment( "FLOAT v. FLOAT (imm)" );
      // FP Operations
      inlineFloat( $3.name, 105 );

      current_variable_base_address = getAddressOf( $1.name );
      addAsm( string("LDA #$") + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( string("LDY #$") + toHex( get_word_H( current_variable_base_address )), 2, false );
      addAsm( "JSR $BBA2; RAM -> FAC", 3, false );
      addAsm( "LDA #$69", 2, false );
      addAsm( "LDY #$00", 2, false );

      addAsm( "JSR $BC5B; CMP(FAC, RAM)", 3, false );
      /* DEBUG */
      dumpA();
      /* DEBUG */

    }
  else if( getTypeOf( $1.name ) == 8 && getTypeOf($3.name) == 8 ) // IMM vs. MEM
    {
      addParserComment( "FLOAT v. FLOAT" );
      // store the first one in FAC
      int current_variable_base_address = getAddressOf( $1.name );

      addAsm( string("LDA #$") + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( string("LDY #$") + toHex( get_word_H( current_variable_base_address )), 2, false );
      // store it in FAC
      addAsm( "JSR $BBA2", 3, false ); // FP ->FAC


      current_variable_base_address = getAddressOf( $3.name );
      addAsm( string("LDA #$") + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( string("LDY #$") + toHex( get_word_H( current_variable_base_address )), 2, false );    
      addAsm( "JSR $BC5B", 3, false );

      // if A == 00, they are equal
      // if A == 01, then FAC > RAM
      // if A == FF, then FAC < RAM

      
    }
  else if( string($1.name) == "A" )
    {
      addParserComment( "A" );

      // do nothing - the value is already in A
    }
  else if( getAddressOf($1.name) != -1 )
    {
      addDebugComment( "Address Found" );
      //cerr << $1.name << " " << getTypeOf( $1.name ) << endl;
      
      addAsm( string( "LDA $" ) + toHex( getAddressOf($1.name)), 3, false);

      //addAsm( string( "LDA #$" ) + toHex(atoi(stripFirst( $3.name ).c_str())), 2, false );
      
    }
  else if( isAddress($1.name))
    {
      addParserComment( "ADDR v." );

      // then it's already an address
      addAsm( string( "LDA " ) + string($1.name), 3, false);
    }
  else if( isByte( $1.name ))
    {
      addParserComment( "Byte v." );

      addAsm( string( "LDA " ) + string($1.name), 2, false);
    }
  else if( isInteger( $1.name))
    {
      addParserComment( "Integer v." );
      addAsm( string( "LDA #$" ) + toHex(atoi($1.name)), 2, false);
    }
  else 
    {
      addParserComment( "Error" );

      addCompilerMessage( "error in for loop initialization", 2 );
    }
  if( getTypeOf( $1.name ) != 0 )
    {
      addAsm( "PHA" );
    }
  //addAsm( "\n", 0, false );
  //addComment( $1.name );
  //addAsm( "\n", 0, false );
  
  /* When comparing Negatives and Positives, please take special care! */
  /* check bit 7 of A and B... if they are the same then continue, otherwise */
  /* undo two's complement in the one where 7 is set */
  
  // if( getTypeOf( $1.name ) == 8 && isFloat($3.name)) // MEM vs. IMM
  if( getTypeOf( $1.name ) == 0 && getTypeOf( $3.name ) == 0 )
    {
      addDebugComment( string( $1.name ) + string(" vs. ") + string($3.name) ); 
      int tmp_rhs = atoi( stripFirst($3.name).c_str() );
      if( tmp_rhs > 255 || tmp_rhs < 0 ) addCompilerMessage( "type mismatch.  uint is 0-255.  cannot compare with a number > 255 or < 0.", 3 );
      addAsm( string("CMP #$") + toHex(tmp_rhs), 2, false );

    }
  else if( getTypeOf( $1.name ) == 0 )
    {
      addDebugComment( string( $1.name ) + string(" vs. ") + string($3.name) ); 
      int tmp_rhs = atoi( stripFirst($3.name).c_str() );
      if( tmp_rhs > 255 || tmp_rhs < 0 ) addCompilerMessage( "type mismatch.  uint is 0-255.  cannot compare with a number > 255 or < 0.", 3 );
      addAsm( string("CMP #$") + toHex(tmp_rhs), 2, false );
    }
  else if( getTypeOf( $1.name ) == 8 && isFloat($3.name)) // FPMEM vs. IMM
    {
      addAsm( "LDA #$00", 2, false );
      addAsm( "PHA" );
      signed_comparison_is_needed = true;
      addAsm( "JSR SIGNEDCMP", 3, false );

    }
  // if it's ID < IMM
  else if( getTypeOf( $1.name ) == 8 && getTypeOf($3.name) == 8 )
    {
      addAsm( "LDA #$00", 2, false );
      addAsm( "PHA" );
      signed_comparison_is_needed = true;
      addAsm( "JSR SIGNEDCMP", 3, false );
    }
  else if( string($3.name) == "A" )
    {
      // do nothing - the value is already in A
    }
  else if( isByte( $3.name)) 
    {
      addDebugComment( string( "getTypeOf( $3.name ) == Byte" ) );
      addAsm( string( "LDA " ) + string( $3.name ), 2, false );
      addAsm( "PHA" );
      signed_comparison_is_needed = true;
      addAsm( "JSR SIGNEDCMP", 3, false );
      
    }
  else if( isInteger( $3.name ))
    {
      
      addDebugComment( string( "getTypeOf( $3.name ) == Integer (" ) + string( $3.name ) + string(")"));
      int tmp_int = atoi( stripFirst($3.name).c_str() );
      if( tmp_int < 0 )
	{
	  tmp_int=twos_complement(tmp_int);
	}

      addAsm( string( "LDA #$" ) + toHex( tmp_int ), 2, false );
      addAsm( "PHA" );
      signed_comparison_is_needed = true;
      addAsm( "JSR SIGNEDCMP", 3, false );
 
    }
  else if( isAddress( $3.name ))
    {
      addDebugComment( "It's an Address" );
      addAsm( string( "LDA " ) + $3.name, 3, false );
      addAsm( "PHA" );
      signed_comparison_is_needed = true;
      addAsm( "JSR SIGNEDCMP", 3, false );
 

    }
  else   // otherwise
    {
      addCompilerMessage( "error in for loop initialization", 2 );

      if( getTypeOf( $1.name )  !=  getTypeOf( $3.name ) )
	{
	  addCompilerMessage( "type mismatch", 2 );
	}
      addAsm( string( "LDA $" ) + toHex(getAddressOf( $3.name )), 3, false );
      addAsm( "PHA" );
      signed_comparison_is_needed = true;
      addAsm( "JSR SIGNEDCMP", 3, false );
 
    }
  if( getTypeOf( $1.name ) != 0 ) addAsm( "PLP" );

  if( scope_stack.top() == "FOR" ) 
    {
      if( string( $2.name ) == string( "<=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 2, false );
	      addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to BODY" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$B0, #$03", 2, false ); 
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 3, false );
	      addAsm( ".BYTE #$D0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to BODY" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	  
	}
      else if( string( $2.name ) == string( "==" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to BODY" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$D0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to BODY" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	}
      else if( string( $2.name ) == string( ">" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+2, false) + string( "; if z==1 jump out of FOR" ), 2, false );
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major]+2, false) + string( "; if c==0 jump out of FOR" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to body of FOR" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$D0, #$03", 2, false ); 
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; if z==1 jump out of FOR" ), 3, false );
	      addAsm( ".BYTE #$B0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; if c==0 jump out of FOR" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to body of FOR" ), 3, false );
	    }
	}
      else if( string( $2.name ) == string( "<" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$B0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to BODY" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }

	}
      else if( string( $2.name ) == string( ">=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCS ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to BODY" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$90, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to BODY" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	    
	}
      else /* != ... NOT EQUAL TO */
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BNE ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==0 jump to BODY" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$F0, #$03", 2, false ); 
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==0 jump to BODY" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+2, false) + string( "; jump out of FOR" ), 3, false );

	    }
	}
      
      
    }
  else if( scope_stack.top() == "IF" || scope_stack.top() == "WHILE" ) /*                                                                                                               <<<<    IF   */
    {
      if( string( $2.name ) == string( "<=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major], false) + string( "; if c==0 jump to THEN" ), 2, false );
	      addAsm( string( "BEQ ") + getLabel( label_vector[label_major], false) + string( "; if z==1 jump to THEN" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$B0, #$03", 2, false ); 
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major], false) + string( "; if c==0 jump to THEN" ), 3, false );
	      addAsm( ".BYTE #$D0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major], false) + string( "; if z==1 jump to THEN" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	    }
	}   
      else if( string( $2.name ) == string( "==" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( ".BYTE #$F0, #$03", 2, false ); 
	      //addAsm( string( "BEQ ") + getLabel( label_vector[label_major], false) + string( "; if z==1 jump to THEN" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$F0, #$03", 2, false ); 

	      //addAsm( string( "JMP ") + getLabel( label_vector[label_major], false) + string( "; if z==1 jump to THEN" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	    }

	}
      else if( string( $2.name ) == string( ">" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to ELSE" ), 2, false );
	      addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to ELSE" ), 2, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$B0, #$03", 2, false ); 
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==0 jump to ELSE" ), 3, false );
	      addAsm( ".BYTE #$D0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to ELSE" ), 3, false );
	    }

	}
      else if( string( $2.name ) == string( "<" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major], false) + string( "; if c==0 jump to THEN" ), 2, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	    }
	  else
	    {
	      // 2022 10 28 - mkpellegrino - changed from #$90 to #$B0
	      addAsm( ".BYTE #$90, #$03", 2, false ); 

	      //addAsm( string( "JMP ") + getLabel( label_vector[label_major], false) + string( "; if c==0 jump to THEN" ), 3, false );
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; jump to ELSE" ), 3, false );
	    }

	}
      else if( string( $2.name ) == string( ">=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BCC ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to ELSE" ), 2, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$B0, #$03", 2, false ); 
	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if c==1 jump to ELSE" ), 3, false );
	    }
	}
      else /* != ... NOT EQUAL TO */
	{
	  if( long_branches == false )
	    {
	      addAsm( string( "BEQ ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to ELSE" ), 2, false );
	    }
	  else
	    {
	      addAsm( ".BYTE #$D0, #$03", 2, false ); 

	      addAsm( string( "JMP ") + getLabel( label_vector[label_major]+1, false) + string( "; if z==1 jump to ELSE" ), 3, false );
	    }

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
  

  addAsmVariable( $2.name, current_variable_type );
  current_variable_base_address = getAddressOf( $2.name );

  if( string( $3.name ) == string( "ARG" ) )
    {
      addDebugComment( "datatype ID init (ARG)" );
      addAsm( string( "LDA #$69" ), 2, false );
      addAsm( string( "LDY #$00" ), 2, false );
      addAsm( "JSR $BBA2; MEM -> FAC", 3, false );
      addAsm( string( "LDX #$" ) + toHex(get_word_L(current_variable_base_address)) + string("; ADDR_L" ), 2, false );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(current_variable_base_address)) + string("; ADDR_H" ), 2, false );
      addAsm( "JSR $BBD4; FAC -> MEM", 3, false );
    }
  else if( string( $3.name ) == string( "FAC" ) )
    {
      addDebugComment( "datatype ID init (FAC)" );
      addAsm( string( "LDX #$" ) + toHex(get_word_L(current_variable_base_address) ), 2, false );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(current_variable_base_address) ), 2, false );
      addAsm( "JSR $BBD4; FAC -> RAM", 3, false );
    }
  else if( isFloat( $3.name ) )
    {
      inlineFloat( $3.name, current_variable_base_address );
    }
  else if( string( $3.name ) == "A" )
    {
      // the the result is in A
      //addAsm( string( "STA $" ) + toHex(current_variable_base_address), 3, false);

      // addAsm( "; ***** ", 0, false );
    }
  else if( isAddress($3.name)) 
    {
      // then it's an address
      addAsm( string("LDA ") + string($3.name), 3, false );
    }
  else if( isUint($3.name) )
    {
      addParserComment( string( "UINT: " ) + string( $2.name ) + string( " " ) + string( $3.name ) );
      // then it's an unsigned integer (type 0 - 8 bits)
      addAsm( string("LDA ") + string($3.name) , 2, false );
    }
  else if( isByte($3.name) )
    {
      // then it's a byte
      addAsm( string("LDA ") + string($3.name) , 2, false );
    }
  else if( isWord($3.name ))
    {
      int v = atoi( string( $3.name ).substr( 1, 6 ).c_str());
      addAsm( string( "LDA #$" ) + toHex(get_word_L(v)), 2, false  );
      addAsm( string( "LDX #$" ) + toHex(get_word_H(v)), 2, false  );
    }
  else if( isInteger($3.name) )
    {
      // this must be a literal
      addDebugComment( " else if( isInteger($3.name) ) - Line 1898" );
      addAsm( string( "LDA #$" ) + toHex( atoi( stripFirst($3.name).c_str() ) ), 2, false);
    }
  else if( isMob( $3.name ))
    {
      if( mob_vector[0] > 7 || mob_vector[0] < 0 )
	{
	  addCompilerMessage( "MOB # out of range (must be 0-7)", 3 );
	}
      if( mob_vector[1] > 255 || mob_vector[1] < 0 )
	{
	  addCompilerMessage( "MOB Pointer out of range", 3 );
	}
      pushScope("MOB");
      //int base_addr = getAddressOf( $2.name );


      // first 2 bytes are: sprite # and sprite location
      int sprite_number = mob_vector[0]; // 0-7
      int sprite_location = mob_vector[1]; // 192, 193... etc

      //cerr << sprite_number << " " << sprite_location << endl;
      
      int sprite_pointer = 2040 + sprite_number;
      
      addAsm( string( "LDA #$") + toHex( sprite_location + sprite_number ), 2, false );
      addAsm( string( "STA $") + toHex( sprite_pointer ), 3, false );

      int sprite_base_address = (sprite_number + sprite_location)*64;

      string BA_L = toHex(get_word_L(sprite_base_address));
      string BA_H = toHex(get_word_H(sprite_base_address));
      
      
      string byte_string = string($2.name) + string( ":\n\t.BYTE " );
      for( int i=2; i<mob_vector.size(); i++ )
	{
	  byte_string += string( "#$" ) + toHex( mob_vector[i]);
	  if( i<(mob_vector.size()-1) ) byte_string+=string(", ");
	}
      mobs.push_back( byte_string );

      mob_vector.erase(mob_vector.begin(),mob_vector.end());

      addAsm( string( "JSR " ) + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      addAsm( byte_string, 63, true );
      addAsm( generateNewLabel(), 0, true );
      addAsm( "PLA" );
      addAsm( "STA $FB", 2, false );
      addAsm( "PLA" );
      addAsm( "STA $FC", 2, false );
      addAsm( "INC $FB", 2, false );
      addAsm( string("LDA #$") + BA_L, 2, false );
      addAsm( "STA $FD", 2, false );
      addAsm( string("LDA #$") + BA_H, 2, false );
      addAsm( "STA $FE", 2, false );
      addAsm( "JSR MOBCPY", 3, false );
      mobcpy_is_needed = true;
      popScope();

      
    }
  else
    {
      addAsm( "; \t\t\t\tUnknown Value in Source Code" , 0, false );
    }

  switch( current_variable_type )
    {
    case 0:
      /* 0 - unsigned int - 1 bytes */
      //addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STA $") + toHex( current_variable_base_address) + string("; ") + string( getNameOf( getIndexOf($3.name ))), 3, false );
      break;
    case 1:
      /* 1 - signed int - 1 bytes */
      addAsm( string("STA $") + toHex( current_variable_base_address) + string("; ") + string( getNameOf( getIndexOf($3.name ))), 3, false );
      break;

    case 2:
      /* 2 - word - 2 bytes */
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );
      break;
    case 4:
      /* 4 - double - 2 bytes */
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );      
      break;
    case 8:
      /* 8 - float - 4 bytes */
      /* TBD */
      break;
    default:
      /* unknown type */
      break;
    }
};
| datatype ID '[' NUMBER ']'
{
  addParserComment( "RULE: statement: datatype ID '[' NUMBER ']'  <== ARRAY" );
  cerr << "initializing an array" << endl;
  cerr << "type: " << $1.name << "\tid: " << $2.name << "\tlength: " << $4.name << endl;
  if( atoi( $4.name ) > 255 || atoi( $4.name ) < 1 ) addCompilerMessage( "Array index out of range 1-255");
  //addParserComment( string($1.name) + " " + string( $2.name ) + "=" + string($3.name) );
  int length = atoi( $4.name );
  string my_type = string($1.name);
  
  for( int i = 0; i < length; i++ )
    {
      if( i == 0 )
	{
	  addAsmVariable( $2.name, current_variable_type );
	}
      else
	{
	  addAsmVariable( string( string( "_" ) + string( $2.name ) + string( "_" ) + toString(i)).c_str(), current_variable_type );
	}
    }

};
| ID '[' expression ']' init
{
  addParserComment( "RULE: statement: ID '[' expression ']' init" );
  current_variable_type=getTypeOf($1.name);
  current_variable_base_address = getAddressOf( $1.name );

  if( isAddress($3.name) )
    {
      int addr_of_index = getAddressOf($3.name);
      addAsm( string("LDX ") + string($3.name), 3, false );
    }
  else //if( isInteger($3.name ) )
    {
      addAsm( string("LDX #$") + toHex(atoi(stripFirst($3.name).c_str())), 2, false );

    }

  addAsm( string("STA $") + toHex( current_variable_base_address ) + string( ",X" ), 3, false );
};
| ID init
{
  addParserComment( "RULE: statement: ID init" );
 
  current_variable_type=getTypeOf($2.name);
  current_variable_base_address = getAddressOf( $1.name );

  if( current_variable_base_address == -1 )
    {
      addCompilerMessage( "Undeclared Variable", 3 );
    }
  
  //cerr << current_variable_type << endl;
  if( getTypeOf($2.name) == 8 && getTypeOf($1.name) == 8 )
    {
      addDebugComment( "FLOAT v. MEM FLOAT" );
    }
  if( isFloat( $2.name) )
    {
      addDebugComment( string("FLOAT v. IMM FLOAT) [") + string( $1.name ) + string(":") + string($2.name) + string( "]" ) );
      int base_address = getAddressOf( $1.name );
      if( base_address == -1 ) base_address = 105;
      inlineFloat( $2.name, base_address );
    }
  else if( string( $2.name ) == string( "FAC" ) )
    {
      addAsm( string( "LDX #$" ) + toHex(get_word_L(current_variable_base_address) ), 2, false );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(current_variable_base_address) ), 2, false );
      addAsm( "JSR $BBD4;  FAC -> MEM", 3, false );
    }
  else if( string( $2.name ) == "A" )
    {
      //addAsm( string( "STA $") + toHex(getAddressOf($1.name)), 3, false );
      addAsm( string( "STA $" ) + toHex(current_variable_base_address), 3, false);
      // result of expression is stored in A
    }
  else if( isAddress( $2.name ))
    {
      //addAsm( string("LDA ") + string( $2.name ), 3, false );
    }
  else if( isInteger( $2.name ))
    {
      addDebugComment( string( $1.name ) + string( " = " ) + string( $2.name ) );
      addAsm( string("LDA #$") + toHex( atoi($2.name) ), 2, false );
    }
  
  switch( current_variable_type )
    {
    case 0:
    case 1:
      addParserComment( "case 0 or 1:" );
      /* 0 - unsigned int - 1 bytes */
      /* 1 - signed int - 1 bytes */
     
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      break;

    case 2:
      /* 2 - word - 2 bytes */
      addParserComment( "case 2:" );

      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );
      break;
    case 4:
      addParserComment( "case 4:" );

      /* 4 - double - 2 bytes */
      addAsm( string("STA $") + toHex( current_variable_base_address), 3, false );
      addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );      
      break;
    case 8:
      /* 8 - float - 5 bytes */
      addParserComment( "*case 8:" );

      /* TBD */
      break;
    default:
      /* unknown type */
      break;
    }
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
  addParserComment( string( "RULE: init: '=' expression" ) );
  //addParserComment( string( $2.name ) );
  //cerr << current_variable_type << endl;

  //cerr << $2.name << endl;
  
  if( string( $2.name ) == "ARG" )
    {
      addParserComment( "ARG" );
      strcpy( $$.name, "ARG" );
    }  
  else if( string( $2.name ) == "FAC" )
    {
      addParserComment( "FAC" );
      strcpy( $$.name, "FAC" );
    }  
  else if( string( $2.name ) == "MOB" )
    {
      addParserComment( "MOB" );
      strcpy( $$.name, "MOB" );
    }  
  else if( string( $2.name ) == "A" )
    {
      // then it's the result
      // of the expression is stored in A
      addComment( "\t\t\t\t\t<< HERE" );
      strcpy( $$.name, "A" );
    }
  else if( isFloat( $2.name ) )
    {
      strcpy( $$.name, $2.name );
    }
  else if( isAddress( $2.name ) || isByte( $2.name ))
    {
      strcpy( $$.name, $2.name );
    }
  else if( isWord( $2.name ))
    {
      strcpy( $$.name, $2.name );
    }
  else if( isInteger( $2.name ) || isUint( $2.name ) )
    {
      addDebugComment( string( "else if( isInteger(") + string($2.name) + string( ")) - line 2263" ));

      if( current_variable_type == 0 )
	{
	  int tmp_int = atoi( stripFirst($2.name).c_str() );
	  if( tmp_int > 255  || tmp_int < 0 ) addCompilerMessage( "type overflow", 3 );
	  addAsm( string( "LDA #$" ) + toHex( tmp_int ), 2, false);

	  strcpy( $$.name, "A" ); 
	}
      else if( current_variable_type == 1 )
	{
	  int tmp_int = atoi( stripFirst($2.name).c_str() );
	  if( tmp_int < 0 )
	    {
	      tmp_int=twos_complement(tmp_int);
	    }
	  addAsm( string( "LDA #$" ) + toHex( tmp_int ), 2, false);

	  strcpy( $$.name, "A" ); 
	}
      else if( current_variable_type == 2 )
	{
	  int tmp_int = atoi( stripFirst($2.name).c_str() );

	  addAsm( string( "LDA #$" ) + toHex( get_word_L(tmp_int) ), 2, false);
	  addAsm( string( "LDX #$" ) + toHex( get_word_H(tmp_int) ), 2, false);
	  
	  strcpy( $$.name, "A" ); 

	}
      else
	{
	  
	  int tmp_int = atoi( stripFirst($2.name).c_str() );
	  if( tmp_int < 0 )
	    {
	      tmp_int=twos_complement(tmp_int);
	    }
	  addAsm( string( "LDA #$" ) + toHex( tmp_int ), 2, false);

	  strcpy( $$.name, "A" ); 

	}
    }
  else if( isMob( $2.name ) )
    {
      //cerr << getAddressOf( stripFirst( $2.name ) ) << ": ";
      strcpy( $$.name, $2.name );

    }
  else
    {
      addCompilerMessage( string( "Unknown Number Type (") + string( $2.name ) + string( ")"), 3 );
      strcpy( $$.name, $2.name );
    }
  
}
|
{
  addParserComment( "RULE: init:" );
  sprintf($$.type, "null");
  $$.nd = mknode(NULL, NULL, "0");
  strcpy($$.name, "A");
  //addAsm( string( "LDA #$00" ), 2, false  );
}
;

expression: expression arithmetic expression
{
  addParserComment( "RULE: expression: expression arithmetic expression" );
  addParserComment( string( $1.name ) + string( " " ) + string( $2.name ) + string( " " ) + string( $3.name ) );
  
  // here is where we should check to see if the
  // variable ($$.name) is already in use (in _this_ scope).
  // .. but we don't yet
  int FAC=0;

  int type1 = getTypeOf( $1.name );
  int type2 = getTypeOf( $3.name );


  addComment( string( $1.name ) + string(" (") + string(itos(getTypeOf($1.name))) + string( ") ") + string( $2.name ) + string( " " ) + string( $3.name ) + string( " (" ) + string( itos( getTypeOf( $3.name ) ) ) + string( ")" )  );

  
  if( type1 == 8 && type2 == 8 && isAddress($1.name) && isAddress($3.name))
    {
      addDebugComment( "FLOAT_MEM arithmetic FLOAT_MEM" );

      int base_address_op1 = hexToDecimal( $1.name );
      int base_address_op2 = hexToDecimal( $3.name );

      // put op1 into fac
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );
      addAsm( "JSR $BBA2", 3, false );
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op1)), 2, false );
      if( string($2.name) == string("*"))
	{
	  addAsm( "JSR $BA28; FMULT", 3, false );
	}
      else if( string($2.name) == string("+"))
	{
	  addAsm( "JSR $B867; FADD", 3, false );
	}
      else if( string($2.name) == string("-"))
	{
	  addAsm( "JSR $B850; FSUB", 3, false );
	}
      else if( string($2.name) == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( "JSR $BB0F; FDIV", 3, false );
	}
      FAC=1;
    }
    else if( type1 == 8 && isFloat( $3.name ) )
    {
      addDebugComment( "FLOAT_MEM arithmetic FLOAT_IMM" );

      inlineFloat( $3.name );
      
      int base_address_op1 = hexToDecimal( $1.name );
 
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op1)), 2, false );
     
      if( string($2.name) == string("*"))
	{
	  addAsm( "JSR $BA28; RAM * FAC", 3, false );
	}
      else if( string($2.name) == string("+"))
	{
	  addAsm( "JSR $B867; RAM + FAC", 3, false );
	}
      else if( string($2.name) == string("-"))
	{
	  addAsm( "JSR $B850; RAM - FAC", 3, false );
	}
      else if( string($2.name) == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( "JSR $BB0F; RAM/FAC", 3, false );
	}
      FAC = 1;
    }
    else if( type2 == 8 && isFloat( $1.name ) )
    {


      inlineFloat( $1.name );

      int base_address_op1 = 105;
      int base_address_op2 = hexToDecimal( $3.name );

      // put op1 into fac
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );
      addAsm( "JSR $BBA2", 3, false );
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op1)), 2, false );

      

      // SWITCH ORDER OF OP1 and OP2 HERE
      addDebugComment( "FLOAT_IMM arithmetic FLOAT_MEM" );
      
      //inlineFloat( $1.name );
      
      //int base_address_op1 = hexToDecimal( $3.name );
 
      //addAsm( string("LDA #$") + toHex(get_word_L(base_address_op1)), 2, false );
      //addAsm( string("LDY #$") + toHex(get_word_H(base_address_op1)), 2, false );
     
      if( string($2.name) == string("*"))
	{
	  addAsm( "JSR $BA28; RAM * FAC", 3, false );
	}
      else if( string($2.name) == string("+"))
	{
	  addAsm( "JSR $B867; RAM + FAC", 3, false );
	}
      else if( string($2.name) == string("-"))
	{
	  addAsm( "JSR $B850; RAM - FAC", 3, false );
	}
      else if( string($2.name) == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( "JSR $BB0F; RAM/FAC", 3, false );
	}
      FAC = 1;
    }
    else if( isFloat( $1.name ) && isFloat( $3.name ) )
    {

      addDebugComment( "FLOAT_IMM arithmetic FLOAT_IMM" );
      
      float imm1 = atof( stripFirst($1.name).c_str() );
      float imm2 = atof( stripFirst($3.name).c_str() );
      float result = 0.0;
      
      if( string($2.name) == string("*"))
	{
	  result = imm1*imm2;
	}
      else if( string($2.name) == string("+"))
	{
	  result = imm1+imm2;
	}
      else if( string($2.name) == string("-"))
	{
	  result = imm1-imm2;
	}
      else if( string($2.name) == string("/"))
	{
	  if( imm2 == 0 )
	    {
	      addCompilerMessage( "ERROR - DIVISION BY ZERO", 3 );
	    }
	  else
	    {
	      result = imm1/imm2;
	    }
	}
      
      inlineFloat( string( "f" ) + to_string(result), 105);
      FAC = 1;
    }

    else if( type1 == 0 && type2 == 0 && isAddress( $3.name ) && isAddress( $1.name ) )
      {
	addDebugComment( "UINT_mem arith UINT_mem" );


	if( !previousAsm( string( "STA ") +  string($1.name)) )
	  {
	    addAsm( string( "LDA ") +  string($1.name), 3, false); // 
	  }
	else
	  {
	    addAsm( string( "; commented out by optimizer"), 0, false); // 
	    addAsm( string( "; LDA ") +  string($1.name), 3, false); // 
	  }
	if( string( $2.name ) == string("+"))
	  {
	    addAsm( "CLC" );
	    addAsm( string( "ADC " ) + string($3.name), 3, false );
	  }
	else if( string( $2.name ) == string("-"))
	  {
	    addAsm( "SEC" );
	    addAsm( string( "SBC " ) + string($3.name), 3, false );
	  }
	else if( string( $2.name ) == string("*"))
	  {
	    umul_is_needed = true;
	    addAsm( "STA $02", 2, false );
	    addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	    addAsm( "STA $03", 2, false );
	    addAsm( "JSR UMUL", 3, false );
	    addAsm( "LDA $03", 2, false );
	  }
	strcpy( $$.name, "A" );
      }
    else if( type1 == 0 && type2 == 0 && isAddress( $1.name ) && isInteger( $3.name ) )
      {
	addAsm( "; ****** <--- HERE **** ", 0, false );
      addAsm( string( "LDA ") +  string($1.name), 3, false); // 
      if( string( $2.name ) == string("+"))
	{
	  addAsm( "CLC" );
	  int tmp_int = atoi(stripFirst($3.name).c_str());
	  addAsm( string( "ADC #$" ) + toHex(tmp_int), 2, false );
	}
      else if( string( $2.name ) == string("-"))
	{
	  addAsm( "SEC" );

	  int tmp_int = atoi(stripFirst($3.name).c_str());
	  addAsm( string( "SBC #$" ) + toHex(tmp_int), 2, false );
	}
      else if( string( $2.name ) == string("*"))
	{
	  addCompilerMessage( "SIGNED integer multiplication (MEM * IMM) not yet implemented (try re-ordering)", 3 );
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( "STA $02", 2, false );
	  addAsm( string( "LDA #$" ) + toHex( tmp_int ) , 2, false );
	  addAsm( "STA $03", 2, false );
	  addAsm( "JSR UMUL", 3, false );
	  addAsm( "LDA $03", 2, false );
	}
      	strcpy( $$.name, "A" );
      }
    else if( type1 == 1 && type2 == 1 && isAddress( $3.name ) && isAddress( $1.name ) )
    {
      addAsm( string( "LDA ") +  string($1.name), 3, false); // 
      if( string( $2.name ) == string("+"))
	{
	  addAsm( "CLC" );
	  addAsm( string( "ADC " ) + string($3.name), 3, false );
	}
      else if( string( $2.name ) == string("-"))
	{
	  addAsm( "SEC" );
	  addAsm( string( "SBC " ) + string($3.name), 3, false );
	}
      else if( string( $2.name ) == string("*"))
	{
	  umul_is_needed = true;
	  addAsm( "STA $02", 2, false );
	  addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	  addAsm( "STA $03", 2, false );
	  addAsm( "JSR UMUL", 3, false );
	  addAsm( "LDA $03", 2, false );
	}
      strcpy( $$.name, "A" );
      
    }
  else if( isAddress( $3.name ) && isInteger( $1.name ) )
    {
      addAsm( string( "LDA ") +  string($3.name), 3, false); //
      
      if( string( $2.name ) == string("+"))
	{
	  addAsm( "CLC" );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( string( "ADC #$" ) + toHex(tmp_int), 2, false );
	}
      else if( string( $2.name ) == string("-"))
	{
	  addAsm( "SEC" );

	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( string( "SBC #$" ) + toHex(tmp_int), 2, false );
	}
     else if( string( $2.name ) == string("*"))
	{
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	    
	  umul_is_needed = true;
	  addAsm( "STA $02", 2, false );
	  addAsm( string( "LDA #$" ) + toHex( tmp_int ), 2, false );
	  addAsm( "STA $03", 2, false );
	  addAsm( "JSR UMUL", 3, false );
	  addAsm( "LDA $03", 2, false );

	}
     else if( string( $2.name ) == string("/"))
	{
	  addAsm( "; SIGNED integer division (IMM / MEM) not yet implemented", 3, false );
	}
      
      strcpy( $$.name, "A" );
    }
  else if( isAddress( $1.name ) && isInteger( $3.name ) )     // MEM vs. IMM
    {
      addAsm( string( "LDA ") +  string($1.name), 3, false); // 
      if( string( $2.name ) == string("+"))
	{
	  addAsm( "CLC" );
	  int tmp_int = atoi(stripFirst($3.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( string( "ADC #$" ) + toHex(tmp_int), 2, false );
	}
      else if( string( $2.name ) == string("-"))
	{
	  addAsm( "SEC" );

	  int tmp_int = atoi(stripFirst($3.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( string( "SBC #$" ) + toHex(tmp_int), 2, false );
	}
      else if( string( $2.name ) == string("*"))
	{
	  addCompilerMessage( "SIGNED integer multiplication (MEM * IMM) not yet implemented (try re-ordering)", 3 );
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( "STA $02", 2, false );
	  addAsm( string( "LDA #$" ) + toHex( tmp_int ) , 2, false );
	  addAsm( "STA $03", 2, false );
	  addAsm( "JSR UMUL", 3, false );
	  addAsm( "LDA $03", 2, false );
	}
     else if( string( $2.name ) == string("/"))
	{
	  addAsm( "; SIGNED integer division (MEM / IMM) not yet implemented", 3, false );
	}

      strcpy( $$.name, "A" );
    }
  else if( getTypeOf( $1.name ) == 2 && getTypeOf( $3.name ) == 8 )
    {
      int base_address_op1 = hexToDecimal( $1.name );      
      int base_address_op2 = hexToDecimal( $3.name );
      
      if( string($2.name) == string("*"))
	{
	  int inst_size = 3;
	  if( base_address_op1 < 255 ) inst_size--;
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), inst_size, false );
	  if( base_address_op2 >= 255 ) inst_size++;
	  addAsm( string("LDA $") + toHex( ( base_address_op1+1 )), inst_size, false );
	  addAsm( "JSR $B391; INT16 -> FAC", 3, false );
	  addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );


	  addCompilerMessage( "This can be optimized by putting the WORD after the FLOAT", 1);
	  addAsm( "JSR $BA28; FMULT RAM * FAC", 3, false );
	}
      else if( string($2.name) == string("+"))
	{
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), 3, false );
	  addAsm( string("LDA $") + toHex( ( base_address_op1+1 )), 3, false );
	  addAsm( "JSR $B391; INT16 -> FAC", 3, false );
	  addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );
	  addCompilerMessage( "This can be optimized by putting the WORD after the FLOAT", 1);
	  addAsm( "JSR $B867; FADD RAM + FAC", 3, false );
	}
      else if( string($2.name) == string("-"))
	{
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), 3, false );
	  addAsm( string("LDA $") + toHex( ( base_address_op1+1 )), 3, false );
	  addAsm( "JSR $B391; INT16 -> FAC", 3, false );

	  addAsm( "LDX #$69", 2, false );
	  addAsm( "LDY #$00", 2, false );
	  addAsm( "JSR $BBD4; FAC -> MEM", 3, false );

	  addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );
	  addAsm( "JSR $BBA2; MEM -> FAC", 3, false );

	  addAsm( "LDA #$69", 2, false );
	  addAsm( "LDY #$00", 2, false );

	  addAsm( "JSR $B850; FSUB RAM - FAC", 3, false );
	}
      else if( string($2.name) == string("/"))
	{
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), 3, false );
	  addAsm( string("LDA $") + toHex( ( base_address_op1+1 )), 3, false );
	  addAsm( "JSR $B391; INT16 -> FAC", 3, false );

	  addAsm( "LDX #$69", 2, false );
	  addAsm( "LDY #$00", 2, false );
	  addAsm( "JSR $BBD4; FAC -> MEM", 3, false );

	  addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );
	  addAsm( "JSR $BBA2; MEM -> FAC", 3, false );

	  addAsm( "LDA #$69", 2, false );
	  addAsm( "LDY #$00", 2, false );

	  addAsm( "JSR $BB0F; FDIV RAM/FAC", 3, false );
	}
      FAC=1;      
    }
  else if( getTypeOf( $3.name ) == 2 && getTypeOf( $1.name ) == 8 )
    {
      int base_address_op1 = hexToDecimal( $1.name );      
      int base_address_op2 = hexToDecimal( $3.name );

      addAsm( string("LDY $") + toHex( ( base_address_op2 )), 3, false );
      addAsm( string("LDA $") + toHex( ( base_address_op2+1 )), 3, false );
      addAsm( "JSR $B391; INT16 -> FAC", 3, false );

      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op1)), 2, false );
      
      if( string($2.name) == string("*"))
	{
	  addAsm( "JSR $BA28; FMULT RAM * FAC", 3, false );
	}
      else if( string($2.name) == string("+"))
	{
	  addAsm( "JSR $B867; FADD RAM + FAC", 3, false );
	}
      else if( string($2.name) == string("-"))
	{
	  addAsm( "JSR $B850; FSUB RAM - FAC", 3, false );
	}
      else if( string($2.name) == string("/"))
	{
	  addAsm( "JSR $BB0F; FDIV RAM/FAC", 3, false );
	}
      FAC=1;      
      
    }
  else if( getTypeOf( $1.name ) == 8 && getTypeOf( $3.name ) == 8 )
    {
      addParserComment( "FLOAT arithmetic FLOAT" );

      int base_address_op1 = hexToDecimal( $1.name );
      int base_address_op2 = hexToDecimal( $3.name );

      // put op1 into fac
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op2)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op2)), 2, false );
      addAsm( "JSR $BBA2", 3, false );
      addAsm( string("LDA #$") + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( string("LDY #$") + toHex(get_word_H(base_address_op1)), 2, false );
      if( string($2.name) == string("*"))
	{
	  addAsm( "JSR $BA28; FMULT", 3, false );
	}
      else if( string($2.name) == string("+"))
	{
	  addAsm( "JSR $B867; FADD", 3, false );
	}
      else if( string($2.name) == string("-"))
	{
	  addAsm( "JSR $B850; FSUB", 3, false );
	}
      else if( string($2.name) == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( "JSR $BB0F; FDIV", 3, false );
	}
      FAC=1;
    }
  /* if they're BOTH IMM's */
  else if( isInteger( $1.name ) && isInteger( $3.name ))
    {
      addParserComment( string( "IMM" ) + string( $2.name ) + string( "IMM (1)") );
      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($3.name).c_str() );
      //cerr << toHex( tmp_int1 + tmp_int2 ) << endl;
      int tmp_int3;

      
      /* then this is a compile-time arithetic operation */
      if( string( $2.name ) == "+"  )
        {
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 || tmp_int3 > 127)
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }
	  //addAsm( string("LDA #$") + toHex( tmp_int1 + tmp_int2 ), 2, false ); 
	  //strcpy( $$.name, string( string("i") + toString( tmp_int1 + tmp_int2 )).c_str() );
	  addAsm( string( "LDA #$" ) + toHex ( tmp_int3  ), 2, false );
	  //strcpy( $$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	  strcpy( $$.name, "A" );
	}
      else if( string( $2.name ) == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 || tmp_int3 > 127)
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }
	  //addAsm( string("LDA #$") + toHex( tmp_int1 - tmp_int2 ), 2, false ); 
	  //strcpy( $$.name, toString( tmp_int1 - tmp_int2 ).c_str() );
	  addAsm( string( "LDA #$" ) + toHex ( tmp_int3  ), 2, false );
	  //strcpy( $$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	  strcpy( $$.name, "A" );

	}
      else if( string( $2.name ) == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 || tmp_int3 > 127 )
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }

	  addAsm( string( "LDA #$" ) + toHex ( tmp_int3  ) + string( "; *** "), 2, false );
	  strcpy( $$.name, "A" );
	}
      else if( string( $2.name ) == "/" )
	{
	  //addAsm( string("LDA #$") + toHex( tmp_int1 / tmp_int2 ), 2, false );
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }

	  addAsm( string( "LDA #$" ) + toHex ( tmp_int3  ), 2, false );
	  //strcpy( $$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	  strcpy( $$.name, "A" );

	  //strcpy( $$.name, toString( tmp_int1 / tmp_int2 ).c_str() );
	}
      else
	{

	  addParserComment( string( "I am unable to recognize [") + string($2.name) + string("]" ));
	  strcpy( $$.name, string("unknown").c_str() );
	}


    }
  else if( isByte( $1.name ) && isByte( $3.name ) )
    {
      addParserComment( "IMM + IMM (2)" );
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
	  addAsm( string("LDA #$") + toHex( tmp_int1 + tmp_int2 ), 2, false ); 

	  strcpy( $$.name, toString( tmp_int1 + tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "-" )
	{
	  addAsm( string("LDA #$") + toHex( tmp_int1 - tmp_int2 ), 2, false ); 

	  strcpy( $$.name, toString( tmp_int1 - tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "*" )
	{
	  addAsm( string("LDA #$") + toHex( tmp_int1 * tmp_int2 ), 2, false ); 

	  strcpy( $$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	}
      else if( string( $2.name ) == "/" )
	{
	  addAsm( string("LDA #$") + toHex( tmp_int1 / tmp_int2 ), 2, false ); 

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
      
      addParserComment( "IMM + ID (Byte v. Addr)" );
     
      int tmp_int1;
      
      std::stringstream ss;
      ss << std::hex <<  string($1.name).substr( 2, 2 );
      ss >> tmp_int1;

      int tmp_size = 2;
      tmp_size = 3;
      addAsm( string("LDA ") + string( $3.name ), tmp_size, false);
      
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
      addAsm( string("STA ") + string($3.name), 3, false );
      strcpy( $$.name, "A" );
    }
  else if( isByte( $3.name ) )
    {
      addParserComment( "ID + IMM" );

      int tmp_size = 2;
      string tmp_string;
      if( $1.name[0] == '$' )
	{
	  addDebugComment( "$3 is a byte and $1 is an address" );
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
      
      if( scope_stack.top() == string("FOR") )
	{
	  // suspect
	  addAsm( string( "STA $") + string($1.name), 3, false );
	}

      strcpy( $$.name, "A" );

    }
  else
    {
      addParserComment( "ID + ID : 2491" );
      if( getTypeOf($1.name) == 8 && getTypeOf($3.name) == 8 )
	{
	  addDebugComment( "both Identifiers point to floats" );
	}
      else if( string( $2.name ) == "+" )
	{
	  if( isByte( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC ") + string($1.name),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($3.name), 3, false );
		}

	      strcpy( $$.name, string(string("A") + string($3.name)).c_str() );
	    }
	  else if( isInteger( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC #$") + toHex(atoi($1.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($3.name), 3, false );
		}
	      strcpy( $$.name, string(string("A") + string($3.name)).c_str() );
	    }
	  else if(  isAddress( $1.name ) && isByte( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC ") + string($3.name),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($1.name), 3, false );
		}
	      
	      strcpy( $$.name, "A" );
	    }
	  else if(  isAddress( $1.name ) && isInteger( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC #$") + toHex(atoi($3.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($1.name), 3, false );
		}

	      strcpy( $$.name, "A" );
	    }
	  else if( isAddress( $1.name ) && isAddress( $3.name ) )
	    {
	      
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC ") + string($3.name),3, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($1.name), 3, false );
		}
	      
	      strcpy( $$.name, "A" );
	    }
	  else if( isAddress( $1.name ) && isUint( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC #$") + toHex(atoi(stripFirst($3.name).c_str())),2, false);
	      strcpy( $$.name, "A" );
	    }
	  else if( isAddress( $1.name ) && isInteger( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "CLC" );
	      addAsm( string("ADC #$") + toHex(atoi(stripFirst($3.name).c_str())),2, false);
	      strcpy( $$.name, "A" );
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
	      strcpy( $$.name, string(string("A") + string($3.name)).c_str() );
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($3.name), 3, false );
		}
	      
	    }
	  else if( isInteger( $1.name ) && isAddress( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $3.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC #$") + toHex(atoi($1.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($3.name), 3, false );
		}
	      
	      strcpy( $$.name, string(string("A") + string($3.name)).c_str() );
	    }
	  else if(  isAddress( $1.name ) && isByte( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC ") + string($3.name),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($3.name), 3, false );
		}
	      
	      strcpy( $$.name, "A" );
	    }
	  else if(  isAddress( $1.name ) && isInteger( $3.name ))
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC #$") + toHex(atoi($3.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($1.name), 3, false );
		}
	      
	      strcpy( $$.name, "A" );
	    }
	  else if( isAddress( $1.name ) && isAddress( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC ") + string($3.name),3, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( string( "STA ") + string($1.name), 3, false );
		}
	      
	      strcpy( $$.name, "A" );
	    }
	  else if( isAddress( $1.name ) && isUint( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC #$") + toHex(atoi(stripFirst($3.name).c_str())),2, false);
	      strcpy( $$.name, "A" );
	    }
	  else if( isAddress( $1.name ) && isInteger( $3.name ) )
	    {
	      addAsm( string( "LDA " ) + string( $1.name ), 3, false );
	      addAsm( "SEC" );
	      addAsm( string("SBC #$") + toHex(atoi(stripFirst($3.name).c_str())),2, false);
	      strcpy( $$.name, "A" );
	    }
	  else
	    {

	      addCompilerMessage( "math error", 3);
	    }

	}
      
      
    }
  if( FAC == 1 )
    {
      strcpy( $$.name, "FAC" );
    }
	
};
| ID '[' expression ']'
{
  addParserComment( "ID '[' expression ']'" );
  int type_of_variable = getTypeOf( $1.name );
  //toHex(get_word_L(base_address_op1))

  if( isAddress( $3.name ) )
    {
      addAsm( string( "LDX " ) + string( $3.name ), 3, false );
    }
  else if( string( $3.name ) == string("A") )
    {
      addAsm( "TAX" );
    }
  else if( isInteger( $3.name ) || isUint( $3.name ) || isByte( $3.name ) )
    {
      if( atoi($3.name) > 255 || atoi($3.name) < 0 ) addCompilerMessage( "Index Out of Range", 3 );
      addAsm( string( "LDX #$") + toHex( atoi( stripFirst($3.name).c_str() ) ), 2, false );
    }

  addAsm( string( "LDA $" ) + toHex(getAddressOf($1.name)) + string(",X"), 3, false );
  //addAsm( string( "LDA #$") + toHex(get_word_L(getAddressOf($1.name))), 3, false );
  //addAsm( "STA $02", 2, false );
  //addAsm( string( "LDA #$") + toHex(get_word_H(getAddressOf($1.name))), 3, false );
  //addAsm( "STA $03", 2, false );
  //addAsm( "LDA ($02,X)", 2, false );
  
  //  cerr << type_of_variable << endl;
  strcpy( $$.name, "A" );
};
| '{' expression '}'
{
  addParserComment( "{ expression }" );
  addAsm( "; testing", 0, false );

};
| tRND '(' expression ')' 
{
  addComment( "=========================================================");  
  addComment( string( "           rnd(") + string( $3.name ) + string( ");") );
  addComment( "=========================================================");
  sidrnd_is_needed = true;
  if( !sidrnd_is_initialised  )
    {
      addAsm( "JSR SIDRND; initialize random number generator", 3, false );
      sidrnd_is_initialised = true;
    }
  
  addAsm( "LDA $D41B", 3, false );
  strcpy( $$.name, "A" );
};
| tTOUINT '(' expression ')'
{
  //cerr << $3.name << endl;
  int t = getTypeOf( $3.name );
  if( t == 8 && isAddress($3.name ))
    {
      // move it from memory to FAC
      // then call the function
      // result in A and Y
      int base_address = hexToDecimal( string($3.name) );
      
      addAsm( string( "LDA #$" ) + toHex(get_word_L(base_address)), 2, false  );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(base_address)), 2, false  );
      addAsm( "JSR $BBA2; MEM -> FAC", 3, false ); // MEM ->FAC
      addAsm( "JSR $B1AA; FAC -> AY (int)", 3, false ); // FAC -> INT
      addAsm( "TYA" );
    }
  strcpy( $$.name, "A" );
};
| tTOFLOAT '(' expression ')'
{
  int t = getTypeOf( $3.name );
  if( t == 0 && isAddress($3.name ))
    {
      // then it's a an unsigned byte
      addAsm( string("LDY ") + string( $3.name ), 3, false ); 
      addAsm( "LDA #$00", 2, false );
      addAsm( "JSR $B391", 3, false );
    }
  strcpy( $$.name, "FAC" );
};
| '{' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value '}'
{
  int sprite_number = atoi( $2.name );
  if( sprite_number > 7 || sprite_number < 0 )
    {
      addCompilerMessage( "invalid MOB number: should be 0-7", 3 );
    }

  int sprite_location = atoi( $4.name );
  if( sprite_location > 255 || sprite_location < 0 )
    {
      addCompilerMessage( "invalid MOB location: should be 0-255", 3 );
    }
  
  mob_vector.push_back( atoi(stripFirst( $2.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $4.name ).c_str()) );
  
 
  mob_vector.push_back( atoi(stripFirst( $6.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $8.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $10.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $12.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $14.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $16.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $18.name ).c_str()) );
  
  mob_vector.push_back( atoi(stripFirst( $20.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $22.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $24.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $26.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $28.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $30.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $32.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $34.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $36.name ).c_str()) );

  mob_vector.push_back( atoi(stripFirst( $38.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $40.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $42.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $44.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $46.name ).c_str()) );
 
  
  mob_vector.push_back( atoi(stripFirst( $48.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $50.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $52.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $54.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $56.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $58.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $60.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $62.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $64.name ).c_str()) );

  mob_vector.push_back( atoi(stripFirst( $66.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $68.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $70.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $72.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $74.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $76.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $78.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $80.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $82.name ).c_str()) );

  mob_vector.push_back( atoi(stripFirst( $84.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $86.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $88.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $90.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $92.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $94.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $96.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $98.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $100.name ).c_str()) );

  mob_vector.push_back( atoi(stripFirst( $102.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $104.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $106.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $108.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $110.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $112.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $114.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $116.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $118.name ).c_str()) );

  mob_vector.push_back( atoi(stripFirst( $120.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $122.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $124.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $126.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $128.name ).c_str()) );
  mob_vector.push_back( atoi(stripFirst( $130.name ).c_str()) );
  
  strcpy( $$.name, "m" );

};
| tGETIN '(' ')'
{
  addComment( "=========================================================");  
  addComment( string("                 getin()" ));
  addComment( "=========================================================");

  addAsm( "LDA $CB", 2, false );
  
  //addAsm( "JSR $FFE4", 3, false );
  strcpy( $$.name, "A" );
};
| tTWOS '(' ID ')'
{
  twos_complement_is_needed = true;
  addComment( "=========================================================");  
  addComment( string("                 twos(") + string( $3.name ) + string(")"));
  addComment( "=========================================================");

  addAsm( string("LDA $") + toHex(getAddressOf( string( $3.name ))), 3, false );
  addAsm( "PHA" );
  addAsm( "JSR TWOS", 3, false );
  addAsm( "PLA" );
  strcpy( $$.name, "A");
};
| tSIN '(' expression ')'
{
  addComment( "=========================================================");  
  addComment( "                 sine");
  addComment( "=========================================================");
  addParserComment( "RULE: expression: sin( expression );" );
  if( isFloat( $3.name ) )
    {
      // IMM float
      inlineFloat( $3.name );
      // calculate the sine of it
      addAsm( "JSR $E26B; SIN(FAC) -> FAC", 3, false ); 
      // result is in FAC
      strcpy( $$.name, "FAC");
    }
  else if( getTypeOf( $3.name ) == 8 )
    {
      // float
      int base_address = getAddressOf($3.name);
      addAsm( string( "LDA #$" ) + toHex(get_word_L(base_address)), 2, false  );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(base_address)), 2, false  );
      addAsm( "JSR $BBA2; MEM -> FAC", 3, false ); // FP ->FAC
      // calculate the sine of it
      addAsm( "JSR $E26B; SIN(FAC) -> FAC", 3, false ); // sqrt
      strcpy( $$.name, "FAC");
    }
  else if( getTypeOf( $3.name ) == 2 )
    {
      // ?? (see also cosine!)
      strcpy( $$.name, "w0344");
    }
  else if( getTypeOf( $3.name ) == 1 )
    {
      strcpy( $$.name, "A");
    }
  else
    {
      addCompilerMessage( "trying to calculate sine of unknown type" );
      strcpy( $$.name, "A");
    }
};
| tCOS '(' expression ')'
{
  addComment( "=========================================================");  
  addComment( "                 cosine");
  addComment( "=========================================================");
  addParserComment( "RULE: expression: cos( expression );" );
  if( isFloat( $3.name ) )
    {
      // IMM float
      inlineFloat( $3.name );
      // calculate the sine of it
      addAsm( "JSR $E264; COS(FAC) -> FAC", 3, false ); 
      // result is in FAC
      strcpy( $$.name, "FAC");
    }
  else if( getTypeOf( $3.name ) == 8 )
    {
      // float
      int base_address = getAddressOf($3.name);
      addAsm( string( "LDA #$" ) + toHex(get_word_L(base_address)), 2, false  );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(base_address)), 2, false  );
      addAsm( "JSR $BBA2; MEM -> FAC", 3, false ); // FP ->FAC
      // calculate the cosine of it
      addAsm( "JSR $E264; COS(FAC) -> FAC", 3, false ); // sqrt
      strcpy( $$.name, "FAC");
    }
  else if( getTypeOf( $3.name ) == 2 )
    {
      // ?? see also sine!
      strcpy( $$.name, "w0344");
    }
  else if( getTypeOf( $3.name ) == 1 )
    {
      strcpy( $$.name, "A");
    }
  else
    {
      addCompilerMessage( "trying to calculate cosine of unknown type" );
      strcpy( $$.name, "A");
    }
};
| tTAN '(' expression ')'
{
  addComment( "=========================================================");  
  addComment( "                 tangent");
  addComment( "=========================================================");
  addParserComment( "RULE: expression: tan( expression );" );
  if( isFloat( $3.name ) )
    {
      // IMM float
      inlineFloat( $3.name );
      // calculate the sine of it
      addAsm( "JSR $E2B4; TAN(FAC) -> FAC", 3, false ); 
      // result is in FAC
      strcpy( $$.name, "FAC");
    }
  else if( getTypeOf( $3.name ) == 8 )
    {
      // float
      int base_address = getAddressOf($3.name);
      addAsm( string( "LDA #$" ) + toHex(get_word_L(base_address)), 2, false  );
      addAsm( string( "LDY #$" ) + toHex(get_word_H(base_address)), 2, false  );
      addAsm( "JSR $BBA2; MEM -> FAC", 3, false ); // FP ->FAC
      // calculate the cosine of it
      addAsm( "JSR $E2B4; TAN(FAC) -> FAC", 3, false ); // sqrt
      strcpy( $$.name, "FAC");
    }
  else if( getTypeOf( $3.name ) == 2 )
    {
      // ?? see also sine!
      strcpy( $$.name, "w0344");
    }
  else if( getTypeOf( $3.name ) == 1 )
    {
      strcpy( $$.name, "A");
    }
  else
    {
      addCompilerMessage( "trying to calculate tangent of unknown type" );
      strcpy( $$.name, "A");
    }
};
| value
{
  addParserComment( string("RULE: expression: value: [") + string( $1.name ) + string(")") );
  addParserComment( string( $1.name ) );
  strcpy( $$.name, $1.name);
};
| ID
{
  addParserComment(string( "RULE: expression: ID : ") + string($1.name ));
  int base_address = getAddressOf($1.name);
  int t = getTypeOf( $1.name );
  strcpy( $$.name, (string( "$" ) + toHex(getAddressOf($1.name ))).c_str() );
};
| tSPRITECOLLISION '(' ')'
{
  addAsm( "LDA $D01E", 3, false );
  strcpy( $$.name, "A" );
};
| tSPRITECOLLISION '(' expression ')'
{
  addAsm( "LDA $D01E;\t\t\tMOB Collision Register", 3, false );
  addAsm( string( "AND " ) + string( $3.name ), 3, false );
  strcpy( $$.name, "A" );
};
| tPEEK '(' NUMBER ')'
{
  if( atoi( $3.name ) > 65535 ) addCompilerMessage( "memory location out of range", 2 );
  if( atoi( $3.name ) < 0 ) addCompilerMessage( "memory location out of range", 2 );
  addAsm( string("LDA $") + toHex(atoi( $3.name )), 3, false );
  strcpy( $$.name, "A" );
};
| tPEEK '(' expression ')'
{
  
  if( string($3.name) == string("ARG") || string($3.name) == string("FAC" ))
    {
      addCompilerMessage( "peek argument type conflict (value must be word)", 3 );
    }
  else if( getTypeOf( $3.name ) == 2)
    {
      addAsm( string("LDA $") + toHex(atoi( $3.name )), 3, false );
    }
    strcpy( $$.name, "A" );
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
| MULTIPLY
{
  addParserComment( "RULE: arithmetic MULTIPLY" );
  current_state = string("*");
  strcpy( $$.name, "*" );
}
|
DIVIDE
{
  addParserComment( "RULE: arithmetic DIVIDE" );
  current_state = string("/");
  strcpy( $$.name, "/" );
}
;

relop: LT { current_state = string( "LT" );  }
| GT { current_state = string( "GT" ); }
| LE { current_state = string( "LE" ); }
| GE { current_state = string( "GE" ); }
| EQ { current_state = string( "EQ" ); }
| NE { current_state = string( "NE" ); }
;

value:
FLOAT_NUM
{
  addDebugComment( string( "RULE: value: FLOAT_NUM: (") + string( $1.name ) + string(")") );
  strcpy($$.name, string( string("f") + string($1.name)).c_str());
}
| NUMBER
{
  addDebugComment( string( "RULE: value: NUMBER: (") + string( $1.name ) + string(")") );
  int v = atoi( $1.name );

  if( getTypeOf( $1.name ) != -1 ) current_variable_type = getTypeOf( $1.name );


  if( current_variable_type == 0 )
    {
      //if( atoi( $1.name ) > 255 || atoi( $1.name ) < 0 ) addCompilerMessage( "uint out of range (0-255)", 3 );
      strcpy($$.name, string( string("u") + string($1.name)).c_str());
    }
  else if( current_variable_type == 1 )
    {
      //if( atoi( $1.name ) > 127 || atoi( $1.name ) < -128 ) addCompilerMessage( "int out of range (-128 to +127)", 3 );
      strcpy($$.name, string( string("i") + string($1.name)).c_str());
    }
  else if( current_variable_type == 2 )
    {
      strcpy($$.name, string( string("w") + string($1.name)).c_str());
    }
  else
    {
       strcpy($$.name, string( string("i") + string($1.name)).c_str());
    }
}
| tWORD
{
  /* ASM VARIABLE TYPES & SIZES */
  /* 0 - unsigned int - 1 bytes */
  /* 1 - signed int - 1 bytes */
  /* 2 - word - 2 bytes */
  /* 4 - double - 2 bytes */
  /* 8 - float - 5 bytes */

  addDebugComment(string("RULE: value: WORD :") +  string($1.name ));
  strcpy( $$.name, $1.name );
}
| INT
{
  addDebugComment(string("RULE: value: INT :") +  string($1.name ));
  strcpy( $$.name, $1.name );
}
| CHARACTER
{
  addDebugComment( "RULE: value: CHARACTER" );
  strcpy($$.name, $1.name);
  //$$.nd = mknode(NULL, NULL, $1.name);
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
  addAsm("RTS");
}
| RETURN {} value ';'
{
  addParserComment( "RULE: return: RETURN {} value ';'" );
  addAsm("RTS");
}
|
{
  addParserComment( "RULE: return:" );
  addAsm( "RTS" );

  $$.nd = NULL;
}
;

%%


int main(int argc, char *argv[])
{
  label_major=0;
  label_vector.push_back(0);
  label_vector.push_back(0);
  label_vector.push_back(0);
  label_vector.push_back(0);
  label_vector.push_back(0);
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
      if( a == "--debug" ) debug_flag_is_on = true;
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
  
  if( scanf_is_needed)
    {
      addAsmVariable( "buffer_tmp_l", 0 );
      addAsmVariable( "buffer_tmp_h", 0 );
    }
  if( return_addresses_needed )
    {
      addAsmVariable( "return_address_1", 0 );
      addAsmVariable( "return_address_2", 0 );
    }
      
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

   if( signed_comparison_is_needed )
    {
      return_addresses_needed = true;
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
   if( umul_is_needed )
     {
       // unsigned int multiplication
       // =================================================================================
       addAsm( "UMUL:", 0, true );
       addAsm( "LDA #$00", 2, false );
       addAsm( "LDX #$08", 2, false );
       addAsm( "UMULTOP:", 0, true );
       addAsm( "LSR $03", 2, false );
       addAsm( "BCC UMULSKIP", 2, false );
       addAsm( "CLC" );
       addAsm( "ADC $02", 2, false );
       addAsm( "UMULSKIP:", 0, true );
       addAsm( "ASL $02", 2, false );
       addAsm( "CLC" );
       addAsm( "DEX" );
       addAsm( "BNE UMULTOP", 2, false );
       addAsm( "STA $03", 2, false ); // 8 bit result in $0042
       // =================================================================================
       addAsm( "RTS" );

     }
   if( sidrnd_is_needed )
     {
       addAsm( "SIDRND:", 0, true );
       addAsm( "PHA" );
       addAsm( "LDA #$FF", 2, false );
       addAsm( "STA $D40E", 3, false );
       addAsm( "STA $D40F", 3, false );
       addAsm( "LDA #$80", 2, false );
       addAsm( "STA $D412", 3, false );
       addAsm( "PLA" );
       addAsm( "RTS" );       
     }
   if( byte2hex_is_needed )
    {
      return_addresses_needed = true;

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
      addAsm( ".BYTE #$90, #$03", 2, false);
      addAsm( "CLC" );
      addAsm( "ADC #$07", 2, false);
      addAsm( "ADC #$30", 2, false);
      addAsm( "JSR $FFD2", 3, false );
      addAsm( "TXA" );
      addAsm( "AND #$0F", 2, false);
      addAsm( "CMP #$0A", 2, false);
      addAsm( ".BYTE #$90, #$03", 2, false);
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
  if( byt2str_is_needed  )
    {
      return_addresses_needed = true;
      addAsm( "BYT2STR:\t\t;Turns a 1 byte value into 3 PETSCII chars on stack", 0, true );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      addAsm( "PLA" ); // the value to be put into the string

      addAsm( "LDX #$00", 2, false );
      addAsm( "B2SL1:", 0, true );
      
      addAsm( "SEC" );
      addAsm( "SBC #$64", 2, false );
      addAsm( "BCC B2SL2", 2, false );
      addAsm( "INX" );
      addAsm( "JMP B2SL1", 3, false );
      addAsm( "B2SL2:", 0, true );
      addAsm( "CLC" );
      addAsm( "ADC #$64", 2, false );
      addAsm( "TAY" );
      addAsm( "TXA" );
      addAsm( "CLC" );
      addAsm( "ADC #$30", 2, false );
      addAsm( "PHA" );
      addAsm( "TYA" );
      addAsm( "LDX #$00", 2, false );


      addAsm( "B2SL3:", 0, true );
      addAsm( "SEC" );
      addAsm( "SBC #$0A", 2, false );
      addAsm( "BCC B2SL4", 2, false );
      addAsm( "INX" );
      addAsm( "JMP B2SL3", 3, false );
      addAsm( "B2SL4:", 0, true );
      addAsm( "CLC" );
      addAsm( "ADC #$0A", 2, false );
      addAsm( "TAY" );
      addAsm( "TXA" );
      addAsm( "CLC" );
      addAsm( "ADC #$30", 2, false );
      addAsm( "PHA" );
      addAsm( "TYA" );
      addAsm( "LDX #$00", 2, false );

      addAsm( "TYA" );
      addAsm( "ADC #$30", 2, false );
      addAsm( "PHA" );
      
      
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );  
      addAsm( "RTS" );

      
    }
  if( false )
    {
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( "FUNCTION:\t\t;Function Comment", 0, true );

      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      
      
      
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );
  
      addAsm( "RTS" );

      
    }
  if( split_byte_is_needed )
    {
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( "SPLITBYTE:\t\t;S1 -> S1=Hi Bits   S0=Lo Bits", 0, true );

      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      addAsm( "PLA" );
      addAsm( "STA $52", 2, false);
      addAsm( "AND #$0F", 2, false );
      addAsm( "CLC" );
      addAsm( "ADC #$30", 2, false );
      addAsm( "PHA" );
      addAsm( "LDA $52", 2, false );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "AND #$0F", 2, false );
      addAsm( "CLC" );
      addAsm( "ADC #$30", 2, false );
      addAsm( "PHA" );      
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );  
      addAsm( "RTS" );

    }
  if( decimal_digit_is_needed )
    {
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( "DECDIG:\t\t;Divide number on stack by 10", 0, true );

      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      addAsm( "PLA" );

      addAsm( "TAX" );
      addAsm( "DEX" );
      addAsm( "BMI DECDIGBK", 2, false);
      addAsm( "LDA #$00", 2, false );
      addAsm( "CLC" );
      addAsm( "PHP" );
      addAsm( "SED" );
      addAsm( "DECDIGLP:", 0, true );
      addAsm( "ADC #$01", 2, false );
      addAsm( "DEX" );
      addAsm( "BPL DECDIGLP", 2, false );
      addAsm( "PLP" );
      addAsm( "DECDIGBK:", 0, true );

      addAsm( "PHA" );
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );  
      addAsm( "RTS" );

    }
  if( div10_is_needed )
    {
      // DIVIDE BY 10 ROUTINE
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( "DIV10:\t\t;Divide number on stack by 10", 0, true );

      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      addAsm( "PLA" );
      addAsm( "LSR" );
      addAsm( "STA $2A", 2, false );
      addAsm( "LSR" );
      addAsm( "ADC $2A", 2, false );
      addAsm( "ROR" );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "ADC $2A", 2, false );
      addAsm( "ROR" );
      addAsm( "ADC $2A", 2, false );
      addAsm( "ROR" );
      addAsm( "LSR" );
      addAsm( "LSR" );
      addAsm( "PHA" ); // result back on stack
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );  
      addAsm( "RTS" );
    }
    if( modulus_is_needed )
    {
      // MODULUS ROUTIUNE
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( "MOD:\t\tS1 % S2", 0, true );

      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      addAsm( "PLA" );
      addAsm( "STA $2A", 2, false ); // S1
      addAsm( "PLA" );
      addAsm( "STA $52", 2, false ); // S2
	
      addAsm( "SEC" );
      addAsm( "LDA $2A", 2, false );
      addAsm( "SBC $52", 2, false );
      addAsm( "ADC" );
      addAsm( "" );
      addAsm( "" );
      addAsm( "" );
      addAsm( "" );
      addAsm( "" );
      addAsm( "" );
      addAsm( "" );
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );  
      addAsm( "RTS" );
    }

  if( cls_is_needed )
    {
      addAsm( "CLS:\t\t; Clear Screen Routine", 0, true );
      addAsm( "LDA #$20", 2, false ); // space
      addAsm( "LDX #$00", 2, false ); // (essentially 256)
      addAsm( "CLSLOOP:", 0, true );
      addAsm( "STA $0400,X", 3, false );
      addAsm( "STA $0500,X", 3, false );
      addAsm( "STA $0600,X", 3, false );
      addAsm( "STA $06E8,X", 3, false );
      addAsm( "DEX" );
      addAsm( "BNE CLSLOOP", 2, false );
      addAsm( "RTS" );

    }
  if( mobcpy_is_needed )
    {
      // a QUICK and DIRTY MEMCPY of 63 BYTES
      addAsm( "MOBCPY:\t\t; Copy 63 bytes from $FB/$FC to $FD/$FE", 0, true ); 
      addAsm( "LDY #$3F", 2, false );
      addAsm( "MOBCPL1:", 0, true );
      addAsm( "CPY #$00", 2, false );
      addAsm( "BEQ MOBCPL2", 2, false );
      addAsm( "LDA ($FB),Y", 2, false );
      addAsm( "STA ($FD),Y", 2, false );
      addAsm( "DEY", 1, false );
      addAsm( "JMP MOBCPL1", 3, false );
      addAsm( "MOBCPL2:", 0, true );
      addAsm( "RTS" );
    }
  if( memcpy_is_needed )
    {
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( "MEMCPY:\t\t; Copy STACK[0] bytes from $FB/$FC to $FD/$FE", 0, true );
      // save return address from the stack
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_1" ) ), 3, false );
      addAsm( "PLA" );
      addAsm( string( "STA $" ) + toHex(getAddressOf(  "return_address_2" ) ), 3, false );
      //==================================================================================
      addAsm( "PLA" );
      addAsm( "TAY" );
      addAsm( "MEMCPL1:", 0, true );
      addAsm( "CPY #$00", 2, false );
      addAsm( "BEQ MEMCPL2", 2, false );
      addAsm( "LDA ($FB),Y", 2, false );
      addAsm( "STA ($FD),Y", 2, false );
      addAsm( "DEY", 1, false );
      addAsm( "JMP MEMCPL1", 3, false );
      addAsm( "MEMCPL2:", 0, true );
      //==================================================================================
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_2" )), 3, false );
      addAsm( "PHA" );
      addAsm( string( "LDA $" ) + toHex(getAddressOf( "return_address_1" )) , 3, false );
      addAsm( "PHA" );
  
      addAsm( "RTS" );

      
    }
  if( twos_complement_is_needed )
    {
      return_addresses_needed = true;

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
      addAsm( "JSR $FFE4", 3, false );
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
  //ProcessMobs();
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
}

void check_return_type(char *value) {
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

void yyerror(const char* msg)
{
  cerr << msg << ": line " << countn+1 << endl;
}


/* BASIC 2.0 SPRITE ROUTINE */
/* V = 53248  -- Base Sprite Address*/
/* POKE V+21, 255  -- turn on all sprites */
/* POKE 2040+SPRITE#, 192+SPRITE#  -- SPRITE# = 0-7 */
/* SPRITE DATA is AT:   (192+SPRITE#)*64  - (192+SPRITE#)*64 + 62 */
/* poke V+39+sprite#, colour */
/* poke V+2*SPRITE#, X  -- x position */
/* poke V+(2*SPRITE#)+1, Y -- y position */
