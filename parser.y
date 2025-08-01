%{
#include <stdio.h>
#include <iostream>

#include <string>
#include <stdlib.h>
#include <ctype.h>
#include <cctype>
#include <vector>
#include <stack>
#include <sstream>
#include <cmath>
#include "lex.yy.c"


  using namespace std;
  string str_ADC;
  string str_AND;
  string str_ASL;
  string str_ALR;// undocumented
  string str_BCC;
  string str_BCS;
  string str_BEQ;
  string str_BIT;
  string str_BMI;
  string str_BNE;
  string str_BPL;
  string str_BRK;
  string str_BVC;
  string str_BVS;
  string str_CLC;
  string str_CLD;
  string str_CLI;
  string str_CLV;
  string str_CMP;
  string str_CPX;
  string str_CPY;
  string str_DCP;
  string str_DEC;
  string str_DEX;
  string str_DEY;
  string str_EOR;
  string str_INC;
  string str_INX;
  string str_INY;
  string str_JMP;
  string str_JSR;
  string str_LAX;
  string str_LDA;
  string str_LDX;
  string str_LDY;
  string str_LSR;
  string str_NOP;
  string str_ORA;
  string str_PHA;
  string str_PHP;
  string str_PLA;
  string str_PLP;
  string str_ROL;
  string str_ROR;
  string str_RTI;
  string str_RTS;
  string str_SBC;
  string str_SEC;
  string str_SED;
  string str_SEI;
  string str_STA;
  string str_STX;
  string str_STY;
  string str_TAX;
  string str_TAY;
  string str_TSX;
  string str_TXA;
  string str_TXS;
  string str_TYA;
  string str_XAA;
  string str_BYTE;
  string commentmarker;
		   
  void setKickDialect()
  {

    str_ADC = string( "adc " );
    str_AND = string( "and " );
    str_ASL = string( "asl " );
    str_ALR = string( "alr " );
    str_BCC = string( "bcc " );
    str_BCS = string( "bcs " );
    str_BEQ = string( "beq " );
    str_BIT = string( "bit " );
    str_BMI = string( "bmi " );
    str_BNE = string( "bne " );
    str_BPL = string( "bpl " );
    str_BRK = string( "brk " );
    str_BVC = string( "bvc " );
    str_BVS = string( "bvs " );
    str_CLC = string( "clc " );
    str_CLD = string( "cld " );
    str_CLI = string( "cli " );
    str_CLV = string( "clv " );
    str_CMP = string( "cmp " );
    str_CPX = string( "cpx " );
    str_CPY = string( "cpy " );
    str_DCP = string( "dcp " );
    str_DEC = string( "dec " );
    str_DEX = string( "dex " );
    str_DEY = string( "dey " );
    str_EOR = string( "eor " );
    str_INC = string( "inc " );
    str_INX = string( "inx " );
    str_INY = string( "iny " );
    str_JMP = string( "jmp " );
    str_JSR = string( "jsr " );
    str_LAX = string( "lax " );
    str_LDA = string( "lda " );
    str_LDX = string( "ldx " );
    str_LDY = string( "ldy " );
    str_LSR = string( "lsr " );
    str_NOP = string( "nop " );
    str_ORA = string( "ora " );
    str_PHA = string( "pha " );
    str_PHP = string( "php " );
    str_PLA = string( "pla " );
    str_PLP = string( "plp " );
    str_ROL = string( "rol " );
    str_ROR = string( "ror " );
    str_RTI = string( "rti " );
    str_RTS = string( "rts " );
    str_SBC = string( "sbc " );
    str_SEC = string( "sec " );
    str_SED = string( "sed " );
    str_SEI = string( "sei " );
    str_STA = string( "sta " );
    str_STX = string( "stx " );
    str_STY = string( "sty " );
    str_TAX = string( "tax " );
    str_TAY = string( "tay " );
    str_TSX = string( "tsx " );
    str_TXA = string( "txa " );
    str_TXS = string( "txs " );
    str_TYA = string( "tya " );
    str_XAA = string( "xaa " );
    str_BYTE = string( ".byte " );
    commentmarker = " // ";


    return;
    
  }

  void setWebDialect()
  {
    str_ADC = string( "ADC " );
    str_AND = string( "AND " );
    str_ALR = string( "ALR " );
    str_ASL = string( "ASL " );
    str_BCC = string( "BCC " );
    str_BCS = string( "BCS " );
    str_BEQ = string( "BEQ " );
    str_BIT = string( "BIT " );
    str_BMI = string( "BMI " );
    str_BNE = string( "BNE " );
    str_BPL = string( "BPL " );
    str_BRK = string( "BRK" );
    str_BVC = string( "BVC " );
    str_BVS = string( "BVS " );
    str_CLC = string( "CLC" );
    str_CLD = string( "CLD " );
    str_CLI = string( "CLI" );
    str_CLV = string( "CLV " );
    str_CMP = string( "CMP " );
    str_CPX = string( "CPX " );
    str_CPY = string( "CPY " );
    str_DCP = string( "DCP " );
    str_DEC = string( "DEC " );
    str_DEX = string( "DEX" );
    str_DEY = string( "DEY" );
    str_EOR = string( "EOR " );
    str_INC = string( "INC " );
    str_INX = string( "INX" );
    str_INY = string( "INY" );
    str_JMP = string( "JMP " );
    str_JSR = string( "JSR " );
    str_LAX = string( "LAX " );
    str_LDA = string( "LDA " );
    str_LDX = string( "LDX " );
    str_LDY = string( "LDY " );
    str_LSR = string( "LSR " );
    str_NOP = string( "NOP" );
    str_ORA = string( "ORA " );
    str_PHA = string( "PHA" );
    str_PHP = string( "PHP" );
    str_PLA = string( "PLA" );
    str_PLP = string( "PLP" );
    str_ROL = string( "ROL " );
    str_ROR = string( "ROR " );
    str_RTI = string( "RTI " );
    str_RTS = string( "RTS" );
    str_SBC = string( "SBC " );
    str_SEC = string( "SEC " );
    str_SED = string( "SED " );
    str_SEI = string( "SEI" );
    str_STA = string( "STA " );
    str_STX = string( "STX " );
    str_STY = string( "STY " );
    str_TAX = string( "TAX" );
    str_TAY = string( "TAY" );
    str_TSX = string( "TSX" );
    str_TXA = string( "TXA" );
    str_TXS = string( "TXS" );
    str_TYA = string( "TYA " );
    str_XAA = string( "XAA " );// OPDCODE: $8B IMM :  2 cycles
    str_BYTE = string( ".BYTE " );
    commentmarker = " ; ";

    return;
  }
  
  /* The extra parameter is also given to yyerror */
  void yyerror(FILE* fp, const char* msg);

  /* forward declarations */
  void addAsm( string s, int instruction_size, bool l);
  void addDebugComment( string s );
  string getNameOf( int a );
  void addComment( string s );
  string stripFirst( string s );
  bool isWordID( string s );
  
  // compiler internal flags
  bool kick=false;
  bool int_uint = false;

  int function_argument_count = 0;
  
  // parameter booleans
  bool p0=false;
  bool p1=false;
  bool p2=false;
  bool p3=false;

  bool load_is_needed=false;
  bool load16_is_needed=false;
  //bool save_is_needed=false;
  bool sid_was_imported=false;
  bool basic_upstart=false;
  
  bool function_labels_are_still_needed=true;

  bool stack_is_needed=false;
  bool illegal_operations_are_needed=false;
  bool sidirq_is_needed=false;
  bool bnkmem_is_needed=false;
  bool scrmem_is_needed=false;
  bool chrmem_is_needed=false;
  bool bmpmem_is_needed=false;
  bool bin2bit_is_needed=false;
  bool word2dec_is_needed=false;
  bool plot_is_needed=false;
  bool float_swap_space_is_needed = false;
  bool multicolour_plot_is_needed=false;
  bool getplot_is_needed=false;
  bool unsigned_signed_cmp_is_needed=false;
  bool split_byte_is_needed=false;
  bool decimal_digit_is_needed=false;
  bool modulus_is_needed=false;
  bool div10_is_needed=false;
  bool return_addresses_needed=true;
  bool umul_is_needed=false;
  bool pow8_is_needed=false;
  bool pow16_is_needed=false;
  bool mul16_is_needed=false;
  bool div16_is_needed=false;
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

  bool processing_includes = false;
  
  bool arg_debug_comments = false;
  bool debug_flag_is_on = false;

  int label=0;
  int label_major=0;

  // command line arguments
  bool arg_memory_locations=false;
  bool arg_unsafe_ifs=false;
  bool arg_unsafe_math=false;
  bool arg_show_labels=true;
  bool arg_asm_comments=true;
  bool arg_show_cycles=false;
  bool arg_optimize=true;
  bool arg_parser_comments=false;
  int scanf_buffer_size=16;
  
  string current_state;

  int data_start=828; // 98 2 byte variables
  int code_start=2049;
  int current_code_location=0;
  int byte_count=0;
  int string_number=0;
  int data_number=0;
  int kbd_bfr_addr = 0xCFE0;
  int current_variable_type=-1;
  int current_variable_base_address=-1;

  int jump_start = 0;
  int jump_end = 0;
  
  int nl = 0; // node_level node level
  
  // helper functions

  int music_init_addr = 0;
  int music_play_addr = 0;
  stack <string> scope_stack;
  stack <string> var_scope_stack;
  stack <int> label_stack;
  vector <int> label_vector;
  vector <int> mob_vector;
  vector <string> mobs;
  vector <string> include_file_vector;
  stack <string> rnd_str_vector;

  //stack <string> iterator_stack;
  

  vector <string> node_vector;

  // taken from: https://stackoverflow.com/questions/440133/how-do-i-create-a-random-alpha-numeric-string-in-c
  
  bool cmpstr( string a, string b )
  {
    bool return_value = false;
    if( memcmp( a.data(), b.data(), b.length() ) == 0 )
      {
	return_value = true;
      }
    return return_value;
  }

  string gen_random_str(const int len) {
    static const char alphanum[] =
      "0123456789"
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      "abcdefghijklmnopqrstuvwxyz";
    std::string tmp_s;
    tmp_s.reserve(len);

    for (int i = 0; i < len; ++i) {
      tmp_s += alphanum[rand() % (sizeof(alphanum) - 1)];
    }
    
    return tmp_s;
  }

  void addNode( string s )
  {
    string n = string("");
    for( int l = 0; l < nl; l++ )
      {
	n = n + string(" ");
      }
    n=n +s;
    node_vector.push_back(n);
    return;
  }
  
  int getDataTypeValue( string s )
  {
    if( s == string("UINT")) return 0;
    if( s == string("BYTE")) return 0;
    if( s == string("INT")) return 1;
    if( s == string("WORD")) return 2;
    if( s == string("DOUBLE")) return 4;
    if( s == string("FLOAT")) return 8;
    if( s == string("MOB")) return 16;
    if( s == string("VOID")) return 32;
    if( s == string("STRING")) return 64;
    return -1;
  }
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
    //if( return_value )  cerr << "isMob" << endl;
    return return_value;
  }
  
  bool isFloatIMM( string s )
  {
    bool return_value = false;
    if( s[0] == 'f' ) return_value = true;
    return return_value;
  }

  bool isUintIMM( string s )
  {
    bool return_value = false;
    if( s[0] == 'u' ) return_value = true;
    return return_value;
  }
  
  bool isWordIMM( string s )
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

  bool isDoubleIMM( string s )
  {
    bool return_value = false;
    if( s[0] == 'd' ) return_value = true;
    return return_value;
  }

  bool isByte( string s )
  {
    bool return_value = false;
    if( s[0] == '#' && s[1] == '$' ) return_value = true;
    return return_value;
  }

  bool isIntIMM( string s )
  {
    bool return_value = false;
    //if( s[0] != '#' && s[0] != '$' ) return_value = true;
    if( s[0] == 'i' ) return_value = true;
    return return_value;
  }

  bool isWordDT(string s)
  {
    bool return_value = false;
    if(s == string("WORD")) return_value = true;
    return return_value;
  }
  
  bool isUintDT(string s)
  {
    bool return_value = false;
    if(s==string("UINT") || s==string("BYTE")) return_value = true;
    return return_value;
  }
  
  bool isIntDT(string s)
  {
    bool return_value = false;
    if(s == string("INT")) return_value = true;
    return return_value;
  }

  bool isFloatDT(string s)
  {
    bool return_value = false;
    if(s == string("FLOAT")) return_value = true;
    return return_value;
  }

  bool isDoubleDT(string s)
  {
    bool return_value = false;
    if(s == string("DOUBLE")) return_value = true;
    return return_value;
  }

  bool isStringDT(string s)
  {
    bool return_value = false;
    if(s == string("STRING")) return_value = true;
    return return_value;
  }

  bool isVoidDT(string s)
  {
    bool return_value = false;
    if(s == string("VOID")) return_value = true;
    return return_value;
  }

  bool isString( string s )
  {
    bool return_value = false;
    if(s == string("str")) return_value = true;
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

  void addOptimizationMessage(string msg, int linen, int level = 0)
  {
    /* level 0 - info */
    /* level 1 - warning */
    /* level 2 - error */
    /* level 3 - critical */

    switch( level )
      {
      case 0:
	cerr << "*** message *** asm instruction number: " << linen << " *** " << msg << " ***" << endl;
	break;
      case 1:
	cerr << "*** warning *** asm instruction number: " << linen << " *** " << msg << " ***" << endl;
	break;
      case 2:
	cerr << "*** ERROR *** asm instruction number: " << linen << " *** " << msg << " ***" << endl;
	break;
      case 3:
	cerr << "***  C R I T I C A L   E R R O R  *** asm instruction number: " << linen << " *** " << msg << " ***" << endl;
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


  
  /* void dumpA() */
  /* { */
  /*   if( debug_flag_is_on ) */
  /*     { */
  /* 	byte2hex_is_needed = true; */
  /* 	/\* DEBUG *\/ */
  /* 	addAsm( "PHA" + commentmarker + "DEBUG", 1, false); */
  /* 	addAsm( "PHA" + commentmarker + "DEBUG", 1, false); */
  /* 	addAsm( str_JSR + "BYTE2HEX" + commentmarker + "DEBUG", 3, false ); */
  /* 	addAsm( "PLA" + commentmarker + "DEBUG", 1, false); */
  /* 	/\* DEBUG *\/ */
  /*     } */
  /*   return; */
  /* } */

  int twos_complement( int x )
  {
    int return_value = ( abs( x ) ^ 255 ) + 1;
    // for an 8 bit byte
    if( x > 255 ) return_value = ( abs( x ) ^ 65535 ) + 1;
      return return_value;
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
    
    int l2 = 1+floor(log2( value )); //  1023 is the bias for 64 bit fp numbers
    int exp = 128 + l2;      // on C64 FP's the bias is 63
    
    exponent = integerToBinary( exp );

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
    return_value = binaryToHex( nmb );
    return return_value;
  }

  string stripQuotes( string s )
  {
    return string(s).substr(1,string(s).length()-2);
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

  string ascii2petscii( int a )
  {
    // for use in CHARACTER
    string retval = "#$";
    switch(a)
      {
	// special cases
      case ' ':
	retval += toHex(32);
	break;
      case '|':	
	retval += toHex(125);
	break;
      case '_':
	retval += toHex(175);
	break;	
      default:
	retval += toHex(a);
      }
    return retval;
  }

  void inlineFloatPush( string s, int addr=105)
  {
    addDebugComment( "FloatIMM -> Stack" );
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
	addAsm( str_LDA + "#$" + fp_in_hex[v] + fp_in_hex[v+1], 2, false );
	addAsm( str_PHA, 1, false );
	v+=2;
      }
    return;
  }

  void fAdd()
  {
    addAsm( str_JSR + "$B867" + commentmarker + "MEM + FAC -> FAC", 3, false );
    return;
  }

  void fAddT()
  {
    addAsm( str_JSR + "$B86A" + commentmarker + "ARG + FAC -> FAC", 3, false );
    return;
  }

  void fSub()
  {
    addAsm( str_JSR + "$B850" + commentmarker + "MEM - FAC -> FAC", 3, false );
  }

  void fSubT()
  {
    addAsm( str_JSR + "$B853" + commentmarker + "ARG - FAC -> FAC", 3, false );
  }
  
  void fMult()
  {
    addAsm( str_JSR + "$BA28" + commentmarker + "MEM * FAC -> FAC", 3, false );
  }

  void fMultT()
  {
    addAsm( str_JSR + "$BA2B" + commentmarker + "ARG * FAC -> FAC", 3, false );
  }

  void fDiv()
  {
    addAsm( str_JSR + "$BB0F" + commentmarker + "MEM / FAC -> FAC", 3, false );
  }

  void fDivT()
  {
    addAsm( str_JSR + "$BB12" + commentmarker + "ARG / FAC -> FAC", 3, false );
  }

  void fPwr()
  {
    addAsm( str_JSR + "$BF78" + commentmarker + "MEM ** FAC -> FAC", 3, false );
  }

  void fPwrT()
  {
    addAsm( str_JSR + "$BF7B" + commentmarker + "ARG ** FAC -> FAC", 3, false );
  }



  void pushFAC()
  {
    addComment( "FAC -> Stack" );
    addAsm( str_TSX, 1, false );
    addAsm( str_TXA, 1, false );
    addAsm( str_SEC, 1, false );
    addAsm( str_SBC + "#$06", 2, false );
    addAsm( str_TAX, 1, false );
    addAsm( str_TXS, 1, false );
    addAsm( str_INX, 1, false );
    //addAsm( str_TXA, 1, false );
    addAsm( str_LDY + "#$01", 2, false );
    addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
  }

  /* void pushARG() */
  /* { */
  /*   addComment( "ARG -> Stack" ); */
  /*   addAsm( str_TSX, 1, false ); */
  /*   addAsm( str_TXA, 1, false ); */
  /*   addAsm( str_SEC, 1, false ); */
  /*   addAsm( str_SBC + "#$06", 2, false ); */
  /*   addAsm( str_TAX, 1, false ); */
  /*   addAsm( str_TXS, 1, false ); */
  /*   addAsm( str_INX, 1, false ); */
  /*   //addAsm( str_TXA, 1, false ); */
  /*   addAsm( str_LDY + "#$01", 2, false ); */
  /*   addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false ); */
  /* } */

  void popFAC()
  {
    addComment( "Stack -> FAC" );
    addAsm( str_TSX, 1, false );	  
    addAsm( str_INX, 1, false );
    addAsm( str_TXA, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_TXS, 1, false );	  
    addAsm( str_LDY + "#$01", 2, false );
    addAsm( str_JSR + "$BBA2" + commentmarker + "STACK -> FAC", 3, false );
  }

  void unstack6()
  {
    addComment( "unstack 6 bytes" );
    addAsm( str_TSX, 1, false ); // 2	  
    addAsm( str_INX, 1, false ); // 2
    addAsm( str_TXA, 1, false ); // 2
    addAsm( str_INX, 1, false ); // 2
    addAsm( str_INX, 1, false ); // 2
    addAsm( str_INX, 1, false ); // 2
    addAsm( str_INX, 1, false ); // 2
    addAsm( str_INX, 1, false ); // 2
    addAsm( str_TXS, 1, false ); // 2
  }
  
  void popARG()
  {
    addComment( "Stack -> ARG" );
    addAsm( str_TSX, 1, false );	  
    addAsm( str_INX, 1, false );
    addAsm( str_TXA, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_INX, 1, false );
    addAsm( str_TXS, 1, false );	  
    addAsm( str_LDY + "#$01", 2, false );
    addAsm( str_JSR + "$BA8C" + commentmarker + "STACK -> ARG (+)", 3, false );
  }

  // convert a string to an inline-float
  //  void inlineFloat( string s, int addr=105)
  void inlineFloat( string s, int addr=25)
  {
    addComment( "inline float: " + stripFirst(s) );
    string sign;
    string stripped_float= stripFirst( s.c_str() );
    string fp_in_hex = toBinaryFloat( atof( stripped_float.c_str() ) );
    if( atof( stripped_float.c_str() ) == 0 ) fp_in_hex=string("0000000000");
    int size_of_instruction=3;
    if( addr < 255 ) size_of_instruction-=1;
    int v=0;
    for( int i=0; i<5; i++ )
      {
	if( addr <= 255 )
	  { size_of_instruction = 2; }
	else
	  { size_of_instruction = 3; }
	addAsm( str_LDA + "#$" + fp_in_hex[v] + fp_in_hex[v+1], 2, false );
	
	if( getNameOf(addr) != ""  )
	  {
	    if( i == 0 )
	      {
		addAsm( str_STA + getNameOf(addr), size_of_instruction, false );
	      }
	    else
	      {
		addAsm( str_STA + getNameOf(addr) + "+" + itos(i), size_of_instruction, false );
	      }
	  }
	else
	  {
	    addAsm( str_STA + "$" + toHex(addr+i), size_of_instruction, false );
	  }
	v+=2;
      }

    if( addr == 105 )
      {
	addAsm( str_LDA + "#$69" + commentmarker + "OPTIMIZE?", 2, false );
	addAsm( str_LDY + "#$00", 2, false );
	addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false );
      }
    else if( addr == 25 )
      {
	addAsm( str_LDA + "#$19" + commentmarker + "OPTIMIZE?", 2, false );
	addAsm( str_LDY + "#$00", 2, false );
	addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false );
      }
    return;
  }

  class id_and_line
  {
  public:
    id_and_line( string s, int l )
      {
	name = s;
	line_number = l;
      }
    string getName(){ return name; };
    int getLine(){ return line_number; };
  private:
    string name;
    int line_number;
  };

  vector<id_and_line*> id_vector;

  vector <id_and_line*> proposed_ids_vector;
  vector <id_and_line*> defined_ids_vector;

  
  class asm_function
  {
  public:
    asm_function( string identifier, string l, int t )
      {
	name=identifier;
	label = l;
	address=0000;
	type=t;
      }
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

  int getTypeOfFunction( string s )
  {
    for( int i=0; i<asm_functions.size(); i++ )
      {
	if( asm_functions[i]->getIdentifier() == s )
	  {
	    return asm_functions[i]->getType();
	  }
      }
    return 0;
  }

  void addIncludeFile( string s )
  {
    include_file_vector.push_back( s );
  }


  // 

  void addFunction( string s, string l )
  {
    asm_function * ptr_function = new asm_function( s, l );
    asm_functions.push_back( ptr_function );

  }

  void addFunction( string s, string l, int t )
  {
    asm_function * ptr_function = new asm_function( s, l, t);
    asm_functions.push_back( ptr_function );
  }


  class asm_data
  {
  public:
    asm_data( string value, int i=0)
      {
	text=value;
	size=i;
      }
    friend ostream &operator << (ostream &out, const asm_data &a); 
    string getText(){ return text; };

    void setSize( int s ){ size = s; };
    int getSize(){ return size; };

    string getString(){ return text; };
    void setString( string s ){ text=s; };

    void setAddress( int i ){ address = i; };
    int getAddress(){ return address; };

  private:
    string text;
    int size;
    int address;
  };

  vector<asm_data*> asm_datum;

  void addData( string identifier, int i=0 )
  {
    asm_data * new_asm_data = new asm_data( identifier, i );
    asm_datum.push_back( new_asm_data ); // add the data to the list of other data
  }

  ostream & operator << (ostream &out, const asm_data &a) 
    {
      out << a.text << commentmarker << "$" << std::hex << a.address << endl;
      return out;
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
      out << commentmarker << "; $" << std::hex << a.address << "\t\t\t\"" << a.text << "\"" << endl;
      out << a.name << ":\n\t" << str_BYTE << " ";
      for( int i = 0; i<a.text.size(); i++ )
	{
	  if( a.text[i] == '\\' && a.text[i+1] == 'n')
	    {
	      out << "$0D, ";
	      i++;
	    }
	  else
	    {
	      out << "$" << toHex((int)a.text[i]) << ", ";
	    }
	 
	}
      out << "$00" << endl;
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
	case 32:
	  return string( "string" );
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

  bool isA( string s )
  {
    bool return_value = false;
    if( s == string("_A")) return_value = true;
    return return_value;
  }

  bool isXA( string s )
  {
    bool return_value = false;
    if( s == string("_XA")) return_value = true;
    return return_value;
  }

  bool isARG( string s )
  {
    bool return_value = false;
    if( s == string("_ARG")) return_value = true;
    return return_value;
  }
  bool isFAC( string s )
  {
    bool return_value = false;
    if( s == string("_FAC")) return_value = true;
    return return_value;
  }
  bool isMOB( string s )
  {
    bool return_value = false;
    if( s == string("_MOB")) return_value = true;
    return return_value;
  }

  bool isRET( string s )
  {
    bool return_value = false;
    if( s == string("RET")) return_value = true;
    return return_value;
  }

  bool isNULL( string s )
  {
    bool return_value = false;
    if( s == string("NULL")) return_value = true;
    return return_value;
  }
  bool isUintID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 0 ) return_value = true;
    return return_value;
  }

  bool isIntID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 1 ) return_value = true;
    return return_value;
  }

  bool isWordID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 2 ) return_value = true;
    return return_value;
  }

  bool isDoubleID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 4 ) return_value = true;
    return return_value;
  }

  bool isFloatID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 8 ) return_value = true;
    return return_value;
  }

  bool isMobID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 16 ) return_value = true;
    return return_value;
  }

  bool isStringID( string s )
  {
    bool return_value = false;
    if( getTypeOf( s ) == 32 ) return_value = true;
    return return_value;
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

    void setcommentmarker( bool b )
    {
      if( b ) mycommentmarker = " // ";
      if( !b ) mycommentmarker = " ; ";
    };
  private:
    string mycommentmarker;
    string text;
    int memory_address;
    bool b_label;
    int size; // how many bytes the code takes up on the 6502
    bool has_label;
    int cycles; // how many cycles the instruction uses
  };

  ostream & operator << (ostream &out, const asm_instruction &a) 
    {
      if( !a.b_label )
	{
	  out << "\t" << a.text; // the instructions
	  if( arg_memory_locations ) out << a.mycommentmarker << "$" << toHex(a.memory_address);
	  if( arg_show_cycles ) out << commentmarker << " (" << a.cycles << ")";
	}
      else
	{
	  out << a.text;
	}
      out << endl;
      return out;
    }
  
  vector<asm_instruction*> asm_instr;
  stack<asm_instruction*> iterator_stack;
  
  void addByte( string s, int instruction_size=1, bool l = false)
  {
    //int a = asm_datum[asm_datum.size()-1]->getSize();
    //asm_datum[asm_datum.size()-1]->setSize( a + instruction_size );
    asm_datum[asm_datum.size()-1]->setSize(asm_datum[asm_datum.size()-1]->getSize()+instruction_size);
    asm_datum[asm_datum.size()-1]->setString(asm_datum[asm_datum.size()-1]->getString() + s);
    //cerr << "adding byte to data: " << s << " (" << asm_datum[asm_datum.size()-1]->getSize() << ")" << endl;
    return;
  }

  
  void addAsm( string s, int instruction_size, bool l = false)
  {
    asm_instruction * my_asm = new asm_instruction( s );
    my_asm->setLabel(l);
    my_asm->setSize(instruction_size);
    byte_count+= instruction_size;
    my_asm->setAddress( 0 ); 
    asm_instr.push_back( my_asm );
    return;
  }

  void insAsm( int index, string s, int instruction_size, bool l = false)
  {
    asm_instruction * my_asm = new asm_instruction( s );
    my_asm->setLabel(l);
    my_asm->setSize(instruction_size);
    byte_count+= instruction_size;
    my_asm->setAddress( 0 ); 
    asm_instr.insert( asm_instr.begin() + index, my_asm );
    return;
  }


  
  void addParserComment( string s )
  {
    if( arg_parser_comments ) addAsm( stripFirst(commentmarker.c_str()) + s, 0, true );
    return;
  }
  
  void addDebugComment( string s )
  {
    if( arg_debug_comments ) addAsm( stripFirst(commentmarker.c_str()) + s, 0, true );
    return;
  }

  void addComment( string s )
  {
    if( !arg_asm_comments ) return;
    if( kick )
      {
	addAsm( string("// ") + s, 0, true );
      }
    else
      {
	addAsm( string("; ") + s, 0, true );
      }
    //if( arg_asm_comments ) addAsm( commentmarker + s, 0, true );
    return;
  }

  void addCommentSection( string s )
  {
    addComment( "=========================================================");
    addComment( string("                        ") + s  );
    addComment( "=========================================================");
    return;
  }

  void addCommentBreak(int i=1)
  {
    if( i==1 )
      {
	addComment( "---------------------------------------------------------");
      }
    else
      {
	addComment( "=========================================================");
      }
    return;
  }

  bool addAsmVariable( string id, int t )
  {
    bool return_value = false;
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
      case 32:
	s = string( "string" );
	break;
      default:
	s = string( "unknown_type" );	    
      }	   

    // first, make sure that it isn't already in there.
    for( int i=0; i<asm_variables.size(); i++ )
      {
	if( asm_variables[i]->getIdentifier() == id )
	  {
	    addCompilerMessage( string( "You cannot re-declare variables: ") + id, 3 );
	  }
      }
    if( t == 0 || t == 1 || t == 2 || t == 4 || t == 8 )
      {
	addDebugComment( string( "Adding: " ) + string(id) + string(" of type: ") + s  );
	asm_variable * new_asm_variable = new asm_variable( id, t );
	asm_variables.push_back( new_asm_variable ); // add the variable to the list of variables
	return_value = true;
      }
    else
      {
	addDebugComment( string( "NOT Adding: " ) + string(id) + string(" of type: ") + s  );
      }
    return return_value;
  }

  bool previousAsm( string s )
  {
    int i=asm_instr.size()-1;
    
    while( asm_instr[ i ]->getString().c_str()[0] == ';' )
      {
	i--;
      }
    if( asm_instr[ i ]->getString() == s ) return true;
    return false;
  }

  void deletePreviousAsm()
  {
    // removes the most recent line of code
    if(debug_flag_is_on)
      {
	string s = string("deleting " + asm_instr[asm_instr.size()-1]->getString() );
	addCompilerMessage( s, 0 );
      }
    byte_count -= asm_instr[asm_instr.size()-1]->getSize();
    asm_instr.erase( asm_instr.end()-1 );
    return;
  }

  void deletePreviousAsmUntil( string s )
  {
    //removes most recent lines of code until "s" is found
    string deletedinst = "";
    while( !cmpstr(deletedinst,s) )
      {
	if(debug_flag_is_on)
	  {
	    string s = string("deleting " + asm_instr[asm_instr.size()-1]->getString() );
	    addCompilerMessage( s, 0 );
	  }
	byte_count -= asm_instr[asm_instr.size()-1]->getSize();
	asm_instr.erase( asm_instr.end()-1 );
	deletedinst =  asm_instr[asm_instr.size()-1]->getString();
      }
    byte_count -= asm_instr[asm_instr.size()-1]->getSize();
    asm_instr.erase( asm_instr.end()-1 );
    return;
 }

  void NodeTable()
  {
    cerr << "NODES" << endl;
    for( int i=0; i<node_vector.size(); i++ )
      {
	cerr << node_vector[i] << endl;
      }
    return;
  }

  void ProcessComments()
  {
    for( int i = 0; i < asm_instr.size(); i++ )
      {
	asm_instr[i]->setcommentmarker(kick);
      }
    return;
  }

  void SymbolTable()
  {
    cerr << "SYMBOLS: " << endl;
    cerr << "\tFunctions" << endl;
    for( int i=0; i<asm_functions.size(); i++ )
      {
	cerr << "\t\t" << asm_functions[i]->getIdentifier() << " : " << asm_functions[i]->getLabel() << " : " <<  asm_functions[i]->getAddress() << asm_functions[i]->getType() << endl;
      }
    cerr << "\tVariables" << endl;
    for( int i=0; i<asm_variables.size(); i++ )
      {
	cerr << "\t\t$" <<  asm_variables[i]->getAddress() << " : "  << asm_variables[i]->getIdentifier() << " : " << asm_variables[i]->getPrintableType() << endl;
	// this gets added directly to the output file!
	if( asm_variables[i]->getIdentifier().c_str()[0] != '_' ) cout << commentmarker << asm_variables[i]->getPrintableType() << " : " << asm_variables[i]->getIdentifier() << " : $" << asm_variables[i]->getAddress() << " (" << asm_variables[i]->getAddressAsInt() << ")" << endl;
      }
    cerr << "\tStrings" << endl;
    for( int i=0; i<asm_strings.size(); i++ )
      {
	cerr << "\t\t$" << asm_strings[i]->getAddress() << " : \"" << asm_strings[i]->getText() << "\"" <<  endl;
      }
    return;
  }

  void ProcessVariables()
  {
    cout << commentmarker << " Variable Labels" << endl;
    for( int i=0; i<asm_variables.size(); i++ )
      {
	// TODO: This is a hack. mkpellegrino 2023 05 22
	// it only outputs the label if it is < 8 characters long

	if( kick )
	  {
	    cout << ".label " << asm_variables[i]->getIdentifier() << " = $" << asm_variables[i]->getAddress() << endl;
	  }
	else if( asm_variables[i]->getIdentifier().length() <= 8 )
	  {
	    cout << asm_variables[i]->getIdentifier() << " = $" << asm_variables[i]->getAddress() << endl;
	  }
	else
	  {
	    cerr << "         Label Name > 8 characters: [" << asm_variables[i]->getIdentifier() << "]" << endl << endl 
		 << "* * *            Unfortunately, this error is quite fatal.                 * * *" << endl
		 << " * *   Try using the --kick option and assembling with the Kick Assembler   * *"  << endl;
	    //exit(-1);
	  }
      }
    return;
  }

  void Optimize()
  {
    addCompilerMessage( "*** *** OPTIMIZATION PHASE *** ***", 0 );
    string plp = string("plp");
    string pla = string("pla");
    string sta03 = string("sta $03");
    string sta02 = string("sta $02");
    string lda02 = string("lda $02");
    string ldaZero = string( "lda #$00" );
    string ldxZero = string( "ldx #$00" );
    string ldyZero = string( "ldy #$00" );
    string pha = string("pha");
    string lda03 = string("lda $03");
    string php = string("php");    
    string clc = string("clc");
    string sec = string("sec");
    string sta = string("sta");
    string jmp = string("jmp");
    string rts = string("rts");
    string sei = string("sei");
    string cli = string("cli");
    string tay = string("tay");
    string tax = string("tax");
    string txa = string("txa");
    string tya = string("tya");
    string lbl = string("LBL");
    string sand = string("and");
    
    string cmt = string("// ");

      for( int i=0; i<asm_instr.size(); i++ )
	{
	  if( cmpstr( asm_instr[i]->getString(), string( "// MARKED_FOR_DELETION") ) )
	    {
	      asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    }
	}
    
    for( int i=0; i<asm_instr.size()-1; i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), txa ) &&
	    cmpstr( asm_instr[i+1]->getString(), sand ) )
	  {
	    addCompilerMessage( "found txa, and.  replace txa, and IMM with xaa IMM for more efficiency.", 0);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if(
	   cmpstr( asm_instr[i]->getString(), plp ) &&
	   cmpstr( asm_instr[i+1]->getString(), php) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing PLP-PHP", i);
	  }
	
	if(
	   cmpstr( asm_instr[i]->getString(), string("// Restore status register") ) &&
	   cmpstr( asm_instr[i+1]->getString(), plp ) &&
	   cmpstr( asm_instr[i+2]->getString(), string("// Preserve Status Register") ) &&
	   cmpstr( asm_instr[i+3]->getString(), php) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+4);
	    addOptimizationMessage( "removing PLP-PHP", i);

	  }
	// POP-PUSH removal (IFIF)
	if(
	   cmpstr( asm_instr[i]->getString(), plp ) &&
	   cmpstr( asm_instr[i+1]->getString(), pla ) &&
	   cmpstr( asm_instr[i+2]->getString(), sta03 ) &&
	   cmpstr( asm_instr[i+3]->getString(), pla ) &&
	   cmpstr( asm_instr[i+4]->getString(), sta02 ) &&
	   cmpstr( asm_instr[i+5]->getString(), lda02 ) &&
	   cmpstr( asm_instr[i+6]->getString(), pha ) &&
	   cmpstr( asm_instr[i+7]->getString(), lda03 ) &&
	   cmpstr( asm_instr[i+8]->getString(), pha ) &&
	   cmpstr( asm_instr[i+9]->getString(), php )
	   )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+10);
	    addOptimizationMessage( "removing POP-PUSH IFIF", i);
	  }
      }


    for( int i=0; i<asm_instr.size()-1; i++ )
      {	
	if( cmpstr( asm_instr[i]->getString(), cmt ) &&
	    cmpstr( asm_instr[i+1]->getString(), pha ) &&
	    cmpstr( asm_instr[i+2]->getString(), txa ) &&
	    cmpstr( asm_instr[i+3]->getString(), pha ) &&
	    cmpstr( asm_instr[i+4]->getString(), cmt ) &&
	    cmpstr( asm_instr[i+5]->getString(), pla ) &&
	    cmpstr( asm_instr[i+6]->getString(), tax ) &&
	    cmpstr( asm_instr[i+7]->getString(), pla ) && 
	    cmpstr( asm_instr[i+8]->getString(), cmt ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+9);
	    addOptimizationMessage( "removing lack of ?? math FAC artifact (2a)", i);
	  }
      }

    for( int i=0; i<asm_instr.size()-1; i++ )
      {	
	if( cmpstr( asm_instr[i]->getString(), cmt ) &&
	    cmpstr( asm_instr[i+1]->getString(), pha ) &&
	    cmpstr( asm_instr[i+2]->getString(), cmt ) &&
	    cmpstr( asm_instr[i+3]->getString(), pla ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+4);
	    addOptimizationMessage( "removing lack of ?? math FAC artifact (2b)", i);
	  }
      }

    
    for( int i=0; i<asm_instr.size()-1; i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), ldaZero ) &&
	    cmpstr( asm_instr[i+1]->getString(), ldxZero ) )
	  {

	    //asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);

	    //asm_instr[i]->setString( "lax #$00" );
	    //asm_instr[i+1]->setString( str_TAX );
	    //asm_instr[i]->setSize( 2 );
	    
	    //addOptimizationMessage( "replacing LDA #$00, LDX #$00 with LAX #$00", i);
	  }
      }

    for( int i=0; i<asm_instr.size()-1; i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), ldaZero ) &&
	    cmpstr( asm_instr[i+1]->getString(), ldyZero ) )
	  {
	    asm_instr[i+1]->setString( str_TAY );
	    asm_instr[i+1]->setSize( 1 );
		
	    addOptimizationMessage( "replacing LDX #$00 with TAY", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), jmp ) &&
	    cmpstr( asm_instr[i+1]->getString(), lbl ) &&
	    cmpstr( asm_instr[i+2]->getString(), lbl ) )
	  {
	    // it's a jmp-lbl-lbl
	    // todo: now we need to check to make sure that the jump is to one of the
	    // two labels
	    // split the jmp line by spaces
	    // split the lbl lines by colons
	    // compare
	    //asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    //addOptimizationMessage( "removing unnecessary JMP (keeping the labels)", i);
	  }
      }

    // clc lbl clc
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), clc ) &&
	    cmpstr( asm_instr[i+1]->getString(), lbl ) &&
	    cmpstr( asm_instr[i+2]->getString(), clc ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "removing doubled up CLC's (split by label)", i);

	  }
      }

    // clc lbl sec
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), clc ) &&
	    cmpstr( asm_instr[i+1]->getString(), lbl ) &&
	    cmpstr( asm_instr[i+2]->getString(), sec ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "removing CLC paired with SEC (split by label)", i);

	  }
      }

    for( int i=0; i<asm_instr.size()-2; i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), rts ) &&
	    cmpstr( asm_instr[i+1]->getString(), cmt ) &&
	    cmpstr( asm_instr[i+2]->getString(), rts ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "removing double rts' (split by comment)", i);

	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), clc ) &&
	    cmpstr( asm_instr[i+1]->getString(), sec ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "removing CLC paired with SEC (removing clc)", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), sec ) &&
	    cmpstr( asm_instr[i+1]->getString(), clc ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "removing CLC paired with SEC (removing sec)", i);
	  }
      }
    
    
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), jmp ) &&
	    cmpstr( asm_instr[i+1]->getString(), rts ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i+1,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing jump return (jump remains)", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), cli ) &&
	    cmpstr( asm_instr[i+1]->getString(), sei ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addComment( "(OPTIMIZE)" );
	    addOptimizationMessage( "clisei (cli removed))", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), tay ) &&
	    cmpstr( asm_instr[i+1]->getString(), tya ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i+1,asm_instr.begin()+i+2);
	    addOptimizationMessage( "tay-tya (tya removed))", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), tya ) &&
	    cmpstr( asm_instr[i+1]->getString(), tay ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i+1,asm_instr.begin()+i+2);
	    addOptimizationMessage( "tya-tay (tay removed))", i);
	  }
      }

    
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), sei ) &&
	    cmpstr( asm_instr[i+1]->getString(), cli ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "seicli (sei removed))", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), pla ) &&
	    cmpstr( asm_instr[i+1]->getString(), pha ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing pop pushes", i);
	  }
      }
    
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), string("pla") ) &&
	    cmpstr( asm_instr[i+1]->getString(), string("pha") ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing pop pushes", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), pha ) &&
	    cmpstr( asm_instr[i+1]->getString(), pla ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing push pops" , i);
	  }
      }
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), sta02 ) &&
	    cmpstr( asm_instr[i+1]->getString(), lda02 ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing sta02-lda02's", i);
	  }
      }
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), sta03 ) &&
	    cmpstr( asm_instr[i+1]->getString(), lda03 ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing sta03-lda03's", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), clc ) &&
	    cmpstr( asm_instr[i+1]->getString(), clc ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing doubled up CLC's", i);
	  }
      }

    // lda #$00, sta, lda#$00
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if(
	   cmpstr( asm_instr[i]->getString(), ldaZero ) &&
	   cmpstr( asm_instr[i+1]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+2]->getString(), ldaZero )
	   )
	  {
	    addOptimizationMessage( "removing redundant lda #$00", i);
	    asm_instr.erase(asm_instr.begin()+i+2,asm_instr.begin()+i+3);
	  }
      }
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if(
	   cmpstr( asm_instr[i]->getString(), ldaZero ) &&
	   cmpstr( asm_instr[i+1]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+2]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+3]->getString(), ldaZero )
	   )
	  {
	    addOptimizationMessage( "removing redundant lda #$00 (2)", i);
	    asm_instr.erase(asm_instr.begin()+i+3,asm_instr.begin()+i+4);
	  }
      }
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if(
	   cmpstr( asm_instr[i]->getString(), ldaZero ) &&
	   cmpstr( asm_instr[i+1]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+2]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+3]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+4]->getString(), ldaZero )
	   )
	  {
	    addOptimizationMessage( "removing redundant lda #$00 (3)", i);
	    asm_instr.erase(asm_instr.begin()+i+4,asm_instr.begin()+i+5);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if(
	   cmpstr( asm_instr[i]->getString(), ldaZero ) &&
	   cmpstr( asm_instr[i+1]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+2]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+3]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+4]->getString().substr(0,3), string("sta") ) &&
	   cmpstr( asm_instr[i+5]->getString(), ldaZero )
	   )
	  {
	    addOptimizationMessage( "removing redundant lda #$00 (4)", i);
	    asm_instr.erase(asm_instr.begin()+i+5,asm_instr.begin()+i+6);
	  }
      }

    
    // round 2
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), string("pla") ) &&
	    cmpstr( asm_instr[i+1]->getString(), string("pha") ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing pop pushes (round 2)", i);
	  }
      }
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), string("pha") ) &&
	    cmpstr( asm_instr[i+1]->getString(), string("pla") ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addOptimizationMessage( "removing pop pushes (round 2)", i);
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	// unnecessary stack manipulations
	if(
	   cmpstr( asm_instr[i+0]->getString(), pla ) &&
	   cmpstr( asm_instr[i+1]->getString(), tax ) &&
	   cmpstr( asm_instr[i+2]->getString(), pla ) &&
	   cmpstr( asm_instr[i+3]->getString(), tay ) &&
	   cmpstr( asm_instr[i+4]->getString(), pha ) &&
	   cmpstr( asm_instr[i+5]->getString(), txa ) &&
	   cmpstr( asm_instr[i+6]->getString(), pha )
	   )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+7);
	    addOptimizationMessage( "removing Unecesary Stack Manipulations", i);
	  }
      }


    return;
  }

  /* void ProcessIncludes() */
  /* { */
  /*   // add all the text from the include file to */
  /*   // the end of the source code */
  /*   for( int i = 0; i < include_file_vector.size(); i++ ) */
  /*     { */
  /* 	cerr << include_file_vector[i] << endl; */

  /* 	yyin = fopen( include_file_vector[i].c_str(), "r" ); */
  /* 	yyinput(); */
  /* 	//yyparse(); */
  /* 	YY_NEW_FILE; */
  /* 	fclose(yyin);	 */
  /*     } */

  /* } */




  void ProcessReturnTypes()
  {
    cerr << commentmarker << " Processing Return Types" << endl;
    for( int i=0; i<asm_instr.size()-1; i++ )
      {
	string loc = asm_instr[i]->getString();
	string left = loc.substr(0,8);
	if( left == "#RETURN ")
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addOptimizationMessage( "inserting return type", i);

	    int ty = 0;
	    string function_to_lookup = loc.substr(8,loc.length()-1);
	    for( int j=0; j<asm_functions.size(); j++ )
	      {
		int function_type = asm_functions[j]->getType();
		if( cmpstr(asm_functions[j]->getIdentifier(),function_to_lookup) )
		{
		  switch( function_type )
		    {
		    case 0:
		      // uint
		      insAsm( i, str_PLA, 1, false );
		      break;
		    case 1:
		      // int
		      insAsm( i, str_PLA, 1, false );
		      break;
		    case 2:
		      // word
		      insAsm( i, str_PLA, 1, false );
		      insAsm( i+1, str_TAX, 1, false );
		      insAsm( i+2, str_PLA, 1, false );
		      
		      break;
		    case 4:
		      // double
		      break;
		    case 8:
		      // float
		      insAsm( i, str_TSX, 1, false );
		      insAsm( i+1, str_INX, 1, false );
		      insAsm( i+2, str_TXA, 1, false );
		      insAsm( i+3, str_INX, 1, false );
		      insAsm( i+4, str_INX, 1, false );
		      insAsm( i+5, str_INX, 1, false );
		      insAsm( i+6, str_INX, 1, false );
		      insAsm( i+7, str_INX, 1, false );
		      insAsm( i+8, str_TXS, 1, false );
		      insAsm( i+9, str_LDY + "#$01", 2, false );
		      insAsm( i+10, str_JSR + "$BBA2" + commentmarker + "STACK -> FAC", 3, false );
		      break;
		    case 16:
		      // mob (deprecated)
		      break;
		    case 32:
		      // string
		      break;
		    case 64:
		      break;
		    case 128:
		      break;
		    default:

		    }
		}
	      }
	  }
      }
  }
  
  void ProcessFunctions()
  {
    
    // delete fuunctions that are both called and defined
    bool a_function_has_been_removed=false;
    for( int i = 0; i < defined_ids_vector.size(); i++ )
      {
	string name = defined_ids_vector[i]->getName();
	
	for( int j = 0; j < proposed_ids_vector.size(); j++ )
	  {
	    if( name == proposed_ids_vector[j]->getName() )
	      {
		proposed_ids_vector.erase(proposed_ids_vector.begin() + j);
		a_function_has_been_removed = true;
		j--;
	      }
	  }

	// if all of the instances of a particular defined function have been removed then
	// remove it from the 'defined' vector... in the end the only functions that
	// will remain are unused functions.
	if( a_function_has_been_removed )
	  {
	    defined_ids_vector.erase(defined_ids_vector.begin() + i);
	    a_function_has_been_removed = false;
	    i--;
	  }
      }
    
    for( int j=0; j<proposed_ids_vector.size(); j++ )
      {
	cerr << "*** ERROR: Undefined Function: " <<  proposed_ids_vector[j]->getName() << " on line " <<  proposed_ids_vector[j]->getLine() << " ***" << endl;
      }

    for( int j=0; j<defined_ids_vector.size(); j++ )
      {
	cerr << "*** Warning: Unused Function: " <<  defined_ids_vector[j]->getName() << " on line " <<  defined_ids_vector[j]->getLine() << " ***" << endl;
      }
    
    
    for( int j=0; j<asm_functions.size(); j++ )
      {
	string current_function = asm_functions[j]->getIdentifier();
	string current_label = asm_functions[j]->getLabel();

	// remove the colon from the end of each label
	current_label.erase( current_label.length()-1, 1 );

	for( int i=0; i<asm_instr.size(); i++ )
	  {
	    // Line of Code
	    string current_LOC = asm_instr[i]->getString();

	    // find the string that is to be replaces
	    std::size_t found = current_LOC.find(string( "###" ) + current_function);

	    // if it IS found
	    if( current_LOC == string( "###" ) + current_function )
	      {
		current_LOC.replace( current_LOC.find(string("###")+current_function), (string( "###" ) + current_function).length(), str_JSR + current_label + commentmarker + current_function + "()" );
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
    //current_code_location
    for( int i=0; i<asm_strings.size(); i++ )
      {
	// this puts the strings all after the code segemnt and other built-in functions like the printf function.
	asm_strings[i]->setAddress( current_code_location );
	current_code_location+=asm_strings[i]->getLength()+1; // the +1 is for the null terminated zero
      }

    
    for( int i=0; i<asm_datum.size(); i++ )
      {
	// this puts the strings all after the code segemnt and other built-in functions like the printf function.
	asm_datum[i]->setAddress( current_code_location );
	current_code_location+=asm_datum[i]->getSize();
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
	if (found!=std::string::npos)
	  {
	    id = tmp_string.substr(0, found );
	    bytes = tmp_string.substr( found, tmp_string.length() );
	  }
	int j = getIndexOf( id.c_str() );
	addAsm( string("MOBLBL")+id+string(":"), 0, true );	
	addAsm( bytes, 63, false);
      }
  }

  void addAsm( string s,  bool l = false)
  {
    asm_instruction * my_asm = new asm_instruction( s );
    my_asm->setLabel(l);
    my_asm->setSize(0);
    if(
       (s == str_ASL) ||
       (s == str_BRK ) ||
       (s == str_CLC ) ||
       (s == str_CLD ) ||
       (s == str_CLI ) ||
       (s == str_CLV ) ||
       (s == str_DEX ) ||
       (s == str_DEY ) ||
       (s == str_INX ) ||
       (s == str_INY ) ||
       (s == str_LSR ) ||
       (s == str_NOP ) ||
       (s == str_PHA ) ||
       (s == str_PHP ) ||
       (s == str_PLA ) ||
       (s == str_PLP ) ||
       (s == str_ROL ) ||
       (s == str_ROR ) ||
       (s == str_RTI ) ||
       (s == str_RTS ) ||
       (s == str_SEC ) ||
       (s == str_SED ) ||
       (s == str_SEI ) ||
       (s == str_TAX ) ||
       (s == str_TAY ) ||
       (s == str_TSX ) ||
       (s == str_TXA ) ||
       (s == str_TXS ) ||
       (s == str_TYA ) )
      {
	my_asm->setSize(1);
      }
    else if (( s.substr(0,3) == str_BCC ) ||
	     ( s.substr(0,3) == str_BCS ) ||
	     ( s.substr(0,3) == str_BEQ ) )
      {
	my_asm->setSize(2);
      }
    asm_instr.push_back( my_asm );
    return;
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

  void preserveFBetc()
  {
    addComment( "vvv Preserve $FB-$FE vvv" );
    addAsm( str_LDA + "$FB", 2, false);
    addAsm( str_PHA );
    addAsm( str_LDA + "$FC", 2, false );
    addAsm( str_PHA );
    addAsm( str_LDA + "$FD", 2, false );
    addAsm( str_PHA );
    addAsm( str_LDA + "$FE", 2, false );
    addAsm( str_PHA );
    addComment( "^^^^^^^^^^^^^^^^^^^^^^^^" );



    return;
  }

  void restoreFBetc()
  {

    addComment( "vvv Restore $FB/$FE vvv" );

    addAsm( str_PLA );
    addAsm( str_STA + "$FE", 2, false );
    addAsm( str_PLA );
    addAsm( str_STA + "$FD", 2, false );
    addAsm( str_PLA );
    addAsm( str_STA + "$FC", 2, false );
    addAsm( str_PLA );
    addAsm( str_STA + "$FB", 2, false );
    addComment( "^^^^^^^^^^^^^^^^^^^^^^^" );

    return;
  }
  
  void preserve0203()
  {
    addComment( "vvv Preserve $02/$03 vvv" );
    addAsm( str_LDA + "$02", 2, false);
    addAsm( str_PHA );
    addAsm( str_LDA + "$03", 2, false );
    addAsm( str_PHA );
    addComment( "^^^^^^^^^^^^^^^^^^^^^^^^" );

    return;
  }

  void restore0203()
  {
    addComment( "vvv Restore $02/$03 vvv" );

    addAsm( str_PLA );
    addAsm( str_STA + "$03", 2, false );
    addAsm( str_PLA );
    addAsm( str_STA + "$02", 2, false );
    addComment( "^^^^^^^^^^^^^^^^^^^^^^^" );

    return;
  }
  
  void saveReturnAddress()
  {
    stack_is_needed = true;
    addAsm( str_PLA );
    addAsm( str_JSR + string("PUSH"), 3, false);
    addAsm( str_PLA );
    addAsm( str_JSR + string("PUSH"), 3, false);
    return;
  }

  void restoreReturnAddress()
  {
    stack_is_needed = true;
    addAsm( str_JSR + string("POP"), 3, false );
    addAsm( str_PHA );
    addAsm( str_JSR + string("POP"), 3, false );
    addAsm( str_PHA );
    return;
  }
  
  void compareFloatVsFloat( string OP1, string OP2 )
  {
    addCommentSection( "FLOAT IMM vs. FLOAT MEM" );
    addDebugComment(  OP1 + string( " rwlop " ) + OP2 );
    // FP Operations
    inlineFloat( OP1, 105);
    current_variable_base_address = getAddressOf( OP2 );
    //addAsm( str_LDA+"#$"+ toHex( get_word_L( current_variable_base_address )), 2, false );
    addAsm( str_LDA + "#<" + getNameOf(getAddressOf(OP2)), 2, false );

    //addAsm( str_LDY+"#$"+toHex( get_word_H( current_variable_base_address )), 2, false );
    addAsm( str_LDY + "#>" + getNameOf(getAddressOf(OP2)), 2, false );

    addAsm( str_JSR+ "$BBA2" +commentmarker+"RAM -> FAC", 3, false );
    addAsm( str_LDA+ "#$69", 2, false );
    addAsm( str_LDY+ "#$00", 2, false );
    addAsm( str_JSR+ "$BC5B" +commentmarker+"CMP(FAC, RAM)", 3, false );
    addAsm( str_PHA );
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
%token <nd_obj> CHAR tFCLOSE tFOPEN tFCLRCHN tFCHROUT tFCHRIN tFREADST tFCHKOUT tFCHKIN tSETLFS tSETNAM tSAVE tLOAD tIMPORT tSPRPTR tPUSH tPOP tCOMMENT tDATA tBANK tPLUSPLUS tMINUSMINUS tSPRITECOLLISION tGETIN tGETCHAR tSPRITEXY tSPRITEX tSPRITEY tSPRITECOLOUR tSPRITEON tWORD tBYTE tDOUBLE tUINT tPOINTER tLN tSIN tCOS tTAN tMOB tSIDIRQ tSIDOFF tSTRTOFLOAT tSTRTOWORD tTOFLOAT tINTTOWORD tTOUINT tTOWORD tTOBIT tDEC tINC tROL tROR tLSR tGETBANK tGETBMP tGETSCR tGETADDR tGETXY tPLOT tJUMP tSETSCR tJSR tIRQ tROMOUT tROMIN tLDA tASL tSPRITESET  tSPRITEOFF tSPRITETOGGLE tRND tXXX tINLINE tJMP tCURSORXY tNOP tCLS tBYTE2HEX tTWOS tPEEK tPOKE NEWLINE CHARACTER tPRINTS PRINTFF SCANFF INT FLOAT WHILE FOR IF ELSE TRUE FALSE NUMBER HEX_NUM FLOAT_NUM ID LE GE EQ NE GT LT tbwNOT tbwAND tbwOR tAND tOR STR ADD SUBTRACT MULTIPLY DIVIDE EXPONENT tSQRT UNARY INCLUDE RETURN tMOBBKGCOLLISION tGETH tGETL tSCREEN tNULL tMEMCPY tSEED tNEEDS tPI tE
%type <nd_obj> headers main body return function datatype statement arithmetic relop program else 
   %type <nd_obj2> init value expression /*charlist*/ numberlist parameterlist argumentlist
      %type <nd_obj3> condition

      %%

      program: headers main '(' ')' '{' body return '}' function {};



headers: 
| /* empty */
| INCLUDE STR
{
  string tmp_str = stripQuotes($2.name);
  addCompilerMessage( string( "including: " ) + $2.name, 0 );
  addIncludeFile( tmp_str );   
}
| tNEEDS '('  STR  ')' ';'
{
  bool correct_usage = false;
  string s =  stripQuotes($3.name);
  if( s == "stack" )
    {
      stack_is_needed = true;
      correct_usage = true;
    }

  if( s == "bin2bit" )
    {
      bin2bit_is_needed = true;
      correct_usage = true;
    }
  if( s == "word2dec" )
    {
      word2dec_is_needed = true;
      correct_usage = true;
    }
  if( s == "plot" )
    {
      plot_is_needed = true;
      correct_usage = true;
    }
  if( s == "mcplot" )
    {
      multicolour_plot_is_needed = true;
      correct_usage = true;
    }
  if( s == "getplot" )
    {
      getplot_is_needed = true;
      correct_usage = true;
    }
  if( s == "modulus" )
    {
      modulus_is_needed = true;
      correct_usage = true;
    }
  if( s == "getkey" )
    {
      getkey_is_needed = true;
      correct_usage = true;
    }
  if( s == "scanf" )
    {
      scanf_is_needed = true;
      correct_usage = true;
    }
  if( s == "bmpmem" )
    {
      bmpmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "chrmem" )
    {
      chrmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "scrmem" )
    {
      scrmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "bnkmem" )
    {
      bnkmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "sidirq" )
    {
      sidirq_is_needed = true;
      correct_usage = true;
    }
  if( s == "undocumented ops" )
    {
      illegal_operations_are_needed = true;
      correct_usage = true;
    }

  if( s == "printf" )
    {
      printf_is_needed = true;
      correct_usage = true;
    }
  if( s == "byte2str" )
    {
      byt2str_is_needed = true;
      correct_usage = true;
    }
  if( s == "byte2hex" )
    {
      byte2hex_is_needed = true;
      correct_usage = true;
    }
  if( s == "twos" )
    {
      twos_complement_is_needed = true;
      correct_usage = true;
    }
  if( s == "memcpy" )
    {
      memcpy_is_needed = true;
      correct_usage = true;
    }
  if( s == "cls" )
    {
      cls_is_needed = true;
      correct_usage = true;
    }
  if( s == "div16" )
    {
      div16_is_needed = true;
      correct_usage = true;
    }
  if( s == "mul16" )
    {
      mul16_is_needed = true;
      correct_usage = true;
    }
  if( s == "unsigned mul" )
    {
      umul_is_needed = true;
      correct_usage = true;
    }
  if( s == "div10" )
    {
      div10_is_needed = true;
      correct_usage = true;
    }
  if( s == "unsigned signed cmp" )
    {
      unsigned_signed_cmp_is_needed = true;
      correct_usage = true;
    }
  if( s == "decimal digit" )
    {
      decimal_digit_is_needed = true;
      correct_usage = true;
    }
  if( s == "signed cmp" )
    {
      signed_comparison_is_needed = true;
      correct_usage = true;
    }
  if( s == "sidrnd" )
    {
      sidrnd_is_needed = true;
      correct_usage = true;
    }
  if( !correct_usage )
    {
      addCompilerMessage( string( "needs ") + $3.name + " not found", 0 );
      addCompilerMessage( "valid strings: bin2bit, bmpmem, bnkmem, byte2hex, byte2str, chrmem, cls, deciml digit, div10, getkey, getplot, mcplot, memcpy, modulus, mul16, plot, printf, scanf, scrmem, sidirq, sidrnd, signed cmp, stack, twos, undocumented ops, unsigned mul, unsigned signed cmp, word2dec", 3 );
    }
  else
    {
      addCompilerMessage( string( "adding built-in functionality: " ) + s, 0 );
    }

}
| headers INCLUDE STR
{
  string tmp_str = stripQuotes($3.name);
  addCompilerMessage( string( "including: " ) + $3.name, 0 );
  addIncludeFile( tmp_str );
  // add the include file to an include-file vector - process them at the end
  //yyin = fopen( tmp_str.c_str(), "rt" );
  strcpy($$.name, $1.name);
}
| headers tNEEDS '('  STR  ')' ';'
{
  bool correct_usage = false;
  string s =  stripQuotes($4.name);
  if( s == "stack" )
    {
      stack_is_needed = true;
      correct_usage = true;
    }

  if( s == "bin2bit" )
    {
      bin2bit_is_needed = true;
      correct_usage = true;
    }
  if( s == "word2dec" )
    {
      word2dec_is_needed = true;
      correct_usage = true;
    }
  if( s == "plot" )
    {
      plot_is_needed = true;
      correct_usage = true;
    }
  if( s == "mcplot" )
    {
      multicolour_plot_is_needed = true;
      correct_usage = true;
    }
  if( s == "getplot" )
    {
      getplot_is_needed = true;
      correct_usage = true;
    }
  if( s == "modulus" )
    {
      modulus_is_needed = true;
      correct_usage = true;
    }
  if( s == "getkey" )
    {
      getkey_is_needed = true;
      correct_usage = true;
    }
  if( s == "scanf" )
    {
      scanf_is_needed = true;
      correct_usage = true;
    }
  if( s == "bmpmem" )
    {
      bmpmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "chrmem" )
    {
      chrmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "scrmem" )
    {
      scrmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "bnkmem" )
    {
      bnkmem_is_needed = true;
      correct_usage = true;
    }
  if( s == "sidirq" )
    {
      sidirq_is_needed = true;
      correct_usage = true;
    }
  if( s == "undocumented ops" )
    {
      illegal_operations_are_needed = true;
      correct_usage = true;
    }

  if( s == "printf" )
    {
      printf_is_needed = true;
      correct_usage = true;
    }
  if( s == "byte2str" )
    {
      byt2str_is_needed = true;
      correct_usage = true;
    }
  if( s == "byte2hex" )
    {
      byte2hex_is_needed = true;
      correct_usage = true;
    }
  if( s == "twos" )
    {
      twos_complement_is_needed = true;
      correct_usage = true;
    }
  if( s == "memcpy" )
    {
      memcpy_is_needed = true;
      correct_usage = true;
    }
  if( s == "cls" )
    {
      cls_is_needed = true;
      correct_usage = true;
    }
  if( s == "div16" )
    {
      div16_is_needed = true;
      correct_usage = true;
    }
  if( s == "mul16" )
    {
      mul16_is_needed = true;
      correct_usage = true;
    }
  if( s == "unsigned mul" )
    {
      umul_is_needed = true;
      correct_usage = true;
    }
  if( s == "div10" )
    {
      div10_is_needed = true;
      correct_usage = true;
    }
  if( s == "unsigned signed cmp" )
    {
      unsigned_signed_cmp_is_needed = true;
      correct_usage = true;
    }
  if( s == "decimal digit" )
    {
      decimal_digit_is_needed = true;
      correct_usage = true;
    }
  if( s == "signed cmp" )
    {
      signed_comparison_is_needed = true;
      correct_usage = true;
    }
  if( s == "sidrnd" )
    {
      sidrnd_is_needed = true;
      correct_usage = true;
    }
  if( !correct_usage )
    {
      addCompilerMessage( string( "needs ") + $4.name + " not found", 0 );
      addCompilerMessage( "valid strings: bin2bit, bmpmem, bnkmem, byte2hex, byte2str, chrmem, cls, deciml digit, div10, getkey, getplot, mcplot, memcpy, modulus, mul16, plot, printf, scanf, scrmem, sidirq, sidrnd, signed cmp, stack, twos, undocumented ops, unsigned mul, unsigned signed cmp, word2dec", 3 );
    }
  else
    {
      addCompilerMessage( string( "adding built-in functionality: " ) + s, 0 );
    }
  strcpy($$.name, $1.name );

};


argumentlist: 
| /* empty */
| datatype ID
{
  addDebugComment(string("Argument: ") + $2.name);
  int t = getDataTypeValue($1.name); // datatype
  addAsmVariable(string($2.name), t);

  switch( t )
    {
    case 0:
    case 1: // one byte argument
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)), 3, false);
      addAsm(str_STA+$2.name, 3, false);
      break;
    case 2:
    case 3:
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+1), 3, false);
      addAsm(str_STA+$2.name+" +1", 3, false);
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)), 3, false);
      addAsm(str_STA+$2.name, 3, false);
      break;
    case 4:
      // double
      break;
    case 8:
      // float
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+4), 3, false);
      addAsm(str_STA+$2.name+"+4", 3, false);
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+3), 3, false);
      addAsm(str_STA+$2.name+"+3", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+2), 3, false);

      addAsm(str_STA+$2.name+"+2", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+1), 3, false);
      addAsm(str_STA+$2.name+" +1", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)), 3, false);
      addAsm(str_STA+$2.name, 3, false);

      break;
    case 16:
      // MOV
      break;
      
    default:
      break;
    }
  function_argument_count++;

}
| datatype ID ',' argumentlist
{
  addDebugComment(string("Argument: ") + $2.name);
  int t = getDataTypeValue($1.name); // datatype
  addAsmVariable(string($2.name), t);

  switch( t )
    {
    case 0:
    case 1: // one byte argument
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)), 3, false);
      addAsm(str_STA+$2.name, 3, false);

      break;
    case 2:
    case 3:
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+1), 3, false);
      addAsm(str_STA+$2.name+" +1", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)), 3, false);
      addAsm(str_STA+$2.name, 3, false);

      break;
    case 4:
      // double
      break;
    case 8:
      // float
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+4), 3, false);
      addAsm(str_STA+$2.name+"+4", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+3), 3, false);
      addAsm(str_STA+$2.name+"+3", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+2), 3, false);
      addAsm(str_STA+$2.name+"+2", 3, false);

      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)+1), 3, false);
      addAsm(str_STA+$2.name+" +1", 3, false);
      addAsm(str_PLA);
      //addAsm(str_STA+"$"+toHex(getAddressOf($2.name)), 3, false);
      addAsm(str_STA+$2.name, 3, false);


      break;
    case 16:
      // MOB
      break;
      
    default:
      break;
    }
    
  function_argument_count++;
  strcpy($$.name, $4.name );

}

parameterlist: /* empty */
|
| expression
{
  addComment( string( "Param: " ) + $1.name );
  if( isUintID($1.name) || isIntID($1.name))
    {
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf( $1.name )), 3, false );
      //addAsm( str_LDA + $1.name, 3, false );
      addAsm( str_PHA );
    }
  else if( isA( $1.name ) )
    {
      addAsm( str_PHA );
    }
  else if( isXA( $1.name ) )
    {
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );
    }
  else if( isWordID( $1.name ) )
    {
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf( $1.name )), 3, false );
      //addAsm( str_LDA + $1.name, 3, false );

      addAsm( str_PHA );
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf( $1.name )) + " +1", 3, false );
      //addAsm( str_LDA + $1.name + " +1", 3, false );

      addAsm( str_PHA );
    }
  else if( isWordIMM( $1.name ) )
    {
      int tmp_v = atoi(stripFirst($1.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);
      
      addAsm( str_LDA + "#$" + toHex( tmp_L ), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$" + toHex( tmp_H ), 2, false );
      addAsm( str_PHA );
    }
  else if( isIntIMM($1.name) )
    {
      int tmp_v = atoi(stripFirst($1.name).c_str());
      addAsm( str_LDA + "#$" + toHex( twos_complement(tmp_v)), 2, false );
      addAsm( str_PHA );
    }
  else if( isUintIMM($1.name))
    {
      int tmp_v = atoi(stripFirst($1.name).c_str());
      addAsm( str_LDA + "#$" + toHex( tmp_v ), 2, false );
      addAsm( str_PHA );
    }
  else if( isFloatID($1.name) )
    {
      // 2024 06 19 - mkpellegrino - Forced var name instead of address
      // or (even worse) nothing!
      string OP = getNameOf(getAddressOf($1.name));
      if( OP == "" )
	{
	  OP = string("$") + toHex(getAddressOf($1.name));
	}

      // 2024 04 15 - mkpellegrino      
      addAsm( str_LDA + OP, 3, false );

      addAsm( str_PHA );
      addAsm( str_LDA + OP + " +1", 3, false );

      addAsm( str_PHA );
      addAsm( str_LDA + OP + "+2", 3, false );
      
      addAsm( str_PHA );
      addAsm( str_LDA + OP + "+3", 3, false );
      
      addAsm( str_PHA );
      addAsm( str_LDA + OP + "+4", 3, false );
      
      addAsm( str_PHA );
    }
  else if( isFloatIMM($1.name) )
    {
      // mkpellegrino = 2025 07 17
      // I think that this might be more efficient
      inlineFloat( $1.name );
      pushFAC();
      //inlineFloatPush( $1.name, 105 );      
    }
  else
    {
      addCompilerMessage( "Unhandled Parameter Type for function call", 3);
    }
}
| parameterlist ',' expression
{
  addDebugComment(string("Last Parameter: ") + $3.name );
  if( isUintID($3.name) || isIntID($3.name) )
    {
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf( $3.name )), 3, false );
      //addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
    }
  else if( isA($3.name) )
    {
      addAsm( str_PHA );
    }
  else if( isXA($3.name) )
    {
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );
    }
  else if( isWordID($3.name) )
    {
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name) ), 3, false );
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf( $3.name )), 3, false );
      //addAsm( str_LDA + $3.name, 3, false );

      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+1 ), 3, false );
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf( $3.name )) + " +1", 3, false );
      //addAsm( str_LDA + $3.name + " +1", 3, false );
      addAsm( str_PHA );
    }
  else if( isWordIMM($3.name) )
    {
      int tmp_v = atoi(stripFirst($3.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);
      
      addAsm( str_LDA + "#$" + toHex( tmp_L ), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$" + toHex( tmp_H ), 2, false );
      addAsm( str_PHA );
    }
  else if( isUintIMM($3.name) )
    {
      int tmp_v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + "#$" + toHex( tmp_v ), 2, false );
      addAsm( str_PHA );
    }
  else if( isIntIMM( $3.name ) )
    {
      int tmp_v = atoi(stripFirst($3.name).c_str());
      addAsm( "// ------ ", 0, true );
      addAsm( str_LDA + "#$" + toHex( twos_complement(tmp_v)), 2, false );
      addAsm( str_PHA );
      addAsm( "// ------ ", 0, true ); 
    }
  else if( isFloatID($3.name) )
    {
      string OP = getNameOf(getAddressOf($3.name));
      if( OP == "" )
	{
	  OP = string("$") + toHex(getAddressOf($3.name));
	}
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name) ), 3, false );
      addAsm( str_LDA + OP, 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+1 ), 3, false );
      addAsm( str_LDA + OP + " +1", 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+2 ), 3, false );
      addAsm( str_LDA + OP + "+2", 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+3 ), 3, false );
      addAsm( str_LDA + OP+ "+3", 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+4 ), 3, false );
      addAsm( str_LDA + OP + "+4", 3, false );
      addAsm( str_PHA );
    }
  else if( isFloatIMM($3.name) )
    {

      inlineFloatPush( $3.name, 105 );
      
    }
  else
    {
      addCompilerMessage( "Unhandled Parameter Type for function call", 3);
    }
  
  strcpy($$.name, $1.name );
};


numberlist: /* empty */
|  
| value
{
  if( !isString( $1.name ) )
    {
      // the label was already added as a STRLBL
      // so don't add the string here
      int v = atoi( stripFirst( $1.name ).c_str());
      addData( generateNewLabel() + " " + str_BYTE + "$" + toHex( v ), 1 );
    }
}
| numberlist ',' value
{
  int v = atoi( stripFirst( $3.name ).c_str());
  addByte( ", $" + toHex( v ), 1 );
  strcpy($$.name, $1.name );
};

// the beginning of the assembler program
main: datatype ID
{
  if( !processing_includes )
    {
      if( kick )
	{
	  if( basic_upstart )
	    {
	      addAsm( "* = $0801", 0, true );
	      addAsm( string("BasicUpstart($") + toHex( code_start ) + ")", 0, true );
	    }
	  addAsm( string( "* = $") + toHex( code_start ), 0, true );
	}
      else
	{
	  addAsm( string( ".org $" ) + toHex( code_start ), 0, true );
	}
      addCommentSection( "main()" );
    }
};

function: function function
| datatype ID
{

  {
    string s = string( "Function Definition: " ) + string( $2.name );
    addComment( s );
  }
  addComment( "return address" );
  // this will make recursion (almost) impossible
  addAsm( "!rx:\t" + str_BYTE + "$00", 1, true );
  addAsm( "!ry:\t" + str_BYTE + "$00", 1, true );

  
  addAsm( string($2.name) + ":", 0, true);
  addFunction( string($2.name), getLabel( label_vector[label_major]-1 ), getDataTypeValue($1.name));


  addAsm( "// MARKED_FOR_DELETION", 0, true );
  addAsm( str_PLA, 1, false );
  addAsm( str_STA + "!rx-", 3, false );
  addAsm( str_PLA, 1, false );
  addAsm( str_STA + "!ry-", 3, false );
 
} '(' argumentlist ')'
{
  addComment( "Restore return address" );
  addAsm( str_LDA + "!ry-", 3, false );
  addAsm( str_PHA, 1, false );
  addAsm( str_LDA + "!rx-", 3, false );
  addAsm( str_PHA, 1, false );


  if( function_argument_count == 0 )
    {
      deletePreviousAsmUntil( "// MARKED_FOR_DELETION" );
      addComment( "Deleted Mnemonics" );
    }
  
} '{' {} body return '}'
  {
    // add this label to the list of functions and their addresses
    // any time we come across the function with this ID
    // we can JSR to it
    defined_ids_vector.push_back( new id_and_line( $2.name, countn+1 ));
    if( !previousAsm(str_RTS) )
      {
	//             // we may want to consider
	//             // adding a return value here
   	addAsm(str_RTS); // add a return statement
	
      }
    
  };
|
;

datatype:
CHAR {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=0;strcpy($$.name, "CHAR");}
|
tUINT {addParserComment( string("RULE: datatype: ") + $$.name);current_variable_type=0; strcpy($$.name, "UINT");}
|
tBYTE {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=0; strcpy($$.name, "BYTE");}
|
INT {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=1; strcpy($$.name, "INT");}
|
tWORD {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=2; strcpy($$.name, "WORD");}
|
tDOUBLE {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=2; strcpy($$.name, "DOUBLE");}
|
FLOAT {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=8;strcpy($$.name, "FLOAT");}
|
tMOB {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=16;strcpy($$.name, "MOB");}
|
VOID {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=32;strcpy($$.name, "VOID");}
|
STR {addParserComment( string("RULE: datatype: ") + $$.name); current_variable_type=64;strcpy($$.name, "STRING");}
;

body: WHILE
{
  // 2023 06 27
  string s = gen_random_str(10);
  rnd_str_vector.push(s);
  
  addComment( "Preserve $02/$03" );
  addComment( string( "vvvv---- Paired with: " ) + s );
  addAsm( str_LDA + "$02", 2, false);
  addAsm( str_PHA );

  addAsm( str_LDA + "$03", 2, false);
  addAsm( str_PHA );
  
  pushScope("WHILE");
  addCommentSection( "WHILE LOOP" );
  addAsm( generateNewLabel(), 0, true );
}
'(' condition
{
  addAsm( generateNewLabel(), 0, true );
}
')' '{' body
{
  addAsm(str_JMP + getLabel( label_vector[label_major]-2, false) + commentmarker + "jump to top of WHILE loop", 3, false );
  addAsm( generateNewLabel(), 0, true );
  popScope();
  
  // 2023 06 27
  string s = rnd_str_vector.top();
  rnd_str_vector.pop();
  
  addDebugComment( "Restore $02/$03" );
  addAsm( str_PLA );
  addAsm( str_STA + "$03", 2, false);
  addAsm( str_PLA );
  addAsm( str_STA + "$02", 2, false);

  addDebugComment( string( "^^^^---- Paired with: " ) + s );
}
'}'

| FOR
{
  string s = gen_random_str(10);
  rnd_str_vector.push(s);
 
  addComment( "Preserve $02/$03" );
  addDebugComment( string( "vvvv---- Paired with: " ) + s );

  addAsm( str_LDA + "$02", 2, false);
  addAsm( str_PHA );
  addAsm( str_LDA + "$03", 2, false);
  addAsm( str_PHA );
  
  //addComment( "Preserve Status Register" );
  //addAsm( str_PHP );
  
  //addAsm( str_CLC );  
  pushScope("FOR");
  addAsm( generateNewLabel(), 0, true );
}
'(' statement { addCommentBreak(); }
';' condition { addCommentBreak(); }
{
  addAsm( generateNewLabel(), 0, true );
}
';' {addAsm("[iterator]",0,true);} statement
{
  addAsm( "[jump to top of for]",0,true);
  string s = "";
  
  while( s != "[iterator]" )
    {
      iterator_stack.push( asm_instr[asm_instr.size()-1] );
      s = iterator_stack.top()->getString();
      deletePreviousAsm();
    }
  addAsm( "// - - - - - - - moved iterator from here to down below", 0, true );
  
  // Pop off the comment
  iterator_stack.pop();

  
} ')'
{  addAsm( generateNewLabel(), 0, true ); }
'{' body '}'
{

  // pop that whole statement off of that stack and jump to top of FOR
  addDebugComment( "// v v v v v v v moved iterator to here from above");
  
  string s = "";
  while( s != "[jump to top of for]" )
    {
      asm_instr.push_back( iterator_stack.top() );
      s = iterator_stack.top()->getString();
      string s2 = string( "replacing: " ) + s;
      addCompilerMessage( s2, 0 );
      iterator_stack.pop();
    }
  // delete the TAG
  deletePreviousAsm();
  
  addDebugComment( "// ^ ^ ^ ^ ^ ^ ^ moved iterator to here from above");
  
  addAsm( str_JMP + getLabel( ((int)label_vector[label_major]-3), false ), 3, false );
  
  addAsm( generateNewLabel(), 0, true );

  if( scope_stack.top() != string("FOR") )
    {
      addCompilerMessage( "Scope out of Sync", 3 );
      addDebugComment( "ERROR: Scope out of Sync" );
      addDebugComment( scope_stack.top() );
    }
  else
    {
      popScope();

      //addCommentBreak(2);
      // 2023 06 27
      string s = rnd_str_vector.top();
      rnd_str_vector.pop();

      // 2023 06 25
      //addComment( "Restore status register" );
      //addAsm( str_PLP );

      addComment( "Restore $02/$03" );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false);
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false);
      addDebugComment( string( "^^^^---- Paired with: " ) + s );

      //addCommentBreak(2);

    }
};
| IF
{

  if( !arg_unsafe_ifs )
    {
      string s = gen_random_str(10);
      rnd_str_vector.push(s);
      addDebugComment( string( "vvvv---- Paired with: " ) + s );

      addComment( "Preserve $02/$03" );
      addAsm( str_LDA + "$02", 2, false);
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false);
      addAsm( str_PHA );
    }

  //addComment( "Preserve Status Register" );
  //addAsm( str_PHP );

  //addCommentBreak(2);

  //addAsm( str_CLC );

  pushScope("IF");
  // ***
  //addAsm( generateNewLabel(), 0, true );
  
}
'(' condition ')'
{
  jump_start = byte_count;
  //addCommentBreak();
  addComment( "Body of If" );
  addAsm( generateNewLabel(), 0, true );
}
'{' body '}'
{
  addAsm( "// MARKED_FOR_DELETION" );
  addAsm( str_JMP + getLabel( label_vector[label_major]+1, false), 3, false);
  addAsm( generateNewLabel(), 0, true );
}
 else
   {
     if( string($11.name) == "" )
       {

	 deletePreviousAsmUntil( "// MARKED_FOR_DELETION");

	 // delete jump to else
	 // deletePreviousAsm();
	 // delete label
	 //deletePreviousAsm();
	 
	 addComment( "Removed previous JMP instruction & a label" );
	 addCompilerMessage( "Removed an unneccessary JMP instruction and Label", 0 );

	 if( (byte_count - jump_start) <= 255 )
	   {
	     // TODO: Figure out why byte count is 6 off!
	     addComment( "^^^^ OPTIMIZE ^^^^ with a BRANCH the JMP that is only 0x" + toHex(6+byte_count-jump_start) + " (" + itos(6+byte_count-jump_start) + ") bytes above" );
	     
	   }
	 addAsm( getLabel(label_vector[label_major]-1), 0, true );
       }
     else
       {
	 //addComment( "ELSE" );
	 //addComment( $11.name );
       }
     addParserComment( "post-process the ELSE" );
   }
{
  addAsm( generateNewLabel(), 0, true );
    
  if( scope_stack.top() != string("IF") )
    {
      addCompilerMessage( "Scope out of Sync", 3 );
      addDebugComment( "ERROR: Scope out of Sync" );
      addDebugComment( scope_stack.top() );
    }
  else
    {
      popScope();

      //addComment( "Restore status register" );
      //addAsm( str_PLP );

      if( !arg_unsafe_ifs )
	{
	  addComment( "Restore $02/$03" );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false);
	  string s = rnd_str_vector.top();
	  rnd_str_vector.pop();
	  addComment( string( "^^^^---- Paired with: " ) + s );

	}
      
    }
};
| statement ';'
{
};
| return
  {
  
  };
| body body
{
  $$.nd = mknode($1.nd, $2.nd, "statements");
};


| tDATA {pushScope("DATA");} ID
{
}
'=' '{' numberlist '}' ';'
{
  if( isString( $7.name ) )
    {
      addDebugComment( "String type added as a word variable" );
      addAsmVariable($3.name, 2);
      int addr = getAddressOf( $3.name );
      addAsm( str_STA + getNameOf( addr ), 3, false );
      addAsm( str_STX + getNameOf( addr ) + " +1", 3, false );
    }
  else
    {
      addAsmVariable($3.name, 2);
      int addr = getAddressOf( $3.name );
      addAsm( str_LDA + "#<" + getLabel( label_vector[label_major]-1,false), 2, false );
      
      addAsm( str_STA + getNameOf( addr ), 3, false );
      addAsm( str_LDA + "#>"  + getLabel( label_vector[label_major]-1,false), 2, false );
      addAsm( str_STA + getNameOf( addr ) + " +1", 3, false );
    }
  
  popScope();
};

// STATEMENTS
// STATEMENT
| tLDA '(' expression ')' ';' 
{
  if( isA($3.name) || isXA($3.name) )
    {
      // it's already in A... do nothing
    }
  else if( isIntID($3.name) || isUintID($3.name) )
    {
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );
    }
  else if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      addAsm( str_LDA +  "#$"  + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isWordIMM($3.name) )
    {
      int val = atoi(stripFirst($3.name).c_str());
      
      if( val > 255 && val < 65536 )
	{
	  addCompilerMessage( string("lda($")+toHex(val)+") is essentially a PEEK", 1 );
	  addAsm( str_LDA + "$" + toHex(val), 3, false );
	}
      else if( val < 256 )
	{
	  addCompilerMessage( string("lda($")+toHex(val)+") is essentially a PEEK in ZP", 1 );
	  addAsm( str_LDA + "$" + toHex(val), 2, false );
	}
      else
	{
	  addCompilerMessage( $3.name, 0 );
	  addCompilerMessage( "Invalid WORD as argument", 3 );
	}
    }
  else
    {
      addCompilerMessage("unidentified argument type for lda", 2 );
    }
};
// STATEMENT
| tPUSH '(' expression ')' ';'
{
  stack_is_needed = true;

  // merely for testing out the software stack
  if( isA($3.name) )
    {
      addAsm( str_JSR + "PUSH", 3, false );
    }
  else if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf( $3.name )), 3, false );
      addAsm( str_JSR + "PUSH", 3, false );
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      addAsm( str_LDA + "#$" + toHex( atoi( stripFirst($3.name).c_str() )), 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
    }
};
// STATEMENT
| tSEED '(' ')' ';' 
{
  sidrnd_is_needed = true;
  addAsm( str_JSR + "SIDRND" + commentmarker + "initialize random number generator", 3, false );
  sidrnd_is_initialised = true;
};

// STATEMENT
| ID '(' parameterlist ')' ';'
{
  addDebugComment( "Call a function as a statement" );
  proposed_ids_vector.push_back( new id_and_line( $1.name, countn+1 ));
  addAsm( str_JSR + $1.name, 3, false );
};

// STATEMENT
| SCANFF '(' expression ')' ';'
{
  if( isWordID( $3.name ) )
    {
      addComment("scanf(WordID)");
      getkey_is_needed=true;
      scanf_is_needed=true;
      memcpy_is_needed=true;
      addAsm( str_JSR + "SCANF", 3, false );  
      addAsm( str_LDA + "#<SCANFBUF-2", 2, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + "#>SCANFBUF-2", 2, false );
      addAsm( str_STA + "$FC", 2, false );
      int addr = getAddressOf($3.name);
      addAsm( str_LDA + $3.name, 2, false);
      addAsm( str_STA + "$FD", 2, false );
      addAsm( str_LDA + $3.name + " +1", 2, false);
      addAsm( str_STA + "$FE", 2, false ); 
      addAsm( str_LDA + "#$" + toHex(scanf_buffer_size), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "MEMCPY", 3, false );
    }
  else if( isWordIMM( $3.name ) )
    {
      int tmp_v = atoi(stripFirst($3.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);
      
      addComment("scanf(WordIMM)");
      getkey_is_needed=true;
      scanf_is_needed=true;
      memcpy_is_needed=true;
      addAsm( str_JSR + "SCANF", 3, false );  
      addAsm( str_LDA + "#<SCANFBUF-2", 2, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + "#>SCANFBUF-2", 2, false );
      addAsm( str_STA + "$FC", 2, false );
      int addr = getAddressOf($3.name);
      addAsm( str_LDA + "#$" + toHex(tmp_L), 2, false);
      addAsm( str_STA + "$FD", 2, false );
      addAsm( str_LDA + "#$" + toHex(tmp_H), 2, false);
      addAsm( str_STA + "$FE", 2, false ); 
      addAsm( str_LDA + "#$" + toHex(scanf_buffer_size), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "MEMCPY", 3, false );
    }
  else if( isXA($3.name) )
    {
      addComment("scanf(XA)");
      getkey_is_needed=true;
      scanf_is_needed=true;
      memcpy_is_needed=true;
      addAsm( str_STA + "$FD", 2, false );
      addAsm( str_STX + "$FE", 2, false );
      
      addAsm( str_JSR + "SCANF", 3, false );  
      addAsm( str_LDA + "#<SCANFBUF-2", 2, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + "#>SCANFBUF-2", 2, false );
      addAsm( str_STA + "$FC", 2, false );
      int addr = getAddressOf($3.name);
      
      addAsm( str_LDA + "#$" + toHex(scanf_buffer_size), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "MEMCPY", 3, false );
    }
  else
    {
      addCompilerMessage( "scanf of this type not supported... use WordID, WordIMM, or XA", 3 );
    }
  
};
// STATEMENT
| tPRINTS '(' expression ')' ';'
{
  if( isUintID($3.name) )
    {
      addComment( "prints(UintID);");

      int addr = getAddressOf( $3.name );
      string OP3 = getNameOf(addr);
      
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "!:\t" + str_LDA + OP3 + ",X", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false ); 
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!-", 3, false ); 
      addAsm( "!:", 0, true );
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "prints(WordIMM);");

      printf_is_needed = true;
      int tmp_v = atoi(stripFirst($3.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);

      addAsm( str_LDX + "$02", 2, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA, 1, false );

      
      addAsm( str_LDA + "#$" + toHex(tmp_L), 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "#$" + toHex(tmp_H), 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false );

      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_STX + "$02", 2, false );
    }
  else if( isWordID($3.name) )
    {
      addComment( "prints(WordID);");
      printf_is_needed = true;
      int addr = getAddressOf( $3.name );
      string OP3 = getNameOf(addr);

      addAsm( str_LDX + "$02", 2, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA, 1, false );
      
      addAsm( str_LDA + OP3, 3, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + OP3 + " +1", 3, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false );

      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_STX + "$02", 2, false );
    }
  else if( isXA($3.name) )
    {
      addComment( "prints(XA);");
      printf_is_needed = true;

      addAsm( str_TAY, 1, false );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_LDA + "$03", 2, false ); 
      addAsm( str_PHA, 1, false );

      
      addAsm( str_STY + "$02", 2, false );
      addAsm( str_STX + "$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false );

      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$02", 2, false );

    }
  else
    {
      addCompilerMessage( string("prints of unknown type: ") + $3.name, 3 );
    }
  strcpy( $$.name, "NULL" );
};
// STATEMENT
| PRINTFF '(' expression ')' ';'
{
  if( isUintID($3.name) )
    {
      addComment( "printf(UintID);" );
      //addComment(string("printf(") + getNameOf(getAddressOf($3.name)) + string(");"));
      int addr = hexToDecimal(stripFirst($3.name).c_str());
      addAsm( str_LDA + getNameOf(addr), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYT2STR", 3, false ); byt2str_is_needed = true;
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA ); 
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + "!+++", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_TYA );
      addAsm( "!:\t" + str_JSR + "$FFD2", 3, true );
      addAsm( "!:\t" + str_TXA, 1, true );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      addAsm( "!:\t" + str_TYA, 1, true );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + "!--", 2, false );
      addAsm( str_JMP + "!---", 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isA($3.name) )
    {
      addComment( "printf(A);" );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYT2STR", 3, false ); byt2str_is_needed = true;
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + "!+++", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );

      addAsm( str_TYA );
      addAsm( "!:\t" + str_JSR + "$FFD2", 3, true );
      addAsm( "!:\t" + str_TXA, 1, true);
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      addAsm( "!:\t" + str_TYA, 1, true);
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + "!--", 2, false );
      addAsm( str_JMP + "!---", 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isIntID($3.name) )
    {
      addComment( "printf(IntID);" );

      //addComment(string("printf(") + getNameOf(getAddressOf($3.name)) + string(");"));
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_CMP + "#$7F", 2, false );
      addAsm( str_BCC + "!+", 2, false ); // BCC Skip
      addAsm( str_LDA + "#$2D", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      // put it into two's complement
      addAsm( str_PLA );
      addAsm( str_SEC );
      addAsm( str_SBC + "#$01", 2, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_PHA );
      addAsm( "!:\t" + str_JSR + "BYT2STR", 3, true ); byt2str_is_needed = true;

      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + "!+++", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );

      addAsm( str_TYA );
      addAsm( "!:\t" + str_JSR + "$FFD2", 3, true );
      addAsm( "!:\t" + str_TXA, 1, true);
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      addAsm( "!:\t" + str_TYA, 1, true);
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + "!--", 2, false );
      addAsm( str_JMP + "!---", 2, false );
      addAsm( "!:", 0, true );
    }
  else if( isARG($3.name) )
    {
      addComment( "printf(ARG);" );

      addAsm( str_LDA + "#$69" + commentmarker + "ARG_L", 2, false );
      addAsm( str_LDY + "#$00" + commentmarker + "ARG_H", 2, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false ); // FP ->FAC
      addAsm( str_JSR + "$BDDD" + commentmarker + "FAC -> PETSCII ($0100)", 3, false );
      
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false);
      printf_is_needed = true;
    }
  else if( isFAC($3.name) )
    {
      addComment( "printf(FAC);" );
      addAsm( str_JSR + "$BDDD" + commentmarker + "FAC -> PETSCII ($0100)", 3, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "!:\t" + str_LDA + "$0100,X", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isFloatID($3.name) )
    {
      addComment( "printf(FloatID);" );
      //addComment(string("printf(") + getNameOf(getAddressOf($3.name)) + string(");"));
      current_variable_base_address = getAddressOf($3.name);

      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false );
      
      // load it into FAC
      addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false ); // FP ->FAC
      // call the FOUT
      
      addAsm( str_JSR + "$BDDD" + commentmarker + "FAC -> PETSCII ($0100)", 3, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false ); printf_is_needed = true;
    }
  else if( isWordID($3.name) )
    {
      addComment( "printf(WordID);" );

      //addComment(string("printf(") + getNameOf(getAddressOf($3.name)) + string(");"));
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      current_variable_base_address = getAddressOf($3.name);
      int base_address_op1 = hexToDecimal($3.name);
      int inst_size = 3;
      if( base_address_op1 < 256 ) inst_size = 2;
      addAsm( str_LDA + getNameOf(base_address_op1), inst_size, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      addAsm( str_LDA + getNameOf(base_address_op1) + " +1", inst_size, false );
      addAsm( str_STA + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );

      // find the 1st non-30 ('0') byte
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "!:\t" + str_LDA + "HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:\t" + str_CPX + "#$06", 2, true );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_DEX );
      addAsm( "!:\t" + str_LDA + "HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!-", 0, false );
      addAsm( "!:", 0, true );
    }
  else if( isXA($3.name) )
    {
      addComment( "printf(XA);" );
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      current_variable_base_address = getAddressOf($3.name);
      int base_address_op1 = hexToDecimal($3.name);
      int inst_size = 3;
      if( base_address_op1 < 256 ) inst_size = 2;
      addAsm( str_STA + "HTD_IN", 3, false );
      addAsm( str_STX + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );

      // find the 1st non-30 ('0') byte
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "!:\t" + str_LDA + "HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!-", 3, false );
      // ---------------------------------
      // 2022 12 16 - mkpellegrino
      // make sure it prints a 0 if it's 0
      // and not just a blank space!
      addAsm( "!:\t" + str_CPX + "#$06", 2, true );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_DEX );
      // ---------------------------------

      addAsm( "!:\t" + str_LDA + "HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "printf(WordIMM);" );
      addCompilerMessage( "This is VERY inefficient.  You could just print the value as a string", 1 );
      int tmp = atoi( stripFirst($3.name).c_str() );
      word2dec_is_needed = true;
      byte2hex_is_needed = true;

      
      addAsm( str_LDA + "#$"  + toHex( get_word_L( tmp )), 2, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      addAsm( str_LDA + "#$" + toHex( get_word_H( tmp )), 2, false );
      addAsm( str_STA + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "!:\t" + str_LDA +"HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:\t" + str_CPX + "#$06", 2, true );
      addAsm( str_BNE + "!+", 2, false );

      addAsm( str_DEX );
      addAsm( "!:\t" + str_LDA +"HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      addComment( "printf(UIntIMM);" );
      addCompilerMessage( "This is VERY inefficient.  You could just print the value as a string", 1 );
      int tmp = atoi( stripFirst($3.name).c_str() );
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      addAsm( str_LDA + "#$" + toHex( tmp ), 2, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "!:\t" + str_LDA + "HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:\t" + str_CPX + "#$06", 2, true );
      addAsm( str_BNE + "!+", 2, false ); 
      addAsm( str_DEX );
      addAsm( "!:\t" + str_LDA + "HTD_STR,X", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:", 0, true );
    }
  else
    {
      addCompilerMessage( "printf: unknown type", 3 );
    }
}
// STATEMENT
| PRINTFF '(' STR ')' ';'
{
  addCommentSection( string("printf(") + string($3.name) + string( ");") );

  addAsm( str_LDX + "$02", 2, false );
  addAsm( str_LDA + "$03", 2, false );
  addAsm( str_PHA );
  
  addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );
  addAsm( str_LDA + "#<STRLBL" + itos(string_number), 2, false );
  addAsm( str_STA + "$02", 2, false );
  addAsm( str_LDA + "#>STRLBL" + itos(string_number++), 2, false );
  addAsm( str_STA + "$03", 2, false );
  
  addAsm( str_JSR + "PRN", 3, false );

  addAsm( str_PLA );
  addAsm( str_STA + "$03", 2, false );
  addAsm( str_STX + "$02", 2, false );
  printf_is_needed = true;
};
// STATEMENT
| tBYTE2HEX '(' expression ')' ';'
{
  // this byte2hex section is all wonky
  //
  // this REALLY should be an expression
  //
  addParserComment( "RULE: body: tBYTE2HEX '(' expression ')' ';'" );
  byte2hex_is_needed = true;
  int t;
  /* if( isA( $3.name ) ) */
  /*   { */
  /*     addAsm( str_PHA ); */
  /*     addAsm( str_JSR + "BYTE2HEX", 3, false ); */
  /*     t = -1; */
  /*   } */
  /* else */
  /*   { */
  /*     t = getTypeOf($3.name); */
  /*   } */

  addDebugComment( string("byte2hex(") + string($3.name) + string(")"));
  if( isUintID($3.name) || isIntID($3.name) ) 
    {
      // uint and int
      addComment( "byte2hex((U)IntID);" );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)).c_str(), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addComment( "byte2hex(UintIMM);" );
      int tmp = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( tmp), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "byte2hex(WordIMM);" );
      int tmp = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA+"#$" + toHex( get_word_L( tmp )), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$" + toHex( get_word_H( tmp)), 2, false ); 
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isWordID($3.name) ) 
    {
      addComment( "byte2hex(WordID);" );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)).c_str(), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)).c_str() + " +1", 3, false );

      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isFloatIMM( string($3.name) ))
    {
      addCompilerMessage( "cannot byte2hex a float... try printf", 3 );
    }
  else if( isA($3.name) )
    {
      addComment( "byte2hex(A);" );
      addDebugComment("Push the argument onto the stack before function call" );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isXA($3.name) )
    {
      addComment( "byte2hex(XA);" );
      addDebugComment("Push the argument onto the stack before function call" );
      addAsm( str_PHA ); 
      addAsm( str_TXA );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else
    {
      addCompilerMessage( "invalid argument type for byte2hex", 3 );
    }
}
// STATEMENT
| tCURSORXY '(' expression
{
  if(isA($3.name))
    {
      addAsm(str_PHA,1,false);
    }
  else if(isXA($3.name))
    {
      addAsm(str_PHA,1,false);
      //addAsm(str_TXA,1,false);
      //addAsm(str_PHA,1,false);
    }
  else if(isFAC($3.name))
    {
      pushFAC();
    }
}
',' expression {} ')' ';'
{

  string _x = $3.name;
  string _y = $6.name;
  addComment( string("cursorxy(") + string(_x) + string(",") + string(_y) + string( ")" ));
  addComment( "clc is integral to jsr $FFF0... do not remove" );
  addAsm( str_CLC ); // carry must be set in order to SET the cursor position using kernal call

  if( isA(_x) )
    {
      if( isA(_y) )
	{
	  addComment( "cursorxy(A, A);" );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addComment( "cursorxy(A, FAC);" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addComment( "cursorxy(A, FloatID);" );
	  addCompilerMessage( "cursorxy: losing high byte of Y", 1 );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  addComment( "cursorxy(A, FloatIMM);" );
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntID(_y) )
	{
	  addCompilerMessage( "cursorxy(A, IntID): y could be out of range", 1 );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );
	}
      else if( isUintID(_y) )
	{ 
	  addComment( "cursorxy(A, UintID);" );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{	  
	  addComment( "cursorxy(A, UintIMM);" );
	  addAsm( str_PLA, 1, false );
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_TAY, 1, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex( y_coord ), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordID(_y) )
	{
	  addComment( "cursorxy(A, WordID);" );
	  addCompilerMessage( "cursorxy: alas... hi-byte is lost", 1 );
	  addAsm( str_PLA, 1, false );
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addComment( "cursorxy(A, WordIMM);" );
	  addCompilerMessage( "cursorxy: alas... hi-byte is lost", 1 );
	  addAsm( str_PLA, 1, false );
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_TAY, 1, false );
	  int tmp_v = atoi(stripFirst(_y).c_str());
	  int tmp_L = get_word_L(tmp_v);
	  addAsm( str_LDX + "#$" + toHex(tmp_L), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );

	}
      else if( isXA(_y) )
	{
	  addComment( "cursorxy(A, XA);" );
	  addCompilerMessage( "cursorxy: alas... hi-byte is lost", 1 );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isFAC(_x) )
    {
      addCompilerMessage( "cursorxy: losing high byte of X", 1 );
      // _x -> Y  and _y -> X
      if( isA(_y) )
	{
	  addComment( "cursorxy(FAC, A);" );
	  addCompilerMessage( "cursorxy(FAC 'n A): destroying $02", 0 );
	  addAsm( str_STA + "$02", 2, false );
	  popFAC();
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + "$02", 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addComment( "cursorxy(FAC, FAC);" );
	  addCompilerMessage( "cursorxy(FAC 'n FAC): destroying $02", 0 );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_STY + "$02", 2, false );
	  popFAC();
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + "$02", 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addComment( "cursorxy(FAC, FloatID);" );
	  addCompilerMessage( "cursorxy(FAC, FloatID): destroying $02", 0 );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_STY + "$02", 2, false );
	  popFAC();
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + "$02", 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  addComment( "cursorxy(FAC, FloatIMM);" );
	  addCompilerMessage( "cursorxy(FAC, FloatIMM): destroying $02", 0 );
	  inlineFloat( _y );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_STY + "$02", 2, false );
	  popFAC();
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + "$02", 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntID(_y) )
	{
	  addComment( "cursorxy(FAC, IntID);" );
	  addCompilerMessage( "cursorxy(FAC, IntID): y could be out of range", 1 );
	  popFAC();
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addComment( "cursorxy(FAC, UintID);" );
	  popFAC();
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );

	}
      else if( isUintIMM(_y) )
	{
	  addComment( "cursorxy(FAC, UintIMM);" );
	  addCompilerMessage( "cursorxy: losing fidelity", 1 );
	  popFAC();
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex( y_coord ), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );  
	}
      else if( isWordID(_y) )
	{
	  addComment( "cursorxy(FAC, WordID);" );
	  addCompilerMessage( "cursorxy: losing fidelity", 1 );
	  popFAC();
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addComment( "cursorxy(FAC, WordIMM);" );
	  addCompilerMessage( "cursorxy: losing fidelity", 1 );
	  popFAC();
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  int y_coord = atoi( stripFirst( _y).c_str() );
	  addAsm( str_LDX + "#$" + toHex( y_coord ), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );  
	}
      else if( isXA(_y) )
	{
	  addComment( "cursorxy(FAC, XA);" );
	  addCompilerMessage( "cursorxy: losing fidelity and destroying $02", 1 );
	  addAsm( str_STA + "$02", 2, false );
	  popFAC();
	  addComment( "^^ OPTIMIZE ^^" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + "$02", 2, false );	  
	  addAsm( str_JSR + "$FFF0", 3, false );  
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isFloatID(_x) )
    {
      if( isA(_y) )
	{
	  addComment( "cursorxy(FloatID, A);" );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );  
	}
      else if( isFAC(_y) )
	{
	  addComment( "cursorxy(FloatID, FAC);" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_STY + "$02", 2, false );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  // addAsm( str_TYA, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addComment( "cursorxy(FloatID, FloatID);" );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  addComment( "cursorxy(FloatID, FloatIMM);" );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );

	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	  
	}
      else if( isIntID(_y) )
	{
	  addComment( "cursorxy(FloatID, IntID);" );
	  addCompilerMessage( "cursorxy(FloatID,IntID): y could be out of range", 1 );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );

	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addComment( "cursorxy(FloatID, UintID);" );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{
	  addComment( "cursorxy(FloatID, UintIMM);" );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex( y_coord ), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordID(_y) )
	{
	  addComment( "cursorxy(FloatID, WordID);" );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addComment( "cursorxy(FloatID, WordIMM);" );
	  addCompilerMessage( "cursorxy: losing high byte", 1 );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  int y_coord = atoi( stripFirst( _y ).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );

	}
      else if( isXA(_y) )
	{
	  addComment( "cursorxy(FloatID, XA);" );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_x)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isFloatIMM(_x) )
    {
      if( isA(_y) )
	{
	  addComment( "cursorxy(FloatIMM, A);" );
	  addAsm( str_PHA, 1, false );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addComment( "cursorxy(FloatIMM, FAC);" );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false ); // _y on stack
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addComment( "cursorxy(FloatIMM, FloatID);" );
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );

	  
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isFloatIMM(_y) )
	{
	  addComment( "cursorxy(FloatIMM, FloatIMM);" );
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntID(_y) )
	{
	  addComment( "cursorxy(FloatIMM, IntID);" );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addComment( "cursorxy(FloatIMM, UintID);" );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{
	  addComment( "cursorxy(FloatIMM, UintIMM);" );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isWordID(_y) )
	{
	  addComment( "cursorxy(FloatIMM, WordID);" );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addComment( "cursorxy(FloatIMM, WordIMM);" );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );

	}
      else if( isXA(_y) )
	{
	  addComment( "cursorxy(FloatIMM, XA);" );
	  addAsm( str_PHA, 1, false );
	  inlineFloat(_x);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isIntID(_x) )
    {
      addCompilerMessage( "Possible out-of-range error at runtime.", 1 );
      if( isA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isFloatID(_y) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isXA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isIntIMM(_x) )
    {
      addCompilerMessage( "cursorxy: x out of range", 3 );	  
    }
  else if( isUintID(_x) )
    {
      if( isA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isFloatID(_y) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isXA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isUintIMM(_x) )
    {
      int x_coord = atoi( stripFirst(_x).c_str() );

      if( isA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );

	}
      else if( isFAC(_y) )
	{
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isUintIMM(_y) )
	{
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isWordID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isWordIMM(_y) )
	{
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isXA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isWordID(_x) )
    {
      if( isA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isFloatID(_y) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isXA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + getNameOf(getAddressOf(_x)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isWordIMM(_x) )
    {
      int x_coord = atoi( stripFirst(_x).c_str() );

      if( isA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );

	}
      else if( isFAC(_y) )
	{
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  inlineFloat(_y);
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isUintIMM(_y) )
	{
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isWordID(_y) )
	{
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isWordIMM(_y) )
	{
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isXA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_L(x_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else if( isXA(_x) )
    {
      if( isA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFAC(_y) )
	{
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatID(_y) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_y)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isFloatIMM(_y) )
	{
	  inlineFloat( _y );
	  addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD (ylo ahi)", 3, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_TAX, 1, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );	  
	}
      else if( isIntID(_y) )
	{
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isIntIMM(_y) )
	{
	  addCompilerMessage( "cursorxy: y out of range", 3 );	  
	}
      else if( isUintID(_y) )
	{
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isUintIMM(_y) )
	{
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordID(_y) )
	{
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + getNameOf(getAddressOf(_y)), 3, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isWordIMM(_y) )
	{
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  int y_coord = atoi( stripFirst(_y).c_str() );
	  addAsm( str_LDX + "#$" + toHex(get_word_L(y_coord )), 2, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else if( isXA(_y) )
	{
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_JSR + "$FFF0", 3, false );
	}
      else
	{
	  addCompilerMessage( "cursorxy: unknown 2nd argument type", 3 );
	}
    }
  else
    {
      addCompilerMessage( "cursorxy: unknown 1st argument type", 3 );
    }
};
// STATEMENT
| tCLS '(' ')' ';'
{
  addCommentSection( "cls()");
  cls_is_needed = true;
  addAsm( str_JSR + "CLS" + commentmarker + "deep cls()", 3, false );
};
// STATEMENT
/* | tCLS '(' expression ')' ';' */
/* { */
/*   addDebugComment( "cls(expression)"); */
/*   if( isUintIMM( $3.name ) ) */
/*     { */
/*       addComment( "cls( UIntIMM )"); */
/*       int v = atoi(stripFirst($3.name).c_str()); */
/*       switch( v ) */
/* 	{ */
/* 	case 1: */
/* 	case 2: */
/* 	case 3: */
/* 	  v*=4; */
/* 	case 0: */
/* 	case 4: */
/* 	case 8: */
/* 	case 12: */
/* 	  addAsm( str_LDA + "#$20", 2, false ); // space */
/* 	  addAsm( str_LDX + "#$00", 2, false ); // (essentially 256) */
/* 	  addComment( "top-of-cls-loop" ); */
/* 	  addAsm( "!:\t" + str_STA + "$" + toHex( v ) +  "400,X", 3, true ); */
/* 	  addAsm( str_STA + "$" + toHex( v ) +  "500,X", 3, false ); */
/* 	  addAsm( str_STA + "$" + toHex( v ) +  "600,X", 3, false ); */
/* 	  addAsm( str_STA + "$" + toHex( v ) +  "6E8,X", 3, false ); */
/* 	  addAsm( str_DEX ); */
/* 	  addAsm( str_BNE + "!-", 2, false ); */
/* 	  break; */
/* 	default: */
/* 	  addAsm( str_JSR + "$FF81" + commentmarker + "<-- kernal cls()", 3, false ); */
/* 	  break; */
/* 	} */
/*     } */
/*   else if( isUintID( $3.name ) ) */
/*     { */
/*       addComment( "cls( UIntID )"); */

      
/*       pushScope("CLS(ID)"); */
/*       addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false ); */
/*       addAsm( str_CMP + "#$04", 2, false ); */
/*       addAsm( str_BCS + "!+", 2, false ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( "!:\t" + str_ASL, 1, true); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ORA + "#$04", 2, false ); */
/*       addAsm( str_TAX ); */
      
/*       addAsm( str_STX + "!+ +2", 3, false ); */
/*       addAsm( str_INX ); */
/*       addAsm( str_STX + "!+ +5", 3, false ); */
/*       addAsm( str_INX ); */
/*       addAsm( str_STX + "!+ +8", 3, false ); */
/*       addAsm( str_STX + "!+ +11", 3, false ); */

/*       addAsm( str_LDA + "#$20", 2, false ); */
/*       addAsm( str_LDX + "#$00", 2, false ); */
      
/*       addAsm( "!:\t" + str_STA + "$0000,X", 3, true ); */
/*       addAsm( str_STA + "$0000,X", 3, false ); */
/*       addAsm( str_STA + "$0000,X", 3, false ); */
/*       addAsm( str_STA + "$00E8,X", 3, false ); */
/*       addAsm( str_DEX ); */
/*       addAsm( str_BNE + "!-", 2, false ); */
/*       popScope(); */
/*     } */
/*   else */
/*     { */
/*       addCompilerMessage( "Unhandled argument type for cls( expression );", 3 ); */
/*     } */

/* }; */
// STATEMENT
| tROMOUT '(' expression ')' ';'
{
  addComment("----------------------------------------------------------------------------------");
  addComment("romout() : Swap out a ROM: Taken from https://sta.c64.org/cbm64mem.html" );
  addComment("%x00: RAM visible in all three areas." );
  addComment("%x01: RAM visible at $A000-$BFFF and $E000-$FFFF." );
  addComment("%x10: RAM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF." );
  addComment("%x11: BASIC ROM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF." );
  addComment("%0xx: Character ROM visible at $D000-$DFFF. (Except for the value %000, see above)");
  addComment("%1xx: I/O area visible at $D000-$DFFF. (Except for the value %100, see above.)" );
  addComment("----------------------------------------------------------------------------------");
  addAsm( str_SEI );
  addAsm( str_LDA + "$01", 2, false );
  addAsm( str_AND + "#$F8", 2, false );

  if( isUintID($3.name) )
    {
      int v = getAddressOf($3.name);
      addAsm( str_ORA + getNameOf(v), 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      int v = atoi(stripFirst($3.name).c_str());
      addAsm( str_ORA + "#$" + toHex(v), 2, false );
    }
  else
    {
      addCompilerMessage( "romout(exp) takes UintID or a UintIMM only", 3 );
    }
  addAsm( str_STA + "$01", 2, false );
  addAsm( str_CLI );
}
// STATEMENT
| tROMIN '(' ')' ';'
{
  addDebugComment( "------------------------------------------------" );
  addComment( "romin() : Restore the default ROMS configuration" );
  addAsm( str_SEI );
  addAsm( str_LDA + "#$37" + commentmarker + "Default Value", 2, false );
  addAsm( str_STA + "$01", 2, false );
  addAsm( str_CLI );
  addDebugComment( "------------------------------------------------" );

}
// STATEMENT
| tSIDOFF '(' expression ')' ';'
{
  // THIS DOES NOT WORK
  // 2024 05 06 - mkpellegrino
  int tmp_addr = atoi(stripFirst($3.name).c_str());
  if( isWordIMM($3.name) )
    {
      addAsm( str_SEI );
      addAsm( str_LDA+"#$31", 2, false );
      addAsm( str_LDX+"#$EA", 2, false );
      addAsm( str_STA+"$0314", 3, false );
      addAsm( str_STX+"$0315", 3, false );
      addComment( "Taken from: https://www.lemon64.com/forum/viewtopic.php?t=48499" );
	addComment( "vvvvvvvvvvvvvvvvvvvv");

	addAsm( str_LDA+"#$81", 2, false );
	addAsm( str_STA+"$DC0D", 3, false );
	addAsm( str_LDA+"#$00", 2, false );
	addAsm( str_STA+"$D01A", 3, false );
	addAsm( str_INC+"$D019", 3, false );
	addAsm( str_LDA+"$DC0D", 3, false );
	if( sid_was_imported )
	  {
	    addAsm( str_JSR+"music.init", 3, false );
	  }
	else
	  {
	    // 2024 04 14 - mkpellegrino
	    //addAsm( str_JSR+getNameOf(tmp_addr), 3, false );
	    // 2024 04 24 - mkpellegrino (undid that change)
	    addAsm( str_JSR+"$"+toHex(tmp_addr), 3, false );
	  }
	addComment( "^^^^^^^^^^^^^^^^^^^");
	addAsm( str_CLI );
    }
  else
    {
      addCompilerMessage(string("Parameter must be an immediate value") + $3.name,3);
    }
  /* addAsm( str_LDA + "#$00", 2, false ); */
  /* addAsm( str_LDX + "#$18", 2, false ); */
  /* addAsm( str_STA + "$D400,X", 3, false ); */
  /* addAsm( str_DEX ); */
  /* addAsm( str_BYTE + "$F0, $FA" + commentmarker + "BEQ -5", 2, false  ); */
  //addAsm(".byte #$F0, #$FA; BEQ -5", 2, false );
};
// STATEMENT
| tSIDIRQ '(' expression ',' expression ')' ';'
{
  addComment( "sidirq(exp,exp)");
  if( isWordIMM( $3.name ) && isWordIMM( $5.name ) )
    {
      music_init_addr = atoi( stripFirst( $3.name ).c_str() );
      music_play_addr = atoi( stripFirst( $5.name ).c_str() );

      sidirq_is_needed = true;
      //int addr = getAddressOf($3.name);
      
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_TAX );
      addAsm( str_TAY );
      if( sid_was_imported )
	{
	  //addAsm( str_LDA + "#music.startSong-1", 2, false );
	  addAsm( str_JSR + "music.init", 3, false );
	}
      else
	{
	  //addAsm( str_LDA + "$" + toHex( music_play_addr ) + "-1", 3, false );
	  addAsm( str_JSR + "$" + toHex( music_init_addr ) + commentmarker + "initialise the SID music", 3, false );
	}

      
      //addAsm( str_JSR + "$1000; initialize the sid music", 3, false );
      //
      addAsm( str_SEI );

      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );

      // 2024 05 09 - mkpellegrino commented out
      //addAsm( str_AND + "$D011", 3, false );
      //addAsm( str_STA + "$D011", 3, false );

      addComment( "Enable Raster Interrupts" );
      // enable the raster int.  2023 05 15
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
   
      addAsm( str_LDY + "#$7E" + commentmarker + "raster line for trigger", 2, false );
      addAsm( str_STY + "$D012", 3, false );

      // 2024 05 09 - mkpellegrino added
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );
      // ------------------

      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_LDA + "#<SIDIRQ", 2, false );
      addAsm( str_LDX + "#>SIDIRQ", 2, false );
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_STX + "$0315", 3, false );
      
      addAsm( str_CLI );
    }
  else
    {
      addCompilerMessage( "invalid address of music routine", 3 );
    }
};
// STATEMENT
| tIRQ '(' expression {if(isXA($3.name)){p0=true;addAsm( str_PHA );addAsm( str_TXA );addAsm( str_PHA );}} ',' expression ',' expression ')' ';'{
  addCompilerMessage( "Don't forget to acknowledge the interrupt: asl(0xD019);", 0 );
  addComment( "tIRQ '(' expression ',' expression ',' expression ')' ';'" );
  
  int addr = getAddressOf( $3.name );
  
  int b = atoi(stripFirst($8.name).c_str());

  if(  b == 255 || b == -1 )
    {
      addComment( "Disable Raster Interrupt Signals from Vic" );
      addAsm( str_SEI );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addAsm( str_CLI );
    }
  else if( isWordIMM($3.name) && isUintIMM($6.name) )
    {
      addComment( "irq(WordIMM, UintIMM, #)" );
      int rasterline = atoi( stripFirst($6.name).c_str() );
      int functionaddr = atoi( stripFirst($3.name).c_str() );
      if( b == 1 ) addAsm( str_SEI );

      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );

      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );

      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA+"#$" + toHex(rasterline), 2, false );
      addAsm( str_STA + "$D012", 3, false ); 

      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );
      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_LDA + "#$" + toHex( get_word_L( functionaddr )), 2, false ); 
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_LDA + "#$" + toHex( get_word_H( functionaddr )), 2, false ); 
      addAsm( str_STA + "$0315", 3, false );
      if( b == 1 ) addAsm( str_CLI );
    }
  else if( isWordIMM($3.name) && isUintID($6.name) )
    {
      addComment( "irq(WordIMM, UintID, #)" );
      int rasterline = atoi( stripFirst($6.name).c_str() );
      int functionaddr = atoi( stripFirst($3.name).c_str() );
      if( b == 1 ) addAsm( str_SEI );

      addComment( "Disable CIA IRQs and NMIs" );

      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      // addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );

      addComment( "Enable Raster Interrupts" );

      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );

      addAsm( str_LDA + getNameOf(getAddressOf($6.name)), 3, false );
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );
      addComment( "The address of the function must be put into $0314/$0315" );

      addAsm( str_LDA + "#$" + toHex( get_word_L( functionaddr )), 2, false ); 
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_LDA + "#$" + toHex( get_word_H( functionaddr )), 2, false ); 
      addAsm( str_STA + "$0315", 3, false );
      if( b == 1 ) addAsm( str_CLI );
    }
  else if( isWordIMM($3.name) && isA($6.name) )
    {
      addComment( "irq(WordIMM, A, #)" );
      addAsm( str_PHA + commentmarker + "put the raster line onto the processor stack", 1, false);
      int functionaddr = atoi( stripFirst($3.name).c_str() );

      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );

      addComment( "Raster line to generate the Interrupt at" );

      addAsm( str_PLA + commentmarker + "the rasterline for the irq is in the processor stack", 1, false);
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );

      addComment( "The address of the function must be put into $0314/$0315" );

      
      addAsm( str_LDA + "#$" + toHex( get_word_L( functionaddr )), 2, false ); 
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_LDA + "#$" + toHex( get_word_H( functionaddr )), 2, false ); 
      addAsm( str_STA + "$0315", 3, false );
      if( b == 1 ) addAsm( str_CLI );
    }
  else if( isWordID($3.name) && isUintIMM($6.name) )
    {
      addComment( "irq(WordID, UintIMM, #)" );
      int rasterline = atoi( stripFirst($6.name).c_str() ); 
      if( b == 1 ) addAsm( str_SEI );

      
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA+"#$" + toHex(rasterline), 2, false );
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );
      
      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_LDA + $3.name, 2, false ); 
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_LDA + $3.name + " +1", 2, false ); 
      addAsm( str_STA + "$0315", 3, false );
      if( b == 1 ) addAsm( str_CLI );
    }
  else if( isWordID($3.name) && isUintID($6.name) )
    {
      addComment( "irq(WordID, UintID, #)" );
      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );

      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA + getNameOf(getAddressOf($6.name)), 3, false );
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );


      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_LDA + $3.name, 2, false ); 
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_LDA + $3.name + " +1", 2, false ); 
      addAsm( str_STA + "$0315", 3, false );
      if( b == 1 ) addAsm( str_CLI );


    }
  else if( isWordID($3.name) && isA($6.name) )
    {
      addComment( "irq(WordID, A, #)" );
      addAsm( str_PHA + commentmarker + "put the raster line onto the processor stack", 1, false);
      int functionaddr = atoi( stripFirst($3.name).c_str() );

      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_PLA + commentmarker + "the rasterline for the irq is in the processor stack", 1, false);
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );
      
      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_LDA + $3.name, 2, false ); 
      addAsm( str_STA + "$0314", 3, false );
      addAsm( str_LDA + $3.name + "+1", 2, false ); 
      addAsm( str_STA + "$0315", 3, false );
      if( b == 1 ) addAsm( str_CLI );

    }
  else if( isXA($3.name) && isUintIMM($6.name) )
    {
      // we _could_ just move a to y and then stx amd sty down below
      // into $0314
      addComment( "irq(XA, UintIMM, #)" );
      //addComment( "Address is on the Processor Stack" );
      //addAsm( str_TAY );
      addComment( "A(l) -> Y ... X(h) is in X" );
      int rasterline = atoi( stripFirst($6.name).c_str() );
      int functionaddr = atoi( stripFirst($3.name).c_str() );
      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA+"#$" + toHex(rasterline), 2, false );
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );


      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_PLA + commentmarker + "High Byte of Address of Routine", 1, false );
      addAsm( str_STA + "$0315", 3, false );
      addAsm( str_PLA + commentmarker + "Low Byte of Address of Routine", 1, false);
      addAsm( str_STA + "$0314", 3, false );
      if( b == 1 ) addAsm( str_CLI ); 
    }
  else if( isXA($3.name) && isUintID($6.name) )
    {
      addComment( "irq(XA, UintID, #)" );

      addComment( "Address is on the Processor Stack" );
      //addAsm( str_TAY );
      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA + getNameOf(getAddressOf($6.name)), 3, false );
      addAsm( str_STA + "$D012", 3, false );

      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );

      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_PLA + commentmarker + "High Byte of Address of Routine", 1, false );
      addAsm( str_STA + "$0315", 3, false );
      addAsm( str_PLA + commentmarker + "Low Byte of Address of Routine", 1, false);
      addAsm( str_STA + "$0314", 3, false );
      if( b == 1 ) addAsm( str_CLI ); 
    }
  else if( isXA($3.name) && isA($6.name) )
    {
      addComment( "irq(XA, A, #)" );
      addAsm( str_PHA + commentmarker + "put the raster line onto the processor stack", 1, false);
      int functionaddr = atoi( stripFirst($3.name).c_str() );

      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      //addAsm( str_LDA + "$DC0D", 3, false );
      //addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_PLA + commentmarker + "the rasterline for the irq is in the processor stack", 1, false);
      addAsm( str_STA + "$D012", 3, false );

      
      addAsm( str_LDA + "$D011", 3, false );
      addAsm( str_AND + "#$7F", 2, false );
      addAsm( str_STA + "$D011", 3, false );

      addComment( "The address of the function must be put into $0314/$0315" );
      addAsm( str_PLA + commentmarker + "High Byte of Address of Routine", 1, false );
      addAsm( str_STA + "$0315", 3, false );
      addAsm( str_PLA + commentmarker + "Low Byte of Address of Routine", 1, false);
      addAsm( str_STA + "$0314", 3, false );
      if( b == 1 ) addAsm( str_CLI ); 
    }
  else
    {
      addCompilerMessage( string($3.name) + ", " + $6.name + ", " + $8.name, 0 );
      addCompilerMessage( "Invalid raster line in irq function", 3 );
    }
													  };
// STATEMENT
| tSETSCR '(' expression ')' ';'
{
  addComment( "set screen memory address" );
  if( isUintIMM( $3.name ) || isIntIMM( $3.name ) )
    {
      int v = 16 * atoi( stripFirst( $3.name ).c_str());
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$0F", 2, false );
      addAsm( str_ORA + "#$" + toHex(v), 2, false);
      addAsm( str_STA + "$D018", 3, false );
    }
  else
    {
      addCompilerMessage( "wrong type for setting screen address", 3);
    }
};
// STATEMENT
| tJSR '(' expression ')' ';'
{
  addComment( "jsr( WordIMM );");
  if( isWordIMM( $3.name ) )
    {
      int where_to = atoi(stripFirst($3.name).c_str());
      if( where_to > 65535 || where_to < 0 ) addCompilerMessage( "invalid jsr (address out of range)", 3 );
      addAsm(str_JSR + "$" + toHex(where_to), 3, false );
    }
  else if( isWordID( $3.name ) )
    {
      int a = getAddressOf($3.name);
      addAsm( str_JSR + getNameOf(a), 3, false );
    }
  else
    {
      addCompilerMessage( "invalid JSR - argument needs to be a WordIMM/ID", 3 );
    }
};
| tBANK '(' expression ')' ';'
{
  // see the commodore 64 programmers manual
  // for a way more efficient routine
  addComment( "THIS SHOULD SAVE $02/$03, but doesn't yet!" );
  if( isA( $3.name ) || isXA( $3.name ) )
    {
      addComment( "bank( A );" );

      addAsm( str_PHA );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_ORA + "$DD02", 3, false );
      addAsm( str_STA + "$DD02", 3, false );
      addAsm( str_PLA );
      
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$02", 2, false );

      addAsm( str_LDA + "$DD00", 3, false );
      addAsm( str_AND + "#$FC", 2, false );
      //addAsm( str_LDA + "#$FC", 2, false );
      //addAsm( str_AND + "$DD00", 3, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$DD00", 3, false );
    }
  else if( isUintID( $3.name ) || isIntID( $3.name ) || isWordID( $3.name ) )
    {
      addComment( "bank( UintID );" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_ORA + "$DD02", 3, false );
      addAsm( str_STA + "$DD02", 3, false );

      int addr = getAddressOf( $3.name );
      addAsm( str_LDA + getNameOf( addr ), 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$02", 2, false );
      
      addAsm( str_LDA + "$DD00", 3, false );
      addAsm( str_AND + "#$FC", 2, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$DD00", 3, false );
    }
  else if( isUintIMM( $3.name ) || isIntIMM( $3.name ) )
    {
      addComment( "bank( UintIMM );" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_ORA + "$DD02", 3, false );
      addAsm( str_STA + "$DD02", 3, false );

      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA, 1, false );

      // POKE 0xDD00,(PEEK(0xDD00)AND 0xFC)OR1
      // mkpellegrino 2024 03 16
      int v = atoi( stripFirst( $3.name ).c_str());
      v = v ^ 255; // xor #$FF
      v = v & 3;   // and #$03
      addAsm( str_LDA + "#$" + toHex( v ), 2, false ); 
      //addAsm(str_EOR + "#$FF", 2, false );
      //addAsm( str_AND + "#$03", 2, false );

      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "$DD00", 3, false );
      addAsm( str_AND + "#$FC", 2, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$DD00", 3, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$02", 2, false );
    }
  else  
    {
      addCompilerMessage( "Error setting VIC-II Bank - unknown type", 3 );
    }
};
// STATEMENT
// 2023 05 02 : this IS needed to support Interrupt Routines
| tJMP '(' expression ')' ';'
{
  if( isWordIMM( $3.name ) )
    {
      int where_to = atoi(stripFirst($3.name).c_str());
      addComment( "jmp($" + toHex(where_to) + ")");
      if( where_to > 65535 || where_to < 0 ) addCompilerMessage( "invalid JMP (address out of range)", 3 );
      addAsm(str_JMP + "$" + toHex(where_to), 3, false );
    }
  else
    {
      addCompilerMessage( "invalid JMP", 3 );
    }
};
| tINLINE '(' STR ')' ';'
{
  string inlinestring = string($3.name);
  addAsm( inlinestring.substr(1,inlinestring.length()-2), 0, true );
}
| tINLINE '(' STR ',' expression ')' ';'
{
  string inlinestring = string($3.name);
  int size = atoi( stripFirst($5.name).c_str() );
  bool isItALabel = false;
  if( size == 0 )
    {
      isItALabel = true;
    }
  
  addAsm( inlinestring.substr(1,inlinestring.length()-2), size, isItALabel );
  //addAsm( string( "        " ) + inlinestring.substr(1,inlinestring.length()-2), size, true );
}
// STATEMENT
| tXXX '(' ')' ';'
{
  // I have no memory of this place -- Gandalf in Moria
  addComment( "special sprite collision interrupt test" );
  addComment( "write a routine in $033C" );
  addAsm( str_LDA + "#$EE" + commentmarker + "INC (abs)", 2, false );
  addAsm( str_STA + "$033C", 3, false );
  addAsm( str_LDA + "#$21", 2, false );
  addAsm( str_STA + "$033D", 3, false );
  addAsm( str_LDA + "#$D0", 2, false );
  addAsm( str_STA + "$033E", 3, false );
  addAsm( str_LDA + "#$60" + commentmarker + "RTS", 2, false );
  addAsm( str_STA + "$033D", 3, false );
  addAsm( str_SEI );
  addAsm( str_LDA + "#$7F", 2, false );
  addAsm( str_STA + "$DC0D", 3, false );
  addAsm( str_STA + "$DD0D", 3, false );
  addAsm( str_LDA + "$DC0D", 3, false );
  addAsm( str_LDA + "$DD0D", 3, false );
  addComment( "#$04 - sprite-sprite collision" );
  addAsm( str_LDA + "#$04", 2, false );
  addAsm( str_STA + "$D01A", 3, false );
  addAsm( str_LDA + "#$3C", 2, false );
  addAsm( str_STA + "$0314", 3, false );
  addAsm( str_LDA + "#$03", 2, false );
  addAsm( str_STA + "$0315", 3, false );  
  addAsm( str_CLI );
};
// STATEMENT
| tNOP '(' ')' ';'
{
  addAsm(str_NOP, 1, false );
};
// STATEMENT
| tMEMCPY '(' expression {} ',' expression {} ',' expression {} ')' ';'
{
  // TODO: Implement all the other types of arguments! - mkpellegrino 20230407
  addComment( string("memcpy(") + $3.name + "," + $6.name + "," + $9.name + ");" );
  if( isWordID($3.name) && isWordID($6.name) && isUintIMM($9.name) )
    {
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA );

      addAsm( str_LDA + "$FB", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$FC", 2, false );
      addAsm( str_PHA );

      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name))+"+1", 3, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($6.name)), 3, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($6.name))+"+1", 3, false );
      addAsm( str_STA + "$FC", 2, false );

      addAsm( str_LDY + "#$" + toHex(atoi(stripFirst($9.name).c_str())), 2, false ); // ldy size
      addAsm( "!:\t" + str_LDA + "($02),Y", 2, true);
      addAsm( str_STA + "($FB),Y", 2, false); 

      addAsm( str_DEY );
      addAsm( str_CPY + "#$00", 2, false );
      addAsm( str_BNE + "!-", 2, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$FC", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$FB", 2, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      
    }
  else if( isWordIMM($3.name) && isWordIMM($6.name) && isUintIMM($9.name) )
    {
      pushScope("memcpy");
      int addr_src = atoi(stripFirst($3.name).c_str());
      int addr_dst = atoi(stripFirst($6.name).c_str());
      int memcpy_size = atoi(stripFirst($9.name).c_str());
      if( addr_src > 65536 ) addCompilerMessage("memcpy source out of range",3);
      if( addr_dst > 65536 ) addCompilerMessage("memcpy destination out of range",3);
      if( memcpy_size > 255 ) addCompilerMessage("memcpy size out of range",3);
      if( memcpy_size == 0 ) addCompilerMessage("memcpy size out of range",3);
      // ----------------------------------
      // TODO: add another check here to see if the two regions overlap
      if( addr_src > addr_dst )
	{
	  if( memcpy_size > 255 ) addCompilerMessage("memcpy size out of range",3);
	  addComment( "memcpy R->L" );
	  // use the R->L memcpy
	  //addAsm( str_SEI );
	  addAsm( str_LDY + "#$00", 2, false );
	  addAsm( generateNewLabel(), 0, true ); // top-of-loop
	  addAsm( str_LDA + "$" + toHex(addr_src) + ",Y", 3, false );
	  addAsm( str_STA + "$" + toHex(addr_dst) + ",Y", 3, false );
	  addAsm( str_INY, 1, false );	  
	  addAsm( str_CPY + "#$" + toHex(memcpy_size), 2, false );
	  addAsm( str_BEQ + getLabel( label_vector[label_major],false), 2, false );
	  addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
	  addAsm( generateNewLabel(), 0, true );
	}
      else
	{
	  if( memcpy_size > 254 ) addCompilerMessage("memcpy size out of range for L->R copy",3);
	  addComment( "memcpy L->R" );	  
	  // use the L->R memcpy
	  //addAsm( str_SEI );
	  addAsm( str_LDY + "#$" + toHex(memcpy_size-1), 2, false );
	  addAsm( generateNewLabel(), 0, true );
	  addAsm( str_LDA + "$" + toHex(addr_src) + ",Y", 3, false );
	  addAsm( str_STA + "$" + toHex(addr_dst) + ",Y", 3, false );
	  addAsm( str_CPY + "#$00", 2, false );
	  addAsm( str_BEQ + getLabel( label_vector[label_major],false), 2, false );
	  addAsm( str_DEY, 1, false );
	  addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
	  addAsm( generateNewLabel(), 0, true );
	}
      popScope();
    }
  else if( isWordIMM($3.name) && isWordIMM($6.name) && isUintID($9.name) )
    {
      pushScope("memcpy");
      int addr_src = atoi(stripFirst($3.name).c_str());
      int addr_dst = atoi(stripFirst($6.name).c_str());
      int memcpy_size_addr = getAddressOf($9.name);
      if( addr_src > 65535 ) addCompilerMessage("memcpy source out of range",3);
      if( addr_dst > 65535 ) addCompilerMessage("memcpy destination out of range",3);
      int instr_size = 2;
      if( memcpy_size_addr > 255 ) instr_size = 3;
      addAsm( str_LDY + getNameOf(memcpy_size_addr) + commentmarker + getNameOf(memcpy_size_addr), instr_size, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_CPY + "#$FF", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major],false), 2, false );
      addAsm( str_LDA + "$" + toHex(addr_src) + ",Y", 3, false );
      addAsm( str_STA + "$" + toHex(addr_dst) + ",Y", 3, false );
      addAsm( str_DEY, 1, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      addAsm( generateNewLabel(), 0, true );
      popScope();

    }
  else if( isWordID($3.name) && isWordID($6.name) && isUintIMM($9.name) )
    {
      //pushScope("memcpy");
      addCompilerMessage( "memcpy(wordid,wordid,uintimm): Not Yet Implemented", 3 );
      //popScope();
    }
  else if( isXA( $3.name ) && isWordIMM($6.name) && isUintIMM($9.name) )
    {
      int dest_addr = atoi(stripFirst($6.name).c_str());
      int cpy_size = atoi(stripFirst($9.name).c_str());
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STX + "$03", 2, false );
      addAsm( str_LDA + "#$" + toHex(get_word_L(dest_addr)), 3, false );
      addAsm( str_STA + "$04", 2, false );
      addAsm( str_LDA + "#$" + toHex(get_word_H(dest_addr)), 3, false );
      addAsm( str_STA + "$05", 2, false );

      addAsm( str_LDY + "#$" + toHex(atoi(stripFirst($9.name).c_str())), 2, false ); // ldy size
      addAsm( "!:\t" + str_LDA + "($02),Y", 2, true);
      addAsm( str_STA + "($04),Y", 2, false); 

      addAsm( str_DEY );
      addAsm( str_CPY + "#$FF", 2, false );
      addAsm( str_BNE + "!-", 2, false );
    }
  else
    {
      addCompilerMessage( "memcpy not yet implemented for arguments of those types", 3 );
    }
}
// STATEMENT
| tPOKE '(' expression {addAsm("// MARKED_FOR_DELETION", 0, true);addComment( "mid-rule action");if(isXA($3.name)){stack_is_needed=true;addAsm(str_JSR+"PUSH",3,false);addAsm(str_TXA); addAsm(str_JSR+"PUSH",3,false);}} ',' expression {} ')' ';'
{
  // this makes it easier to change the number of sub-parameters
  string param1 = string($3.name);
  string param2 = string($6.name);
  
  addDebugComment( "poke( expression, expression );" );
  if( isWordID(param1) && (isUintID(param2) || isIntID(param2)) )
    {
      addComment( "poke( WordID, UintID );" );
      int addr_addr = getAddressOf(param1);
      int valu_addr = getAddressOf(param2);
      string tmp_addr_name = getNameOf(addr_addr);
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2;
      
      /* get & store the low byte of the poke address */
      addAsm( str_LDA + tmp_addr_name, instr_size, false ); 
      addAsm( str_STA + "!+", 3, false );

      /* get & store the high byte of the poke address */
      instr_size = 3;
      if( addr_addr+1 < 256 ) instr_size = 2;

      addAsm( str_LDA + tmp_addr_name + "+1", instr_size, false );
      addAsm( str_STA + "!++", 3, false );

      instr_size = 3;
      if( valu_addr < 256 ) instr_size = 2;

      addAsm( str_LDA + getNameOf(getAddressOf(param2)), instr_size, false );
      addAsm( str_BYTE + "$8D" + commentmarker + "STA absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isXA(param1) && isA(param2))
    {
      addComment( "poke( XA, A );" );
      addAsm( str_TAY ); 
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "!++", 3, false ); // X
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "!+", 3, false ); // A      
      addAsm( str_BYTE + "$8C" + commentmarker + "<-- STY absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isXA(param1) && (isUintID(param2) || isIntID(param2)) )
    {
      deletePreviousAsmUntil( "// MARKED_FOR_DELETION" );
      //deletePreviousAsm(); // JSR PUSH
      //deletePreviousAsm(); // TXA
      //deletePreviousAsm(); // JSR PUSH
      //if( arg_asm_comments )
      //{
      //  deletePreviousAsm(); // delete the comment
      //}
      addComment( "deleted previous 3 instructions" );
      
      addComment( "poke( XA, UIntID )" );
      
      int valu_addr = getAddressOf(param2);
      string value_name = getNameOf(valu_addr);
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_STX + "!++", 3, false );

      int instr_size = 3;
      if( valu_addr < 256 ) instr_size = 2;
      addAsm( str_LDA + value_name, instr_size, false );
      addAsm( str_BYTE + "$8D" + commentmarker + "<-- STA absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isXA(param1) && (isUintIMM(param2) || isIntIMM(param2)) )
    {
      deletePreviousAsmUntil( "// MARKED_FOR_DELETION");

      //deletePreviousAsm(); // JSR PUSH
      //deletePreviousAsm(); // TXA
      //deletePreviousAsm(); // JSR PUSH
      //if( arg_asm_comments )
      //	{
      //  deletePreviousAsm(); // delete the comment
      //}
      addComment( "deleted previous 3 instructions" );
      addComment( "poke( XA, UIntIMM) (self modifying code)" );
      int valu_addr = getAddressOf(param2);
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_STX + "!++", 3, false );
      int value = atoi( stripFirst(param2).c_str() );
      addAsm( str_LDA + "#$" + toHex( value ), 2, false );
      addAsm( str_BYTE + "$8D" + commentmarker + "<-- STA absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isWordID(param1) && (isUintIMM(param2) || isIntIMM(param2)) )
    {
      addComment( "poke(WordID, UintIMM);" );

      int addr_addr = getAddressOf(param1);
      int value = atoi( stripFirst(param2).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2; // it's in Zero Page
      
      /* get & store the low byte of the poke address */
      addAsm( str_LDA + getNameOf(addr_addr), instr_size, false );
      addAsm( str_STA + "!+", 3, false );
      /* get & store the high byte of the poke address */
      instr_size = 3;
      if( addr_addr+1 < 256 ) instr_size = 2;

      addAsm( str_LDA + getNameOf(addr_addr)+"+1", instr_size, false );
      addAsm( str_STA + "!++", 3, false );

      /* load the value into acc */
      addAsm( str_LDA + "#$" + toHex( value ), 2, false );

      /* store it in the instruction */
      addAsm( str_BYTE + "$8D" + commentmarker + "<-- STA absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isUintID(param1) && (isUintIMM(param2) || isIntIMM(param2)) )
    {
      addComment( "poke(UintID, UintIMM);" );

      int addr_addr = getAddressOf(param1);
      int value = atoi( stripFirst(param2).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2; // it's in Zero Page
      addAsm( str_LDA + getNameOf(addr_addr), instr_size, false );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_LDA + "#$" + toHex( value ), 2, false );
      addAsm( str_BYTE + "$85" + commentmarker + "<-- STA Zero Page", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isWordIMM(param1) && (isUintID(param2) || isIntID(param2)) )
    {
      addComment("poke( WordIMM, UIntID );" );
      int addr = atoi( stripFirst(param1).c_str() );
      if( addr < 0 || addr > 65536 ) addCompilerMessage( "address out of range [0,65535]", 3 );
      
      int value_addr = getAddressOf(param2);
      
      int instr_size = 3;
      if( value_addr < 256 ) instr_size = 2;
      addAsm( str_LDA + getNameOf(value_addr), instr_size, false );
      instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr ), instr_size, false );
    }
  else if( isWordIMM(param1) && (isUintIMM(param2) || isIntIMM(param2)) )
    {
      addComment("poke(WordIMM, UIntIMM);");
      int addr = atoi( stripFirst(param1).c_str() );
      if( addr < 0 || addr > 65536 ) addCompilerMessage( "address out of range [0,65535]", 3 );

      int value = atoi( stripFirst(param2).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );

      addAsm( str_LDA + "#$" + toHex( value ), 2, false );
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr ), instr_size, false );
    }
  else if( isWordIMM(param1) && isA(param2) )
    {
      addComment("poke( WordIMM, A)");
      int addr = atoi( stripFirst(param1).c_str() );
      if( addr < 0 || addr > 65536 ) addCompilerMessage( "address out of range [0,65535]", 3 );
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2; 
      addAsm( str_STA + "$" + toHex( addr ), instr_size, false );
    }
  else if( isWordID(param1) && isA(param2) )
    {
      addComment( "poke(WordID, A)" );
      pushScope("POKE( WordID, A )");
      addAsm( str_STA + "!+", 3, false );
      int addr_addr = getAddressOf(param1);
      int value = atoi( stripFirst(param2).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2; // it's in Zero Page
      addAsm( str_LDA + getNameOf(addr_addr), instr_size, false );
      addAsm( str_STA + "!++", 3, false );
      instr_size = 3;
      if( addr_addr < 255 ) instr_size = 2;
      addAsm( str_LDA + getNameOf(addr_addr) + "+1", instr_size, false ); 
      addAsm( str_STA + "!+++", 3, false );
      addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA immediate", 1, false );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
      addAsm( str_BYTE + "$8D" + commentmarker + "<-- STA absolute", 1, false );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
      popScope();
    }
  else if( isUintID(param1) && isA(param2) )
    {
      addComment( "poke(UintID, A) -- self modifying code" );
      addAsm( str_STA + "!+", 3, false );
      int addr_addr = getAddressOf(param1);
      int value = atoi( stripFirst(param2).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2; // it's in Zero Page
      addAsm( str_LDA + getNameOf(addr_addr), instr_size, false );
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA immediate", 1, false );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
      addAsm( str_BYTE + "$85" + commentmarker + "<-- STA Zero Page", 1, false );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
    }
  else if( (isUintIMM(param1)||isIntIMM(param1)) && (isUintIMM(param2)||isIntIMM(param2)))
    {
      addComment("poke( UIntIMM, UintIMM); (zp)");
      int addr = atoi( stripFirst(param1).c_str() );
      int value = atoi( stripFirst(param2).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "poke parameter out of range [0,255]", 3 );
      addAsm( str_LDA + "#$" + toHex( value ), 2, false );
      addAsm( str_STA + "$" + toHex( addr ), 2, false );
    }
  else
    {
      addCompilerMessage( "Invalid Poke Parameters", 3 );
    }
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

// COMPARISONS

// TODO: mkpellegrino - 2023 04 06
// there needs to be a change here:
// condition: expression {if(isA($1.name) addAsm( str_PHA );} relop expression
// which would make $2.name -> $3.name and $3.name -> $4.name
// then, when comparing anything with an A as OP1, it will need to be
// popped off of the processor stack
condition: expression[LHS] relop[OP] expression[RHS]
{
  addDebugComment( "=========================================================");
  addDebugComment( string( "condition in ") + scope_stack.top() );
  addParserComment( scope_stack.top() + " " + $1.name + $2.name + $3.name);
  addDebugComment( "=========================================================");
  string tc;
  //if( isXA($1.name ) ) tc+=string( "XA" );
  if( isXA($LHS.name) ) tc+=string( "XA" );
  if( isA($1.name ) ) tc+=string( "A" );
  if( isUintID($1.name) ) tc+=string( "UintID" );
  if( isIntID($1.name) ) tc+=string( "IntID" );
  if( isWordID($1.name) ) tc+=string( "WordID" );
  if( isDoubleID($1.name) ) tc+=string( "DoubleID" );
  if( isFloatID($1.name) ) tc+=string( "FloatID" );
  if( isUintIMM($1.name) ) tc+=string( "UintIMM" );
  if( isIntIMM($1.name) ) tc+=string( "IntIMM" );
  if( isWordIMM($1.name) ) tc+=string( "WordIMM" );
  if( isDoubleIMM($1.name) ) tc+=string( "DoubleIMM" );
  if( isFloatIMM($1.name) ) tc+=string( "FloatIMM" );
  tc+=string( " " );
  if( getAddressOf($1.name) == 0 )
    {
      tc+=$1.name;
    }
  else
    {
      tc+=string(getNameOf(getAddressOf($1.name)));
    }
  tc+=string( " vs. " );
  if( isA($3.name ) )
    {
      tc+=string( "A" );
      addAsm( str_STA + "$02", 2, false );
    }
  //if( isXA($3.name ) ) tc+=string( "XA" );
  if( isXA($RHS.name) ) tc+=string( "XA" );
  if( isUintID($3.name) ) tc+=string( "UintID" );
  if( isIntID($3.name) ) tc+=string( "IntID" );
  if( isWordID($3.name) ) tc+=string( "WordID" );
  if( isDoubleID($3.name) ) tc+=string( "DoubleID" );
  if( isFloatID($3.name) ) tc+=string( "FloatID" );
  if( isUintIMM($3.name) ) tc+=string( "UintIMM" );
  if( isIntIMM($3.name) ) addComment( "IntIMM" );
  if( isWordIMM($3.name) ) tc+=string( "WordIMM" );
  if( isDoubleIMM($3.name) ) tc+=string( "DoubleIMM" );
  if( isFloatIMM($3.name) ) tc+=string( "FloatIMM" );
  tc+=string( " " );

  if( getAddressOf($3.name) <= 0 )
    {
      tc+=$3.name;
    }
  else
    {
      tc+=string(getNameOf(getAddressOf($3.name)));
    }
  
  //tc+=string($3.name);
  
  addComment( tc );
  
  if( scope_stack.top() == "FOR" ) addAsm( generateNewLabel() + commentmarker + "Top of FOR Loop", 0, true );  
  if( scope_stack.top() == "WHILE" ) addAsm( generateNewLabel() + commentmarker + "Top of WHILE Loop", 0, true );  
  if( scope_stack.top() == "IF" ) addAsm( generateNewLabel() + commentmarker + "Top of IF statement", 0, true );  

  
  // at this point, we need to look at the type of the variable that is located
  // at the $1.name address, so we know how to compare it with another number

  if( isUintID($1.name) && string($2.name) == string( ">=" ) && (!isA($3.name)) &&  atoi(stripFirst($3.name).c_str()) == 0 )
    {
      addCompilerMessage( "UINTs can ONLY be >= 0... this line of code will lead to an infinite loop", 3 );
    }

  if( isUintID($1.name) && string($2.name) == string( "<" ) && (isUintIMM($3.name) || isIntIMM($3.name) ) &&  atoi(stripFirst($3.name).c_str()) == 0 )
    {
      addCompilerMessage( "UINTs can ONLY be >= 0... this line of code will lead to an infinite loop", 3 );
    }

  if( isIntID($1.name) && string($2.name) == string( ">" ) && (isUintIMM($3.name) || isIntIMM($3.name) ) && atoi(stripFirst($3.name).c_str()) == 128 )
    {
      addCompilerMessage( "INTs can ONLY be between -127 and +128... this line of code will lead to an infinite loop", 3 );
    }
 

  if( isIntID($1.name) && string($2.name) == string( "<=" ) && (isUintIMM($3.name) || isIntIMM($3.name) ) && atoi(stripFirst($3.name).c_str()) == 128 ) 
    {
      addCompilerMessage( "INTs can ONLY be between -127 and +128... this line of code will lead to an infinite loop", 3 );
    }

  // ====================================================================================================================
  //                 COMPARISONS START HERE
  // ====================================================================================================================
  if( isFloatIMM($1.name) && isFloatID($3.name)) 
    {
      addComment( "FloatIMM relop FloatID" );
		  
      // FP Operations
      inlineFloat( $1.name, 105);
      current_variable_base_address = getAddressOf($3.name);
      string tmp_name = getNameOf(current_variable_base_address);

      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false );

      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_LDA + "#$69", 2, false );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_JSR + "$BC5B" + commentmarker + "CMP(FAC, RAM)", 3, false );
    }
  else if( isXA($1.name) && isWordIMM($3.name))  // mismatch
    {
      addComment( "XA relop WordIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_CMP + "#$" + toHex( tmp_H ), 2, false ); 
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_TYA );
      addAsm( str_CMP + "#$" + toHex( tmp_L ), 2, false );
      addAsm( "!:", 0, true );
    }
  else if( isXA($1.name) && isUintIMM($3.name))  // mismatch
    {
      // This should be more like XA relop WordIMM
      addComment( "XA relop UintIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());

      // save A in Y
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_CMP + "#$00", 2, false ); 
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_TYA );
      addAsm( str_CMP + "#$" + toHex( tmp_v ), 2, false );
      addAsm( "!:", 0, true );
    }
  else if( isXA($1.name) && isWordID($3.name))  // mismatch
    {
      addComment( "XA relop WordID" );
      int tmp_v = getAddressOf( $3.name );
      addAsm( str_CPX + getNameOf( tmp_v ) + "+1", 3, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_CMP + getNameOf( tmp_v ), 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isWordID($1.name) && isXA($3.name))  // mismatch
    {
      addComment( "WordID relop XA" );
      addCompilerMessage("Swapping WordID and XA in comparison would be more efficient", 1);
      int tmp_v = getAddressOf( $1.name );
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_STX + "!+", 3, false );
      addAsm( str_LDX + getNameOf( tmp_v ) + " +1", 3, false );
      // CPX #$00
      addAsm( str_BYTE + "$E0" + commentmarker + "<-- CPX Immediate", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( str_BNE + "!++", 2, false );
      addAsm( str_LDA + getNameOf( tmp_v ), 3, false );
      // CMP #$00
      addAsm( str_BYTE + "$C9" + commentmarker + "<-- CMP Immediate", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:", 0, true );
    }
  else if( isA($1.name) && isWordID($3.name))  // mismatch
    {
      addCompilerMessage( "A relop WordID (type mismatch)", 1 );
      addComment( "A relop WordID" );
      int tmp_v = getAddressOf( $3.name );
      addAsm( str_TAY );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_CMP + getNameOf( tmp_v ) + " +1", 3, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_TYA );
      addAsm( str_CMP + getNameOf( tmp_v ), 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isA($1.name) && isUintID($3.name))
    {
      addComment( "A relop UintID" );
      int tmp_v = getAddressOf($3.name);
      addAsm( str_CMP + getNameOf( tmp_v ), 3, false );
    }
  else if( isA($1.name) && isUintIMM($3.name))
    {
      addComment( "A relop UintIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());
      addAsm( str_CMP + "#$" + toHex( tmp_v ), 2, false );
    }
  else if( isA($1.name) && isIntIMM($3.name))  // mismatch
    {
      addCompilerMessage( "comparing A with IntIMM (type mismatch)", 1 );
      addComment( "A relop IntIMM (mismatch)" );
      int tmp_v = atoi(stripFirst($3.name).c_str());

      if( tmp_v < 0 )
	{
	  addDebugComment( "Value is negative (so it's in two's complement)" );
	  tmp_v = twos_complement(tmp_v);
	}
      
      addAsm( str_CMP + "#$" + toHex( tmp_v ), 2, false );
    }
  else if( isUintID($1.name) && isIntID($3.name))  // mismatch
    {
      addCompilerMessage( "UintID relop IntID (type mismatch)", 1 );
      addComment( "UintID relop IntID (mismatch)" );
      // if the address of $1 or $3 < 256... change instr size to 2
      unsigned_signed_cmp_is_needed = true;
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP" + commentmarker + "unsigned comparison", 3, false );
      addAsm( str_PLP );
    }
  else if( isUintIMM($1.name) && isIntID($3.name) )  // mismatch
    {
      addCompilerMessage( "UintIMM relop IntID (type mismatch)", 1 );
      addComment( "UintIMM relop IntID (mismatch)" );

      unsigned_signed_cmp_is_needed = true;
      int i = atoi(stripFirst($1.name).c_str());
      if( i > 255 ) addCompilerMessage( "uint out of range (0-255)", 2 );
      addAsm( str_LDA + "#$" + toHex(i), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP" + commentmarker + "unsigned comparison", 3, false );
      addAsm( str_PLP );
    }
  else if( isUintID($1.name) && isIntIMM($3.name) )  // mismatch
    {
      addCompilerMessage( "UintID relop IntIMM (type mismatch)", 1 );
      addComment( "UintID relop IntIMM (mismatch)" );

      unsigned_signed_cmp_is_needed = true;

      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_PHA );
      int i = atoi(stripFirst($3.name).c_str());
      if( i < 0 )
	{
	  i = twos_complement(i);
	}
      addAsm( str_LDA + "#$" + toHex(i), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP" + commentmarker + "unsigned comparison", 3, false );
      addAsm( str_PLP );
    }
  else if( isIntIMM($1.name) && isUintID($3.name) )  // mismatch
    {
      addCompilerMessage( "IntIMM relop UIntID (type mismatch)", 1 );

      addComment( "IntIMM relop UIntID (mismatch)" );

      unsigned_signed_cmp_is_needed = true;

      int i = atoi(stripFirst($1.name).c_str());
      if( i < 0 )
	{
	  i = twos_complement(i);
	}
      addAsm( str_LDA + "#$" + toHex(i), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP" + commentmarker + "unsigned comparison", 3, false );
      addAsm( str_PLP );
    }
  else if( isUintID($1.name) && isA($3.name) )
    {
      addComment( "UIntID relop A (mismatch)" );
      addDebugComment( "swap A and UintID before comparison (also preserve $02)" );
      addAsm( str_TAX );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_TAY );
      addAsm( str_STX + "$02", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_CMP + "$02", 2, false );
      addAsm( str_STY + "$02", 2, false );
    }
  else if( isIntID($1.name) && isA($3.name) )  // mismatch
    {
      // 2024 05 10 - mkpellegrino
      addCompilerMessage( "IntID relop A (type mismatch)", 1 );
      addComment( "IntID relop A (mismatch)" );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isA($1.name) && isXA($3.name) )
    {
      addCompilerMessage( "A relop XA: nyi", 3 );
    }
  else if( isXA($1.name) && isA($3.name) )
    {
      addCompilerMessage( "XA relop A: nyi", 3 );
    }
  else if( isXA($1.name) && isXA($3.name) )
    {
      addCompilerMessage( "XA relop XA: nyi", 3 );
      addComment( "XA relop XA" );
      // TODO: Fix THIS using a mid-rule action (by pushing one of the A's onto stack)
      addComment( "both values to compare are in XA... FIX THIS!!!" );
      addCompilerMessage( "illegal compare; LHS and RHS are both in XA", 2  );
    }
  else if( isA($1.name) && isA($3.name) )
    {
      addCompilerMessage( "A relop A: nyi", 3 );
      addComment( "A relop A" );
      // TODO: Fix THIS using a mid-rule action (by pushing one of the A's onto stack)
      addComment( "both values to compare are in A... FIX THIS!!!" );
      addCompilerMessage( "illegal compare; LHS and RHS are both in A", 2  );
    }
  else if( isUintID($1.name) && isUintID($3.name))
    {
      addComment("UintID relop UintID");
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_CMP + getNameOf(getAddressOf($3.name)), 3, false );
    }
  else if( isUintID($1.name) && isUintIMM($3.name))
    {
      int tmp_addr = getAddressOf($1.name);
      string tmp_name = getNameOf(tmp_addr);
      addComment("UintID relop UintIMM");
      // Done
      addAsm( str_LDA + tmp_name, 3, false );
      addAsm( str_CMP + "#$"  + toHex( atoi(stripFirst($3.name).c_str() )), 2, false );
    }
  else if( isUintIMM($1.name) && isUintID($3.name))
    {
      addCompilerMessage( "UintIMM relop UintID (type mismatch)", 1 );
      addComment("UintIMM relop UintID");
      addAsm( str_LDA + "#$" + toHex( atoi(stripFirst($1.name).c_str() )), 2, false );
      addAsm( str_CMP + getNameOf(getAddressOf($3.name)), 3, false );
    }
  else if( isUintIMM($1.name) && isUintIMM($3.name))
    {
      addComment("UintIMM relop UintIMM");
      addCompilerMessage( "Comparing of 2 Immediate values (just hard code it)", 1 );
      addAsm( str_LDA + "#$" + toHex( atoi(stripFirst($1.name).c_str() )), 2, false );
      addAsm( str_CMP + "#$" + toHex( atoi(stripFirst($3.name).c_str() )), 2, false );
    }
  else if( isIntID($1.name) && isIntID($3.name) )
    {
      addComment("IntID relop IntID");

      signed_comparison_is_needed = true;
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isIntID($1.name) && isIntIMM($3.name) )
    {
      addComment("IntID relop IntIMM");

      signed_comparison_is_needed = true;
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );

      addAsm( str_PHA );
      
      int i = atoi(stripFirst($3.name).c_str() );
      if( i < 0 )
	{
	  i = twos_complement( i );
	}
      
      addAsm( str_LDA + "#$" + toHex(i), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isIntID($1.name) && isUintIMM($3.name) )
    {
      addCompilerMessage( "IntID relop UintIMM (type mismatch)", 1 );
      addComment("IntID relop UIntIMM");

      if( atoi($3.name) > 127 || atoi($3.name) < -127 )
	addCompilerMessage( "value out of range for INT comparison", 3 );
	
      signed_comparison_is_needed = true;
      
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$" + toHex( atoi(stripFirst($3.name).c_str() )), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isIntIMM($1.name) && isIntID($3.name) )
    {
      addCompilerMessage( "IntIMM relop IntID (type mismatch)", 1 );
      addComment("IntIMM relop IntID");

      signed_comparison_is_needed = true;
      int OP1 = atoi(stripFirst($1.name).c_str());
      if( OP1 < 0 )
	{
	  OP1 = twos_complement( OP1 );
	}
      addAsm( str_LDA + "#$" + toHex( OP1 ), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isIntIMM($1.name) && isIntIMM($3.name) )
    {
      addComment("IntIMM relop IntIMM");
      addCompilerMessage( "comparing 2 Immediate values... just hardcode it!", 1 );
      signed_comparison_is_needed = true;
      int OP1 = atoi(stripFirst($1.name).c_str());
      if( OP1 < 0 )
	{
	  OP1 = twos_complement( OP1 );
	}
      int OP2 = atoi(stripFirst($3.name).c_str());
      if( OP2 < 0 )
	{
	  OP2 = twos_complement( OP2 );
	}
      addAsm( str_LDA + "#$" + toHex( OP1 ), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$" + toHex( OP2 ), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isFloatID($1.name) && isFloatIMM($3.name))
    {
      addComment("FloatID relop FloatIMM");
      inlineFloat($3.name, 105 );
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($1.name)), 2, false ); 
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false );
      addAsm( str_LDA + "#$69", 2, false );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_JSR + "$BC5B" + commentmarker + "CMP(FAC, RAM)", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_PHA );
      signed_comparison_is_needed = true;
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isWordID($1.name) && isUintID($3.name) )
    {
      addCompilerMessage( "WordID relop UintID (type mismatch)", 1 );
      addComment("WordID relop UintID");

      addAsm( str_LDX + "#$01", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",X",3, false ); 
      addAsm( str_CMP + "#$00", 2, false );
      addDebugComment( "if A is NOT 0, then WORD > UINT" );
      addAsm( str_BNE + "!+", 2, false );
      addCompilerMessage( "If address of OP1 or OP2 is in Zero Page, instruction size may vary", 0);
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_CMP + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isFloatID($1.name) && isFloatID($3.name) )
    {
      addComment("FloatID relop FloatID");
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($1.name)), 2, false ); 
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "FP -> FAC", 3, false ); // FP ->FAC
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false ); 
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false );
      addAsm( str_JSR + "$BC5B", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_PHA );
      signed_comparison_is_needed = true;
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isWordID($1.name) && isWordID($3.name))
    {
      addComment("WordID relop WordID");
      addAsm(str_LDA + getNameOf(getAddressOf($1.name)) + "+1", 3, false );
      addAsm(str_CMP + getNameOf(getAddressOf($3.name)) + "+1", 3, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm(str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm(str_CMP + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( "!:", 0, true );
    }
  else if( isWordID($1.name) && isWordIMM($3.name))
    {
      addComment("WordID relop WordIMM");
      addComment( getNameOf(getAddressOf($1.name)) + " relop " + $3.name );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + "+1", 3, false );
      addAsm( str_CMP + "#$" + toHex(get_word_H(atoi(stripFirst($3.name).c_str()))), 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_CMP + "#$" + toHex(get_word_L(atoi(stripFirst($3.name).c_str()))), 2, false );
      addAsm( "!:", 0, true );
    }
  else
    {
      addCompilerMessage( "Comparing of these two types is not yet handled", 3 );
    }
  
  // ====================================================================================================================
  if( scope_stack.top() == "FOR" ) 
    {
      if( string($2.name) == string( "<=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to BODY", 2, false );
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false) + commentmarker +  "if z==1 jump to BODY", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BCS + "!_skip+", 2,  false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to BODY", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_BNE + "!_skip+", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to BODY", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR (OPTIMIZE)", 3, false );
	    }
	}
      else if( string($2.name) == string( "==" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to BODY", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BNE + "!_skip+", 2, false ); // BNE +3
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to BODY", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR (OPTIMIZE)", 3, false );
	    }
	}
      else if( string($2.name) == string( ">" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+2, false) + commentmarker + "if z==1 jump out of FOR", 2, false );
	      addAsm( str_BCC + getLabel( label_vector[label_major]+2, false) + commentmarker + "if c==0 jump out of FOR", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to body of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BNE + "!_skip+", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "if z==1 jump out of FOR", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_BCS + "!_skip+", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "if c==0 jump out of FOR (OPTIMIZE)", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to body of FOR", 3, false );
	    }
	}
      else if( string($2.name) == string( "<" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to BODY", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BCS + "!_skip+", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to BODY", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR (OPTIMIZE)" , 3, false );
	    }
	}
      else if( string($2.name) == string( ">=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCS + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to BODY", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BCC + "!_skip+", 2, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_JMP  + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to BODY", 3, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR (OPTIMIZE)", 3, false );
	    }
	}
      else /* != ... NOT EQUAL TO */
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BNE + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==0 jump to BODY" , 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BEQ + "!+", 2, false );
	      addAsm( str_JMP +  getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==0 jump to BODY", 3, false );
	      addAsm( "!:\t" + str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR (OPTIMIZE)", 3, true );
	    }
	}
    }
  else if( scope_stack.top() == "IF" || scope_stack.top() == "WHILE" )
    {
      if( string($2.name) == string( "<=" ) )
	{
	  if( long_branches == false )
	    {
	      //addAsm( str_BCC + getLabel( label_vector[label_major], false) + commentmarker + "if c==0 jump to THEN", 2, false );
	      //addAsm( str_BEQ + getLabel( label_vector[label_major], false) + commentmarker + "if z==1 jump to THEN", 2, false );
	      //addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE", 3, false );
	      //strcpy($$.name, "exp <= exp sb" );
	    }
	  else
	    {
	      addAsm( str_BCS + "!_skip+", 2, false ); // BCS +3
	      addAsm( str_JMP + getLabel( label_vector[label_major], false) + commentmarker + "if c==0 jump to BODY", 3, false );
	      addAsm( "!_skip:", 0, true );

	      addAsm( str_BNE + "!_skip+", 2, false ); // BNE +3
	      addAsm( str_JMP + getLabel( label_vector[label_major], false) + commentmarker + "if z==1 jump to BODY", 3, false );
	      addAsm( "!_skip:", 0, true );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE (OPTIMIZE)", 3, false );
	      strcpy($$.name, "exp <= exp lb" );
	    }
	}   
      else if( string($2.name) == string( "==" ) )
	{
	  
	  addAsm( str_BEQ + "!_skip+", 2, false );
	  addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE (OPTIMIZE)", 3, false );
	  addAsm( "!_skip:", 0, true );
	  strcpy($$.name, "exp == exp" );
	}
      else if( string($2.name) == string( ">" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to ELSE", 2, false );
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE", 2, false );
	      
	      strcpy($$.name, "exp > exp sb" ); // shortbranches
	    }
	  else
	    {
	      addAsm( str_BCS + "!_skip+", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to ELSE" , 3, false );
	      addAsm( "!_skip:", 0, true );	      
	      addAsm( str_BNE + "!_skip+", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE (OPTIMIZE)" , 3, false );
	      addAsm( "!_skip:", 0, true );
	      strcpy($$.name, "exp > exp lb" ); // longbranches
	    }
	}
      else if( string($2.name) == string( "<" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major], false) + commentmarker + "if c==0 jump to THEN", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + " jump to ELSE", 3, false );
	      strcpy($$.name, "exp < exp sb" ); // shortbranches
	    }
	  else
	    {
	      addAsm( str_BCC + "!_skip+", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE (OPTIMIZE)", 3, false );
	      addAsm( "!_skip:", 0, true );
	      strcpy($$.name, "exp < exp lb" ); // longbranches
	    }
	}
      else if( string($2.name) == string( ">=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to ELSE", 2, false );	      
	      strcpy($$.name, "exp >= exp sb" ); // shortbranches
	    }
	  else
	    {
	      addAsm( str_BCS + "!_skip+", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to ELSE (OPTIMIZE)", 3, false );
	      addAsm( "!_skip:", 0, true );
	      strcpy($$.name, "exp >= exp lb" ); // longbranches
	    }
	}
      else /* != ... NOT EQUAL TO */
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BEQ  + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE", 2, false );
	      strcpy($$.name, "exp != exp sb" ); // shortbranches
	    }
	  else
	    {
	      addAsm( str_BNE + "!_skip+", 2, false ); // BNE +3
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE (OPTIMIZE)", 3, false );
	      addAsm( "!_skip:", 0, true );
	      strcpy($$.name, "exp != exp lb" ); // longbranches
	    }
	}
    }
  else
    {
      addComment( "Unknown Conditional" );
    }

  addComment( "=========================================================");  
      
}
| condition
{
  string _tmpCond = $1.name;
  if( _tmpCond == "exp == exp" )
    {
      // 7 bytes
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 3 instructions" );
      addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false), 2, false);    
    }
  else if( _tmpCond == "exp > exp lb" )
    {
      // 14 bytes
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 5 instructions" );

      addAsm( str_JMP + getLabel( label_vector[label_major], false) + commentmarker + "if z==1 jump to 2nd condition", 3, false );
      addAsm( "!_skip:", 0, true );
      addAsm( str_BNE + getLabel( label_vector[label_major]+1, false) + commentmarker + "branch to body of IF", 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major], false) + commentmarker + "if z==1 jump to 2nd condition (OPTIMIZE)", 3, false );
    }
  else if( _tmpCond == "exp < exp lb" )
    {
      // 9 bytes
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 3 instructions" );

      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "branch to body of IF", 2, false );
    }
  else if( _tmpCond == "exp >= exp lb" )
    {
      // 9 bytes
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 3 instructions" );

      addAsm( str_BCS + getLabel( label_vector[label_major]+1, false) + commentmarker + "branch to body of IF", 2, false );
    }
  else if( _tmpCond == "exp <= exp lb" )
    {
      addCompilerMessage( "you could save 3 bytes by swapping operands in condition and changing it to: '>'", 0 );
      // 17 bytes
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 5 instructions" );

      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "Jump to body of IF", 2, false );
      addAsm( "!_skip:", 0, true );
      addAsm( str_BNE + "!_skip+", 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "Jump to body of IF (OPTIMIZE)", 2, false );
      addAsm( "!_skip:", 0, true );
      
    }
  else if( _tmpCond == "exp != exp lb" )
    {
      // 9 bytes
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 3 instructions" );

      addAsm( str_BNE + getLabel( label_vector[label_major]+1, false) + commentmarker + "branch to body of IF", 2, false );
    }
  
  //addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false), 3, false);

} tOR {} condition {}
{
  addComment( "condition tOR condition" );
}
| condition
{
  string _tmpCond = $1.name;
  if( _tmpCond == "exp == exp" )
    {
      // TODO CHECK THIS ONE (there may be a comment in there that it's deleting w/o checking to see if comments are on
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 2 instructions" );

      //deletePreviousAsm();
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false), 3, false);
      addAsm( "!_skip:", 0, true );
    }
  else if( _tmpCond == "exp > exp lb" )
    {
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 5 instructions" );
 
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false), 3, false);
      addAsm( "!_skip:", 0, true );
      addAsm( str_BNE + "!_skip+", 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false), 3, false);
      addAsm( "!_skip:", 0, true ); 
    }
  else if( _tmpCond == "exp <= exp lb" )
    {
      if( arg_asm_comments )
      	{
	  deletePreviousAsm();
	}
      
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 5 instructions" );

      addAsm( str_JMP + getLabel( label_vector[label_major], false), 3, false);
      addAsm( "!_skip:", 0, true );
      addAsm( str_BNE + "!_skip+", 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major], false), 3, false);
      addAsm( "!_skip:", 0, true );
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false), 3, false);
      
    }
  else if( _tmpCond == "exp >= exp lb" )
    {
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
	  
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 2 instructions" );
 
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "JMP to else (OPTIMIZE)", 3, false);
      addAsm( "!_skip:", 0, true );
    }
  else if( _tmpCond == "exp < exp lb" )
    {
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
	  
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 2 instructions" );
      
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "JMP to else (OPTIMIZE)", 3, false);
      addAsm( "!_skip:", 0, true );
    }
  else if( _tmpCond == "exp != exp lb" )
    {
      if( arg_asm_comments )
	{
	  deletePreviousAsm();
	}
	  
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "deleted previous 2 instructions" );
     
      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "JMP to else (OPTIMIZE)", 3, false);
      addAsm( "!_skip:", 0, true );
    }

  // TODO: Implement the rest of these to coincide with all of the exp relop exp's
  
} tAND {} condition {}
{
  addComment( "condition tAND condition" );
  //addAsm( "!_body:", 0, true );
  //addCompilerMessage( "Logical anding of 2 conditions is very poorly implemented. (if A && B)", 1 );
};

| TRUE { add('K'); $$.nd = NULL; }
| FALSE { add('K'); $$.nd = NULL; }
| { $$.nd = NULL; }
;

statement: datatype ID init
{
  // Variable Initialisations
  string _dt = string($1.name);
  string _id = string($2.name);
  string _init = string($3.name);

  if( int_uint )
    {
      addCompilerMessage( "Initialising a signed integer with an unsigned integer that is > 127.  Chaos may ensue.", 1 );
    }
  int_uint = false;
			  
      
  //  ASSIGNMENTS
  current_variable_type = getDataTypeValue( _dt );

  // this adds the variable to the list of variables
  addAsmVariable(_id, current_variable_type );

  current_variable_base_address = getAddressOf(_id);

  if(isFloatDT(_dt) && isFloatID(_id) && isARG(_init))
    {
      addCompilerMessage( "float ID = ARG has been removed (for now)", 3 );
      addComment( "Float FloatID = ARG" );
      //addAsm( str_LDA + "#69", 2, false );
      //addAsm( str_LDY + "#$00", 2, false );
      //addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_JSR + "$BBFC" + commentmarker + "ARG -> FAC", 3, false );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf(_id)), 2, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_id)), 2, false ); 
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if( isNULL(_init) )
    {
      addCompilerMessage( "Uninitialised variable may contain garbage", 0 );
    }
  else if( _init == string("Slipstream"))
    {
      // I have no idea WTF I was thinking here... Slipstream?!?
      if( (isIntDT(_dt) || isUintDT(_dt)) && (isIntID(_id) || isUintID(_id)) )
	{
	  addCompilerMessage( "slipstreaming " + _id, 0 );
	  int addr1 = getAddressOf(_id);
	  int instr_size = 3;
	  if( addr1 < 256 ) instr_size = 2;
	  addAsm( str_STA + _id + commentmarker + "$" + toHex(addr1), instr_size, false );
	}
      else if( isWordDT(_dt) && isWordID(_id) )
	{
	  addCompilerMessage( "slipstreaming " + _id, 0 );
	  int addr1 = getAddressOf(_id);
	  int addr2 = getAddressOf(_id)+1;
	  int instr_size = 3;
	  if( addr1 < 256 ) instr_size = 2;
	  addAsm( str_STA + _id + commentmarker + "$" + toHex(addr1), instr_size, false );

	  instr_size = 3;
	  if( addr2 < 256 ) instr_size = 2;
	  addAsm( str_STX + _id + "+1" + commentmarker + "$" + toHex(addr1+1), instr_size, false );
	}
      else if( isFloatDT(_dt) && isFloatID(_id)  )
	{
	  addCompilerMessage( "Uninitialised float may contain garbage", 0 );
	}
    }
  else if(isFloatDT(_dt) && isFloatID(_id) && isXA(_init))
    {
      addComment( "FLOAT FloatID = XA" );
      addComment( "^v^ OPTIMIZE v^v" );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf( _id )), 3, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf( _id )), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if(isFloatDT(_dt) && isFloatID(_id) && isA(_init))
    {
      addComment( "Float FloatID = A" );
      addComment( "^v^ OPTIMIZE v^v" );
      addAsm( str_TAY, 1, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf( _id )), 3, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf( _id )), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if(isFloatDT(_dt) && isFloatID(_id) && isFAC(_init))
    {
      addComment( "FLOAT FloatID = FAC" );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf(_id)), 2, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_id)), 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if(isFloatDT(_dt) && isFloatID(_id) && isFloatIMM(_init))
    {
      addCompilerMessage( "This shouldn't trigger", 3 );
      addComment( "float FloatID = FloatIMM" );
      inlineFloat(_init, current_variable_base_address );
    }
  else if(isUintDT(_dt) && isUintID(_id) && isA(_init))
    {
      addComment( "Uint UintID = A" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm(str_STA + _id, instr_size, false );
    }
  else if(isIntDT(_dt) && isIntID(_id) && isA(_init))
    {
      addComment( "Int IntID = A" ); 
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm(str_STA + _id, instr_size, false );
    }
  else if((isUintDT(_dt)||isIntDT(_dt)) && (isUintID(_id)||isIntID(_id)) && isXA(_init))
    {
      addComment( "Uint/Int UintID/IntID = XA " );
      addCompilerMessage("Initialising a 1 byte memory location with a 2 byte value; losing High Byte",0);
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm( str_STA + _id, instr_size, false );
    }
  else if( isWordDT(_dt) && isWordID(_id) && isA(_init) )
    {
      addCompilerMessage("Initialising a 2 byte memory location with a 1 byte value",0);
      addComment( "word WordID = A" );
      illegal_operations_are_needed = true;
      addAsm( str_LDX + "#$00", 2, false );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm(str_STA + _id, instr_size, false );	    
      instr_size = 3;
      if( current_variable_base_address+1 < 256 ) instr_size = 2;
      addAsm(str_STX + _id + "+1", instr_size, false );
    }
  else if( isWordDT(_dt) && isWordID(_id) && isXA(_init))
    {
      addComment( "word WordID = XA" );
      addAsm(str_STA + _id, 3, false );
      addAsm(str_STX + _id + " +1", 3, false );
    }
  else if(isWordDT(_dt) && isWordID(_id) && isFAC(_init))
    {
      addComment("word WordID = FAC" );
      addCompilerMessage( "16-bit word is signed", 0 );
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      addAsm( str_STY + getNameOf(getAddressOf($2.name)), 3, false );
      addAsm( str_STA + getNameOf(getAddressOf($2.name)) + " +1", 3, false ); 
    }
  else if(isUintDT(_dt) && isUintID(_id) && isFAC(_init))
    {
      addComment("uint ID = FAC" );
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      // if A is != #$00, then Y should = #$FF
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_LDY + "#$FF", 2, false );
      addAsm( "!:\t" + str_STY + getNameOf(getAddressOf($2.name)), 3, true );
    }
  else if(isIntDT(_dt) && isIntID(_id) && isFAC(_init))
    {
      addCompilerMessage( "Possible SIGN issues", 1 );
      addComment("int ID = FAC" );
      // if the bit 15 == 1 then it's negative... otherwise it's positive
      addCompilerMessage( "16-bit word is signed", 0 );

      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      addAsm( str_STY + getNameOf(getAddressOf($2.name)), 3, false );
    }

  else if(isMOB(_init))
    {
      addCompilerMessage( "MOB type has been removed (for now)", 3 );
      if( mob_vector[1] > 255 || mob_vector[1] < 0 ) addCompilerMessage( "MOB Pointer out of range", 3 );
      pushScope("MOB");
      addAsm( str_LDA + "#$" + toHex(mob_vector[1]), 2, false );
      addAsm( str_STA + _id, 3, false );
      int sprite_number = mob_vector[0]; // 0-7
      int sprite_area = mob_vector[1]; // 192, 193... etc


      // calculate where the pointer is so we can store the 192, 193, 194...
      // sprite pointer = bank_mem + screen_mem + 0x07F8 + sprite_number
      // 0x07f8 is the screen size (2040);
      
      // when using the default VIC bank it's the last 8 bytes of screen memory -- 2040 through 2047

      // sprite pointer = bank_mem + screen_mem + 0x03F7 + sprite_number
      // mkpellegrino - 2023 06 14
      // 0x03F8 -> into Address  
      //addAsm( str_LDA + "#$F7", 2, false ); -- should be 0xF8
      addAsm( str_LDA + "#$F8", 2, false );
      addAsm( str_STA + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_STA + getLabel( ((int)label_vector[label_major]), false )+ "+1", 3, false );
      
      // Add the Sprite Number to Address
      addAsm( str_LDA + "#$" + toHex( sprite_number ) + commentmarker + "<- Sprite #", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      addAsm( str_STA + getLabel( ((int)label_vector[label_major]), false ), 3, false );

      // in case the value in Label overflows, we need to carry the 1 into Label+1
      // actually .. we don't!  because the greatest sprite # is 7... #$F7 + #$07 < #$100
      //addAsm( str_LDA + "#$00", 2, false );
      //addAsm( str_ADC + getLabel( ((int)label_vector[label_major]), false )+ "+1", 3, false );

      // get the location of the screen memory -> A
      // I checked the value in "A" after the pop off the stack
      // and it is correct for (at least) bank 1
      scrmem_is_needed=true;
      addAsm( str_JSR + "SCRMEM", 3, false );
      addAsm( str_PLA );

      // add the location of screen memory to the address
      addAsm( str_ADC + getLabel( ((int)label_vector[label_major]), false ) + "+1", 3, false );
      addAsm( str_STA + getLabel( ((int)label_vector[label_major]), false ) + "+1", 3, false );

      // get the location of the bank
      bnkmem_is_needed=true;
      addAsm( str_JSR + "BNKMEM", 3, false );   
      addAsm( str_PLA );

      // add the location of the bank to the address
      addAsm( str_ADC + getLabel( ((int)label_vector[label_major]), false ) + "+1", 3, false );
      addAsm( str_STA + getLabel( ((int)label_vector[label_major]), false ) + "+1", 3, false );

      // Load the sprite area and store it at the address
      addAsm( str_LDA + "#$" + toHex( mob_vector[1] ) + commentmarker + "sprite pointer", 2, false );
      addAsm( str_BYTE + "$8D" + commentmarker + "STA Absolute", 1, false ); // STA
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );
      
      int sprite_base_address = sprite_area*64;

      string BA_L = toHex(get_word_L(sprite_base_address)); 
      string BA_H = toHex(get_word_H(sprite_base_address));
      string byte_string = string(_id) + "_data:\n\t" + str_BYTE;
      for( int i=2; i<mob_vector.size(); i++ )
	{
	  byte_string += string( "$" ) + toHex( mob_vector[i]);
	  if( i<(mob_vector.size()-1) ) byte_string+=string(", ");
	}
      mobs.push_back( byte_string );
      mob_vector.erase(mob_vector.begin(),mob_vector.end());
      addAsm( str_JMP + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      addAsm( byte_string, 63, true );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA + "#<" + _id + "_data", 2, false ); /// _id is the name of the MOB
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + "#>" + _id + "_data", 2, false );
      addAsm( str_STA + "$FC", 2, false );
      
      addAsm( str_LDA + "#$" + BA_L, 2, false );
      addAsm( str_STA + "$FD", 2, false );
      
      // Load the (sprite area)*64 and store it at the address
      addAsm( str_LDA+"#$" + BA_H, 2, false );
      
      addAsm( str_STA + "$FE", 2, false );

      // this will get the bank offset
      bnkmem_is_needed=true;
      addAsm( str_JSR + "BNKMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00, #$20, #$40, 
      addAsm( str_CLC );
      addAsm( str_ADC + "$FE", 2, false );
      addAsm( str_STA + "$FE", 2, false );
      
      addAsm( str_JSR + "MOBCPY", 3, false );
      mobcpy_is_needed = true;
      popScope();
    }
  else
    {
      string msg = string( "Undefined variable: ") + string( _dt ) + string(" ") +  string( _id ) + string("=") + string( _init );
      addCompilerMessage( msg, 3 );
    }
};
| datatype ID '[' expression ']'
{
  if( isUintIMM( $4.name ) || isIntIMM( $4.name ) )
    {
      int length = atoi(stripFirst($4.name).c_str());
      if( length > 255 || length < 1 ) addCompilerMessage( "Array index out of range 1-255",3);
      addComment( string( "Array of size: " ) + itos(length) );
      
      current_variable_type = getDataTypeValue( $1.name );
      for( int i = 0; i < length; i++ )
	{
	  if( i == 0 )
	    {
	      addAsmVariable($2.name, current_variable_type );
	    }
	  else
	    {
	      addAsmVariable( string( string( "_" ) + string($2.name) + string( "_" ) + toString(i)).c_str(), current_variable_type );
	    }
	}
    }
  else
    {
      addCompilerMessage( "Invalid Dimension at compile time for array.", 3 );
    }
};
// STATEMENT
| ID tMINUSMINUS
{
  int a = getAddressOf($1.name);
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  if( isWordID($1.name ) )
    {
      addComment( "WordID--" );
      addCompilerMessage( getNameOf( a ) + "-- just subtracts 0x0001 from the value", 0 );

      /* Words must use SBC so that Carry can get set if > 0xFF */
      addAsm( str_SEC );
      addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
      addAsm( str_SBC + "#$01", 2, false );
      addAsm( str_STA + getNameOf(a), size_of_instruction, false );
      addAsm( str_LDA + getNameOf(a) + "+1", size_of_instruction, false );
      addAsm( str_SBC + "#$00", 2, false );
      addAsm( str_STA + getNameOf(a) + "+1", size_of_instruction, false );
    }
  else if( isUintID($1.name) || isIntID($1.name) )
    {
      addComment( "UIntID--  or  IntID--" );
      addAsm( str_DEC + getNameOf( a ), size_of_instruction, false );
    }
  else
    {
      addCompilerMessage( "invalid decrement", 3 );
    }

};
// STATEMENT
| ID tPLUSPLUS
{
  int a = getAddressOf($1.name);
  int size_of_instruction = 3;
  
  if( isUintID($1.name) )
    {
      addComment( "UIntID++" );
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_INC + getNameOf( a ), size_of_instruction, false );
    }
  else if( isIntID($1.name) )
    {
      addComment( "IntID++" );
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_INC + getNameOf( a ), size_of_instruction, false );
    }
  else if( isWordID($1.name) )
    {
      addCompilerMessage( getNameOf( a ) + "++ just adds 0x0001 to the value", 0 );
      addComment( "WordID++" );
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + "#$01", 2, false );
      addAsm(str_CLC);
      addAsm( str_ADC + getNameOf( a ), size_of_instruction, false );
      addAsm( str_STA + getNameOf( a ), size_of_instruction, false );
      if( a < 255 ) size_of_instruction = 2;
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_ADC + getNameOf( a ) + "+1", size_of_instruction, false );
      addAsm( str_STA + getNameOf( a ) + "+1", size_of_instruction, false );
    }
  else
    {
      addCompilerMessage( "invalid increment", 3 );
    }

};
| tDEC '(' ID ',' NUMBER ')'
{
  // TODO: Fix this to not use addresses unless necessary
  addComment( "dec( ID, IMM )   [for bytes only!]");
  int a = getAddressOf($3.name);
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  int l = atoi($5.name);
  for( int i = 0; i < l; i++ ) addAsm( str_DEC + getNameOf( a ), size_of_instruction, false );
};
// STATEMENT
| tINC '(' expression ',' expression ')'
{
  // TODO: Fix this to not use addresses unless necessary
  if( (isUintID($3.name)||isIntID($3.name)) && isUintIMM($5.name) )
    {
      addComment( "inc( UIntID, UIntIMM )" );
      int n = atoi(stripFirst($5.name).c_str());
      if( n > 2 )
	{
	  addCompilerMessage( "inc(" + getNameOf(getAddressOf($3.name)) + ", " + itos(n) + ") uses " + itos(6*n) + " clock cycles in " + itos(n) + " bytes", 1 );
	  addCompilerMessage( "consider just adding " + itos(n) + " to " + getNameOf(getAddressOf($3.name)) + " for 12 cycles in 9 bytes", 1 );
	}
      for( int i = 0; i < n; i++ )
	{
	  addAsm( str_INC + getNameOf( getAddressOf($3.name) ), 3, false );
	}
    }
  else if( isUintID($3.name) && isUintID($5.name) )
    {
      addDebugComment( "this just adds the 2 UintID's together" );
      addComment( "inc( UintID, UintID )" );
      addAsm( str_LDA + getNameOf( getAddressOf($5.name)), 3, false );
      addAsm( str_CLC );
      addAsm( str_ADC + getNameOf( getAddressOf($3.name)), 3, false );
      addAsm( str_STA + getNameOf( getAddressOf($3.name)), 3, false );
    }
  else
    {
      addCompilerMessage( "invalid type(s) for inc(exp,exp)", 3 );
    }
};
// STATEMENT
| tINC '(' expression ')'
{
  addDebugComment( "inc(expression)");
  int a = getAddressOf($3.name);
  string a_name = getNameOf( a );
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  if( isWordID($3.name ) )
    {
      addComment( "inc(WordID)" );
      addCompilerMessage( "inc(" + a_name + ") just adds 0x0001 to the value", 0 );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + a_name, size_of_instruction, false );
      addAsm( str_STA + a_name, size_of_instruction, false );
      a++;
      if( a < 256 )
	{
	  size_of_instruction = 2;
	}
      else
	{
	  size_of_instruction = 3;
	}
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_ADC + a_name + "+1", size_of_instruction, false );
      addAsm( str_STA + a_name + "+1", size_of_instruction, false );
    }
  else if( isUintID($3.name) || isIntID($3.name) )
    {
      addComment( "inc(UintID/IntID)" );
      addAsm( str_INC + getNameOf(a), size_of_instruction, false );
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "inc(WordIMM) - address");
      addCompilerMessage( "inc(" + toHex(atoi(stripFirst($3.name).c_str())) + ") increments the byte at the specified memory address.", 1);
      addAsm( str_INC + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
    }
  else
    {
      addCompilerMessage( "inc(expression) error - invalid argument type", 3 );
    } 
};
// STATEMENT
| tDEC '(' expression ')'
{
  // not sure if SEC should be here.
  int a = getAddressOf($3.name);
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  if( isWordID($3.name ) )
    {
      addComment( "dec(WordID)");
      addAsm( str_LDA + "#$FF", 2, false );
      illegal_operations_are_needed = true;
      
      addAsm( str_DCP + getNameOf(a), size_of_instruction, false );
      a++;
      if( a < 256 )
	{
	  size_of_instruction = 2;
	}
      else
	{
	  size_of_instruction = 3;
	}
      addAsm( str_BNE + "!+", 2, false );
      //addAsm( str_BYTE + "$D0, $" + toHex(size_of_instruction) + commentmarker + "BNE +3", 2, false );
      addAsm( str_DEC + getNameOf(getAddressOf($3.name))+ "+1", size_of_instruction, false );
      addAsm( "!:", 0, true );
    }
  else if( isUintID($3.name) || isIntID($3.name) )
    {
      addComment( "dec(UintID or IntID)");
      addAsm( str_DEC + getNameOf( a ), size_of_instruction, false );
    }
  else if( isA($3.name) )
    {
      addComment( "dec(A)");
      addCompilerMessage( "dec(expression) function not allowed here", 3 );
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "dec(WordIMM)");
      addCompilerMessage( "dec(" + toHex(atoi(stripFirst($3.name).c_str())) + ") decrements the byte at specified memory address", 1 );
      addAsm( str_DEC + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
    }
  else
    {
      addCompilerMessage( "dec(??) error - invalid argument type", 3 );
    } 
};



| tROL '(' expression ')'
{
  addComment( "rol statement" );
  if( isWordIMM($3.name))
    {
      addAsm( str_LDA + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( "!:\t" + str_STA + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, true );
    }
  else
    addCompilerMessage( "ROL (statement) of type not permitted... yet", 3 );
};
| tROR '(' expression ')'
{
  addComment( "ror statement" );
  if( isWordIMM($3.name))
    {
      addAsm( str_LDA + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_LSR, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( "!:\t" + str_STA + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, true );
    }
  else
    addCompilerMessage( "ROR (statement) of type not permitted... yet", 3 );
};
| tLSR '(' expression ')'
{
  addComment( "lsr statement" );
  if( isWordIMM($3.name))
    {
      addAsm( str_LSR + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
    }
  else
    addCompilerMessage( "LSR (statement) of type not permitted... yet", 3 );
};
| tASL '(' expression ')'
{
  addComment( "asl statement" );
  if( isWordIMM($3.name))
    {
      addAsm( str_ASL + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
    }
  else
    addCompilerMessage( "ASL (statement) of type not permitted... yet", 3 );
};

// STATEMENT
| tSPRITECOLOUR '(' expression ',' expression ')'
{
  addDebugComment( "statement: tSPRITECOLOUR '(' expression ',' expression ')' ';'" );
  addComment( "spriteColour( exp, exp );" );
  int base_addr = 53248;
  int sprite_number = 0;
  int sprite_colour = 0;

  // COLOUR
  if( isIntIMM($5.name) || isUintIMM($5.name))
    {
      sprite_colour = atoi( stripFirst($5.name).c_str() ); // the sprite colour
      addAsm( str_LDA + "#$" + toHex( sprite_colour ), 2, false );
    }
  else if(isIntID($5.name) || isUintID($5.name))
    {
      sprite_colour = getAddressOf($5.name);
      addAsm( str_LDA + getNameOf( sprite_colour ), 3, false );
    }

  // SPRITE NUMBER
  if( isIntIMM($3.name) || isUintIMM($3.name))
    {
      sprite_number = atoi( stripFirst($3.name).c_str() ); // the sprite #
      addAsm( str_STA + "$" + toHex( base_addr+sprite_number+39 ), 3, false );
    }
  else if(isIntID($3.name) || isUintID($3.name))
    {
      sprite_number = getAddressOf($3.name);
      addAsm( str_LDX + getNameOf( getAddressOf($3.name)), 3, false );
      addAsm( str_STA + "$D027,X", 3, false );
    } 
};

// STATEMENT
| tSPRITEON '(' expression ')'
{
  addComment( "spriteon( exp );" );
  
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      addComment( "spriteon( UIntIMM );" );
      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
      addAsm( str_ORA + "$D015", 3, false );
      addAsm( str_STA + "$D015", 3, false );
    }
  else if( isA( $3.name ) )
    {
      addComment( "spriteon( A );" );
      addAsm( str_ORA + "$D015", 3, false );
      addAsm( str_STA + "$D015", 3, false );
    }
  else
    {
      addComment( "spriteon( ??? );" );
      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$D015", 3, false );
      // 2025 05 01 - mkpellegrino
      addAsm( str_ORA + "$" + toHex( x ), 3, false );
      addAsm( str_STA + "$D015", 3, false );
    }
};

// STATEMENT
| tSPRITEOFF '(' expression ')'
{
  addDebugComment( "TODO: this could be implemented better for IMMs" );
  addComment( "spriteoff( exp );" );

  
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      addComment( "spriteoff( UIntIMM );" );

      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D015", 3, false );
      addAsm( str_STA + "$D015", 3, false );

    }
  else if( isA( $3.name ) )
    {
      addComment( "spriteoff( A );" );

      addComment( "not yet implemented" );
      addCompilerMessage( "spriteoff( A ) not yet implemented", 3 );
      //addAsm(str_EOR + "#$FF", 2, false );
      //addAsm( str_AND + "$D015", 3, false );
    }
  else
    {
      addComment( "spriteoff( ??? );" );

      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$" + toHex( x ), 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D015", 3, false );
      addAsm( str_STA + "$D015", 3, false );
    }
};

// STATEMENT
| tSPRITEY '(' expression ',' expression ')'
{
  addComment( string( "spritey( ") + string($3.name) + string(", ") + string($5.name) + string( " );" ) );
  int base_address = 53248;
  int sprite_address = 0;
  //int x_coord = 0;
  int y_coord = 0;
  if((isIntIMM($3.name) && isIntIMM($5.name))   ||
     (isUintIMM($3.name) && isUintIMM($5.name)) ||
     (isIntIMM($3.name) && isUintIMM($5.name))  ||
     (isUintIMM($3.name) && isIntIMM($5.name)) )
    {
      addComment( "spritey( UIntIMM, UIntIMM );" );

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      y_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( y_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address + 1 ), 3, false );
    }
  else if((isIntIMM($3.name) && isIntID($5.name))    ||
	  (isIntIMM($3.name) && isUintID($5.name))   ||
	  (isUintIMM($3.name) && isIntID($5.name))   ||
	  (isUintIMM($3.name) && isUintID($5.name)) )
    {
      addComment( "spritey( UIntIMM, UIntID );" );

      int addr = hexToDecimal($5.name);

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr) , 3, false );
      //addAsm( str_LDA + string($5.name) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address +1 ), 3, false );
    }
  else if((isUintID($3.name) && isUintID($5.name)) ||
	  (isUintID($3.name) && isIntID($5.name)) ||
	  (isIntID($3.name) && isUintID($5.name)) ||
	  (isIntID($3.name) && isIntID($5.name)) )
    {
      addComment( "spritey( UIntID, UIntID );" );

      addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + string($5.name), 3, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );
    }
  else if((isA($3.name) && isUintID($5.name)) ||
	  (isA($3.name) && isIntID($5.name)))
    {
      addComment( "spritey( A, UIntID );" );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(getAddressOf($5.name)), 3, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );

    }
  else if((isA($3.name) && isUintIMM($5.name)) ||
	  (isA($3.name) && isIntIMM($5.name)))
    {
      addComment( "spritey( A, UIntIMM );" );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(string($5.name)).c_str())), 3, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );

    }
  else if( (isUintID($3.name) && isIntIMM($5.name)) ||
	   (isUintID($3.name) && isUintIMM($5.name)) ||
	   (isIntID($3.name) && (isIntIMM($5.name))) ||
	   (isIntID($3.name) && (isUintIMM($5.name))) )
    {
      addComment( "spritey( UIntID, UIntIMM );" );
       
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(string($5.name)).c_str())), 2, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );

    }
  else if( (isUintID($3.name) && isA($5.name)) ||
	   (isIntID($3.name) && isA($5.name)) )
    {
      addComment( "spritey( UIntID, A );" );		 
      addAsm( str_PHA );
      addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );
    }
  else if( (isUintIMM($3.name) && isA($5.name)) ||
	   (isIntIMM($3.name) && isA($5.name)) )
    {
      addComment( "spritey( UIntIMM, A );" );

      int sprite_number = 2*atoi(stripFirst(string($5.name)).c_str());
      int sprite_addr = 53249 + sprite_number;
      addAsm( str_STA + "$" + toHex(sprite_addr) + commentmarker + "set the y-coord", 3, false );
    }
  else
    {
      addCompilerMessage( "spritey error - invalid type", 1 );
    }
}

// STATEMENT
| tSPRITETOGGLE '(' expression ')'
{
  addComment( "spritetoggle( exp );" );
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      addComment( "spritetoggle( UIntIMM );" );

      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
    }
  else
    {
      addComment( "spritetoggle( ??? );" );

      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$" + toHex( x ), 3, false );
    }
  addAsm( str_EOR + "$D015", 3, false );
  addAsm( str_STA + "$D015", 3, false );
};

// STATEMENT
| tSPRITEX '(' expression ',' expression ')'
{
  addDebugComment( string( "spritex( ") + string($3.name) + string(", ") + string($5.name) + string( " );" ) );

  int base_address = 53248;
  int sprite_address = 0;
  int x_coord = 0;
  int y_coord = 0;
  if( (isIntIMM($3.name) && isIntIMM($5.name)) ||
      (isIntIMM($3.name) && isUintIMM($5.name)) ||
      (isUintIMM($3.name) && isIntIMM($5.name)) ||
      (isUintIMM($3.name) && isUintIMM($5.name)) )
    {
      addComment( "spritex( UIntIMM, UIntIMM );" );
      
      sprite_address = atoi( stripFirst($3.name).c_str() );
      int tmp_bit = (int)pow(2,sprite_address);
      int tmp_others = tmp_bit ^ 255;
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );


      // clear the high bit
      addAsm( str_LDA + "#$" + toHex( tmp_others ), 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if( isUintIMM($3.name) && isXA($5.name) )
    {
      addComment( "spriteX( UintIMM, XA )" );
      sprite_address = atoi( stripFirst($3.name).c_str() );
      int tmp_bit = (int)pow(2,sprite_address);
      int tmp_others = tmp_bit ^ 255;
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      addAsm( str_CPX + "#$00", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      int s = atoi( stripFirst($3.name).c_str() );
      switch( s )
	{
	case 0:
	  addAsm( str_LDA + "#$FE", 2, false );
	  break;
	case 1:
	  addAsm( str_LDA + "#$FD", 2, false );
	  break;
	case 2:
	  addAsm( str_LDA + "#$FB", 2, false );
	  break;
	case 3:
	  addAsm( str_LDA + "#$F7", 2, false );
	  break;
	case 4:
	  addAsm( str_LDA + "#$EF", 2, false );
	  break;
	case 5:
	  addAsm( str_LDA + "#$DF", 2, false );
	  break;
	case 6:
	  addAsm( str_LDA + "#$BF", 2, false );
	  break;
	case 7:
	  addAsm( str_LDA + "#$7F", 2, false );
	  break;
	default:
	  addCompilerMessage( "spritex( #, x )... # out of range", 3 );
	}
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      switch( s )
	{
	case 0:
	  addAsm( "!:\t" + str_LDA + "#$01", 2, true );
	  break;
	case 1:
	  addAsm( "!:\t" + str_LDA + "#$02", 2, true );
	  break;
	case 2:
	  addAsm( "!:\t" + str_LDA + "#$04", 2, true );
	  break;
	case 3:
	  addAsm( "!:\t" + str_LDA + "#$08", 2, true );
	  break;
	case 4:
	  addAsm( "!:\t" + str_LDA + "#$10", 2, true );
	  break;
	case 5:
	  addAsm( "!:\t" + str_LDA + "#$20", 2, true );
	  break;
	case 6:
	  addAsm( "!:\t" + str_LDA + "#$40", 2, true );
	  break;
	case 7:
	  addAsm( "!:\t" + str_LDA + "#$80", 2, true );
	  break;
	default:
	  addCompilerMessage( "spritex( #, x )... # out of range", 3 );
	}
      addAsm( str_ORA + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
      addAsm( "!:", 0, true );
      
    }
  else if(  (isXA($3.name) && isWordID($5.name) ) ||
	    (isA($3.name) && isWordID($5.name) ))
    {
      addComment( "spritex( XA/A, WordID );" );
      if( isXA($3.name) )
	{
	  addCompilerMessage( "spritex cannot take XA as first parameter... losing High Byte", 0 );
	}
      int value_addr = getAddressOf( $5.name );
      
      
      // A is already set
      //addAsm( str_LDA + "$" + toHex( var_addr ), 3, false );
      addAsm( str_PHA ); 
      addAsm( str_ASL ); // multiply by 2
      addAsm( str_TAX ); // move it to X
      addAsm( str_LDA + getNameOf( value_addr ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_STA + "$D000,X", 3, false );

      addAsm( str_PLA );

      // =========== vvvv BIN2BIT vvvv ========
      // if( smaller )
      //    use JSR
      // else
      //    use inline
      //
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true );
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );

      //addAsm( str_PHA );
      //addAsm( str_JSR + "BIN2BIT", 3, false);
      ///addAsm( str_PLA );
      // ========== ^^^^ BIN2BIT ^^^^ ==========
      addAsm( str_TAY );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_TAX, 1, false );
      
      addAsm( str_LDA + getNameOf(hexToDecimal($5.name)) + "+1", 3, false );
      addAsm( str_LSR, 1, false );
      addAsm( str_BCS + "!+", 2, false ); // if bit then store a 1 there x there
      addAsm( str_STX + "$D010", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      addAsm( "!:\t" + str_TYA, 1, true );
      addAsm( str_ORA + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
      addAsm( "!:", 0, true );

    }
  else if(  (isUintIMM($3.name) && isWordIMM($5.name) ) ||
	    (isIntIMM($3.name) && isWordIMM($5.name) ) )
    {

      int sprite_base = 53248;
      
      addComment( "spritex( UIntIMM, WordIMM );" );

      int tmp_sn = atoi(stripFirst($3.name).c_str());
      int tmp_coord = atoi(stripFirst($5.name).c_str());
      int tmp_bit = (int)pow(2,tmp_sn);
      int tmp_others = tmp_bit ^ 255;
      int tmp_coordH = get_word_H(tmp_coord);
      int tmp_coordL = get_word_L(tmp_coord);

      int this_sprite_addr = sprite_base + 2*tmp_sn;
      int tmp_set_to;
      addAsm( str_LDA + "#$" + toHex(tmp_coordL), 2, false );
      addAsm( str_STA + "$" + toHex( this_sprite_addr ), 3, false );
      if( tmp_coordH == 0 )
	{
	  addAsm( str_LDA + "#$" + toHex( tmp_others ), 2, false );
	  addAsm( str_AND + "$D010", 3, false );
	}
      else
	{
	  addAsm( str_LDA + "#$" +  toHex( tmp_bit ), 2, false );
	  addAsm( str_ORA + "$D010", 3, false );
	}
      addAsm( str_STA + "$D010", 3, false );
      
    }
  else if( (isUintID($3.name) && isWordID($5.name)) ||
	   (isIntID($3.name) && isWordID($5.name)) )
    {
      addComment( "spritex( UIntID, WordID );" );
      addDebugComment( "this needs work" );
      bin2bit_is_needed = true;
      
      int sprite_addr = getAddressOf( $3.name );
      int value_addr = getAddressOf( $5.name );

      // the low byte
      addAsm( str_LDA + getNameOf( getAddressOf( $3.name ) ), 3, false );
      addAsm( str_ASL ); // multiply by 2
      addAsm( str_TAX ); // move it to X
      addAsm( str_LDA + getNameOf( getAddressOf( $5.name ) ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_STA + "$D000,X", 3, false );

      // the high byte
      // 2024 04 27 - mkpellegrino
      addAsm( str_LDA + getNameOf( sprite_addr ), 3, false );

      addAsm( str_PHA );
      addAsm( str_JSR + "BIN2BIT", 3, false);
      addAsm( str_PLA );

      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$02", 2, false );

      // 2023 03 07 - mkpellegrino
      addAsm( str_LDX + getNameOf( getAddressOf( $3.name ) ), 3, false );
      addAsm( str_LDA + getNameOf( value_addr ) + "+1" , 3, false ); // this is the HIGH byte of the X coord
      addAsm( "!:\t" + str_ASL, 1, true );
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if(isUintID($3.name) && isXA($5.name))
    {
      //============================================
      addComment( "spritex( (U)IntID, XA );" );
      addAsm( str_TAY );
      
      // save $02 & $03 & $05
      addAsm( str_LDA + "$02", 2, false);
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false);
      addAsm( str_PHA );
      //addAsm( str_LDA + "$05", 2, false );
      //addAsm( str_PHA );
      //====================
      // put AX in $02 $03
      addAsm( str_STY + "$02", 2, false );
      addAsm( str_STX + "$03" + commentmarker + "temporarily store the High Byte", 2, false );
      //====================
      
      // bin2bit_is_needed = true;
      
      int sprite_number = getAddressOf( $3.name );

      // the low byte
      addAsm( str_LDA + getNameOf( sprite_number ) + commentmarker + "sprite # -> A", 3, false );

      addAsm( str_PHA );
      addAsm( str_ASL + commentmarker + "multiply it by 2", 1, false ); // multiply by 2
      addAsm( str_TAX + commentmarker + "make Sprite# * 2 the index (X)", 1, false); // move it to X
      addAsm( str_TYA + commentmarker + "move the Low Byte of x-coord to A", 1, false);
      addAsm( str_STA + "$D000,X" + commentmarker + "set the low-byte value", 3, false );
      // the high byte
      addAsm( str_PLA );
      //addAsm( str_LDA + "$" + toHex( sprite_number ), 3, false );
      //addAsm( str_LDA + "$02", 2, false );
      //addAsm( str_TXA );
      //addAsm( str_LSR );
      

      // 2024 05 01 - mkpellegrino
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true  );
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );

      // 2024 04 29 - Change this to the other code
      //addAsm( str_PHA );
      //addAsm( str_JSR + "BIN2BIT", 3, false);
      //addAsm( str_PLA );

      
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$05", 2, false );
      
      addAsm( str_LDX + getNameOf( sprite_number ), 3, false );
      addAsm( str_INX );
      //addAsm( str_LDX + "$02; puts the sprite number into X", 2, false );
      addAsm( str_LDA + "$03" + commentmarker + "puts the High Byte of the x-coord into A (it's a 1 or a 0)", 2, false );
      addAsm( str_LSR + commentmarker + "puts that 1 or 0 into the carry flag", 1, false  );
      //addComment( "top-of-loop" );
      addAsm( "!:\t" + str_ROL, 1, true ); // used to be ASL
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );
      //addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );
      addAsm( str_ORA + "$05", 2, false );
      addAsm( str_STA + "$D010", 3, false );
      //====================
      // restore $03 & $02
      //addAsm( str_PLA );
      //addAsm( str_STA + "$05", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      //============================================
    }
  else if( (isUintID($3.name) && isA($5.name)) ||
	   (isIntID($3.name) && isA($5.name)))
    {
      addComment( "spritex( UIntID, A );" );
      //bin2bit_is_needed = true;
      
      int sprite_addr = getAddressOf( $3.name );
      
      int value_addr = getAddressOf( $5.name );
      //addAsm( str_PHA );
      addAsm( str_TAY );

      // the low byte
      addAsm( str_LDA + getNameOf( sprite_addr ), 3, false );
      addAsm( str_ASL ); // multiply by 2
      addAsm( str_TAX ); // move it to X
      addAsm( str_TYA );
      //addAsm( str_PLA );
      //addAsm( str_LDA + "$" + toHex( value_addr ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_STA + "$D000,X", 3, false );

      // the high byte
      addAsm( str_LDA + getNameOf( sprite_addr ), 3, false );

      // 2024 05 01 - mkpellegrino
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true );
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if( (isUintIMM($3.name) && isWordID($5.name)) ||
	   (isIntIMM($3.name) && isWordID($5.name)))
    {
      addComment( "spritex( UIntIMM, WordID );" );

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      int addr = hexToDecimal($5.name);
      // 2024 04 14 - mkpellegrino
      // Low Byte
      addAsm( str_LDA + getNameOf( getAddressOf( $5.name ) ), 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      // High Byte
      // 2024 04 27 - mkpellegrino
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_BIT + getNameOf(addr)+"+1", 3, false );
      addAsm( str_BEQ + "!+", 2, false );

      // find out which sprite number we're talking about
      int sprite_number = atoi( stripFirst($3.name).c_str() );

      // 2024 04 26 - mkpellegrino
      // hardcoded IMMs
      switch( sprite_number )
	{
	case 7:
	  addAsm( str_LDA + "#$80", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$7F", 2, true);
	  break;
	case 6:
	  addAsm( str_LDA + "#$40", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$BF", 2, true);
	  break;
	case 5:
	  addAsm( str_LDA + "#$20", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$DF", 2, true);
	  break;
	case 4:
	  addAsm( str_LDA + "#$10", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$EF", 2, true);
	  break;
	case 3:
	  addAsm( str_LDA + "#$08", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$F7", 2, true);
	  break;
	case 2:
	  addAsm( str_LDA + "#$04", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FB", 2, true);
	  break;
	case 1:
	  addAsm( str_LDA + "#$02", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FD", 2, true);
	  break;
	case 0:
	  addAsm( "// lda #$01", 0, false );
	  //addAsm( str_LDA + "#$01", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FE", 2, true);
	  break;
	default:
	  addCompilerMessage( "Non-sprite number used as IMMEDIATE value\nRange is: 0 to 7", 3 );
	  break;
	}

      addAsm( str_AND + "$D010", 3, false );
      addAsm( "!:\t" + str_STA + "$D010", 3, true );
      
    }
  else if( (isIntIMM($3.name) && isIntID($5.name)) ||
	   (isIntIMM($3.name) && isUintID($5.name)) ||
	   (isUintIMM($3.name) && isIntID($5.name)) ||
	   (isUintIMM($3.name) && isUintID($5.name)) )
    {
      addComment( "spritex( UIntIMM, UIntID );" );
      // 2024 04 29 - mkpellegrino
      int sprite_number = atoi( stripFirst($3.name).c_str() );
      
      
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_LDA + getNameOf(getAddressOf($5.name)), 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );

      // turn off the 9th bit
      switch( sprite_number )
	{
	case 7:
	  addAsm( str_LDA + "#$7F", 2, false );
	  break;
	case 6:
	  addAsm( str_LDA + "#$BF", 2, false );
	  break;
	case 5:
	  addAsm( str_LDA + "#$DF", 2, false );
	  break;
	case 4:
	  addAsm( str_LDA + "#$EF", 2, false );
	  break;
	case 3:
	  addAsm( str_LDA + "#$F7", 2, false );
	  break;
	case 2:
	  addAsm( str_LDA + "#$FB", 2, false );
	  break;
	case 1:
	  addAsm( str_LDA + "#$FD", 2, false );
	  break;
	case 0:
	  addAsm( str_LDA + "#$FE", 2, false );
	  break;
	}
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
      
    }
  else if( (isUintID($3.name) && isUintID($5.name)) ||
	   (isUintID($3.name) && isIntID($5.name)) ||
	   (isIntID($3.name) && isUintID($5.name)) ||
	   (isIntID($3.name) && isIntID($5.name)) )
    {
      addComment( "spritex( UIntID, UIntID );" );
      // 2024 04 29 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      // addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(getAddressOf($5.name)), 3, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

      // turn OFF the high bit if necessary
      // turn the sprite # into a binary number
      addDebugComment( "turn off the 9th bit in $D010" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_LDX + getNameOf(getAddressOf($3.name)), 3, false );

      //addAsm( str_INX, 1, false );
      //addAsm( str_DEX, 1, false );

      addAsm( "!:\t" + str_BEQ + "!+", 2, true );
      addAsm( str_ASL, 1, false );
      addAsm( str_DEX, 1, false );
      addAsm( str_JMP + "!-", 2, false );

      // now A contains the bit
      addAsm( "!:\t" + str_EOR + "#$FF", 2, true );
      // mask out the high bit for x
      addAsm( str_AND + "$D010", 3, false ); 
      addAsm( str_STA + "$D010", 3, false ); 
    }
  else if( (isUintID($3.name) && isUintIMM($5.name)) ||
	   (isUintID($3.name) && isIntIMM($5.name)) ||
	   (isIntID($3.name) && isUintIMM($5.name)) ||
	   (isIntID($3.name) && isIntIMM($5.name)) )
    {
      addComment( "spritex( UIntID, UIntIMM );" );
   
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      //addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(string($5.name)).c_str())), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

      // turn OFF the high bit if necessary
      // turn the sprite # into a binary number
      addDebugComment( "turn off the 9th bit in $D010" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_LDX + getNameOf(getAddressOf($3.name)), 3, false );
      //addAsm( str_INX, 1, false );
      //addAsm( str_DEX, 1, false );
      addAsm( "!:\t" + str_BEQ + "!+", 2, true );
      addAsm( str_ASL, 1, false );
      addAsm( str_DEX, 1, false );
      addAsm( str_JMP + "!-", 2, false );

      // now A contains the bit
      addAsm( "!:\t" + str_EOR + "#$FF", 2, true );
      // mask out the high bit for x
      addAsm( str_AND + "$D010", 3, false ); 
      addAsm( str_STA + "$D010", 3, false ); 

    }
  else if( isUintID($3.name) && isWordIMM($5.name) )
    {
      // 2024 04 29 - mkpellegrino
      addComment( "spritex( UintID, WordIMM )");

      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      //addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(get_word_L(atoi(stripFirst($5.name).c_str()))), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

      // turn OFF the high bit if necessary
      // turn the sprite # into a binary number
      addDebugComment( "turn off the 9th bit in $D010" );
      addAsm( str_LDA + "#$" + toHex(get_word_H(atoi(stripFirst($5.name).c_str()))), 2, false );
      addAsm( str_LDX + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( "!:\t" + str_BEQ + "!+", 2, true );
      addAsm( str_ASL, 1, false );
      addAsm( str_DEX, 1, false );
      addAsm( str_JMP + "!-", 2, false );

      addAsm( "!:\t" + str_ORA + "$D010", 3, true ); 
      addAsm( str_STA + "$D010", 3, false ); 
    }
  else
    {
      string s = string( "spritex error - invalid type - " ) + $3.name + ":" + $5.name;
      addCompilerMessage( s, 1 );
    }
};

// TODO: add spritexy( imm, XA, XA );
| tSPRITEXY '(' expression ',' expression ',' expression ')'
{
  addComment( string( "spritexy( ") + $3.name + ", " + $5.name + ", " + $7.name +  " );"  );
  int base_address = 53248;
  int sprite_address = 0;
  int x_coord = 0;
  int y_coord = 0;
  if((isIntIMM($3.name) && isIntIMM($5.name) && isIntIMM($7.name)) ||
     (isUintIMM($3.name) && isIntIMM($5.name) && isIntIMM($7.name)) ||
     (isIntIMM($3.name) && isUintIMM($5.name) && isIntIMM($7.name)) ||
     (isUintIMM($3.name) && isUintIMM($5.name) && isIntIMM($7.name)) ||
     (isIntIMM($3.name) && isIntIMM($5.name) && isUintIMM($7.name)) ||
     (isUintIMM($3.name) && isIntIMM($5.name) && isUintIMM($7.name)) ||
     (isIntIMM($3.name) && isUintIMM($5.name) && isUintIMM($7.name)) ||
     (isUintIMM($3.name) && isUintIMM($5.name) && isUintIMM($7.name)) )
    {
      addComment( "spritexy( UIntIMM, UIntIMM, UintIMM );");
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      
      x_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      y_coord = atoi( stripFirst($7.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( y_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );

      int sprite_number = atoi( stripFirst($3.name).c_str());
      switch( sprite_number )
	{
	case 0:
	  addAsm( str_LDA + "#$FE", 2, false );
	  break;
	case 1:
	  addAsm( str_LDA + "#$FD", 2, false );
	  break;
	case 2:
	  addAsm( str_LDA + "#$FB", 2, false );
	  break;
	case 3:
	  addAsm( str_LDA + "#$F7", 2, false );
	  break;
	case 4:
	  addAsm( str_LDA + "#$EF", 2, false );
	  break;
	case 5:
	  addAsm( str_LDA + "#$DF", 2, false );
	  break;
	case 6:
	  addAsm( str_LDA + "#$BF", 2, false );
	  break;
	case 7:
	  addAsm( str_LDA + "#$7F", 2, false );
	  break;
	default:
	  addCompilerMessage( "invalid sprite number", 2 );
	}
      addAsm( str_AND + "$D010", 3, false ); 
      addAsm( str_STA + "$D010", 3, false );
    }
  else if((isIntIMM($3.name) && isWordID($5.name) && isIntIMM($7.name)) ||
	  (isIntIMM($3.name) && isWordID($5.name) && isUintIMM($7.name)) ||
	  (isUintIMM($3.name) && isWordID($5.name) && isIntIMM($7.name)) ||
	  (isUintIMM($3.name) && isWordID($5.name) && isUintIMM($7.name)))
    {

      addComment( "spritexy( UIntIMM, WordID, UintIMM );");

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;

      int addr = hexToDecimal($5.name);
      // 2025 05 04 - mkpellegrino - moved the next 2 lines to here for speed
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($7.name).c_str())) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );

      // 2024 04 30 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      

      // need to put the ninth bit into 0xD010
   
      // find out which sprite number we're talking about
      int sprite_number = atoi( stripFirst($3.name).c_str() );


      //============================================0--0-
      // High Byte
      // 2024 04 27 - mkpellegrino
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_BIT + getNameOf(addr)+"+1", 3, false );
      addAsm( str_BEQ + "!+", 2, false );


      // 2024 04 26 - mkpellegrino
      // hardcoded IMMs
      switch( sprite_number )
	{
	case 7:
	  addAsm( str_LDA + "#$80", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$7F", 2, true);
	  break;
	case 6:
	  addAsm( str_LDA + "#$40", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$BF", 2, true);
	  break;
	case 5:
	  addAsm( str_LDA + "#$20", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$DF", 2, true);
	  break;
	case 4:
	  addAsm( str_LDA + "#$10", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$EF", 2, true);
	  break;
	case 3:
	  addAsm( str_LDA + "#$08", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$F7", 2, true);
	  break;
	case 2:
	  addAsm( str_LDA + "#$04", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FB", 2, true);
	  break;
	case 1:
	  addAsm( str_LDA + "#$02", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FD", 2, true);
	  break;
	case 0:
	  addAsm( "// lda #$01", 0, false );
	  //addAsm( str_LDA + "#$01", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FE", 2, true);
	  break;
	default:
	  addCompilerMessage( "Invalid sprite number used as IMMEDIATE value\nRange is: 0 to 7", 3 );
	  break;
	}

      addAsm( str_AND + "$D010", 3, false );
      addAsm( "!:\t" + str_STA + "$D010", 3, true );
    }
  else if((isIntIMM($3.name) && isWordID($5.name) && isIntID($7.name)) ||
	  (isIntIMM($3.name) && isWordID($5.name) && isUintID($7.name)) ||
	  (isUintIMM($3.name) && isWordID($5.name) && isIntID($7.name)) ||
	  (isUintIMM($3.name) && isWordID($5.name) && isUintID($7.name)))
    {
      addComment( "spritexy( UIntIMM, WordID, UIntID );");

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;

      int addr = hexToDecimal($5.name);

      // 2025 05 04 - mkpellegrino - swapped the order her, of setting y, and x
      addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($7.name).c_str())) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );

      addAsm( str_LDA + getNameOf(addr) + commentmarker + "(this _wasn't_ working)", 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      //============================================0--0-
      // 9th Bit
      // 2024 05 01 - mkpellegrino
      // 2024 04 27 - mkpellegrino
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_BIT + getNameOf(addr)+"+1", 3, false );
      addAsm( str_BEQ + "!+", 2, false );

      int sprite_number = atoi( stripFirst($3.name).c_str() );

      // 2024 04 26 - mkpellegrino
      // hardcoded IMMs
      switch( sprite_number )
	{
	case 7:
	  addAsm( str_LDA + "#$80", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$7F", 2, true);
	  break;
	case 6:
	  addAsm( str_LDA + "#$40", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$BF", 2, true);
	  break;
	case 5:
	  addAsm( str_LDA + "#$20", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$DF", 2, true);
	  break;
	case 4:
	  addAsm( str_LDA + "#$10", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$EF", 2, true);
	  break;
	case 3:
	  addAsm( str_LDA + "#$08", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$F7", 2, true);
	  break;
	case 2:
	  addAsm( str_LDA + "#$04", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FB", 2, true);
	  break;
	case 1:
	  addAsm( str_LDA + "#$02", 2, false);
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FD", 2, true);
	  break;
	case 0:
	  addAsm( "// lda #$01", 0, false );
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$FE", 2, true);
	  break;
	default:
	  addCompilerMessage( "Invalid sprite number used as IMM value\nRange is: 0 to 7", 3 );
	  break;
	}

      addAsm( str_AND + "$D010", 3, false );
      addAsm( "!:\t" + str_STA + "$D010", 3, true );

      
    }
  else if((isIntIMM($3.name) && isIntIMM($5.name) && isIntID($7.name)) ||
	  (isIntIMM($3.name) && isIntIMM($5.name) && isUintID($7.name)) ||
	  (isIntIMM($3.name) && isUintIMM($5.name) && isIntID($7.name)) ||
	  (isIntIMM($3.name) && isUintIMM($5.name) && isUintID($7.name)) ||
	  (isUintIMM($3.name) && isIntIMM($5.name) && isIntID($7.name)) ||
	  (isUintIMM($3.name) && isIntIMM($5.name) && isUintID($7.name)) ||
	  (isUintIMM($3.name) && isUintIMM($5.name) && isIntID($7.name)) ||
	  (isUintIMM($3.name) && isUintIMM($5.name) && isUintID($7.name)) )
    {
      addComment( "spritexy( UIntIMM, UIntIMM, UIntID );");

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA + "#$" + toHex(x_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($7.name).c_str())) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );

      int sprite_number = atoi( stripFirst($3.name).c_str());
      switch( sprite_number )
	{
	case 0:
	  addAsm( str_LDA + "#$FE", 2, false );
	  break;
	case 1:
	  addAsm( str_LDA + "#$FD", 2, false );
	  break;
	case 2:
	  addAsm( str_LDA + "#$FB", 2, false );
	  break;
	case 3:
	  addAsm( str_LDA + "#$F7", 2, false );
	  break;
	case 4:
	  addAsm( str_LDA + "#$EF", 2, false );
	  break;
	case 5:
	  addAsm( str_LDA + "#$DF", 2, false );
	  break;
	case 6:
	  addAsm( str_LDA + "#$BF", 2, false );
	  break;
	case 7:
	  addAsm( str_LDA + "#$7F", 2, false );
	  break;
	default:
	  addCompilerMessage( "invalid sprite number", 2 );
	}
      addAsm( str_AND + "$D010", 3, false ); 
      addAsm( str_STA + "$D010", 3, false );
    }
  else if((isIntIMM($3.name) && isIntID($5.name) && isIntID($7.name)) ||
	  (isIntIMM($3.name) && isIntID($5.name) && isUintID($7.name)) ||
	  (isIntIMM($3.name) && isUintID($5.name) && isIntID($7.name)) ||
	  (isIntIMM($3.name) && isUintID($5.name) && isUintID($7.name)) ||
	  (isUintIMM($3.name) && isIntID($5.name) && isIntID($7.name)) ||
	  (isUintIMM($3.name) && isIntID($5.name) && isUintID($7.name)) ||
	  (isUintIMM($3.name) && isUintID($5.name) && isIntID($7.name)) ||
	  (isUintIMM($3.name) && isUintID($5.name) && isUintID($7.name)) )
    {

      addComment( "spritexy( UIntIMM, UIntID, UIntID );");

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_LDA + getNameOf(hexToDecimal($5.name)), 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      addAsm( str_LDA + getNameOf(hexToDecimal($7.name)), 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );

      int sprite_number = atoi( stripFirst($3.name).c_str());
      switch( sprite_number )
	{
	case 0:
	  addAsm( str_LDA + "#$FE", 2, false );
	  break;
	case 1:
	  addAsm( str_LDA + "#$FD", 2, false );
	  break;
	case 2:
	  addAsm( str_LDA + "#$FB", 2, false );
	  break;
	case 3:
	  addAsm( str_LDA + "#$F7", 2, false );
	  break;
	case 4:
	  addAsm( str_LDA + "#$EF", 2, false );
	  break;
	case 5:
	  addAsm( str_LDA + "#$DF", 2, false );
	  break;
	case 6:
	  addAsm( str_LDA + "#$BF", 2, false );
	  break;
	case 7:
	  addAsm( str_LDA + "#$7F", 2, false );
	  break;
	default:
	  addCompilerMessage( "invalid sprite number", 2 );
	}
      addAsm( str_AND + "$D010", 3, false ); 
      addAsm( str_STA + "$D010", 3, false );
    }
  else if((isIntIMM($3.name) && isIntID($5.name) && isIntIMM($7.name)) ||
	  (isIntIMM($3.name) && isIntID($5.name) && isUintIMM($7.name)) ||
	  (isIntIMM($3.name) && isUintID($5.name) && isIntIMM($7.name)) ||
	  (isIntIMM($3.name) && isUintID($5.name) && isUintIMM($7.name)) ||
	  (isUintIMM($3.name) && isIntID($5.name) && isIntIMM($7.name)) ||
	  (isUintIMM($3.name) && isIntID($5.name) && isUintIMM($7.name)) ||
	  (isUintIMM($3.name) && isUintID($5.name) && isIntIMM($7.name)) ||
	  (isUintIMM($3.name) && isUintID($5.name) && isUintIMM($7.name)) )
    {

      addComment( "spritexy( UIntIMM, UIntID, UIntIMM );");

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_LDA + getNameOf(hexToDecimal($5.name)), 3, false );

      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      y_coord = atoi( stripFirst($7.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( y_coord), 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );

      int sprite_number = atoi( stripFirst($3.name).c_str());
      switch( sprite_number )
	{
	case 0:
	  addAsm( str_LDA + "#$FE", 2, false );
	  break;
	case 1:
	  addAsm( str_LDA + "#$FD", 2, false );
	  break;
	case 2:
	  addAsm( str_LDA + "#$FB", 2, false );
	  break;
	case 3:
	  addAsm( str_LDA + "#$F7", 2, false );
	  break;
	case 4:
	  addAsm( str_LDA + "#$EF", 2, false );
	  break;
	case 5:
	  addAsm( str_LDA + "#$DF", 2, false );
	  break;
	case 6:
	  addAsm( str_LDA + "#$BF", 2, false );
	  break;
	case 7:
	  addAsm( str_LDA + "#$7F", 2, false );
	  break;
	default:
	  addCompilerMessage( "invalid sprite number", 2 );
	}
      addAsm( str_AND + "$D010", 3, false ); 
      addAsm( str_STA + "$D010", 3, false );
    }
  else if((isIntID($3.name) && isIntID($5.name) && isIntID($7.name)) ||
	  (isIntID($3.name) && isIntID($5.name) && isUintID($7.name)) ||
	  (isIntID($3.name) && isUintID($5.name) && isIntID($7.name)) ||
	  (isIntID($3.name) && isUintID($5.name) && isUintID($7.name)) ||
	  (isUintID($3.name) && isIntID($5.name) && isIntID($7.name)) ||
	  (isUintID($3.name) && isIntID($5.name) && isUintID($7.name)) ||
	  (isUintID($3.name) && isUintID($5.name) && isIntID($7.name)) ||
	  (isUintID($3.name) && isUintID($5.name) && isUintID($7.name)) )
    {
      addComment( "spritexy( UIntID, UIntID, UIntID );");

      //bin2bit_is_needed = true;
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );

      //addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(hexToDecimal($5.name)), 3, false );

      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord (bits 1-8)", 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + getNameOf(hexToDecimal($7.name)), 3, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );
      
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );

      //addAsm( str_PHA );
      //addAsm( str_JSR + "BIN2BIT", 3, false);
      //addAsm( str_PLA );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if((isIntID($3.name) && isWordID($5.name) && isIntID($7.name)) ||
	  (isUintID($3.name) && isWordID($5.name) && isIntID($7.name)) ||
	  (isIntID($3.name) && isWordID($5.name) && isUintID($7.name)) ||
	  (isUintID($3.name) && isWordID($5.name) && isUintID($7.name)))
    {
      addComment( "spritexy( UIntIMM, WordID, UIntID ); (still being tested)");
      addCompilerMessage( "spritexy( UIntIMM, WordID, UIntID ); (still being tested)", 0 );

      //bin2bit_is_needed = true;
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );

      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(hexToDecimal($5.name)), 3, false );

      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord (bits 1-8)", 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + getNameOf(hexToDecimal($7.name)), 3, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );

      // determine bit of sprite from $3.name
      addDebugComment( "determine bit for $D010 of sprite # located in $3.name" );
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );
      // =========== vvvv BIN2BIT vvvv ========
      // if( smaller )
      //    use JSR
      // else
      //    use inline
      //
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );

      //addAsm( str_PHA );
      //addAsm( str_JSR + "BIN2BIT", 3, false);
      ///addAsm( str_PLA );
      // ========== ^^^^ BIN2BIT ^^^^ ==========
      addAsm( str_TAY );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_TAX, 1, false );
      
      addAsm( str_LDA + getNameOf(hexToDecimal($5.name)) + "+1", 3, false );
      addAsm( str_LSR, 1, false );
      addAsm( str_BCS + "!+", 2, false ); // if bit then store a 1 there x there
      addAsm( str_STX + "$D010", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      addAsm( "!:\t" + str_TYA, 1, true);
      addAsm( str_ORA + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
      addAsm( "!:", 0, true );
    }
  else if( (isIntID($3.name) && isIntIMM($5.name) && isIntIMM($7.name)) ||
	   (isIntID($3.name) && isIntIMM($5.name) && isUintIMM($7.name)) ||
	   (isIntID($3.name) && isUintIMM($5.name) && isIntIMM($7.name)) ||
	   (isIntID($3.name) && isUintIMM($5.name) && isUintIMM($7.name)) ||
	   (isUintID($3.name) && isIntIMM($5.name) && isIntIMM($7.name)) ||
	   (isUintID($3.name) && isIntIMM($5.name) && isUintIMM($7.name)) ||
	   (isUintID($3.name) && isUintIMM($5.name) && isIntIMM($7.name)) ||
	   (isUintID($3.name) && isUintIMM($5.name) && isUintIMM($7.name)) )
    {
      addComment( "spritexy( UIntID, UIntIMM, UIntIMM );");

      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );

      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(string($5.name)).c_str())), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord (bits 1-8)", 3, false );

      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(string($7.name)).c_str())), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );

      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );

      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );

      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if( (isIntID($3.name) && isWordIMM($5.name) && isIntIMM($7.name)) ||
	   (isIntID($3.name) && isWordIMM($5.name) && isUintIMM($7.name)) ||
	   (isUintID($3.name) && isWordIMM($5.name) && isIntIMM($7.name)) ||
	   (isUintID($3.name) && isWordIMM($5.name) && isUintIMM($7.name)) )
    {
      //bin2bit_is_needed = true;
      addComment( "spritexy( UIntID, WordIMM, UIntIMM );");

      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );
      //addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );

      addAsm( str_LDA + "#$" + toHex(get_word_L(atoi(stripFirst(string($5.name)).c_str()))), 2, false );
      
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(string($7.name)).c_str())), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );

      // TODO: Set 9th BIT to WHATEVER IT SHOULD BE
      //addAsm( str_LDA + "#$" + toHex(get_word_H(atoi(stripFirst(string($5.name)).c_str()))), 2, false );

      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );


      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );

      //addAsm( str_PHA );
      //addAsm( str_JSR + "BIN2BIT", 3, false);
      //addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );

      addAsm( str_TAX, 1, false );
      addAsm( str_LDA + "#$" + toHex(get_word_H(atoi(stripFirst(string($5.name)).c_str()))), 2, false );
      addAsm( str_LSR, 1, false );
      addAsm( str_BCS + "!+", 2, false ); // if bit then store a 1 there x there
      addAsm( str_STX + "$D010", 3, false );
      addAsm( str_JMP + "!++", 3, false );
      addAsm( "!:\t" + str_TYA, 1, true );
      addAsm( str_ORA + "$D010", 3, false );
      addAsm( str_STA + "$D010", 3, false );
      addAsm( "!:", 0, true );


    }  
  else if( (isIntIMM($3.name) && isWordIMM($5.name) && isIntIMM($7.name)) ||
	   (isIntIMM($3.name) && isWordIMM($5.name) && isUintIMM($7.name)) ||
	   (isUintIMM($3.name) && isWordIMM($5.name) && isIntIMM($7.name)) ||
	   (isUintIMM($3.name) && isWordIMM($5.name) && isUintIMM($7.name)) )
    {
      addComment( "spritexy( UIntIMM, WordIMM, UIntIMM );");

      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
      //addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(get_word_L(atoi(stripFirst(string($5.name)).c_str()))), 2, false );

      //addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($5.name).c_str())), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($7.name).c_str())), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );

      // TODO: SET 9TH BIT to WHATEVER IT SHOULD BE
      //addAsm( str_LDA + "#$" + toHex(get_word_H(atoi(stripFirst(string($5.name)).c_str()))), 2, false );
      int sprite_number = atoi( stripFirst($3.name).c_str() );

      int ninth_bit = get_word_H(atoi( stripFirst($5.name).c_str() ));
      int mask;
      if( ninth_bit == 1 )
	{
	  // set the bit
	  switch( sprite_number )
	    {
	    case 0:
	      {
		addAsm( str_LDA + "#$01", 2, false );
		break;
	      }
	    case 1:
	      {
		addAsm( str_LDA + "#$02", 2, false );
		break;
	      }
	    case 2:
	      {
		addAsm( str_LDA + "#$04", 2, false );
		break;
	      }
	    case 3:
	      {
		addAsm( str_LDA + "#$08", 2, false );
		break;
	      }
	    case 4:
	      {
		addAsm( str_LDA + "#$10", 2, false );
		break;
	      }
	    case 5:
	      {
		addAsm( str_LDA + "#$20", 2, false );
		break;
	      }
	    case 6:
	      {
		addAsm( str_LDA + "#$40", 2, false );
		break;
	      }
	    case 7:
	      {
		addAsm( str_LDA + "#$80", 2, false );
		break;
	      }
	  
	    }
	  addAsm( str_ORA + "$D010", 3, false );
	  addAsm( str_STA + "$D010", 3, false );
	}
      else
	{
	  switch( sprite_number )
	    {
	    case 0:
	      {
		addAsm( str_LDA + "#$FE", 2, false );
		break;
	      }
	    case 1:
	      {
		addAsm( str_LDA + "#$FD", 2, false );
		break;
	      }
	    case 2:
	      {
		addAsm( str_LDA + "#$FB", 2, false );
		break;
	      }
	    case 3:
	      {
		addAsm( str_LDA + "#$F7", 2, false );
		break;
	      }
	    case 4:
	      {
		addAsm( str_LDA + "#$EF", 2, false );
		break;
	      }
	    case 5:
	      {
		addAsm( str_LDA + "#$DF", 2, false );
		break;
	      }
	    case 6:
	      {
		addAsm( str_LDA + "#$BF", 2, false );
		break;
	      }
	    case 7:
	      {
		addAsm( str_LDA + "#$7F", 2, false );
		break;
	      }
	  
	    }
	  addAsm( str_AND + "$D010", 3, false );
	  addAsm( str_STA + "$D010", 3, false );
	}
    }  
  else
    {
      addCompilerMessage( "unidentified argument type in spritexy", 3 );
    }
};

// STATEMENT
| tSPRITESET '(' expression ')'
{
  addComment( "spriteset( exp );" );
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      addComment( "spriteset( UIntIMM );" );
      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
    }
  else if( isA($3.name) )
    {
      addComment( "spriteset( A );" );
    }
  else
    {
      addCompilerMessage( "spriteset( exp ) of unknown type.", 0 );
      addComment( "spriteset( ??? );" );

      int x = getAddressOf($3.name);
      addAsm( str_LDA + getNameOf( x ), 3, false );
    }
  addAsm( str_STA + "$D015", 3, false );
};


| tPLOT '(' expression {addComment("mid-rule action");if(isA($3.name))addAsm(str_PHA + commentmarker + "\t\t\t\tx",1,false);} ',' expression {addComment("mid-rule action");if(isA($6.name))addAsm(str_PHA + commentmarker + "\t\t\t\ty",1,false);} ',' expression {addComment("mid-rule action");if(isA($9.name))addAsm(str_TAY + commentmarker + "\t\t\t\tc",1,false);} ')'
{
  string arg0 = string($3.name);
  string arg1 = string($6.name);
  string arg2 = string($9.name);

  addAsm( "#if SAFEMCPLOT", 0, true);
  addAsm( str_LDA + "$02", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$03", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$FA", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$FC", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$FD", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$FE", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$FF", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$22", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$50", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( "#endif", 0, true);
  
  multicolour_plot_is_needed = true;
  if( isWordID(arg0) && (isWordID(arg1)||isUintID(arg1)) && isUintID(arg2) )
    {
      addComment( "MC PLOT [WORD  WORD|UINT  UINT]" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c_addr = getAddressOf($9.name);
      
      // X Low - because this is Multicolour - the X coordinate fits into 1 byte
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // X High
      //addAsm( str_LDA+"#$00", 2, false ); // High Byte not needed
      //addAsm( str_STA + "$FB", 2, false );

      // Y
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
      //addAsm( str_JSR + "MCPLOT", 3, false );


      // colour
      addAsm( str_LDA + getNameOf(c_addr), 3, false );
      addAsm( str_STA + "$FD", 2, false );

      addAsm( str_JSR + "MCPLOT", 3, false );
      
    }
  else if( isWordID($3.name) && (isWordID($6.name)||isUintID($6.name)) && isUintIMM($9.name) )
    {
      addComment( "MC PLOT [WORD  WORD|UINT  UINT]" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c_addr = getAddressOf($9.name);
      
      // X Low - because this is Multicolour - the X coordinate fits into 1 byte
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // X High
      //addAsm( str_LDA+"#$00", 2, false ); // High Byte not needed
      //addAsm( str_STA + "$FB", 2, false );

      // Y
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
      //addAsm( str_JSR + "MCPLOT", 3, false );

      int c = atoi(stripFirst($9.name).c_str());
      addAsm( str_LDA + "#$" + toHex(c), 2, false );
      addAsm( str_STA + "$FD", 2, false );

      addAsm( str_JSR + "MCPLOT", 3, false );

    }
  else if( isA($3.name) && isA($6.name) && isA($9.name) )
    {
      addComment( "MCPLOT [A  A  A]" ); 
      int x = atoi(stripFirst($3.name).c_str());
      int y = atoi(stripFirst($6.name).c_str());
      int c = atoi(stripFirst($9.name).c_str());
      //addAsm( str_ );
      addAsm( str_STY + "$FD" + commentmarker + "Colour", 2, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$FC" + commentmarker + "Y", 2, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$FA" + commentmarker + "X", 2, false );
      
      addAsm( str_JSR + "MCPLOT", 3, false );
    }
  else if( isUintID($3.name) && (isWordID($6.name)||isUintID($6.name)) && isUintID($9.name) )
    {
      addComment( "MCPLOT [uint   word|uint   uintT" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c_addr = getAddressOf($9.name);

      // X Low - because this is Multicolour - the X coordinate fits into 1 byte
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // Y
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
      //addAsm( str_JSR + "MCPLOT", 3, false );

      // colour
      addAsm( str_LDA + getNameOf(c_addr), 3, false );
      addAsm( str_STA + "$FD", 2, false );

      addAsm( str_JSR + "MCPLOT", 3, false );
    }
  else if( isUintID($3.name) && (isWordID($6.name)||isUintID($6.name)) && isUintIMM($9.name) )
    {
      addComment( "MCPLOT [uint   word|uint   UintIMM" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c_value = atoi(stripFirst($9.name).c_str());

      // X Low - because this is Multicolour - the X coordinate fits into 1 byte
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // Y
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
      //addAsm( str_JSR + "MCPLOT", 3, false );

      // colour
      addAsm( str_LDA + "#$" + toHex(c_value), 2, false );
      addAsm( str_STA + "$FD", 2, false );

      addAsm( str_JSR + "MCPLOT", 3, false );

    }
  else if( isUintID($3.name) && (isWordID($6.name)||isUintID($6.name)) && isA($9.name) )
    {
      addComment( "MCPLOT [uint   word|uint   A]" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c = atoi(stripFirst($9.name).c_str());

      
      // X Low - because this is Multicolour - the X coordinate fits into 1 byte
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // Y
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );

      // colour
      //addAsm( str_PLA );

      // vv debug 
      //addAsm( str_LDA + "#$22" );
      // ^^ debug
      
      addAsm( str_STY + "$FD", 2, false );


      // ZP $02 was getting destroyed, so we need to save it
      //addAsm( str_TAY );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      //addAsm( str_TYA );
      
      //addAsm( str_LDA + "#$" + toHex(c), 2, false );
      //addAsm( str_STA + "$FD", 2, false );

      addAsm( str_JSR + "MCPLOT", 3, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      
    }
  else if( (isUintIMM($3.name)||isIntIMM($3.name)) && (isUintIMM($6.name)||isIntIMM($6.name)) && (isUintIMM($9.name)||isIntIMM($9.name)) )
    {
      addComment( "MCPLOT [IMM   IMM  IMM" ); 
      int x = atoi(stripFirst($3.name).c_str());
      int y = atoi(stripFirst($6.name).c_str());
      int c = atoi(stripFirst($9.name).c_str());
      addAsm( str_LDA + "#$" + toHex(x), 2, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "#$" + toHex(y), 2, false );
      addAsm( str_STA + "$FC", 2, false );
      addAsm( str_LDA + "#$" + toHex(c), 2, false );
      addAsm( str_STA + "$FD", 2, false );
      addAsm( str_JSR + "MCPLOT", 3, false );
    }
  else if( (isWordID($3.name)||isUintID($3.name)) && (isUintIMM($6.name)||isIntIMM($6.name)) && (isUintIMM($9.name)||isIntIMM($9.name)) )
    {
      addComment( "MCPLOT [ID   IMM  IMM]" );
      int x_addr = getAddressOf($3.name);

      
      int y = atoi(stripFirst($6.name).c_str());
      int c = atoi(stripFirst($9.name).c_str());

      // X Low - because this is Multicolour - the X coordinate fites into 1 byte
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );

      addAsm( str_LDA + "#$" + toHex(y), 2, false );
      addAsm( str_STA + "$FC", 2, false );
      addAsm( str_LDA + "#$" + toHex(c), 2, false );
      addAsm( str_STA + "$FD", 2, false );
      addAsm( str_JSR + "MCPLOT", 3, false );
    }
  else
    {
      addCompilerMessage( "type not implemented yet for plot" );
    }
  addAsm( "#if SAFEMCPLOT", 0, true);
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$50", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$22", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$FF", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$FE", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$FD", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$FC", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$FA", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$03", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$02", 2, false );
  addAsm( "#endif", 0, true );
};
| tCOMMENT '(' STR  ')'
{
  string commentstring = string($3.name);
  // strip the quotes off of the string and remove an unnecessary space at the beginning
  addAsm( commentmarker.substr(1,3) + commentstring.substr(1,commentstring.length()-2), 0, true );
};

// THIS IS BROKEN - mkpellegrino 2023 02 15
// 2023 06 13 - working on it

| ID '[' expression {if(isA($3.name)){addAsm(str_PHA);}} ']' init
{
  string arg0 = string($1.name);
  string arg1 = string($3.name);
  string arg2 = string($6.name);

  char* ag0 = $1.name;
  char* ag1 = $3.name;
  char* ag2 = $6.name;

  if( isA(arg1.c_str() ) && !isXA(arg2.c_str() ) )
    {
      // remove last instruction
      // it should be a "pha"
      // deletePreviousAsm(); // pha
      addAsm( str_PLA, 1, false );
    }

  //addCompilerMessage( arg0 + "[" + getNameOf(hexToDecimal(stripFirst(arg1).c_str())) + "]=" + arg2, 0 ); 
  addComment( "Array Initialisation" );
  addParserComment( "RULE: statement: ID '[' expression ']' init" );
  current_variable_type=getTypeOf(arg0.c_str());
  current_variable_base_address = getAddressOf(arg0.c_str());

  
  //if( isUintID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isA(arg2.c_str()) )
  if( isUintID( arg0.c_str() ) && (isUintID(ag1) || isIntID(arg1.c_str())) && isA(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntID] = A" ); 
      int addr_of_index = getAddressOf(arg1.c_str());
      addAsm( str_LDX + getNameOf( addr_of_index ), 3, false );
      addAsm( str_STA + getNameOf( current_variable_base_address ) + ",X", 3, false );
    }
  else if( isIntID(ag0) && isUintIMM(ag1) && isXA(ag2))
    {
      int tmp_index = atoi(stripFirst(ag1).c_str());

      addComment( "IntID_array[UintID] = XA" ); 
      //addAsm( str_LDX + toHex( tmp_index ), 3, false );
      addAsm( str_STA + getNameOf(getAddressOf(arg0.c_str())) + "+" + stripFirst(arg1.c_str()), 3, false );
    }      
  else if( isIntID(arg0.c_str()) && isUintIMM(arg1.c_str()) && isA( arg2.c_str() ))
    {
      addComment( "IntID_array[UIntIMM] = A" );
      addAsm( str_STA + getNameOf(getAddressOf(arg0.c_str())) + "+" + stripFirst(arg1.c_str()), 3, false );
    }
  else if( isUintID(arg0.c_str()) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isXA(arg2.c_str()) )
    {
      addComment( "UINT array[(U)IntID] = XA;" );
      addCompilerMessage( "Setting Uint = XA, losing high byte", 1 );
      addAsm( str_TAY );
      int tmp_i = getAddressOf( arg1.c_str() );
      int tmp_v = getAddressOf( arg0.c_str() );
      addComment( "TODO: Check to see if the next line is an Address or what!" );
      addAsm( str_LDA + "$" + toHex(tmp_i), 3, false ); 
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_STA + "$" + toHex( tmp_v ) + string( ",X" ), 3, false );
    }
  else if( isUintID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isA(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntIMM] = A" );

      int tmp_index = atoi(stripFirst(arg1.c_str()).c_str());
      //addAsm( str_LDX + "#$" + toHex(tmp_index), 2, false );
      //addAsm( str_STA + getNameOf( current_variable_base_address ) +",X" , 3, false );
      addAsm( str_STA + getNameOf( current_variable_base_address ) + "+" + stripFirst(arg1.c_str()), 3, false );
    }
  else if( isUintID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isUintID(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntIMM] = UintID" );
      int tmp_v = getAddressOf(arg2.c_str());
      int tmp_index = atoi(stripFirst(arg1.c_str()).c_str());
      addAsm( str_LDA + getNameOf(tmp_v), 3, false );
      //addAsm( str_LDX + "#$"  + toHex(tmp_index), 2, false );
      //addAsm( str_STA + getNameOf( current_variable_base_address ) + ",X" , 3, false );
      addAsm( str_STA + getNameOf( current_variable_base_address ) + "+" + stripFirst(arg1.c_str()), 3, false );
    }
  else if( isUintID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isUintID(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntID] = UintID" );
	    
      int tmp_v = getAddressOf(arg2.c_str());
      int tmp_index = getAddressOf(arg1.c_str());
      addAsm( str_LDA + getNameOf(tmp_v), 3, false );
      addAsm( str_LDX + getNameOf(tmp_index), 3, false );
      addAsm( str_STA + getNameOf( current_variable_base_address ) + ",X", 3, false );
    }
  else if( isWordID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isXA(arg2.c_str()) )
    {
      addComment( "wordarray[(U)IntID] = XA;" );

      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_PHA );
      int tmp_i = getAddressOf( arg1.c_str() );
      int tmp_v = getAddressOf( arg0.c_str() );
      addAsm( str_LDA + getNameOf(tmp_i), 3, false ); 
      addAsm( str_ASL );// 2* because it's a word array... not a byte array
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_STA + getNameOf( tmp_v ) + ",X", 3, false );
      addAsm( str_PLA );
      addAsm( str_INX );
      addAsm( str_STA + getNameOf( tmp_v ) + ",X", 3, false );
    }
  else if( isWordID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isWordIMM(arg2.c_str()) )
    {
      addComment( "WordID[UintID] = WordIMM;" );

      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = getAddressOf(arg1.c_str());
      int tmp_w = atoi( stripFirst(arg2.c_str()).c_str() );
      addAsm( str_LDA + getNameOf( tmp_i ), 3, false );
      addAsm( str_ASL );  // 2* because it's a word array... not a byte array
      addAsm( str_TAX );
      addAsm( str_LDA + "#<" + getNameOf(tmp_w), 2, false );
      addAsm( str_STA + getNameOf( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#>" + getNameOf(tmp_w), 2, false );
      addAsm( str_STA + getNameOf( current_variable_base_address ) + string( ",X" ), 3, false );
    }
  else if( isWordID(arg0.c_str()) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isWordID(arg2.c_str()) )
    {
      addComment( "WordID[UintID] = WordID;" );

      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = getAddressOf(arg1.c_str());
      int tmp_w = getAddressOf(arg2.c_str());
      addAsm( str_LDA + "$" + toHex( tmp_i ), 3, false ); 
      addAsm( str_ASL ); // 2* because it's a word array... not a byte array
      addAsm( str_TAX );
      addAsm( str_LDA + "#<" + getNameOf(tmp_w), 2, false );
      addAsm( str_STA + getNameOf( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#>" + getNameOf(tmp_w), 2, false );
      addAsm( str_STA + getNameOf( current_variable_base_address ) + string( ",X" ), 3, false );
    }
  else if( isWordID(arg0.c_str()) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isWordID(arg2.c_str()) )
    {
      // does this actually work?
      addComment( "WordID[UintIMM] = WordID" );

      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = 2*atoi( stripFirst(arg1.c_str()).c_str() );  // 2* because it's a word array... not a byte array
      int tmp_w = getAddressOf(arg2.c_str());

      addAsm( str_LDA + "#<" + toHex( getAddressOf(arg2.c_str())), 2, false );
      //addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_w) ), 2, false );
      addAsm( str_STA + getNameOf( getAddressOf( arg0.c_str() ) ) + "+" + itos(2*atoi(stripFirst(arg1.c_str()).c_str())), 3, false );

      addAsm( str_LDA + "#>" + toHex(getAddressOf(arg2.c_str())), 2, false );
      //addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_w) ), 2, false );
      addAsm( str_STA + getNameOf( getAddressOf( arg0.c_str() ) ) + "+" + itos(1+2*atoi(stripFirst(arg1.c_str()).c_str())), 3, false );

    }
  else if( isWordID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isWordIMM(arg2.c_str()) )
    {
      addComment( "WordID[UintIMM] = WordIMM" );
      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = 2*atoi( stripFirst(arg1.c_str()).c_str() );  // 2* because it's a word array... not a byte array
      int tmp_w = atoi( stripFirst(arg2.c_str()).c_str() );

      addAsm( str_LDA + "#<" + toHex(getAddressOf(arg2.c_str())), 2, false );    
      //addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_w) ), 2, false );

      addAsm( str_STA + getNameOf( tmp_base ) + "+" + itos(tmp_i), 3, false );
      
      addAsm( str_LDA + "#>" + toHex(getAddressOf(arg2.c_str())), 2, false );
      //addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_w) ), 2, false );
      
      addAsm( str_STA + getNameOf( tmp_base ) + "+" + itos(tmp_i+1), 3, false );
    }
  else if( isWordID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isXA(arg2.c_str()) )
    {
      addComment( "word array[(U)IntIMM] = XA;" );
      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = 2*atoi( stripFirst(arg1.c_str()).c_str() );  // 2* because it's a word array... not a byte array

      int tmp_w = atoi( stripFirst(arg2.c_str()).c_str() );

      //addAsm( str_TAY );
      //addAsm( str_TXA );
      //addAsm( str_PHA );
      //addAsm( str_TYA );
      addAsm( str_STA + getNameOf( tmp_base ) + "+" + itos(tmp_i), 3, false );
      //addAsm( str_PLA );
      addAsm( str_STX + getNameOf( tmp_base ) + "+" + itos(tmp_i+1), 3, false );
    }
  else if(isWordID(arg0.c_str()) && isA(arg1.c_str()) && isXA(arg2.c_str()))
    {
      // TODO: Redo this with self modifying code
      // so it compiles to something like:
      // PLA
      // STA $????
      // PLA
      // STA $????+1
      addComment( "WORD array[A] = XA; (with an MRA)" );
      int tmp_base_address = getAddressOf( arg0.c_str() );
      
      // arg1 (the array index) is on the processor stack      
      addAsm( str_JSR + "PUSH", 3, false ); // push A from XA onto our stack
      addAsm( str_TXA );
      addAsm( str_JSR + "PUSH", 3, false ); // push X from XA onto our stack

      addAsm( str_PLA );
      addAsm( str_ASL + commentmarker + "*2 b/c its a WORD array", 1, false);
      addAsm( str_TAY );
      addAsm( str_INY + commentmarker + "b/c we will store X first",1,false);
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA ); // push $02 onto processor stack
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA ); // push $03 onto processor stack

      addAsm( str_LDA + "#<" +  getNameOf(tmp_base_address), 2, false );
      //addAsm( str_LDA + "#$" +  toHex(get_word_L(tmp_base_address)), 2, false );
      addAsm( str_STA + "$02", 2, false );
      //addAsm( str_LDA + "#$" +  toHex(get_word_H(tmp_base_address)), 2, false );
      addAsm( str_LDA + "#>" +  getNameOf(tmp_base_address), 2, false );
      addAsm( str_STA + "$03", 2, false );

      addAsm( str_JSR + "POP", 3, false ); // pop X from XA off of our stack
      addAsm( str_STA + "($02),Y", 2, false );
      addAsm( str_DEY );
      addAsm( str_JSR + "POP", 3, false ); // pop A from XA off of our stack
      addAsm( str_STA + "($02),Y", 2, false );

      // restore $02 and $03
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );

    }
  else
    {
      addCompilerMessage( "Unable to initialise ARRAY", 3 );
    }
};
| ID init 
{
  // Variable assignments

  string _id = string($1.name);
  string _init = string($2.name);

  current_variable_type=getTypeOf(_id);
  current_variable_base_address = getAddressOf(_id);
  
  if(current_variable_base_address == -1)
    {
      addCompilerMessage( "Undeclared Variable: " + _id, 3 );
    }
  
  addParserComment( "RULE: statement: ID init" );

  if( isWordID(_id) && isA(_init) )
    {
      addComment("WordID = A" );
      int addr = getAddressOf(_id);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;

      // 2024 04 14 - mkpellegrino
      addAsm( str_STA + getNameOf(addr), instr_size, false);
      instr_size = 3;
      if( addr+1 < 256 ) instr_size = 2;
      addAsm( str_LDA + "#$00", 2, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_STA + getNameOf(addr) + " +1", instr_size, false);
      
    }
  else if( isWordID(_id) && isXA(_init) )
    {
      addComment("WordID = XA" );
      int addr = getAddressOf(_id);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_STA + getNameOf(addr), instr_size, false);
      instr_size = 3;
      if( addr+1 < 256 ) instr_size = 2;
      addAsm( str_STX + getNameOf(addr) + " +1", instr_size, false);
    }
  else if( isWordID(_id) && isFAC(_init) )
    {
      addComment("WordID = FAC" );
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      addAsm( str_STY + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_STA + getNameOf(getAddressOf(_id)) + " +1", 3, false );
    }  
  else if( isFloatID(_id) && isXA(_init) )
    {
      addComment( "FloatID = XA" );
      addComment( "^v^ OPTIMIZE v^v" );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if( isFloatID(_id) && isA(_init) )
    {
      addComment("FloatID = A" );
      addComment( "^v^ OPTIMIZE v^v" );
      addAsm( str_TAY, 1, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if( isFloatID(_id) && isFAC(_init) )
    {
      addComment("FloatID = FAC" );
      addAsm( str_LDX + "#<" + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf(_id)), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if( isIntID(_id) && isA(_init) )
    {
      addComment( "IntID = A" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size=2; 
      addAsm( str_STA + getNameOf(current_variable_base_address), instr_size, false);
    }
  else if( isUintID(_id) && isA(_init) )
    {
      addComment( "UintID = A" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size=2; 
      addAsm( str_STA + getNameOf(current_variable_base_address), instr_size, false);
    }
  else if( isIntID && isXA(_init) )
    {
      addComment( "IntID = XA" );
      addCompilerMessage("setting a 1 byte memory location to a 2 byte value... losing High Byte",0);

      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size=2; 
      addAsm( str_STA + getNameOf(current_variable_base_address), instr_size, false);
    }
  else if( (isUintID(_id)||isIntID(_id)) && isXA(_init) )
    {
      // this should happen only if the instruction is
      // something specific
      addAsm( "// ^^^ OPTIMIZE (maybe) ^^^", 0, false );
      addComment( "UintID init with XA" );
      addCompilerMessage("setting a 1 byte memory location to a 2 byte value... losing High Byte",0);
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm( str_STA + getNameOf(current_variable_base_address), instr_size, false );
    }
  else if( (isUintID(_id)||isIntID(_id)) && isFAC(_init) )
    {
      addComment("UIntID = FAC" );
      addCompilerMessage("setting a 1 byte memory location to a Floating Point byte value... losing Sign and Fidelity",0);
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      addAsm( str_STY + getNameOf(getAddressOf(_id)), 3, false );
    }
  else
    {
      addCompilerMessage( "ID initialisation error: invalid initialiser", 3 );
    } 
};
| tSCREEN '(' expression ')'
{
  //addAsm( str_SEI );
  if( isUintID( $3.name ) || isIntID( $3.name ) || isWordID( $3.name ))
    {
      addComment("screen(UintID|IntID|WordID): set bit 4 of $D011 to LSB of expression (as in b00010000)");
      if( isWordID( $3.name ) )
	{
	  addCompilerMessage( string("screen(WordID) where ") + getNameOf(getAddressOf($3.name)) + string(" is a word... ignoring High Byte"), 0 );
	}
      int instr_size = 3;
      int v = getAddressOf( $3.name );
      if( v < 256 ) instr_size = 2;
      addAsm( str_LDA + getNameOf(v), instr_size, false );
      addAsm( str_CLC, 1, false );
      addAsm( str_ROR, 1, false );
      addAsm( str_BCS + "!+" + commentmarker + "branch to setbit", 2, false );
      addComment( "clearBit" );
      addAsm( str_LDA + "#$EF", 2, false );
      addAsm( str_AND + "$D011", 3, false );
      addAsm( str_BCC + "!++" + commentmarker + "skip over setbit", 2, false );
      addComment( "setBit" );
      addAsm( "!:\t" + str_LDA + "#$10", 2, true );
      addAsm( str_ORA + "$D011", 3, false );
      addAsm( "!:\t" + str_STA + "$D011", 3, true );
      
    }
  else if( isUintIMM( $3.name ) || isIntIMM( $3.name ) | isWordIMM( $3.name ))
    {
      addComment("screen(UINTIMM): set bit 4 of $D011 to LSB of expression (as in b00010000)");

      if( isWordIMM( $3.name ))
	{
	  addCompilerMessage( "screen(WordIMM)... ignoring High Byte", 0 );
	}
	  
      int v = atoi( stripFirst($3.name).c_str());

      //addAsm( str_LDA + "#$" + toHex(v), 2, false );
      if( v == 0 )
	{
	  addComment( "Turning Screen Off" );
	  addAsm( str_LDA + "#$EF", 2, false );
	  addAsm( str_AND + "$D011", 3, false );
	  addAsm( str_STA + "$D011", 3, false );
	}
      else
	{
	  addComment( "Turning Screen On" );
	  addAsm( str_LDA + "#$10", 2, false );
	  addAsm( str_ORA + "$D011", 3, false );
	  addAsm( str_STA + "$D011", 3, false );
	}
    }
  else if( isA( $3.name ) || isXA( $3.name ))
    {
      addComment("screen(A || XA): set bit 4 of $D011 to LSB of expression (as in b00010000)");

      if( isXA( $3.name ) )
	{
	  addCompilerMessage( string("screen(XA)... ignoring X"), 0 );
	}

      
      addAsm( str_CLC, 1, false );
      addAsm( str_ROR, 1, false );
      addAsm( str_BCS + "!+" + commentmarker + "branch to setbit", 2, false );
      addComment( "clearBit" );
      addAsm( str_LDA + "#$EF", 2, false );
      addAsm( str_AND + "$D011", 3, false );
      addAsm( str_BCC + "!++" + commentmarker + "skip over setbit", 2, false );
      addComment( "setBit" );
      addAsm( "!:\t" + str_LDA + "#$10", 2, true );
      addAsm( str_ORA + "$D011", 3, false );
      addAsm( "!:\t" + str_STA + "$D011", 3, true );
    }
  else
    {
      addCompilerMessage( "incorrect type for 'screen' must be Word, Uint, Int, A, or XA", 3 );
    }
  //popScope();
};

| tFCLOSE '(' expression ')'
{
  addComment( "fclose" );
  if( isUintIMM( $3.name ) || isIntIMM( $3.name ) )
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isUintID( $3.name ) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
    }
  else if( isA($3.name) )
    {
      // already in A... do nothing
    }
  else
    {
      addCompilerMessage( "for now Paramater (Logical#) must be a UintIMM, uintID or in A", 3);
    }
  addAsm( str_JSR + "$FFC3", 3, false );
};
| tFOPEN '(' ')'
{
  addComment( "fopen" );
  addAsm( str_JSR + "$FFC0", 3, false );
};
| tSETNAM '(' expression ')'
{
  addDebugComment( "Set Filename (expression)" );
  if( isXA($3.name) )
    {
      addComment( "setfilename( XA );" );
      
      // find the length of the string first
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_STX + "!+++", 3, false );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );
      
      addAsm( str_LDX + "#$00", 2, false );
      
      addAsm( "!:\t" + str_BYTE + "$BD" + commentmarker + "<-- LDA Absolute,X", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );

      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!---", 3, false );
      // now X contains the string length
      addAsm( "!:\t" + str_STX + "!--", 3, true  ); // use this space temporarily

      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_TAX );

      addAsm( str_LDA + "!--", 3, false ); 
      addAsm( str_JSR + "$FFBD", 3, false );
    }
  else if( isWordID( $3.name ) )
    {
      //addAsm( str_NOP );

      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_LDX + getNameOf(getAddressOf($3.name)) + "+1", 3, false );
      
      // find the length of the string first
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_STX + "!+++", 3, false );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );
      
      addAsm( str_LDX + "#$00", 2, false );
      
      addAsm( "!:\t" + str_BYTE + "$BD" + commentmarker + "<-- LDA Absolute,X", 1, true ); // LDA absolute,X
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );

      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!---", 3, false );
      // now X contains the string length
      addAsm( "!:\t" + str_STX + "!--", 3, true  ); // use this space temporarily

      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_TAX );

      addAsm( str_LDA + "!--", 3, false ); 
      addAsm( str_JSR + "$FFBD", 3, false );
    }
  else if( isUintID( $3.name ) )
    {
      //addAsm( str_NOP );

      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false );
      addAsm( str_LDX + "#>" + getNameOf(getAddressOf($3.name)) + "+1", 2, false );
      
      // find the length of the string first
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_STX + "!+++", 3, false );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );
      
      addAsm( str_LDX + "#$00", 2, false );
      
      addAsm( "!:\t" + str_BYTE + "$BD" + commentmarker + "<-- LDA Absolute,X", 1, true ); // LDA absolute,X
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );

      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "!---", 3, false );
      // now X contains the string length
      addAsm( "!:\t" + str_STX + "!--", 3, true  ); // use this space temporarily

      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_TAX );

      addAsm( str_LDA + "!--", 3, false ); 
      addAsm( str_JSR + "$FFBD", 3, false );
    }
  else
    {
      addCompilerMessage( "unexpected type", 3);
    }
  
};
| tSETNAM '(' STR ')'
{
  addComment( "Set Filename" );
  addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );
  addAsm( str_LDA + "#$" + toHex( string($3.name).length()-2), 2, false );
  addAsm( str_LDX + "#<STRLBL" + itos(string_number), 2, false );
  addAsm( str_LDY + "#>STRLBL" + itos(string_number++), 2, false );
  addAsm( str_JSR + "$FFBD", 3, false );
};
| tFCLRCHN '(' ')'
{
  addComment( "fclrchn" );
  addAsm( str_JSR + "$FFCC", 3, false );
};
| tFCHROUT '(' expression ')'
{
  addComment( "fchrout" );
  if( isA( $3.name ) )
    {
      // do nothing, it's in A already
    }
  else if( isUintIMM( $3.name ) )
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isUintID($3.name) )
    {
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );
    }
  else
    {
      addCompilerMessage( "chrout argument must be A, UintID, or UintIMM", 3 );			 
    }
  addAsm( str_JSR + "$FFD2", 3, false );
};
| tFCHKOUT '(' expression ')'
{
  addComment( "fchkout" );
  if( isUintIMM( $3.name ) )
    {
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isUintID($3.name) )
    {
      addAsm( str_LDX + getNameOf(hexToDecimal($3.name)), 3, false );
    }
  else
    {
      addCompilerMessage( "for now Param1 (Logical#) must be a UintIMM", 3);
    }
  addAsm( str_JSR + "$FFC9", 3, false );
  
};
| tFCHKIN '(' expression ')'
{
  addComment( "fchkin" );
  if( isUintIMM( $3.name ) )
    {
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isA( $3.name ) )
    {
      addAsm( str_TAX, 1, false );
    }
  else if( isUintID( $3.name ) )
    {
      int tmp_addr = hexToDecimal($3.name); 
      int size_of_instruction = 3;
      if( tmp_addr <= 255 ) size_of_instruction = 2;
      addAsm( str_LDX + getNameOf(tmp_addr), size_of_instruction, false ); 
    }
  else
    {
      addCompilerMessage( "for now Param1 (Logical#) must be a A, UintIMM or UintID", 3);
    }
  addAsm( str_JSR + "$FFC6", 3, false );
  
};
| tSETLFS '(' expression ',' expression ',' expression ')'
{
  addComment( "Set Logical File System" );
  if( isUintIMM( $3.name ) )
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isUintID($3.name) )
    {
      addAsm( str_LDA + getNameOf(hexToDecimal($3.name)), 3, false );
    }

  else
    {
      addCompilerMessage( "for now Param1 (Logical#) must be a UintIMM", 3);
    }
  if( isUintIMM( $5.name ) )
    {
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($5.name).c_str())), 2, false ); 
    }
  else if( isUintID($5.name) )
    {
      addAsm( str_LDX + getNameOf(hexToDecimal($5.name)), 3, false );
    }
  else
    {
      addCompilerMessage( "for now Param2 (Device #) must be a UintIMM", 3);
    }
  if( isUintIMM( $7.name ) )
    {
      addAsm( str_LDY + "#$" + toHex(atoi(stripFirst($7.name).c_str())), 2, false );
    }
  else if( isUintID($7.name) )
    {
      addAsm( str_LDY + getNameOf(hexToDecimal($7.name)), 3, false );
    }
  else
    {
      addCompilerMessage( "for now Param3 (Secondary#) must be a UintIMM, UIntID", 3);
    }
  addAsm( str_JSR + "$FFBA", 3, false );  
};
/* | tSAVE '(' STR ',' expression ',' expression ')' */
/* { */
/*   pushScope("SAVE"); */
/*   save_is_needed = true; */
/*   addAsm( str_SEI ); */


/*   addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() ); */


/*   int datasize; */
/*   int memoryloc; */
/*   if( isUintIMM($7.name) ) */
/*     { */
/*       datasize = atoi(stripFirst($7.name).c_str()); */
/*     } */
/*   else */
/*     { */
/*       addCompilerMessage( "Size must be a UintIMM", 3 ); */
/*     } */
/*   if( isWordIMM($5.name) ) */
/*     { */
/*       memoryloc = atoi(stripFirst($5.name).c_str()); */
/*       addAsm( str_LDA + "#>$" + toHex(memoryloc), 2, false ); */
/*       addAsm( str_PHA ); */
      
/*       addAsm( str_LDA + "#<$" + toHex(memoryloc), 2, false ); */
/*       addAsm( str_PHA ); */
/*     } */
/*   else if( isWordID($5.name) ) */
/*     { */
/*       memoryloc = atoi(stripFirst($5.name).c_str()); */
/*       addAsm( str_LDA + "$" + toHex(memoryloc), 3, false ); */
/*       addAsm( str_PHA ); */
/*       addAsm( str_LDA + "$" + toHex(memoryloc+1), 3, false ); */
/*       addAsm( str_PHA ); */
/*     } */
/*   else */
/*     { */
/*       addCompilerMessage( "Memory Location must be a WordIMM or WordID", 3 ); */
/*     } */
  


/*   addAsm( str_LDA + "#$" + toHex( string($3.name).length()-2), 2, false ); */
/*   addAsm( str_PHA ); */
  
/*   addAsm( str_LDA + "#>STRLBL" + itos(string_number), 2, false ); */
/*   addAsm( str_PHA ); */

/*   addAsm( str_LDA + "#<STRLBL" + itos(string_number++), 2, false ); */
/*   addAsm( str_PHA ); */
  
/*   addAsm( str_LDA + "#$" + toHex(datasize), 2, false ); */
/*   addAsm( str_PHA ); */

/*   addAsm( str_JSR + "SAVE", 3, false ); */
/*   addAsm( str_CLI ); */

/*   popScope(); */
/* }; */
/* | tLOAD '(' STR ',' expression ',' expression ')' */
/* { */
/*   pushScope("LOAD"); */
/*   addAsm( str_SEI ); */

/*   //load16_is_needed = true; */
/*   //load_is_needed = true; */

/*   addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() ); */

/*   // attached Disk Filename, memorylocation, size (in bytes) */
/*   int datasize; */
/*   int memoryloc; */
  
/*   if( isUintIMM($7.name) || isWordIMM($7.name) ) */
/*     { */
/*       datasize = atoi(stripFirst($7.name).c_str()); */
/*     } */
/*   else  */
/*     { */
/*       addCompilerMessage( "Size must be a UintIMM/WordIMM", 3 ); */
/*     } */

/*   if( datasize > 255 ) */
/*     { */
/*       load16_is_needed = true; */
/*     } */
/*   else */
/*     { */
/*       load_is_needed = true; */
/*     } */

  
/*   if( isWordIMM($5.name) ) */
/*     { */
/*       memoryloc = atoi(stripFirst($5.name).c_str()); */
/*       addAsm( str_LDA + "#>$" + toHex(memoryloc), 2, false ); */
/*       addAsm( str_PHA ); */
      
/*       addAsm( str_LDA + "#<$" + toHex(memoryloc), 2, false ); */
/*       addAsm( str_PHA ); */
      
/*     } */
/*   else if( isWordID($5.name) ) */
/*     { */
/*       memoryloc = atoi(stripFirst($5.name).c_str()); */

/*       addAsm( str_LDA + "$" + toHex(memoryloc), 3, false ); */
/*       addAsm( str_PHA ); */
      
/*       addAsm( str_LDA + "$" + toHex(memoryloc+1), 3, false ); */
/*       addAsm( str_PHA ); */
/*     } */
/*   else */
/*     { */
/*       addCompilerMessage( "Memory Location must be a WordIMM or WordID", 3 ); */
/*     } */

/*   addComment( "push the address of the filename onto the stack" ); */
/*   addAsm( str_LDA + "#$" + toHex( string($3.name).length()-2), 2, false ); */
/*   addAsm( str_PHA ); */
  
/*   addAsm( str_LDA + "#>STRLBL" + itos(string_number), 2, false ); */
/*   addAsm( str_PHA ); */

/*   addAsm( str_LDA + "#<STRLBL" + itos(string_number++), 2, false ); */
/*   addAsm( str_PHA ); */

/*   addComment( "push the number of bytes onto the stack" ); */
/*   addAsm( str_LDA + "#$" + toHex(datasize), 2, false ); */
/*   addAsm( str_PHA ); */

/*   if( datasize > 255 ) */
/*     { */
/*       addAsm( str_JSR + "LOAD16", 3, false ); */
/*     } */
/*   else */
/*     { */
/*       addAsm( str_JSR + "LOAD", 3, false ); */
/*     } */
/*   addAsm( str_CLI ); */
    
/*   popScope(); */
/* }; */
| tIMPORT '(' STR ',' STR ',' expression ')' 
{

  string arg0 = stripQuotes($3.name);
  //cerr << $7.name << endl;
  string arg1 = string($5.name);
  if( arg0 == string("BIN") || arg0 == string("bin") )
    {

      if( isWordIMM($7.name) )
	{
	  string s1 = string( ".import binary " ) + $5.name;
	  asm_instruction * my_asm1 = new asm_instruction( s1 );
	  my_asm1->setLabel(true);
	  my_asm1->setSize(0);
	  my_asm1->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm1 );
	  
	  
	  string s0 = string( "* = $" ) + toHex(atoi(stripFirst($7.name).c_str()));
	  asm_instruction * my_asm0 = new asm_instruction( s0 );
	  my_asm0->setLabel(true);
	  my_asm0->setSize(0);
	  my_asm0->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm0 );
	}
      else
	{
	  addCompilerMessage( "argument MUST be WordIMM", 3 );
	}

    }
  else if ( arg0 == string("SID") || arg0 == string("sid") )
    {
      if( isWordIMM($7.name) )
	{
       	  music_init_addr = 1;

	  string s4 = string( ".fill music.size, music.getData(i)" );
	  asm_instruction * my_asm4 = new asm_instruction(s4);
	  my_asm4->setLabel(true);
	  my_asm4->setSize(0);
	  my_asm4->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm4 );
     
	  string s3 = string( "*=music.location" );
	  asm_instruction * my_asm3 = new asm_instruction(s3);
	  my_asm3->setLabel(true);
	  my_asm3->setSize(0);
	  my_asm3->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm3 );
	  
	  string s2 = string( ".print \"init=$\"+toHexString(music.init)" );
	  asm_instruction * my_asm2 = new asm_instruction( s2 );
	  my_asm2->setLabel(true);
	  my_asm2->setSize(0);
	  my_asm2->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm2 );
	  
	  string s1 = string( ".print \"play=$\"+toHexString(music.play)" );
	  asm_instruction * my_asm1 = new asm_instruction( s1 );
	  my_asm1->setLabel(true);
	  my_asm1->setSize(0);
	  my_asm1->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm1 );
	  
	  string s0 = string( ".var music = LoadSid(" ) + $5.name + ")";
	  asm_instruction * my_asm0 = new asm_instruction( s0 );
	  my_asm0->setLabel(true);
	  my_asm0->setSize(0);
	  my_asm0->setAddress(0);
	  asm_instr.insert( asm_instr.begin(), my_asm0 );
	  sid_was_imported = true;
	}
      else
	{
	  addCompilerMessage( "argument MUST be WordIMM", 3 );
	}
    }
  else
    {
      addCompilerMessage( "import must be of type: bin or sid", 3 );
    }
  
};
// EXPRESSIONS?



init: '=' expression
{
  addParserComment( string( "RULE: init: '=' expression" ) );
  
  int variable_type = getTypeOf( $$.name );

  if( isARG($2.name)  )
    {
      addCompilerMessage( "ARG is being removed", 3 );
      addComment( "initialising with ARG" );
      strcpy($$.name, "_ARG" );
    }
  else if( isXA($2.name)  )
    {
      addComment( "initialising with XA" );
      strcpy($$.name, "_XA" );
    }
  else if( isFAC($2.name)  )
    {
      addComment( "initialising with FAC" );
      strcpy($$.name, "_FAC" );
    }  
  else if( isMOB($2.name)  )
    {
      addCompilerMessage( "MOB type has been removed (for now)", 3 );
      addComment( "initialising a sprite with MOB" );
      strcpy($$.name, "_MOB" );
    }  
  else if( isA($2.name) )
    {
      addComment( "initialising with A" );
      strcpy($$.name, "_A" );
    }
  else if( isFloatIMM($2.name) )
    {
      addComment( "initialising with FloatIMM" );
      //inlineFloat( $2.name, 105 );
      // 2025 07 01 - mkpellegrino
      //inlineFloat( $2.name, 25 );
      inlineFloat( $2.name );
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($2.name) )
    {
      addComment( "initialising with FloatID" );
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($2.name)), 3, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($2.name)), 3, false );
      addComment( "RAM -> FAC" );
      addAsm( str_JSR + "$BBA2", 3, false );
      strcpy($$.name, "_FAC" );
    }
  else if( isWordID( $2.name ) )
    {
      int tmp_addr = hexToDecimal($2.name);
      int instr_size = 3;
      if(tmp_addr < 256) instr_size = 2;
      addComment( "initialising with WordID" );

      addAsm( str_LDA + getNameOf(tmp_addr), instr_size, false );
      instr_size = 3;
      if(tmp_addr < 255) instr_size = 2;
      addAsm( str_LDX + getNameOf(tmp_addr) + " +1",instr_size, false );
      strcpy($$.name, "_XA" );
    }
  else if( isUintID( $2.name ) )
    {
      int tmp_addr = hexToDecimal($2.name); 
      addComment( "initialising with UintID" );
      int instr_size = 3;
      if(tmp_addr < 256) instr_size = 2;
      addAsm( str_LDA + getNameOf(tmp_addr), instr_size, false );
      strcpy($$.name, "_A" );
    }
  else if( isIntID( $2.name ) )
    {
      int tmp_addr = hexToDecimal($2.name); 
      addComment( "initialising with IntID" );
      int instr_size = 3;
      if(tmp_addr < 256) instr_size = 2;

      addAsm( str_LDA + getNameOf(tmp_addr), instr_size, false );
      strcpy($$.name, "_A" );
    }
  else if( isUintIMM($2.name) )
    {
      addComment( "initialising with UintIMM" );
      
      int v = atoi( stripFirst($2.name).c_str() );
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      strcpy( $$.name, "_A" );
      if( v > 127 )
	{
	  int_uint = true;
	}
      else
	{
	  int_uint = false;
	}
      
    }
  else if( isIntIMM($2.name) )
    {
      addComment( string("initialising with IntIMM: ") + $2.name );
      int v = atoi( stripFirst($2.name).c_str() );
      if( v < 0 )
	{
	  addComment( "... two's complement ..." );
		     
	  v = twos_complement(v);
	}
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      strcpy( $$.name, "_A" );
    }
  else if( isWordIMM($2.name) )
    {
      addComment( string("initialising with WordIMM: ") + $2.name );

      int tmp_int = atoi( stripFirst($2.name).c_str() );
      if( get_word_L(tmp_int) ==  get_word_H(tmp_int) )
	{
	  addComment( "undocumented instruction" );
	  addAsm( str_LAX + "#$" + toHex( get_word_L(tmp_int)), 2, false );
	  //addAsm( str_TAX );
	}
      else
	{
	  addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int) ), 2, false);
	  addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int) ), 2, false);
	}
      strcpy($$.name, "_XA" ); 
    }
  else if( isNULL($2.name) )
    {
      //addComment( "initialising NULL" );
      strcpy($$.name, "NULL" );
    }
  else
    {
      addComment( "What is this?  Pass it on!" );
      addComment( $2.name );
      strcpy($$.name, $2.name );
    }
}
|
{
  addParserComment( "RULE: init: nothing (not NULL)" );
  strcpy($$.name, "Slipstream");
};

// START OF MATH

expression: expression[OP1]
{
  // MIDRULE ACTION
  if(isA($1.name)) { addComment("OP1 (A)"); addAsm( str_PHA );}
  else if(isXA($1.name)){ addComment("OP1 (XA)");addAsm( str_PHA );addAsm( str_TXA );addAsm( str_PHA );}
  //else if(isWordID($1.name)) {addComment("OP1 (WordID)");}
  //else if(isWordIMM($1.name)) {addComment("OP1 (WordIMM)");}
  //else if(isFloatID($1.name)) {addComment("OP1 (FloatID)");}
  //else if(isFloatIMM($1.name)) {addComment( "OP1 (FloatIMM)");}
  //else if(isIntID($1.name)) {addComment("OP1 (IntID)");}
  //else if(isIntIMM($1.name)) {addComment("OP1 (IntIMM)");}
  //else if(isUintID($1.name)) {addComment("OP1 (UintID)");}
  //else if(isUintIMM($1.name)) {addComment("OP1 (UintIMM)");}
  else if(isFAC($1.name)){ addComment("OP1 (FAC)");pushFAC();}
}
arithmetic[MATHOP] expression[OP2]
{
  //if(isA($4.name)) {addComment("OP2 (A)");}
  //else if(isXA($4.name)) {addComment("OP2 (XA)");}
  //else if(isWordID($4.name)) {addComment("OP2 (WordID)");}
  //else if(isWordIMM($4.name)) {addComment("OP2 (WordIMM)");}
  //else if(isFloatID($4.name)) {addComment("OP2 (FloatID)");}
  //else if(isFloatIMM($4.name)) {addComment( "OP2 (FloatIMM)");}
  //else if(isIntID($4.name)) {addComment("OP2 (IntID)");}
  //else if(isIntIMM($4.name)) {addComment("OP2 (IntIMM)");}
  //else if(isUintID($4.name)) {addComment("OP2 (UintID)");}
  //else if(isUintIMM($4.name)) {addComment("OP2 (UintIMM)");}
  //else if(isFAC($4.name)) { addComment("OP2 (FAC)");}
}


{
  if( isXA($1.name) && (!isXA($4.name) && !isA($4.name) /* && !isFAC($4.name)) */ ) )
    {
      addAsm( str_PLA, 1, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false );
      addComment( "^^^--- OPTIMIZE ---^^^" );
    }
  
  if( isA($1.name) && (!isXA($4.name) && !isA($4.name) /* && !isFAC($4.name) */ ) )
    {
      addAsm( str_PLA, 1, false );
      addComment( "^^^--- OPTIMIZE ---^^^" );
    }
  string op = string($3.name);
  string O1;
  string O2;

  string IMM1L = toHex(get_word_L(atoi(stripFirst($1.name).c_str())));
  string IMM1H = toHex(get_word_H(atoi(stripFirst($1.name).c_str())));
  string IMM2L = toHex(get_word_L(atoi(stripFirst($4.name).c_str())));
  string IMM2H = toHex(get_word_H(atoi(stripFirst($4.name).c_str())));
  
  int addrOP1 = getAddressOf($1.name);
  int sizeOP1A = 3;
  int sizeOP1B = 3;
  if( addrOP1 < 256 ) sizeOP1A = 2;
  if( addrOP1+1 < 256 ) sizeOP1B = 2;
  
  int addrOP2 = getAddressOf($4.name);
  int sizeOP2A = 3;
  int sizeOP2B = 3;
  if( addrOP2 < 256 ) sizeOP2A = 2;
  if( addrOP2+1 < 256 ) sizeOP2B = 2;
  
  if( isUintID($1.name) || isIntID($1.name) || isWordID($1.name) || isFloatID($1.name))
    {
      O1 = getNameOf(getAddressOf($1.name));
    }
  if( isUintID($4.name) || isIntID($4.name) || isWordID($4.name) || isFloatID($4.name))
    {
      O2 = getNameOf(getAddressOf($4.name));
    }
    
  // here is where we should check to see if the
  // variable ($$.name) is already in use (in _this_ scope).
  // .. but we don't yet
  int FAC=0;

  if( isA($1.name) && isA($4.name) )
    {
      addComment( "A math A: TOC" );
      if( op == string("+"))
	{
	  if( arg_unsafe_math )
	    {
	      addComment( "A + A --> A (Destroys $FB)" );	   
	      addAsm( str_STA + "$FB" + commentmarker + "(2:3)", 2, false ); // temporaily store OP2 in zp
	      addAsm( str_PLA + commentmarker + "(1:4)", 1, false ); 
	      addAsm( str_CLC, 1, false );
	      addAsm( str_ADC + "$FB" + commentmarker + "(2:3)" , 2, false );
	      addCompilerMessage( "--unsafe-math saved 11 bytes and 22 clock cycles", 0 );
	    }
	  else
	    {
	      addComment( "A + A --> A" );
	      addAsm( str_TAX + commentmarker + "(1:2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(1:4)", 1, false );
	      addAsm( str_TAY + commentmarker + "(1:2)", 1, false );
	      addAsm( str_LDA + "$FB" + commentmarker + "(2:2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(1:3)", 1, false );
	      addAsm( str_STX + "$FB" + commentmarker + "(2:3)", 2, false );
	      addAsm( str_TYA + commentmarker + "(1:2)", 1, false );
	      addAsm( str_CLC, 1, false );
	      addAsm( str_ADC + "$FB" + commentmarker + "(2:3)", 2, false );
	      addAsm( str_TAY + commentmarker + "(1:2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(1:4)", 1, false );
	      addAsm( str_STA + "$FB" + commentmarker + "(2:3)", false );
	      addAsm( str_TYA + commentmarker + "(1:2)", 1, false );
	    }	  
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  if( arg_unsafe_math )
	    {
	      addComment( "A - A --> A (Destroys $FB)" );	   
	      addAsm( str_STA + "$FB", 2, false ); // temporaily store OP2 in zp
	      addAsm( str_PLA ); 
	      addAsm( str_SEC );
	      addAsm( str_SBC + "$FB", 2, false );
	    }
	  else
	    {	  
	      addComment( "A - A --> A" );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$FB", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_STX + "$FB", 2, false );
	      addAsm( str_TYA, 1, false );
	      addAsm( str_SEC );
	      addAsm( str_SBC + "$FB", 2, false );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$FB", false );
	      addAsm( str_TYA, 1, false );
	    }
	  strcpy($$.name, "_A" );

	}
      else if( op == string("*"))
	{
	  addComment( "A * A --> A (Destroys $02/$03)" );
	  umul_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  addComment( "A / A --> A" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  
	  addAsm( str_PLA );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );	  
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** A --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("A math A: Unknown Operation", 3);
	}
    }

  else if( isA($1.name) && isFAC($4.name) )
    {
      float_swap_space_is_needed = true;
      addComment( "A math FAC: TOC" );
      if( op == string( "+" ) )
	{
	  addComment( "A + FAC --> FAC" );
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  pushFAC();	  
	  addAsm( str_LDY + "$02", 2, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  
	  fAddT();
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", false );
	    }
	}
      else if( op == string( "-" ) )
	{
	  addComment( "A - FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  pushFAC();
	  addAsm( str_LDY + "$02", 2, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  popFAC();
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addComment( "A * FAC --> FAC" );

	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }

	  pushFAC();	  
	  addAsm( str_LDY + "$02", 2, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", false );
	    }

	}
      else if( op == string("/") )
	{
	  addComment( "A / FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  pushFAC();
	  addAsm( str_LDY + "$02", 2, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  popFAC();

	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  
	  fDivT();
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", false );
	    }
	}
      else if( op == string("**") )
	{
	  addComment( "A ** FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  pushFAC();
	  addAsm( str_LDY + "$02", 2, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  popFAC();

	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", false );
	    }
	}
      else
	{
	  addCompilerMessage( "A math FAC: unknown operation", 3 );
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isA($1.name) && isFloatID($4.name) )
    {
      addComment( "A math FloatID: TOC" );
      int base_address_op2 = hexToDecimal($4.name);
      string OP2 = getNameOf( base_address_op2 );
      if( op == string( "+" ) )
	{
	  addComment( "A + FloatID --> FAC" );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();	  
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ))
	{
	  addComment( "A - FloatID --> FAC" );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();	  
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("*") )
	{	  
	  addComment( "A * FloatID --> FAC" );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();	  
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ))
	{
	  addComment( "A / FloatID --> FAC" );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();	  
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}      
      else if( op == string("**" ) )
	{
	  addComment( "A ** FloatID --> FAC" );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();	  
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "A math FloatID: Unknown Operation", 3 );
	}			    
    }
  else if( isA($1.name) && isFloatIMM($4.name) )
    {
      addComment( "A math FloatIMM: TOC" );

      if( op == string("+") )
	{	  
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  inlineFloat($4.name);
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );  
	  addAsm( str_JSR + "$B867" + commentmarker + "MEM + FAC -> FAC", 3, false );
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("-") )
	{	  
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  inlineFloat($4.name);
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("*") )
	{	  
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  inlineFloat($4.name);
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("/") )
	{	  
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  inlineFloat($4.name);
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ))
	{
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  inlineFloat($4.name);
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage("A math FloatIMM: unknown operation", 3 );
	}
    }
  else if( isA($1.name) && isIntID($4.name) )
    {
      int instr_size = 3;
      if( getAddressOf($4.name) < 256 )
	{
	  instr_size = 2;
	}
      string O2 = getNameOf(getAddressOf($4.name));
      addComment( "A math IntID: TOC" );
      
      if( op == string( "+" ) )
	{
	  addComment( "A + IntID --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, instr_size, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "A - IntID --> A" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, instr_size, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string( "*" ) )
	{
	  addComment( "A * IntID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false );
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( str_LDA + O2, instr_size, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_STX + "_MUL16_FE", 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy( $$.name, "_XA" );
	}      
      else if( op == string( "/" ) )
	{
	  addComment( "A / IntID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, true );
	  
	  addAsm( str_LDA + O2, instr_size, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true );

	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  addAsm( "!:", 0, true );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** IntID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_BMI + "!+", 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:\t" + str_PLA, 1, true );
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("A math IntID: Unknown operation", 3);
	}
    }
  else if( isA($1.name) && isIntIMM($4.name) )
    {
      addComment( "A math IntIMM: TOC" );
      int O2_int = atoi(stripFirst(stripFirst($4.name).c_str()).c_str());      
      if( op == string( "+" ) )
	{
	  addComment( "A + IntIMM --> A" );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + toHex(O2_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string( "-" ) )
	{
	  addCompilerMessage( "A - IntIMM: Possible Overflow", 1 );
	  addComment( "A - IntIMM --> A" );
	  addAsm( str_CLC );
	  addAsm( str_ADC + toHex(O2_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string( "*" ) )
	{
	  addComment( "A * IntIMM --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  ); 
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(twos_complement(O2_int)), 2, false  );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$FF", 2, false  ); 
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}      
      else if( op == string( "/" ) )
	{
	  addComment( "A / IntIMM --> A" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(O2_int), 2, false  );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** IntIMM" );
	  addAsm( str_LDA + "#$00", 2, false );
	  strcpy( $$.name, "_A" );
	}
      else
	{
	  addCompilerMessage("A math IntIMM: Unknown operation", 3);
	}
    }
  else if( isA($1.name) && isUintID($4.name) )
    {
      addComment( "A math UintID: TOC" );
      int tmp_addr = getAddressOf($4.name);
      
      string tmp_name = getNameOf(tmp_addr);
      if( op == string("+"))
	{
	  addComment( "A + UintID --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "A - UintID --> A" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  // TODO: This should be mul16
	  addComment( "A * UintID --> A" );
	  umul_is_needed = true;
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAX );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STX + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_LDX + "$03", 2, false );  
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TXA );
	    }
	  else
	    {
	      addAsm( str_LDA + "$03", 2, false );  
	    }
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  addComment( "A / UintID --> A" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** UintID" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("A math UintID: Unknown operation", 3);
	}
    }
  else if( isA($1.name) && isUintIMM($4.name) )
    {
      int tmp_v = atoi(stripFirst( $4.name ).c_str());
      addComment( "A math UintIMM: TOC" );
      if( op == string("+") )
	{
	  addComment( "A + UintIMM" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(tmp_v), 2, false );
	  strcpy($$.name, "_A");
	}
      else if( op == string( "-" ))
	{
	  addComment( "A - UintIMM" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_v), 2, false );
	  strcpy($$.name, "_A");
	}
      else if( op == string( "*" ) )
	{
	  mul16_is_needed = true;
	  addComment( "A * UintIMM --> XA" );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  ); 
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false  );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string( "/" ) )
	{
	  addComment( "A / UintIMM --> XA" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false  );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** UintIMM --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false  );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("A math UintIMM: Unknown operation", 3);
	}
    }
  else if( isA($1.name) && isWordID($4.name) )
    {
      addComment( "A math WordID: TOC" );
      if( op == string( "+" ))
	{
	  addComment( "A + WordID --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)) + "+1", 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "-" ))
	{
	  addComment( "A - WordID --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)) + "+1", 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "/" ))
	{
	  addComment( "A / WordID --> XA" );
	  div16_is_needed = true;
	  
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);

	  addAsm( str_LDA + O2, sizeOP2A, false  );	  
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + O2 + " +1", sizeOP2B, false  );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "*" ))
	{
	  mul16_is_needed = true;
	  int tmp_op1 = getAddressOf( $1.name );
	  addComment( "A * WordID --> XA" );
	  
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  
	  addAsm( str_LDA + O2, sizeOP2A, false  );	  
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + O2 + " +1", sizeOP2B, false  );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** WordID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("A math WordID: Unknown Operation", 3 );
	}
    }
  else if( isA($1.name) && isWordIMM($4.name) )
    {
      int tmp_v = atoi(stripFirst( $4.name ).c_str());
      addComment( "A math WordIMM: TOC" );
      //addAsm( str_PLA );   // <<-- if prev. loc's deleted then this is not needed
      if( op == string("+") )
	{
	  addComment( "A + WordIMM --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_L(atoi(stripFirst($4.name).c_str()))), 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_H(atoi(stripFirst($4.name).c_str()))), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "-" ))
	{
	  addComment( "A - WordIMM --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(get_word_L(atoi(stripFirst($4.name).c_str()))), 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + "#$" + toHex(get_word_H(atoi(stripFirst($4.name).c_str()))), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "*" ) )
	{
	  int O2L = get_word_L(atoi(stripFirst($4.name).c_str()));
	  int O2H = get_word_H(atoi(stripFirst($4.name).c_str()));
	  addComment( "A * WordIMM --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( str_LDA + "#$" + toHex(O2L), 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  addAsm( str_LDA + "#$" + toHex(O2H), 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "/" ) )
	{
	  addComment( "A / WordIMM --> XA" );
	  int O2 = atoi(stripFirst($4.name).c_str());
	  int O2L = get_word_L(atoi(stripFirst($4.name).c_str()));
	  int O2H = get_word_H(atoi(stripFirst($4.name).c_str()));
	  if( O2 == 2 )
	    {
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LDX + "#$00", 2, false );
	      strcpy($$.name, "_XA");
	    }
	  else if( O2 == 4 )
	    {
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LDX + "#$00", 2, false );
	      strcpy($$.name, "_XA");
	    }
	  else if( O2 == 8 )
	    {
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LDX + "#$00", 2, false );
	      strcpy($$.name, "_XA");
	    }
	  else if( O2 == 16 )
	    {
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LDX + "#$00", 2, false );
	      strcpy($$.name, "_XA");
	    }
	  else if( O2 == 32 )
	    {
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_LDX + "#$00", 2, false );
	      strcpy($$.name, "_XA");
	    }
	  else
	    {
	      div16_is_needed = true;
	      addAsm( str_STA + "_DIV16_FB", 3, false );
	      addAsm( str_LDA + "#$00", 2, false ); 
	      addAsm( str_STA + "_DIV16_FC", 3, false );
	      addAsm( str_LDA + "#$" + toHex(O2L), 2, false );
	      addAsm( str_STA + "_DIV16_FD", 3, false );
	      addAsm( str_LDA + "#$" + toHex(O2H), 2, false );
	      addAsm( str_STA + "_DIV16_FE", 3, false );
	      addAsm( str_JSR + "DIV16", 3, false );
	      addAsm( str_LDA + "_DIV16_FB", 3, false );
	      addAsm( str_LDX + "_DIV16_FC", 3, false );
	      strcpy($$.name, "_XA");
	    }
	}
      else if( op == string( "**" ) )
	{
	  addComment( "A ** WordIMM --> XA" );
	  addCompilerMessage( "Using only Lo Byte of power as A ** WordIMM gives just too darn large of a result", 1 );
	  if ( tmp_v > 255 ) tmp_v = 255;

	  // special cases
	  if( tmp_v == 0 )
	    {
	      addAsm( str_LDA + "#$01", 2, false );
	      addAsm( str_LDX + "#$00", 2, false );
	    }
	  else if( tmp_v == 1 )
	    {
	      addAsm( str_LDX + "#$00", 2, false );
	    }
	  else if( tmp_v > 15)
	    {
	      addAsm( str_LAX + "#$FF", 2, false );
	    }
	  else
	    {	      
	      mul16_is_needed = true;
	      pow16_is_needed = true;

	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_v)), 2, false  );
	      
	      addAsm( str_PHA, 1, false );
	      addAsm( str_JSR + "pow16", 3, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_PLA, 1, false );
	    }
	  strcpy($$.name, "_XA" );

	}
      else
	{
	  addCompilerMessage("A math WordIMM: Unknown Operation", 3);
	}
    }

  else if( isA($1.name) && isXA($4.name) )
    {
      addComment( "A math XA: TOC" );
      if( op == string( "+" ) )
	{
	  addComment( "A + XA --> XA" );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_STX + "!++", 3, false );
	  addAsm( str_PLA );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_BYTE + "$69" + commentmarker + "ADC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_BYTE + "$69" + commentmarker + "ADC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "A - XA --> XA (Destroys $02/$03)" );
	  addAsm( str_SEC );
	  addAsm( str_TAY );               // 2
	  addAsm( str_LDA + "$02", 2, false );  // 3
	  addAsm( str_STY + "$02", 2, false );  // 3
	  addAsm( str_LDY + "$03", 2, false );  // 3
	  addAsm( str_STX + "$03", 2, false );  // 3
	  addAsm( str_TAX );               // 2
	  addAsm( str_PLA );               // 4
	  addAsm( str_SBC + "$02", 2, false );  // 3
	  addAsm( str_STA + "$02", 2, false );  // 3
	  addAsm( str_LDA + "#$00", 2, false ); // 2
	  addAsm( str_SBC + "$03", 2, false );  // 3
	  addAsm( str_STY + "$03", 2, false );  // 3
	  addAsm( str_LDY + "$02", 2, false );  // 3
	  addAsm( str_STX + "$02", 2, false );  // 3
	  addAsm( str_TAX );               // 2
	  addAsm( str_TYA );               // 2

	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "*" ) )
	{
	  addComment( "A * XA --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_PLA );	  
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "/" ) )
	{
	  div16_is_needed = true;

	  addComment( "A / XA --> XA" );
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_CMP + "#$00", 2, false );
	      addAsm( str_BNE + "!+", 2, false );
	      addAsm( str_CPX + "#$00", 2, false );
	      addAsm( str_BNE + "!+", 2, false );
	      // Div by Zero
	      addComment( "DIV by Zero error" );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_JSR + "$B391", 3, false );
	      addAsm( str_JSR + "$BB0F", 3, false );
	      
	      addAsm( "!:", 0, true );
	    }
	  
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_PLA );	  
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage("A ** XA --> XA", 1);

	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("A math XA: Unknown Operation", 3);
	}
    }
  else if( isFAC($1.name) && isA($4.name) )
    {
      addComment( "FAC math A: TOC" );
      addComment( "hahaha - FAC 'n' A" );
      if( op == string( "+" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math A: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isFAC($4.name) )
    {
      addComment( "FAC math FAC: TOC" );
      if( op == string( "+" ) )
	{
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isFloatID($4.name) )
    {
      addComment( "FAC math FloatID: TOC" );
      if( op == string( "+" ) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "*" ) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage("FAC math FloatID: unknown operation", 3);
	}
    }
  else if( isFAC($1.name) && isFloatIMM($4.name) )
    {
      addComment( "FAC math FloatIMM: TOC" );
      if( op == string( "+" ) )
	{
	  inlineFloat( $4.name );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  inlineFloat( $4.name );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  inlineFloat( $4.name );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  inlineFloat( $4.name );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  inlineFloat( $4.name );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math FloatIMM: unknown operation", 3);	  
	}
      strcpy($$.name, "_FAC" );

    }
  else if( isFAC($1.name) && isIntID($4.name) )
    {
      addComment( "FAC math IntID: TOC" );

      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDY + getNameOf(getAddressOf($4.name)), 3, false ); 
      addAsm( str_TYA, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!pos+", 2, false );
      // result is negative
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!pos:", 0, true );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_JSR + "$BC44" + commentmarker + "signed word16 -> FAC", 3, false );
      
      if( op == string( "+" ))
	{
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math IntID: unknown operation", 3);	  
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isIntIMM($4.name) )
    {
      addComment( "FAC math IntIMM: TOC" );
      int tmp_int = twos_complement(atoi(stripFirst($4.name).c_str()));
      
      if( op == string( "+" ))
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  if( tmp_int == -10 ) addCompilerMessage( "Add Special Case for * -10", 1 );
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math IntIMM: unknown operation", 3);	  
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isUintID($4.name) )
    {
      addComment( "FAC math UintID: TOC" );
      int base_address_op2 = hexToDecimal($4.name);
      string OP2 = getNameOf( base_address_op2 );

      if( op == string( "+" ))
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math UintID: unknown operation", 3);	  
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isUintIMM($4.name) )
    {
      addComment( "FAC math UintIMM: TOC" );
      int tmp_int = atoi(stripFirst($4.name).c_str());
      
      if( op == string( "+" ))
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  if( tmp_int == 10 || tmp_int == -10 ) addCompilerMessage( "Add Special Case for * 10 or * -10", 1 );
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math UintIMM: unknown operation", 3);	  
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isWordID($4.name) )
    {
      addComment( "FAC math WordID: TOC" );
      int base_address_op2 = hexToDecimal($4.name);
      string OP2 = getNameOf( base_address_op2 );

      if( op == string( "+" ))
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math WordID: unknown operation", 3);	  
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isWordIMM($4.name) )
    {
      addComment( "FAC math WordIMM: TOC" );
      int tmp_int = atoi(stripFirst($4.name).c_str());
      string hi = toHex(get_word_H( tmp_int ));
      string lo = toHex(get_word_L( tmp_int ));
      if( op == string( "+" ))
	{
	  addAsm( str_LDY + "#$" + lo, 2, false );
	  addAsm( str_LDA + "#$" + hi, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + "#$" + lo, 2, false );
	  addAsm( str_LDA + "#$" + hi, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  if( tmp_int == 1000 || tmp_int == -1000 ) addCompilerMessage( "Add Special Case for * 1000", 1 );
	  addAsm( str_LDY + "#$" + lo, 2, false );
	  addAsm( str_LDA + "#$" + hi, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + "#$" + lo, 2, false );
	  addAsm( str_LDA + "#$" + hi, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + "#$" + lo, 2, false );
	  addAsm( str_LDA + "#$" + hi, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math WordIMM: unknown operation", 3);	  
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFAC($1.name) && isXA($4.name) )
    {
      addComment( "FAC math XA: TOC" );
      if( op == string( "+" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();	  
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FAC math A: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFloatID($1.name) && isA($4.name) )
    {
      addComment( "FloatID math A: TOC" );

      int base_address_op1 = hexToDecimal($1.name); 
      string OP1 = getNameOf( base_address_op1 );

      if( op == string("+"))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "FloatID math A: Unknown Operation", 3);
	}
      strcpy($$.name, "_FAC" );
    }
  else if( isFloatID($1.name) && isFAC($4.name) )
    {      
      addComment( "FloatID math FAC: TOC" );
      int base_address_op1 = hexToDecimal($1.name); 
      string OP1 = getNameOf( base_address_op1 );
      if( op == string( "+" ))
	{
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "FloatID math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFloatID($1.name) && isFloatID($4.name ) )
    {
      addComment( "FloatID math FloatID: TOC" );
      int base_address_op1 = hexToDecimal($1.name);
      int base_address_op2 = hexToDecimal($4.name);
      
      string OP1 = getNameOf( base_address_op1 );
      string OP2 = getNameOf( base_address_op2 );

      if( op == string("*"))
	{
	  addAsm( str_LDA + "#<" + OP2, 2, false );
	  addAsm( str_LDY + "#>" + OP2, 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("+"))
	{
	  addAsm( str_LDA + "#<" + OP2, 2, false );
	  addAsm( str_LDY + "#>" + OP2, 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  addAsm( str_SEC );
	  addAsm( str_LDA + "#<" + OP2, 2, false );
	  addAsm( str_LDY + "#>" + OP2, 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string("/"))
	{
	  addAsm( str_LDA + "#<" + OP2, 2, false );
	  addAsm( str_LDY + "#>" + OP2, 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );

	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addComment( "(possible DIV by ZERO)" );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  addAsm( str_LDA + "#<" + OP2, 2, false );
	  addAsm( str_LDY + "#>" + OP2, 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$BC0F" + commentmarker + "FAC -> ARG", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "FloatID math FloatID: Unknown Operation", 3 );
	}
      strcpy($$.name, "_FAC" );
    }
  else if( isFloatID($1.name) && isFloatIMM($4.name) )
    {
      addComment( "FloatID math FloatIMM: TOC" );

      inlineFloat($4.name);
      
      int base_address_op1 = hexToDecimal($1.name);
 
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
 
     
      if( op == string("*"))
	{
	  fMultT();
	}
      else if( op == string("+"))
	{
	  fAddT();
	}
      else if( op == string("-"))
	{
	  fSubT();
	}
      else if( op == string("/"))
	{
	  addComment( "If denominator is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  float f = atof( stripFirst($4.name).c_str() );
	  if( f == 0 ) addCompilerMessage( "error - division by 0", 3 );
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("Math operation not implemented yet. (FloatID arith FloatIMM)", 3);
	}
      strcpy($$.name, "_FAC" );
    }

  else if( isFloatID($1.name) && isIntID($4.name) )
    {
      addComment( "FloatID math IntID: TOC" );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDY + getNameOf(getAddressOf($4.name)), 3, false ); 
      addAsm( str_TYA, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!pos+", 2, false );
      // result is negative
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!pos:", 0, true );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_JSR + "$BC44" + commentmarker + "signed word16 -> FAC", 3, false );

      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

      if( op == string("+") )
	{
	  fAddT();
	}
      else if( op == string("-") )
	{
	  fSubT();
	}
      else if( op == string("*") )
	{
	  fMultT();
	}
      else if( op == string("/") )
	{
	  addCompilerMessage( "Potential for Division by 0", 1 );
	  fDivT();
	}
      else if( op == string("**") )
	{
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("Math operation not implemented yet. (FloatID arith IntID)", 3);
	}
      strcpy( $$.name, "_FAC" );
      
    }
  else if( isFloatID($1.name) && isIntIMM($4.name) )
    {
      addComment( "FloatID math IntIMM: TOC");
      
      // get OP2 as a word
      string hi_byte = "00";
      int tmp_int = atoi(stripFirst($4.name).c_str());
      if( tmp_int < 0 )
	{
	  tmp_int = twos_complement( tmp_int );
	  hi_byte = "FF";
	}
      string low_byte = toHex(tmp_int);
      
      int base_address_op1 = hexToDecimal($1.name); 
      string OP1 = getNameOf( base_address_op1 );

      if( op == string("*") )
	{
	  addAsm( str_LDY + "#$" + low_byte, 2, false );
	  addAsm( str_LDA + "#$" + hi_byte, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + "#$" + low_byte, 2, false );
	  addAsm( str_LDA + "#$" + hi_byte, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "+" ) )
	{
	  addAsm( str_LDY + "#$" + low_byte, 2, false );
	  addAsm( str_LDA + "#$" + hi_byte, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + "#$" + low_byte, 2, false );
	  addAsm( str_LDA + "#$" + hi_byte, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + "#$" + low_byte, 2, false );
	  addAsm( str_LDA + "#$" + hi_byte, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatID math IntIMM: Unknown Operation", 3 );
	}
    }
  else if( isFloatID($1.name) && isUintID($4.name) )
    {
      // $B391: Convert 16-bit signed integer to floating point number in FAC. Expects lowbyte in Y- and highbyte in A-register.
      // $BC0F: Copy a number currently in FAC, over into ARG
      // $BBA2: Fetch a number from a RAM location to FAC (A=Addr.LB, Y=Addr.HB)
      // $BA28: Multiplies a number from RAM and FAC (clobbers ARG, A=Addr.LB, Y=Addr.HB)
      // $BB0F: Divides a number stored in RAM by the number in FAC (A=Addr.LB, Y=Addr.HB)
      // $B867: Adds the number in FAC with one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $B850: Subtracts the number in FAC from one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $BF78: Raises a number stored ín RAM to the power in FAC (A=Addr.LB, Y=Addr.HB)
      addComment( "FloatID math UintID: TOC" );
      int base_address_op1 = hexToDecimal($1.name);
      int base_address_op2 = hexToDecimal($4.name);
      string OP1 = getNameOf( base_address_op1 );
      string OP2 = getNameOf( base_address_op2 );
      if( op == string("*") )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "+" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatID math UintID: Unknown Operation", 3 );
	}
    }
  else if( isFloatID($1.name) && isUintIMM($4.name) )
    {
      // $B391: Convert 16-bit signed integer to floating point number in FAC. Expects lowbyte in Y- and highbyte in A-register.
      // $BC0F: Copy a number currently in FAC, over into ARG
      // $BBA2: Fetch a number from a RAM location to FAC (A=Addr.LB, Y=Addr.HB)
      // $BA28: Multiplies a number from RAM and FAC (clobbers ARG, A=Addr.LB, Y=Addr.HB)
      // $BB0F: Divides a number stored in RAM by the number in FAC (A=Addr.LB, Y=Addr.HB)
      // $B867: Adds the number in FAC with one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $B850: Subtracts the number in FAC from one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $BF78: Raises a number stored ín RAM to the power in FAC (A=Addr.LB, Y=Addr.HB)
      addComment( "FloatID math UintIMM: TOC" );
      int base_address_op1 = hexToDecimal($1.name);
      string OP1 = getNameOf( base_address_op1 );
      string OP2 = toHex( atoi( stripFirst($4.name).c_str() ) );
      if( op == string("*") )
	{
	  addAsm( str_LDY + "#$" + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + "#$" + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "+" ) )
	{
	  addAsm( str_LDY + "#$" + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + "#$" + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + "#$" + OP2, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatID math UintIMM: Unknown Operation", 3 );
	}
    }
  else if( isFloatID($1.name) && isWordID($4.name) )
    {
      addComment( "FloatID math WordID: TOC" );
      int base_address_op1 = hexToDecimal($1.name); 
      int base_address_op2 = hexToDecimal($4.name);

      string OP1 = getNameOf( base_address_op1 );
      string OP2 = getNameOf( base_address_op2 );

      addCompilerMessage( "16-bit word is SIGNED", 1 );

      if( op == string("*"))
	{
	  addAsm( str_LDY + OP2, 3, false ); 
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false ); 
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("+"))
	{
	  addAsm( str_LDY + OP2, 3, false ); 
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false ); 
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  addAsm( str_LDY + OP2, 3, false ); 
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false ); 
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string("/"))
	{
	  addAsm( str_LDY + OP2, 3, false ); 
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false ); 
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + OP2, 3, false ); 
	  addAsm( str_LDA + OP2 + " +1", 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );      
	  addAsm( str_LDA + "#<" + OP1, 2, false );
	  addAsm( str_LDY + "#>" + OP1, 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatID math WordID: Unknown Operation", 3 );
	}
      strcpy($$.name, "_FAC" );
    }
  else if( isFloatID($1.name) && isWordIMM($4.name) )
    {
      // $B391: Convert 16-bit signed integer to floating point number in FAC. Expects lowbyte in Y- and highbyte in A-register.
      // $BC0F: Copy a number currently in FAC, over into ARG
      // $BBA2: Fetch a number from a RAM location to FAC (A=Addr.LB, Y=Addr.HB)
      // $BA28: Multiplies a number from RAM and FAC (clobbers ARG, A=Addr.LB, Y=Addr.HB)
      // $BB0F: Divides a number stored in RAM by the number in FAC (A=Addr.LB, Y=Addr.HB)
      // $B867: Adds the number in FAC with one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $B850: Subtracts the number in FAC from one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $BF78: Raises a number stored ín RAM to the power in FAC (A=Addr.LB, Y=Addr.HB)
      addComment( "FloatID math WordIMM: TOC" );
      int base_address_op1 = hexToDecimal($1.name);
      string OP1 = getNameOf( base_address_op1 );
      string OP2H = toHex(get_word_H(atoi(stripFirst($3.name).c_str())));
      string OP2L = toHex(get_word_L(atoi(stripFirst($3.name).c_str())));
      
      string OP2 = toHex( atoi( stripFirst($4.name).c_str() ) );
      addCompilerMessage( "16-bit word is SIGNED", 1 );

      if( op == string("*") )
	{
	  addAsm( str_LDY + "#$" + OP2L, 3, false );
	  addAsm( str_LDA + "#$" + OP2H, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDY + "#$" + OP2L, 3, false );
	  addAsm( str_LDA + "#$" + OP2H, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "+" ) )
	{
	  addAsm( str_LDY + "#$" + OP2L, 3, false );
	  addAsm( str_LDA + "#$" + OP2H, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + "#$" + OP2L, 3, false );
	  addAsm( str_LDA + "#$" + OP2H, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + "#$" + OP2L, 3, false );
	  addAsm( str_LDA + "#$" + OP2H, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatID math WordIMM: Unknown Operation", 3 );
	}
    }
  else if( isFloatID($1.name) && isXA($4.name) )
    {
      addComment( "FloatID math XA: TOC" );

      int base_address_op1 = hexToDecimal($1.name); 
      string OP1 = getNameOf( base_address_op1 );
      addCompilerMessage( "16-bit word is SIGNED", 1 );

      if( op == string("+"))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string( "-" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string( "*" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string( "/" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );

	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP1, 3, false );
	  addAsm( str_LDY + "#>" + OP1, 3, false );

	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "Operation not implemented for: FloatID math XA", 3);
	}
    }
  else if( isFloatIMM($1.name) && isA($4.name) )
    {
      addComment( "FloatIMM math A: TOC" );

      if( op == string("*") )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("+") )
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("-") )
	{	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("/") )
	{	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ))
	{
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "Operation not implemented for: FloatIMM math A", 3);
	}
    }
  else if( isFloatIMM($1.name) && isFAC($4.name) )
    {      
      addComment( "FloatIMM math FAC: TOC" );
      if( op == string( "+" ))
	{
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string( "/" ))
	{
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "FloatIMM math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFloatIMM($1.name) && isFloatID($4.name))
    {
      addComment( "FloatIMM math FloatID: TOC" );
      if( op == string("*"))
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("+"))
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string("/"))
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDA + "#<" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_LDY + "#>" + getNameOf(getAddressOf($4.name)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  inlineFloat($1.name);
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("Math operation not implemented yet. (A arith A)", 3);
	}
      strcpy($$.name, "_FAC" );
    }
  else if( isFloatIMM($1.name) && isFloatIMM($4.name) )
    {
      addComment( "FloatIMM math FloatIMM: TOC" );
      
      float imm1 = atof( stripFirst($1.name).c_str() );
      float imm2 = atof( stripFirst($4.name).c_str() );
      float result = 0.0;
      
      if( op == string("*"))
	{
	  result = imm1*imm2;
	}
      else if( op == string("+"))
	{
	  result = imm1+imm2;
	}
      else if( op == string("-"))
	{
	  result = imm1-imm2;
	}
      else if( op == string("/"))
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
      else if( op == string( "**" ) )
	{
	  result = pow( imm1, imm2 );
	}
      else
	{
	  addCompilerMessage("FloatIMM math FloatIMM: Unknown Operation", 3 );
	}
      
      inlineFloat( string( "f" ) + to_string(result), 105);
      strcpy($$.name, "_FAC" );
    }
  else if( isFloatIMM($1.name) && isIntID($4.name) )
    {
      addComment( "FloatIMM math IntID: TOC" );
      if( op == string("+"))
	{
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();

	}
      else if( op == string("*"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("/"))
	{
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();	  
	}
      else if( op == string("**"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FloatIMM math IntID: Unknown Operation", 3);
	}

      strcpy( $$.name, "_FAC" );
    }
  else if( isFloatIMM($1.name) && isIntIMM($4.name) )
    {
      addComment( "FloatIMM math IntIMM: TOC" );
      float tmp_int1 = atof( stripFirst($1.name).c_str() );
      float tmp_int2 = atof( stripFirst($4.name).c_str() );
      
      float tmp_int3;

      if( op == string("+") )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("-") )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("*") )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("/") )
	{
	  if( tmp_int2 == 0 ) addCompilerMessage( "Division By Zero", 3 );
	  tmp_int3 = tmp_int1 / tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("**") )
	{
	  tmp_int3 = pow(tmp_int1, tmp_int2);
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatIMM math IntIMM: Unknown Operation", 3 );
	}
    }
  else if( isFloatIMM($1.name) && isUintIMM($4.name) )
    {
      addComment( "FloatIMM math UintIMM: TOC" );
      float tmp_int1 = atof( stripFirst($1.name).c_str() );
      float tmp_int2 = atof( stripFirst($4.name).c_str() );
      float tmp_int3;

      if( op == string("+") )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("-") )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("*") )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("/") )
	{
	  if( tmp_int2 == 0 ) addCompilerMessage( "Division By Zero", 3 );
	  tmp_int3 = tmp_int1 / tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("**") )
	{
	  tmp_int3 = pow(tmp_int1, tmp_int2);
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatIMM math UintIMM: Unknown Operation", 3 );
	}

      
    }
  else if( isFloatIMM($1.name) && isUintID($4.name) )
    {
      addComment( "FloatIMM math UintID: TOC" );
      if( op == string("+"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string("*"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("/"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string("**"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("Math operation not implemented yet. (FloatIMM arith UintID)", 3);
	}

      strcpy( $$.name, "_FAC" );
    }
  else if( isFloatIMM($1.name) && isWordIMM($4.name) )
    {
      addComment( "FloatIMM math WordIMM: TOC" );
      float tmp_int1 = atof( stripFirst($1.name).c_str() );
      float tmp_int2 = atof( stripFirst($4.name).c_str() );
      
      float tmp_int3;

      if( op == string("+") )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("-") )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("*") )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("/") )
	{
	  if( tmp_int2 == 0 ) addCompilerMessage( "Division By Zero", 3 );
	  tmp_int3 = tmp_int1 / tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("**") )
	{
	  tmp_int3 = pow(tmp_int1, tmp_int2);
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "FloatIMM math WordIMM: Unknown Operation", 3 );
	}
    }
  else if( isFloatIMM($1.name) && isWordID($4.name) )
    {
      // do the math at compile time
      addComment( "FloatIMM math WordID: TOC" );
      if( op == string("+"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + O2 + "+1", 3, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + O2 + "+1", 3, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string("*"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + O2 + "+1", 3, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("/"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + O2 + "+1", 3, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string("**"))
	{
	  // OP2 -> FAC
	  addAsm( str_LDA + O2 + "+1", 3, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FloatIMM math WordID: Unknown Operation", 3 );
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isFloatIMM($1.name) && isXA($4.name) )
    {
      // do the math at compile time
      addComment( "FloatIMM math XA: TOC" );
      if( op == string("+"))
	{
	  // OP2 -> FAC
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string("-"))
	{
	  // OP2 -> FAC
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();	  
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string("*"))
	{
	  // OP2 -> FAC
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();	  
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string("/"))
	{
	  // OP2 -> FAC
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string("**"))
	{
	  // OP2 -> FAC
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP1 -> FAC
	  inlineFloat( $1.name );
	  deletePreviousAsm();
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("FloatIMM math XA: Unknown Operation", 3 );
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isIntID($1.name) && isA($4.name) )
    {
      // TODO: THESE SHOULD RETURN XA!
      addComment( "IntID math A: TOC" );
      if( op == string("+") )
	{
	  addComment( "IntID + A --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O1, 2, false );
	  strcpy($$.name, "_A");	  
	}
      else if( op == string("-") )
	{
	  addComment( "IntID - A --> A" );
	  addAsm( str_SEC );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  // mkpellegrino - 20250313
	  addAsm( str_TAX + commentmarker + "this 'saves' the value in O1", 1, false );
	  addAsm( str_STY + O1, sizeOP1A, false );
	  addAsm( str_SBC + O1, sizeOP1A, false );
	  addAsm( str_STX + O1 + commentmarker + "this replaces the value in O1", sizeOP1A, false );
	  strcpy($$.name, "_A");
	}
      else if( op == string("*") )
	{
	  addCompilerMessage( "IntID * A only returns 8-bit SIGNED result", 1 );			      
	  addComment( "IntID * A --> A" );
	  umul_is_needed = true;

	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );

	  addAsm( "!:\t" + str_TAY, 1, true );
	  
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	    }
	  
	  addAsm( str_STX + "$02", 2, false );
	  addAsm( str_STY + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  

	  if( !arg_unsafe_math )
	    {
	      addAsm( str_LDY + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA, 1, false );
	    }
	  else
	    {
	      addAsm( str_LDA + "$03", 2, false );
	    }

	  addAsm( str_PLP, 1, false );
	  
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_A" );	  
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "IntID / A --> XA" );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("**"))
	{
	  addComment( "IntID ** A --> XA" );
	  pow16_is_needed = true;
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_PHA, 1, true );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );// not needed
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );	  
	}
      else
	{
	  addCompilerMessage("IntID math A: Unknown Operation", 3 );
	}
    }
  else if( isIntID($1.name) && isFAC($4.name) )
    {      
      addComment( "IntID math FAC: TOC" );
      if( op == string( "+" ))
	{
	  addCompilerMessage( "This could probably be reworked", 0);
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );


	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  addCompilerMessage( "This could probably be reworked", 0);
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );

	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  addCompilerMessage( "This could probably be reworked", 0);
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  addCompilerMessage( "If Integer is < 0, an error could occur", 1 );
	  addCompilerMessage( "This could probably be reworked", 0);
	  float_swap_space_is_needed = true;
	  addAsm( str_PHA, 1, false );

	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "IntID math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isIntID( $1.name ) && isFloatID( $4.name ) )
    {
      addComment( "IntID math FloatID: TOC" );      
      if( op == string("+"))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP2 -> FAC
	  addAsm( str_LDA + "#<" + O2, 3, false );
	  addAsm( str_LDY + "#>" + O2, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  float_swap_space_is_needed = true;
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // FAC -> MEM (fp1)
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  addAsm( str_LDA + "#<" + O2, 3, false );
	  addAsm( str_LDY + "#>" + O2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); 

	  // MEM (fp1) -> ARG (+)
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // OP2 -> FAC
	  addAsm( str_LDA + "#<" + O2, 3, false );
	  addAsm( str_LDY + "#>" + O2, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  float_swap_space_is_needed = true;
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // FAC -> MEM (fp1)
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  addAsm( str_LDA + "#<" + O2, 3, false );
	  addAsm( str_LDY + "#>" + O2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); 

	  // MEM (fp1) -> ARG (+)
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  float_swap_space_is_needed = true;
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  // FAC -> MEM (fp1)
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  addAsm( str_LDA + "#<" + O2, 3, false );
	  addAsm( str_LDY + "#>" + O2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); 

	  // MEM (fp1) -> ARG (+)
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage("IntID math FloatID: Unknown Operation", 3 );
	}
      strcpy( $$.name, "_FAC" );
      
    }
  else if( isIntID( $1.name ) && isFloatIMM( $4.name ) )
    {
      addComment( "IntID math FloatIMM: TOC" );
      float_swap_space_is_needed = true;
      if( op == string("+"))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // FAC -> MEM (fp0)
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  inlineFloat($4.name);

	  // MEM (fp0) -> ARG (+)
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // FAC -> MEM (fp0)
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  inlineFloat($4.name);

	  // MEM (fp0) -> ARG (+)
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // FAC -> MEM (fp0)
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  inlineFloat($4.name);

	  // MEM (fp0) * FAC -> FAC
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // FAC -> MEM (fp0)
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  inlineFloat($4.name);

	  // MEM (fp0) -> ARG (+)
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  // OP1 -> FAC
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_ASL, 1, false );
	  addAsm( str_BCC + "!skip+", 2, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( "!skip:\t", 0, true );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  // FAC -> MEM (fp0)
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  // OP2 -> FAC
	  inlineFloat($4.name);

	  // MEM (fp0) -> ARG (+)
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  
	  // ARG ** FAC -> FAC
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "IntID math FloatIMM: Unknown Operation", 3 );
	}
      strcpy( $$.name, "_FAC" );
    }  
  else if( isIntID( $1.name ) && isIntID( $4.name ) )
    {
      // TODO: These should return XA
      addComment( "IntID math IntID: TOC" );
      if( op == string("+"))
	{
	  addComment( "IntID + IntID --> A" );
	  addAsm( str_LDA + O1, sizeOP1A, false);
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "IntID - IntID --> A" );
	  addAsm( str_LDA + O1, sizeOP1A, false);
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  addComment( "IntID * IntID --> A" );
	  umul_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false);

	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_LDA + O2, sizeOP2A, false);
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );

	  if( !arg_unsafe_math )
	    {	      
	      addAsm( str_LDY + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA );
	    }
	  else
	    {
	      addAsm( str_LDY + "$03", 2, false );
	    }
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addCompilerMessage( "IntID / IntID --> A", 0 );

	  //if( !arg_unsafe_math )
	  //  {
	  //    addComment( "preserve $02/$03" );
	  //    addAsm( str_LDA + "$02", 2, false );
	  //    addAsm( str_PHA );
	  //    addAsm( str_LDA + "$03", 2, false );
	  //    addAsm( str_PHA );
	  //  } 

	  addComment( "Get the sign of the quotient" );
	  addAsm( str_LDA + O1, sizeOP1A, false);
	  addAsm( str_EOR + O2, sizeOP1A, false);
	  addAsm( str_PHP, 1, false );

	  addComment( "make both divisor and dividend positive" );
	  addAsm( str_LDA + O1, sizeOP1A, false);
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FB", 3, true );

	  addAsm( str_LDA + O2, sizeOP2A, false);
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true );

	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  //if( !arg_unsafe_math )
	  //  {
	  //    addComment( "restore $02/$03" );
	  //    addAsm( str_PLA );
	  //    addAsm( str_STA + "$03", 2, false );
	  //    addAsm( str_PLA );
	  //    addAsm( str_STA + "$02", 2, false );
	  //  }

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC" + commentmarker + "OPTIMIZE", 3, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**") )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addComment( "IntID ** IntID --> XA" );
	  
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_JMP + "!++++", 3, false );
	  addAsm( "!:\t" + str_LDA + "#$00", 2, true );
	  addAsm( str_STA + "!++", 3, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "!++", 3, false );
	  addAsm( "!:\t" + str_PHA, 1, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA Imm", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );	  
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntID math IntID: Unknown Operation", 3 );
	}
    }
  else if( isIntID($1.name) && isIntIMM($4.name) )
    {
      addComment( "IntID math IntIMM: TOC" );
      
      if( op == string("+"))
	{
	  addComment( "IntID + IntIMM" );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false);
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "IntID - IntIMM" );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false);
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  addComment( "IntID * IntIMM -> A" );
	  // TODO: Make this safe for $02/$03
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false);	  
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + "#$" + toHex( tmp_int ) , 2, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  addComment( "IntID / IntIMM -> XA" );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false);
	  addAsm( str_PHP, 1, false );  // N will be set in SR if negative
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:", 0, true );
	  // take the negative sign off of OP2
	  int op2 = atoi(stripFirst(stripFirst($4.name).c_str()).c_str() );

	  addComment( string( "OP2: " ) + itos( op2 ) );
	  if( op2 == 1 )
	    {
	      addComment( "Division by 1... do nothing!" );
	    }
	  else if( op2 == 2 )
	    {
	      addAsm( str_LSR );
	    }
	  else if( op2 == 4 )
	    {
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	    }
	  else if( op2 == 8 )
	    {
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	    }
	  else if( op2 == 16 )
	    {
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	    }
	  else if( op2 == 32 )
	    {
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	      addAsm( str_LSR );
	    }
	  else if( op2 == 64 )
	    {
	      addAsm( str_AND + "#$C0", 2, false );
	      addAsm( str_CLC );
	      addAsm( str_ROL );
	      addAsm( str_ROL );
	      addAsm( str_ROL );
	    }
	  else if( op2 == 128 )
	    {
	      addAsm( str_AND + "#$80", 2, false );
	      addAsm( str_CLC );
	      addAsm( str_ROL );
	      addAsm( str_ROL );
	    }
	  else
	    {
	      // space here
	      div16_is_needed = true;	      
	      addAsm( str_STA + "_DIV16_FB", 3, false );
	      addAsm( str_LDA + "#$00", 2, false ); 
	      addAsm( str_STA + "_DIV16_FC", 3, false );
	      addAsm( str_STA + "_DIV16_FE", 3, false );	      
	      addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	      addAsm( str_STA + "_DIV16_FD", 3, false );
	      addAsm( str_JSR + "DIV16", 3, false );
	      addAsm( str_LDA + "_DIV16_FB", 3, false );
	    }
	  // now fix the sign
	  addAsm( str_LDX + "#$00", 3, false );
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BMI + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );	  
	  addAsm( str_LDX + "#$FF", 2, false );	  
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**") )
	{
	  addCompilerMessage( "IntID ** IntIMM: A will always = 0", 1);
	  addComment( "IntID ** IntIMM -> A" );
	  addAsm( str_LDA + "#$00", 2, false );
	  strcpy($$.name, "_A" );
	}
      else
	{
	  addCompilerMessage( "IntID math IntIMM: Unknown Operation", 3 );
	}
    }
  else if( isIntID($1.name) && isUintID($4.name) )
    {
      if( !previousAsm( str_STA + O1 ) )
	{
	  addAsm( str_LDA + O1, sizeOP1A, false);
	}
      else
	{
	  addAsm( commentmarker + str_LDA + O1 + commentmarker + "commented out for optimization", 0, false);
	}
      // ==============================================================================

      
      addComment( "IntID math UintID: TOC" );
      if( op == string("+") )
	{
	  addComment( "IntID + UintID --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A");
	}
      else if( op == string("-") )
	{
	  addComment( "IntID - UintID --> A" );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A");
	}
      else if( op == string("*") )
	{
	  addComment( "IntID * UintID --> A" );
	  addCompilerMessage( "IntID * UintID: I believe this works fine", 1);
	  umul_is_needed = true;
	  addAsm( str_TAX );
	  
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_LDY + "$03", 2, false );	  

	  addAsm( str_STX + "$02", 2, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDX + "$03", 2, false );

	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_STY + "$03", 2, false );
	  addAsm( str_TXA );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  addComment( "IntID / UintID --> A" );
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP2A, false );
	  addAsm( str_PHP, 1, false );	  
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FB", 3, true );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "IntID ** UintID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_LDA + "#$00", 2, true );
	  addAsm( str_STA + "!++", 3, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "!++", 3, false );
	  addAsm( "!:\t" + str_PHA, 1, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA Imm", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );	  
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntID math UintID: Unknown Operation", 3 );
	}
    }
  else if( isIntID($1.name) && isUintIMM($4.name) )
    {
      addComment( "IntID math UintIMM: TOC" );
      addAsm( str_LDA +  string($1.name), 3, false);
      if( op == string("+"))
	{
	  addComment( "IntID + UintIMM --> A" );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "IntID - UintIMM --> A" );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  // TODO: Add Special Cases here ... *2, *4, *8...
	  int op2 = atoi(stripFirst($4.name).c_str());
	  // TODO: make safe for $02/$03
	  addCompilerMessage( "Possible type conflict", 1);
	  addComment( "IntID * UintIMM --> A" );
	  if( op2 == 0 )
	    {
	      addAsm( str_LDA + "#$00", 2, false );
	    }
	  else if( op2 == 1 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false );
	    }
	  else if( op2 == 2 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_ASL, 1, false );
	    }
	  else if( op2 == 4 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	    }
	  else if( op2 == 8 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	    }
	  else if( op2 == 16 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	    }
	  else if( op2 == 32 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	      addAsm( str_ASL, 1, false );
	    }
	  else
	    {
	      umul_is_needed = true;	  
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_LDA + "#$" + toHex( op2 ) , 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_JSR + "UMUL", 3, false );
	      addAsm( str_LDA + "$03", 2, false );
	    }
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  int op2 = atoi(stripFirst($4.name).c_str());
	  if( op2 == 0 )
	    {
	      addCompilerMessage( "IntID / UintIMM: Division By Zero", 3 );
	    }
	  addComment( "IntID / UintIMM --> XA" );

	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHP, 1, false );  // N will be set in SR if negative
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:", 0, true );

	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );

	  // now fix the sign
	  addAsm( str_LDX + "#$00", 3, false );
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BMI + "!+", 2, false );	  
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );	  
	  addAsm( str_LDX + "#$FF", 2, false );	  
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**") )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  int op2 = atoi(stripFirst($4.name).c_str());
	  addComment( "IntID ** UintIMM" );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_PHA, 1, true );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntID math UintIMM: Unknown Operation", 3 );
	}
    }
  else if( isIntID($1.name) && isWordID($4.name) )
    {
      addComment( "IntID math WordID: TOC" );
      if( op == string("+") )
	{
	  addComment( "IntID + WordID --> XA" );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("-") )
	{
	  addCompilerMessage( "IntID - WordID: may produce unexpected results", 1);
	  addComment( "IntID - WordID --> XA" );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + O2 + " +1", 3, false );	  
	  addAsm( str_TAX, 1, false );	  
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_SBC + O2, sizeOP2A, false );	  
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "IntID * WordID --> XA" );
	  addAsm( str_LDX + "#$00", 2, false );	  
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_STA + "_MUL16_FB", 3, true );
	  addAsm( str_STX + "_MUL16_FC", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );	  
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  addAsm( str_LDA + O2 + " +1", sizeOP2A, false );	  
	  addAsm( str_STA + "_MUL16_FE", 3, false );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "IntID / WordID --> XA" );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );

	  //addAsm( "!:\t" + str_LDA + O1, sizeOP1A, false );	  
	  addAsm( "!:\t" + str_STA + "_DIV16_FB", 3, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );	  
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + O2 + " +1", sizeOP2A, false );	  
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "_DIV16_FC", 3, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( "!:\t" + str_LDA + "_DIV16_FB", 3, true );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "IntID ** WordID: exponent restricted to Low Byte", 0 );
	  addComment( "IntID ** WordID --> XA" );

	  mul16_is_needed = true;
	  pow16_is_needed = true;


	  addAsm( str_LDA + "#$00", 2, true );
	  addAsm( str_STA + "!++", 3, false );
	  addAsm( str_LDA + O1, 3, false );

	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "!++", 3, false );
	  addAsm( "!:\t" + str_PHA, 1, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA Imm", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );	  
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntID math WordID: Unknown Operation", 3 );
	}
    }
  else if( isIntID($1.name) && isWordIMM($4.name) )
    {
      addComment( "IntID math WordIMM: TOC" );
      if( op == string("+") )
	{
	  addComment( "IntID + WordIMM --> XA" );
	  addDebugComment( "Determine if the Int is < 0" );
	  addAsm( str_LDA + O1, sizeOP1A, false );

	  addAsm( str_BIT + O1, 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false ); // (is this needed?)
	  addAsm( str_BMI + "!+", 2, false );

	  // POSITIVE
	  addAsm( str_CLC );
	  addAsm( str_ADC + "#$" + IMM2L, 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + "#$" + IMM2H, 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  addAsm( str_JMP + "!+++", 3, false );

	  // NEGATIVE
	  //addAsm( str_CLC );

	  // TWO'S COMP
	  addAsm( "!:\t" + str_EOR + "#$FF", 2, true );
	  addAsm( str_CLC );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_SEC );
	  addAsm( str_LDA + "#$" + IMM2L, 2, false );
	  addAsm( str_BYTE + "$E9", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addComment( "SEC maybe isn't needed?" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("-") )
	{
	  addComment( "IntID - WordIMM --> XA" );
	  addDebugComment( "Determine if the Int is < 0" );
	  //addAsm( str_BIT + O1, 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BMI + "!+", 2, false );

	  // POSITIVE
	  // A =Low
	  // X =dc
	  // Y =dc

	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + IMM2L, 2, false );
	  addAsm( str_TAY );
	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + "#$" + IMM2H, 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  addAsm( str_JMP + "!+++", 3, false );

	  // NEGATIVE
	  // 2024 04 16 - mkpellegrino
	  // So - after thinking about this...
	  // right now what it does is:
	  // IntID -> 2's Complement
	  // IntID + WordIMM -> XA
	  // XA --> 2's complement
	  //
	  // basically - it's making the integer
	  // positive... adding the 2 numbers
	  // then making the answer negative.
	  //
	  // really we only need to make
	  // the WordIMM a 2's comp. #
	  // then add them.
	  //  TODO: fixit later
	  //addAsm( str_CLC );

	  // TWO'S COMP
	  addDebugComment( "take the # out of two's complement" );
	  addAsm( "!:\t" + str_EOR + "#$FF", 2, true );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_CLC );
	  addAsm( str_LDA + "#$" + IMM2L, 2, false );
	  addAsm( str_BYTE + "$69", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );

	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "IntID * WordIMM --> XA" );
	  addDebugComment( "Determine if the Int is < 0" );

	  // bit getNameOf(getAddressOf($1.name))
	  // N will be set if the int is negative
	  
	  addAsm( str_BIT + O1, 3, false );
	  addAsm( str_PHP );
	  addAsm( str_LDA + O1, sizeOP1A, false );

	  // if carry flag is set
	  // then two's comp A and
	  // multiply
	  // otherwise just multiply

	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_CLC );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_MUL16_FD", 3, true);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_LDA + "#$" + IMM2L, 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  addAsm( str_PLP );
	  
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_CLC );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("/") )
	{
	  addComment( "IntID / WordIMM --> XA" );

	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );

	  addAsm( "!:\t" + str_STA + "_DIV16_FB", 3, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( str_LDA + "#$" + IMM2L, 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "_DIV16_FC", 3, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( "!:\t" + str_LDA + "_DIV16_FB", 3, true );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "**" ) )
	{
	  addComment( "IntID ** WordIMM --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + "#$00", 2, true );
	  addAsm( str_STA + "!++", 3, false );
	  addAsm( str_LDA + O1, 3, false );

	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "!++", 3, false );
	  addAsm( "!:\t" + str_PHA, 1, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA Imm", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + IMM2L, 3, false );	  
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntID math WordIMM: Unknown Operation", 3);
	}
    }
  else if( isIntID($1.name) && isXA($4.name) )
    {
      addComment( "IntID math XA: TOC" );
      if( op == string("+") )
	{
	  addAsm( str_CLC, 1, false );
	  
	  addComment( "IntID + XA --> XA" );
	  addAsm( str_ADC + O1, sizeOP1A, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_BIT + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  // it's negative
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_JMP + "!++", 3, false );
	  // it's positive
	  addAsm( "!:\t" + str_ADC + "#$00", 2, true );
	  addAsm( "!:\t" + str_TAX, 1, true);
	  addAsm( str_TYA );	  
	  strcpy($$.name, "_XA");
	}
      else if( op == string("-") )
	{
	  addComment( "IntID - XA --> XA" );
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_STX + "$03", 2, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_SEC, 1, true );
	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_SBC + "$03", 2, false );
	  addAsm( str_TAX, 1, false );

	  if( !arg_unsafe_math )
	    {
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*") )
	{
	  addComment( "IntID * WordID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  addAsm( str_STX + "_MUL16_FE", 3, false );
	  addAsm( str_LDX + "#$00", 2, false );	  
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_STA + "_MUL16_FB", 3, true );
	  addAsm( str_STX + "_MUL16_FC", 3, false );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("/") )
	{
	  addComment( "IntID / XA --> XA" );

	  // TODO: for speed optimization... if X IS NOT Zero
	  // the the Result IS zero
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_STX + "_DIV16_FE", 3, false );
	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  
	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "**" ) )
	{
	  addComment( "IntID ** XA" );
	  addCompilerMessage( "IntID ** XA: Exponent is restricted to Low Byte (A)", 1);
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else
	{
	  addCompilerMessage( "IntID math XA: Unknown Operation", 3 );
	}
    }
  else if(isIntIMM($1.name) && isA($4.name) )
    {
      // first term is ALWAYS negative
      addComment( "IntIMM math A: TOC" );
      int OP1value = twos_complement(atoi( stripFirst($1.name).c_str() ));
      if( op == string("+") )
	{
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(OP1value), 2, false ); 
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addAsm( str_SEC );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_LDA + "#$" + toHex(OP1value), 2, false );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  // this takes the negative sign off of the number
	  int OP1value = atoi( stripFirst(stripFirst($1.name).c_str()).c_str() );

	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( commentmarker + str_LDA + "#$00", 0, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false );
	  addAsm( str_LDA + "#$" + toHex(OP1value), 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );

	  if( !arg_unsafe_math )
	    {
	      addComment( "preserve $02/$03" );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	    }
	  addAsm( str_JSR + "MUL16", 3, false );
	  if( !arg_unsafe_math )
	    {
	      addComment( "restore $02/$03" );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	    }

	  // turn RESULT into TWOS Complement
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_EOR + "MUL16R", 3, false );
	  addAsm( str_STA + "MUL16R", 3, false );

	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_EOR + "MUL16R +1", 3, false );
	  addAsm( str_STA + "MUL16R +1", 3, false );

	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDA + "#$01", 2, false );
	  addAsm( str_ADC + "MUL16R", 3, false );
	  addAsm( str_TAY, 1, false );
	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + "MUL16R +1", 3, false );

	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addCompilerMessage( "IntIMM / A --> XA", 3);

	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  if( tmp_int < 0 ) tmp_int = -1 * tmp_int;
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false );	  
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  
	  addAsm( str_JSR + "DIV16", 3, false );
	  
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  	  
	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**") )
	{
	  addCompilerMessage( "IntIMM ** A: Destroys $02", 1);
	  addAsm( str_STA + "$02", 2, false );
	  int op1 = atoi(stripFirst($1.name).c_str());
	  op1 = -1 * op1;

	  // TODO: this could be done faster like
	  // IntID / UintIMM
	  //addAsm( str_LDA + O2, 3, false );
	  addAsm( str_ROR, 1, false );
	  addAsm( str_PHP, 1, false );

	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + "#$" + toHex(op1), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BCC + "!+", 2, false );
	  
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math A: Unknown Operation", 3 );
	}
    }
  else if(isIntIMM($1.name) && isFAC($4.name) )
    {
      addComment( "IntIMM math FAC: TOC" );
      int OP1value = atoi( stripFirst($1.name).c_str() );
      string OP1hex;

      if( op == string( "+" ) )
	{
	  OP1hex = toHex( twos_complement(OP1value) );
	  pushFAC();
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}	  
      else if( op == string( "-" ) )
	{
	  OP1hex = toHex( twos_complement(OP1value) );
	  pushFAC();
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "*" ) )
	{
	  OP1hex = toHex( twos_complement(OP1value) );
	  pushFAC();
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  OP1hex = toHex( twos_complement(OP1value) );
	  pushFAC();
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fDivT();
	  strcpy($$.name, "_FAC" );

	}
      else if( op == string( "**" ) )
	{
	  OP1hex = toHex( twos_complement(OP1value) );
	  pushFAC();
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math FAC: Unknown Operation", 3 );
	}
    }
  else if(isIntIMM($1.name) && isFloatID($4.name) )
    {
      addComment( "IntIMM math FloatID: TOC" );
      //int tmpValue = atoi( stripFirst($1.name).c_str() );
      //cout << tmpValue << endl;
      string OP1hex = toHex( twos_complement(atoi(stripFirst($1.name).c_str() )));

      addAsm( str_LDY + "#$" + OP1hex, 2, false );
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

      pushFAC();
      
      addAsm( str_LDA + "#<" + O2, 3, false );
      addAsm( str_LDY + "#>" + O2, 3, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );

      popARG();      
	  
      if( op == string( "+" ) )
	{
	  fAddT();
	}	  
      else if( op == string( "-" ) )
	{
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "raising a negative number to a rational power may give complex result and is not handled.  you will likely be eaten by a grue.", 1 );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "IntIMM math FloatID: Unknown Operation", 3 );
	}

      strcpy($$.name, "_FAC" );
    }
  else if(isIntIMM($1.name) && isFloatIMM($4.name) )
    {
      addComment( "IntIMM math FloatIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math FloatIMM: unknown operation", 3 );      
	}
    }
  else if(isIntIMM($1.name) && isIntID($4.name) )
    {
      addComment( "IntIMM math IntID: TOC" );
      if( op==string( "+" ))
	{
	  addComment( "IntIMM + IntID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  string OP2 = getNameOf(getAddressOf($4.name));
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_int)), 2, false );
	  addAsm( str_ADC + OP2, 3, false );
	  addAsm( str_BVS + "!+", 2, false );
	  addAsm( str_INX, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "-" ))
	{
	  addComment( "IntIMM - IntID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  string OP2 = getNameOf(getAddressOf($4.name));
	  addAsm( str_SEC, 1, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_int)), 2, false );
	  addAsm( str_SBC + OP2, 3, false );
	  addAsm( str_BVS + "!+", 2, false );
	  addAsm( str_INX, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "*" ))
	{
	  addComment( "IntIMM * IntID --> XA" );
	  mul16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  string OP2 = getNameOf(getAddressOf($4.name));
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STX + "_MUL16_FE", 3, false );
	  addAsm( str_DEX, 1, false );	      
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_int)), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + OP2, 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_ROL, 1, false );
	  addAsm( str_BCC + "!+", 2, false ); // it's positive
	  addAsm( str_DEC + "_MUL16_FE", 3, false );	      
	  addAsm( "!:", 0, true );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "/" ))
	{
	  addCompilerMessage( "IntIMM/IntID -> XA (Signed Word16)", 0 );
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  if( tmp_int < 0 ) tmp_int = -1 * tmp_int;
	  div16_is_needed = true;
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );	  
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:", 0, true );
	  addAsm( str_STA + "_DIV16_FD", 3, false );	  
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  
	  addAsm( str_JSR + "DIV16", 3, false );
	  
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BMI + "!+", 2, false );
	  
	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "**" ))
	{
	  addComment( "IntIMM ** IntID --> XA" );
	  int op1 = atoi(stripFirst($1.name).c_str());
	  op1 = -1 * op1;

	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_BNE + "!+", 2, false );
	  addAsm( str_LAX + "#$01", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( str_JMP + "!++", 3, false );
	  addAsm( "!:", 0, true );
	  
	  addAsm( str_BPL + "!+", 2, false );
	  
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_BEQ + "!++", 2, false );
	  
	  addAsm( "!:", 0, true );
	  addAsm( str_ROR, 1, false );
	  addAsm( str_PHP, 1, false );

	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + "#$" + toHex(op1), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BCC + "!+", 2, false );
	  
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("Unknown Operation: IntIMM math IntID", 3 );
	}
    }
  else if(isIntIMM($1.name) && isIntIMM($4.name) )
    {
      addComment( "IntIMM math IntIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math IntIMM: unknown operation", 3 );      
	}
    }
  else if(isIntIMM($1.name) && isUintID($4.name) )
    {
      addComment( "IntIMM math UintID: TOC" );
      if( op==string( "+" ))
	{
	  addComment( "IntIMM + UintID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  string OP2 = getNameOf(getAddressOf($4.name));
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDX + "#$FF", 2, false );
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_int)), 2, false );
	  addAsm( str_ADC + OP2, 3, false );
	  addAsm( str_BVC + "!+", 2, false );
	  addAsm( str_INX, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "-" ))
	{
	  addComment( "IntIMM - UintID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  string OP2 = getNameOf(getAddressOf($4.name));
	  addAsm( str_SEC, 1, false );
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_int)), 2, false );
	  addAsm( str_SBC + OP2, 3, false );
	  addAsm( str_TAY, 1, false );	  
	  addAsm( str_LDA + "#$FF" );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "*" ))
	{
	  addComment( "IntIMM * UintID --> XA" );
	  mul16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  string OP2 = getNameOf(getAddressOf($4.name));
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STX + "_MUL16_FE", 3, false );
	  addAsm( str_DEX, 1, false );	      
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_int)), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + OP2, 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_ROL, 1, false );
	  addAsm( str_BCC + "!+", 2, false ); // it's positive
	  addAsm( str_DEC + "_MUL16_FE", 3, false );	      
	  addAsm( "!:", 0, true );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "/" ))
	{
	  addCompilerMessage( "IntIMM/UintID -> XA (Signed Word16)", 0 );
	  int tmp_int = atoi(stripFirst($1.name).c_str() );
	  if( tmp_int < 0 ) tmp_int = -1 * tmp_int;
	  div16_is_needed = true;
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );	  
	  addAsm( str_STA + "_DIV16_FD", 3, false );	  
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  
	  addAsm( str_JSR + "DIV16", 3, false );
	  
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  	  
	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op==string( "**" ))
	{
	  addComment( "IntIMM ** UintID --> XA" );
	  int op1 = atoi(stripFirst($1.name).c_str());
	  op1 = -1 * op1;

	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_ROR, 1, false );
	  addAsm( str_PHP, 1, false );

	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + "#$" + toHex(op1), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BCC + "!+", 2, false );
	  
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("Unknown Operation: IntIMM math UintID", 3 );
	}
    }
  else if( isIntIMM($1.name) && isUintIMM($4.name) )
    {
      addComment( "IntIMM math UintIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math UintIMM: unknown operation", 3 );      
	}
    }
  else if(isIntIMM($1.name) && isWordID($4.name) )
    {
      addComment( "IntIMM math WordID: TOC" );
      
      string positive_op1 = toHex(atoi( stripFirst(stripFirst($1.name).c_str()).c_str() ));

      if( op==string( "+" ))
	{
	  addAsm( str_SEC, 1, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_SBC + "#$" + positive_op1, 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	  strcpy($$.name, "_XA" );	  
	}
      else if( op==string("-"))
	{
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDA + "#$" + positive_op1, 2, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );

	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op==string("*"))
	{
	  mul16_is_needed = true;
	  addAsm( str_LDA + "#$" + positive_op1, 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false );

	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op==string("/"))
	{
	  div16_is_needed = true;
	  addAsm( str_LDA + "#$" + positive_op1, 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);

	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  // twos complement the result
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op==string("**"))
	{
	  addComment( "IntIMM ** WordID --> XA" );
	  addCompilerMessage( "Limiting WordID (exponent) to UINT", 1 );
	  int op1 = atoi(stripFirst($1.name).c_str());
	  op1 = -1 * op1;

	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_ROR, 1, false );
	  addAsm( str_PHP, 1, false );

	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + "#$" + toHex(op1), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BCC + "!+", 2, false );
	  
	  addAsm( str_CLC, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("IntIMM math WordID: Unknown Operation", 3 );
	}
    }
  
  
  else if( isIntIMM($1.name) && isWordIMM($4.name) )
    {
      addComment( "IntIMM math WordIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
      
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math WordIMM: unknown operation", 3 );      
	}
    }
  else if( isIntIMM($1.name) && isXA($4.name) )
    {
      addComment( "IntIMM math XA: TOC" );
      if( op == string( "+" ) )
	{	  
	  addComment( "IntIMM + XA --> XA" );
	  int OP1value = twos_complement(atoi(stripFirst($1.name).c_str() ));
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(OP1value), 2, false ); 
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_ADC + "#$FF", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  int OP1value = twos_complement(atoi(stripFirst($1.name).c_str() ));
	  addComment( "IntIMM - XA --> XA" );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_STX + "!++", 3, false );
	  addAsm( str_LDA + "#$" + toHex(OP1value), 2, false ); 
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00" + commentmarker + "<-- A", 1, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00" + commentmarker + "<-- X", 1, false );	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string( "*" ) )
	{
	  int OP1value = twos_complement(atoi(stripFirst($1.name).c_str() ));
	  addComment( "IntIMM * XA --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FD", 3, false );	  
	  addAsm( str_STX + "_MUL16_FE", 3, false );	  
	  addAsm( str_LDA + "#$" + toHex(OP1value), 2, false ); 
	  addAsm( str_STA + "_MUL16_FB", 3, false );	  
	  addAsm( str_LDA + "#$FF", 2, false ); 
	  addAsm( str_STA + "_MUL16_FC", 3, false );	  
	  addAsm( str_JSR + "MUL16", 3, false );
 	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "IntIMM / XA --> XA" );
	  int OP1value = (atoi(stripFirst(stripFirst($1.name).c_str()).c_str() ));
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false );	  
	  addAsm( str_STX + "_DIV16_FE", 3, false );	  
	  addAsm( str_LDA + "#$" + toHex(OP1value), 2, false ); 
	  addAsm( str_STA + "_DIV16_FB", 3, false );	  
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );	  
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );	  
	  addAsm( str_LDX + "_DIV16_FC", 3, false );	  
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  int OP1value = twos_complement(atoi(stripFirst($1.name).c_str() ));
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addCompilerMessage( "IntIMM ** XA: exponent restricted to low-byte of XA", 1 );
	  addComment( "IntIMM ** XA --> XA" );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$" + toHex(OP1value), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );	  
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "IntIMM math XA: Unknown Operation", 3 );
	}
    }
  else if( isUintID($1.name) && isA($4.name) )
    {
      addComment( "UintID math A: TOC" );
      
      if( op == string("+"))
	{
	  addComment( "UintID + A --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O1, sizeOP1A, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  // TODO: Test this... I'm not sure it's correct
	  // it might be backwards (see IntID - A)
	  addComment( "UintID - A --> A" );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_SEC );
	  addAsm( str_BYTE + "$E9", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", true );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  addComment( "UintID * A --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( commentmarker + str_LDA + "#$00", 0, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_LDA + "$03", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addComment( "UintID / A --> XA" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false );	  
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( commentmarker + str_LDA + "#$00", 0, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**"))
	{
	  // HERE 2025 06 18
	  addComment( "UintID ** A --> XA" );
	  pow8_is_needed = true;
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow8", 3, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_A" );	  
	}
      else
	{
	  addCompilerMessage( "UintID math A: Unknown Operation", 3 );
	}
    }
  else if( isUintID($1.name) && isFAC($4.name) )
    {      
      addComment( "UintID math FAC: TOC" );
      int base_address_op1 = hexToDecimal($1.name);
      string OP1 = getNameOf( base_address_op1 );

      if( op == string( "+" ))
	{
	  // since addition is commutative, the order here doesn't matter
	  pushFAC();
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  pushFAC();
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );	  
	  popARG();
	  fSubT();
	  addAsm( str_JSR + "$BFB4" + commentmarker + "+FAC -> -FAC", 3, false );
	}
      else if( op == string( "*" ))
	{
	  pushFAC();
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  popARG();
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  float_swap_space_is_needed = true;
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );	  

	  pushFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();

	  fDivT();
	}
      else if( op == string( "**" ))
	{

	  float_swap_space_is_needed = true;
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );	  

	  pushFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "UintID math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isUintID($1.name) && isFloatID($4.name) )
    {
      // $B391: Convert 16-bit signed integer to floating point number in FAC. Expects lowbyte in Y- and highbyte in A-register.
      // $BC0F: Copy a number currently in FAC, over into ARG
      // $BBA2: Fetch a number from a RAM location to FAC (A=Addr.LB, Y=Addr.HB)
      // $BA28: Multiplies a number from RAM and FAC (clobbers ARG, A=Addr.LB, Y=Addr.HB)
      // $BB0F: Divides a number stored in RAM by the number in FAC (A=Addr.LB, Y=Addr.HB)
      // $B867: Adds the number in FAC with one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $B850: Subtracts the number in FAC from one stored in RAM (A=Addr.LB, Y=Addr.HB)
      // $BF78: Raises a number stored ín RAM to the power in FAC (A=Addr.LB, Y=Addr.HB)
      addComment( "UintID math FloatID: TOC" );
      int base_address_op1 = hexToDecimal($1.name);
      int base_address_op2 = hexToDecimal($4.name);
      string OP1 = getNameOf( base_address_op1 );
      string OP2 = getNameOf( base_address_op2 );
      if( op == string("*") )
	{
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );

	  popARG();
	  fDivT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "+" ) )
	{
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );

	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fAddT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "-" ) )
	{
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  pushFAC();
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  popARG();
	  fPwrT();
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "UintID math FloatID: Unknown Operation", 3 );
	}
    }
  else if( isUintID($1.name) && isFloatIMM($4.name) )
    {
      addComment( "UintID math FloatIMM: TOC" );
      addAsm( str_LDY + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      pushFAC();
      inlineFloat($4.name);
      popARG();

      if( op == string( "+" ))
	{
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  fPwrT();
	}      
      else
	{
	  addCompilerMessage( "UintID math FloatIMM: Unknown Operation.", 3 );
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isUintID($1.name) && isIntID($4.name) )
    {
      addComment( "UintID math IntID: TOC" );

      addAsm( str_LDA + O1, sizeOP1A, false );
      if( op == string("+") )
	{
	  addComment( "UintID + IntID --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false);
	  strcpy($$.name, "_A" );
	}
      else if ( op == string("-") )
	{
	  addComment( "UintID - IntID --> A" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, sizeOP2A, false);
	  strcpy($$.name, "_A" );
	}
      else if ( op == string("*") )
	{
	  addComment( "UintID * IntID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_STA + "_MUL16_FD", 3, true );
	  addAsm( str_STX + "_MUL16_FE", 3, true );
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if ( op == string("/") )
	{
       	  addComment( "UintID / IntID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHP, 1, false );	  
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true );


	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
      	}
      else if( op == string("**") )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addComment( "UintID ** IntID --> XA" );
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_LDY + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_BMI + "!+", 2, false );

	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy( $$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintID math IntID: unknown operation", 3); 
	}
    }
  else if( isUintID($1.name) && isIntIMM($4.name) )
    {
      addComment( "UintID math IntIMM: TOC" );
      if( op == string("+"))
	{
	  addComment( "UintID + IntIMM --> A" );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "UintID - IntIMM -->" ); 
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  addCompilerMessage( "UIntID * IntIMM may produce unexpected result", 0 );
	  addComment( "UintID * IntIMM --> A" ); 
	
	  int tmp_int = atoi(stripFirst($1.name).c_str());

	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());
	  bool was_negative = false;
	  if( op2 < 0 )
	    {
	      was_negative = true;
	      op2=op2*(-1);
	    }
	  if( op2 == 0 )
	    {
	      addAsm( str_LDA + "#$00", 2, false );
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 1 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 2 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 4 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 8 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 16 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 32 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 64 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( op2 == 128 )
	    {
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      addAsm( str_ASL );
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	  else
	    {
	      umul_is_needed = true;	  
	      if( !arg_unsafe_math )
		{
		  // preserve $02/$03
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA );
		}
	      addAsm( str_LDY + "#$" + toHex(op2), 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_JSR + "UMUL", 3, false );
	      
	      if( !arg_unsafe_math )
		{
		  addAsm( str_LDY + "$03", 2, false );
		  // restore $02/$03
		  addAsm( str_PLA );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA );
		  addAsm( str_STA + "$02", 2, false );
		  addAsm( str_TYA );
		}
	      else
		{
		  addAsm( str_LDA + "$03", 2, false );
		}
	      if( was_negative )
		{
		  addComment( "twos complement" );
		  addAsm( str_CLC );
		  addAsm( str_EOR + "#$FF", 2, false);
		  addAsm( str_ADC + "#$01", 2, false);
		}
	      strcpy($$.name, "_A" );
	    }
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst(stripFirst($4.name).c_str()).c_str());
	  addComment( "UintID / IntIMM --> A" );
	  div16_is_needed = true;
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
    }
  else if( isUintID( $1.name ) && isUintID( $4.name ) )
    {
      if( !previousAsm( str_STA + O1 ) )
	{
	  addAsm( str_LDA + O1, sizeOP1A, false);
	}
      else
	{
	  addAsm( commentmarker + str_LDA + O1 + commentmarker + "commented out for optimization", 0, false);
	}
      // ==============================================================================
      addComment( "UintID math UintID: TOC" );
      if( op == string("+"))
	{
	  addComment( "UintID + UintID --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-"))
	{
	  // TODO: this should return XA
	  addComment( "UintID - UintID --> A" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  // TO DO: this should return XA
	  addComment( "UintID * UintID --> A" );
	  umul_is_needed = true;
	  addAsm( str_TAX );
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_LDY + "$03", 2, false );	  
	  addAsm( str_STX + "$02", 2, false );
	  
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDX + "$03", 2, false );

	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_STY + "$03", 2, false );
	  addAsm( str_TXA );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  addComment( "UintID / UintID --> XA" );
	  div16_is_needed = true;	  
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintID ** UintID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );	  
	}
      else
	{
	  addCompilerMessage( "UintID math UintID: Unknown Operation", 3 );
	}
    }
  else if( isUintID($1.name) && isUintIMM($4.name) )     // UintID vs. UintIMM
    {
      addComment( "UintID math UintIMM: TOC" );
      
      if( op == string("+"))
	{
	  addComment( "UintID + UintIMM --> A" );
	  addAsm( str_LDA + O1, sizeOP1A, false);

	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "UintID - UintIMM --> A" );
	  addAsm( str_LDA + O1, sizeOP1A, false);

	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  
	  addComment( "UintID * UintIMM --> XA (Word16)" );
	  int addr_op1 = getAddressOf( $1.name );
	  //mul16_is_needed = true;
	  int tmp_v = atoi(stripFirst($4.name).c_str());

	  if( tmp_v == 0 )
	    {
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_TAX, 1, false );
	      
	    }
	  else if( tmp_v == 1 )
	    {
	      addAsm( str_LDA + O1, sizeOP1A, false);
	      addAsm( str_LDX + "#$00", 2, false );
	    }
	  else if( tmp_v == 11 )
	    {
	      // TODO: add arg_unsafe_math check here
	      addComment( "multiply by 11 - 145 cycles" );
	      addComment( "save ZP $02/$03/$04/$05" );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$04", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$05", 2, false );
	      addAsm( str_PHA, 1, false );
	      addComment( "----------------------" );
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_STA + "$04", 2, false );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_STA + "$05", 2, false );

	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_CLC, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_ADC + "$04", 2, false );
	      addAsm( str_STA + "$02", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_ADC + "$05", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      
	      addAsm( str_CLC, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_ADC + "$04", 2, false );	      
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TAY, 1, false );
	      
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_ADC + "$05", 2, false );
	      addAsm( str_TAX, 1, false );
	      addComment( "-------------------" );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$05", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$04", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA, 1, false );
	    }
	  else if( tmp_v == 40 )
	    {
	      // TODO: add arg_unsafe_math check here
	      addComment( "multiply by 40" );
	      addComment( "save ZP $02/$03/$04/$05" );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$04", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$05", 2, false );
	      addAsm( str_PHA, 1, false );
	      addComment( "----------------------" );
	      addAsm( str_LDA + O1, sizeOP1A, false );

	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_STA + "$04", 2, false );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_STA + "$05", 2, false );

	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      
	      addAsm( str_CLC, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_ADC + "$04", 2, false );
	      addAsm( str_STA + "$02", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );	      
	      addAsm( str_ADC + "$05", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );	      
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_LDY + "$02", 2, false );
	      
	      addComment( "-------------------" );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$05", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$04", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA, 1, false );
	    }	  
	  else
	    {
	      mul16_is_needed = true;
	      addAsm( str_LDA + O1, sizeOP1A, false);
       
	      addAsm( str_STA + "_MUL16_FB", 3, false );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "_MUL16_FC", 3, false );
	      addAsm( str_STA + "_MUL16_FE", 3, false );
	      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false );
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());
	  addComment( "UintID / UintIMM --> A" );
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**") )
	{
	  addComment( "UintID ** UintIMM --> A" );
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintID math UintIMM: unknown operation", 3 );
	}
    }
  else if( isUintID($1.name) && isWordID($4.name) )
    {
      addComment( "UintID math WordID (in progress): TOC" );
      if( op == string( "+" ) )
	{
	  addComment( "UintID + WordID --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_ADC + O2, 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + O2 + " +1", 3, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "UintID - WordID --> XA" );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + O2 + " +1", sizeOP2B, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	}
      else if( op == string( "*" ) )
	{
	  addComment( "UintID * WordID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  addAsm( str_LDA + O2, sizeOP2A, false  );	  
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + O2 + " +1", sizeOP2B, false  );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "UintID / WordID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);

	  addAsm( str_LDA + O2, sizeOP2A, false  );	  
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + O2 + " +1", sizeOP2B, false  );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintID ** WordID --> XA" );
	  addCompilerMessage( "UintID ** WordID: exponent restricted to low-byte of WordID", 1 );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintID math WordID: unknown operation", 3 );
	}
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID($1.name) && isWordIMM($4.name) )
    {
      // TODO: Hardcode common multipliers (256, 512, 1024, 2048, 4096, 8192)...  are there others?
      addComment( "UintID math WordIMM: TOC" );      
      int OP2 = atoi(stripFirst($4.name).c_str());
      if( op == string("+") )
	{
	  addComment( "UintID + WordIMM --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_ADC + "#$" + IMM2L, 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "UintID - WordIMM --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_SBC + "#$" + IMM2L, 2, false );	  
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + "#$" + IMM2H, 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "UintID * WordIMM --> XA" );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + "#$" + IMM2L, 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addCompilerMessage( "UintID / WordIMM: possible division by zero", 1 );
	  addComment( "UintID / WordIMM --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + "#$" + IMM2L, 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$" + IMM2H, 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
  	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintID ** WordIMM --> XA" );
	  addCompilerMessage( "UintID ** WordIMM: exponent restricted to low byte", 1 );
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = get_word_L(atoi(stripFirst($4.name).c_str()));
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintID / WordIMM: Unknown Operation", 3 );
	}
    }
  else if( isUintID($1.name) && isXA($4.name) )
    {
      addComment( "UintID math XA: TOC" );
      int tmp_addr = getAddressOf($1.name);
      string tmp_name = getNameOf(tmp_addr);
      if( op == string("-") )
	{
	  addCompilerMessage( "UintID - XA --> XA should be written better", 0 );
	  if( !arg_unsafe_math)
	    {
	      addComment( "UintID - XA --> XA (Uses $02)");
	    }
	  else
	    {
	      addComment( "UintID - XA --> XA (Destroys $02)");
	    }
	  if( !arg_unsafe_math)
	    {
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STY + "$02", 2, false );
	    }
	  else
	    {
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_SEC );
	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_STX + "$02", 2, false );
	  addAsm( str_LDA + "#$00", 2, false  );
	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_TAX );
	  if( !arg_unsafe_math)
	    {
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("+") )
	{
	  addComment( "UintID + XA --> XA");
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O1, sizeOP1A, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
      	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  addComment( "UintID * XA --> XA");
	  mul16_is_needed = true;	  
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addComment( "UintID / XA --> XA");
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintID ** XA --> XA");
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addCompilerMessage( "UintID ** XA: exponent restricted to low-byte of XA", 1 );

	  addAsm( str_TAX, 1, false );
	  
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintID math XA: Unknown Operation", 3 );
	}
    }
  else if( isUintIMM($1.name) && isA($4.name) )
    {
      addComment( "UintIMM math A: TOC" );
      int tmp_i = atoi( stripFirst($1.name).c_str() );  // OP1
      if( op == string("+"))
	{
	  addComment( "IntIMM + A --> A" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex( tmp_i ), 2);
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "IntIMM - A --> A" );
	  addAsm( str_SEC );

	  addAsm( str_STA + "!+", 3, false );

	  addAsm( str_LDA + "#$" + toHex( tmp_i ), 2);
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false ); 
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );

	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  addComment( "UintIMM * A --> XA" );
	  if( tmp_i == 40 )
	    {
	      //addAsm( str_TAX, 1, false );
	      addComment( "multiply by 40" );
	      if( !arg_unsafe_math)
		{
		  addAsm( str_TAX, 1, false );
		  addComment( "save ZP $02/$03/$04/$05" );
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$04", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$05", 2, false );
		  addAsm( str_PHA, 1, false );
		  addComment( "----------------------" );
		  addAsm( str_STX + "$02", 2, false );
		  addAsm( str_STX + "$04", 2, false );
		}
	      else
		{
		  addAsm( str_STA + "$02", 2, false );
		  addAsm( str_STA + "$04", 2, false );
		}
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_STA + "$05", 2, false );

	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      
	      addAsm( str_CLC, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_ADC + "$04", 2, false );
	      addAsm( str_STA + "$02", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );	      
	      addAsm( str_ADC + "$05", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );	      
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_LDX + "$03", 2, false );

	      if( !arg_unsafe_math)
		{
		  addAsm( str_LDY + "$02", 2, false );
		  addComment( "-------------------" );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$05", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$04", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$02", 2, false );
		  addAsm( str_TYA, 1, false );
		}
	      else
		{
		  addAsm( str_LDA + "$02", 2, false );
		}
	      strcpy($$.name, "_XA" );
	    }
	  else
	    {
	      mul16_is_needed = true;
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_STX + "_MUL16_FE", 3, false);
	      addAsm( str_LDA + "#$" + toHex(tmp_i), 2, false );
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_STX + "_MUL16_FC", 3, false);
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R +1", 3, false );
	      strcpy($$.name, "_XA" );
	    }
	}
      else if( op == string("/"))
	{
	  addComment( "UintIMM / A --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(tmp_i), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**"))
	{
	  addComment( "UintIMM ** A --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_i), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math A: Unknown operation", 3 );
	}
    }
  else if(isUintIMM($1.name) && isFAC($4.name) )
    {
      addComment( "UintIMM math FAC: TOC" );
      int OP1value = atoi( stripFirst($1.name).c_str() );
      string OP1hex;

      if( op == string( "+" ) )
	{
	  float_swap_space_is_needed = true;
	  OP1hex = toHex( OP1value ) ;
	  pushFAC();
	  
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  popFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  
	  strcpy($$.name, "_FAC" );
	}	  
      else if( op == string( "-" ) )
	{
	  float_swap_space_is_needed = true;
	  OP1hex = toHex( OP1value ) ;
	  pushFAC();
	  
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  popFAC();
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "*" ) )
	{
	  float_swap_space_is_needed = true;
	  OP1hex = toHex(OP1value);

	  pushFAC();
	  
	  addAsm( str_LDY + "#$" + OP1hex, 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  
	  popARG();
	  fMultT();
	  
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM0", 3, false );
	  addAsm( str_LDY + "#$" + toHex(OP1value), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM1", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM0 -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );

	  fDivT();
	  strcpy($$.name, "_FAC" );

	}
      else if( op == string( "**" ) )
	{
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM0", 3, false );
	  addAsm( str_LDY + "#$" + toHex(OP1value), 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );	  
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM1", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM0 -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM1 -> ARG (+)", 3, false );

	  fPwrT();
	  
	  strcpy($$.name, "_FAC" );

	}
      else
	{
	  addCompilerMessage( "UintIMM math FAC: Unknown Operation", 3 );
	}
    }
  else if( isUintIMM($1.name) && isFloatIMM($4.name) )
    {
      addComment( "UintIMM math FloatIMM: TOC" );
      float tmp_int1 = atof( stripFirst($1.name).c_str() );
      float tmp_int2 = atof( stripFirst($4.name).c_str() );
      float tmp_int3;

      if( op == string("+") )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("-") )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("*") )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("/") )
	{
	  if( tmp_int2 == 0 ) addCompilerMessage( "Division By Zero", 3 );
	  tmp_int3 = tmp_int1 / tmp_int2;
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else if( op == string("**") )
	{
	  tmp_int3 = pow(tmp_int1, tmp_int2);
	  inlineFloat( "f" + to_string( tmp_int3 ) );
	  strcpy( $$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math FloatIMM: Unknown Operation", 3 );
	}
    }
  else if( isUintIMM($1.name) && isFloatID($4.name) )
    {
      addComment( "UintIMM math FloatID: TOC" );
      string OP1l = toHex(get_word_L(atoi(stripFirst($1.name).c_str())));

      addAsm( str_LDY + "#$" + OP1l, 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      pushFAC();
      addAsm( str_LDA + "#<" + O2, 3, false );
      addAsm( str_LDY + "#>" + O2, 3, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      popARG();
      if( op == string( "+" ) )
	{	  
	  addComment( "UintIMM + FloatID --> FAC" );
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addComment( "UintIMM - FloatID --> FAC" );
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addComment( "UintIMM * FloatID --> FAC" );
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addComment( "UintIMM / FloatID --> FAC" );
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintIMM ** FloatID --> FAC" );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "UintIMM math FloatID: Unknown Operation", 3 );
	}
      strcpy($$.name, "_FAC" );
    }
  else if( isUintIMM($1.name) && isIntIMM($4.name) )
    {
      addComment( "UintIMM math IntIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math IntIMM: unknown operation", 3 );      
	}
    }
  else if( isUintIMM($1.name) && isIntID($4.name) )
    {
      addComment( "UintIMM math IntID: TOC" );
      
      if( op == string("+"))
	{
	  addAsm( str_LDA + O2, sizeOP2A, false);
	  addComment( "UIntIMM + IntID --> A" );
	  int tmp_int = atoi(stripFirst($1.name).c_str());

	  if( tmp_int != 0 )
	    {
	      addAsm( str_CLC, 1, false );
	      addAsm( str_ADC + "#$" + toHex(tmp_int), 2, false );
	    }
	  else
	    {
	      addComment( "no need to add 0" );
	      addAsm( commentmarker + str_CLC, 0, true );
	      addAsm( commentmarker + str_ADC + "#$00", 0, true );

	    }
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "UIntIMM - IntID --> A" );
	  addAsm( str_LDA + O2, sizeOP2A, false);

	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" +  toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  addComment( "UintIMM * IntID --> XA" );
	  mul16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );	  
	  addAsm( "!:\t" + str_STX + "_MUL16_FC", 3, true);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/"))
	{
	  addComment( "UintIMM / IntID --> XA" );
	  div16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("**"))
	{
	  addComment( "UintIMM ** IntID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_LDY + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_BMI + "!+", 2, false );
	  
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy( $$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math IntID: unknown operation", 3 );
	}
    }
  else if( isUintIMM($1.name) && isUintID($4.name) )
    {
      addComment( "UintIMM math UintID: TOC" );
      if( op == string("+"))
	{
	  addComment( "UintIMM + UintID --> XA" );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false); // 
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	  addAsm( str_BCC + "!+", 2, false );
	  addAsm( str_INX, 2, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-"))
	{
	  addComment( "UintIMM - UintID --> A" );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_SEC );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int == 0 )
	    {
	      addComment( "Special Case: 0 * UintID -> XA" );
	      addAsm( str_LAX + "#$00", 2, false );
	    }	  
	  else if( tmp_int == 1 )
	    {
	      
	      addComment( "Special Case: 1 * UintID -> XA" );
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	    }	  
	  else if( tmp_int == 2 )
	    {
	      // tested for 0 - 254
	      addComment( "Special Case: 2 * UintID -> XA" );
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	      addAsm( str_ROL, 1, false );
	      addAsm( str_BCC + "!+", 2, false );
	      addAsm( str_INX, 1, false );
	      addAsm( "!:", 0, true );
	    }
	  else if( tmp_int == 4 )
	    {
	      addComment( "Special Case: 4 * UintID -> XA" );
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	      
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );	      
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	    }
	  else if( tmp_int == 8 )
	    {
	      addComment( "Special Case: 8 * UintID -> XA" );
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	      addAsm( str_LDY + "#$03" + commentmarker + "(2)", 2, false );
	      addAsm( "!:\t" + str_ROL, 1, true );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	      addAsm( str_DEY + commentmarker + "(2)", 1, false );
	      addAsm( str_BNE + "!-" + commentmarker + "(2)", 2, false );
	    }
	  else if( tmp_int == 16 )
	    {
	      addComment( "Special Case: 16 * UintID -> XA" );
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	      addAsm( str_LDY + "#$04" + commentmarker + "(2)", 2, false );
	      addAsm( "!:\t" + str_ROL, 1, true );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	      addAsm( str_DEY + commentmarker + "(2)", 1, false );
	      addAsm( str_BNE + "!-" + commentmarker + "(2)", 2, false );
	    }
	  else if( tmp_int == 32 )
	    {
	      // TODO: I think this could be optimized for both size and speed
	      addComment( "Special Case: 32 * UintID -> XA" );
	      addAsm( str_LDX + "#$00" + commentmarker + "(2 clock cycles)", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)) + commentmarker + "(4)", 3, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$E0" + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$1F" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	    }
	  else if( tmp_int == 64 )
	    {
	      // TODO: I think this could be optimized for both size and speed
	      addComment( "Special Case: 64 * UintID -> XA" );
	      addAsm( str_LDX + "#$00" + commentmarker + "(2 clock cycles)", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)) + commentmarker + "(4)", 3, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$C0" + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$3F" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	    }
	  else if( tmp_int == 128 )
	    {
	      // TODO: I think this could be optimized for both size and speed
	      // maybe AND #$01, the ROR, ROR
	      addComment( "Special Case: 128 * UintID -> XA (24 bytes - 43 clock cycles)" );
	      addAsm( str_LDX + "#$00" + commentmarker + "(2 clock cycles)", 2, false );
	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)) + commentmarker + "(4)", 3, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$80" + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$7F" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	    }
	  else
	    {
	      addComment( "UintIMM * UintID --> XA" );
	      mul16_is_needed = true;
	      addAsm( str_LDX + "#$00", 2, false );
	      addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_STX + "_MUL16_FE", 3, false);

	      addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_STX + "_MUL16_FC", 3, false);

	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R +1", 3, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/"))
	{
	  addComment( "UintIMM / UintID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  div16_is_needed = true;
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("**"))
	{
	  addComment( "UintIMM ** UintID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math UintID: unknown operation", 3 );
	}
    }
  else if( isUintIMM($1.name) && isUintIMM($4.name) )
    {
      addComment( "UintIMM math UintIMM: TOC (compile-time operation)" );
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addComment( "vvv OPTIMIZE? vvv" );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 > 65536 )
	    {
	      addCompilerMessage( "Word Overflow (value greater than 65536)", 3 );
	    }
	  //if( tmp_int3 < 0 )
	  //  {
	  //    tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	  //  }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math UintIMM: unknown operation", 3 );      
	}
    }
  else if( isUintIMM($1.name) && isWordID($4.name) )
    {
      addComment( "UintIMM math WordID: TOC" );
      if( op == string( "+" ) )
	{	  
	  addComment( "UintIMM + WordID --> XA" );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_LDX + getNameOf(getAddressOf($4.name)) + " +1", 3, false);
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "UintIMM - WordID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_SEC );
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "*" ) )
	{
	  mul16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addComment( "UintIMM * WordID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  div16_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addComment( "UintIMM / WordID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_LDX + getNameOf(getAddressOf($4.name)) + " +1", 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false);
	  addAsm( str_LDX + "_DIV16_FC", 3, false);
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintIMM ** WordID --> XA" );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addCompilerMessage( "UintIMM ** WordID: exponent restricted to Low-Byte of WordID", 1 );
	  addAsm( str_LDA + "#$" + toHex(tmp_int), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else
	{
	  addCompilerMessage( "UintIMM math WordID: Unknown Operation", 3 );
	}
    }
  else if( isUintIMM($1.name) && isWordIMM($4.name) )
    {
      addComment( "UintIMM math WordIMM: TOC (compile-time operation)" );
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      // this will never happen
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      // this will never happen
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      // this will never happen
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      // this will never happen
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      // this will never happen
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "UintIMM math WordIMM: unknown operation", 3 );      
	}
    }
  else if( isUintIMM($1.name) && isXA($4.name) )
    {
      addComment( "UintIMM math XA: TOC" );
      if( op == string( "+" ) )
	{	  
	  addComment( "UintIMM + XA --> XA" );
	  int IMMvalue = atoi(stripFirst($1.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "UintIMM - XA --> XA" );
	  int IMMvalue = atoi(stripFirst($1.name).c_str());

	  addAsm( str_SEC, 1, false );
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_TAY, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_TYA, 1, false );
	    }
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_STX + "$03", 2, false );
	  addAsm( str_LDA + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + "$03", 2, false );
	  addAsm( str_TAX, 1, false );
	  if( !arg_unsafe_math )
	    {
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", 2, false );
	    }
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string( "*" ) )
	{
	  mul16_is_needed = true;
	  addComment( "UintIMM * XA --> XA" );
	  int IMMvalue = atoi(stripFirst($1.name).c_str());
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "UintIMM / XA --> XA" );
	  div16_is_needed = true;
	  int IMMvalue = atoi(stripFirst($1.name).c_str());
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false);
	  addAsm( str_LDX + "_DIV16_FC", 3, false);
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "UintIMM ** XA --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addCompilerMessage( "UintIMM ** XA: exponent restricted to low-byte (A)", 1 );
	  int IMMvalue = atoi(stripFirst($1.name).c_str());
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );	  
	}
      else
	{
	  addCompilerMessage( "UintIMM math XA: Unknown Operation", 3 );
	}
    }
  else if( isWordID($1.name) && isA($4.name) )
    {
      addComment( "WordID math A: TOC" );      
      if( op == string("+") )
	{  
	  addComment( "WordID + A --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O1, sizeOP1A, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + O1 + " +1", sizeOP1B, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{  
	  addComment( "WordID - A --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O1, sizeOP1A, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA+"#$00", 2, false );
	  addAsm( str_SBC + O1 + "+1", sizeOP1B, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  int tmp_op1 = getAddressOf( $1.name );
	  addComment( "WordID * A --> XA" );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  );      
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "WordID / A --> XA" );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  );      
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );	  
	  strcpy($$.name, "_XA" );
	  
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordID ** A --> XA" );
	  addCompilerMessage( "WordID ** A: exponent restricted to < 0x0F", 1 );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O1 + "+1", 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordID math A: Unknown Operation", 3);
	}
    }
  else if( isWordID($1.name) && isFAC($4.name) )
    {
      addComment( "WordID math FAC: TOC" );
      float_swap_space_is_needed = true;
      addAsm( str_LDX + "#<!fp0+", 2, false );
      addAsm( str_LDY + "#>!fp0+", 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
      addAsm( str_LDY + O1, 3, false );
      addAsm( str_LDA + O1 + " +1", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD16 -> FAC", 3, false );
      pushFAC();
      addAsm( str_LDA + "#<!fp0+", 3, false );
      addAsm( str_LDY + "#>!fp0+", 3, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      popARG();
      if( op == string( "+" ))
	{
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "WordID math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isWordID($1.name) && isFloatID($4.name) )
    {
      addComment( "WordID math FloatID: TOC" );
      addCompilerMessage( "16-bit word is SIGNED", 1 );
      int base_address_op1 = hexToDecimal($1.name);
      int base_address_op2 = hexToDecimal($4.name);

      string OP1 = getNameOf( base_address_op1 );
      string OP2 = getNameOf( base_address_op2 );
      if( op == string("*"))
	{
	  addComment( "WordID * FloatID --> XA" );
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + OP1 + "+1", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD16 -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BA28" + commentmarker + "MEM * FAC -> FAC", 3, false );
	  addCompilerMessage( "This can be optimized by putting the WORD after the FLOAT", 1);
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("+"))
	{
	  addComment( "WordID + FloatID --> XA" );
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + OP1 + " +1", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD16 -> FAC", 3, false );
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$B867" + commentmarker + "MEM + FAC -> FAC", 3, false );
	  addCompilerMessage( "This can be optimized by putting the WORD after the FLOAT", 1);
	  strcpy($$.name, "_FAC" );

	}
      else if( op == string("-"))
	{

	  float_swap_space_is_needed = true;
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + OP1 + " +1", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  //addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  addAsm( str_JSR + "$B850" + commentmarker + "MEM - FAC -> FAC", 3, false );
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string("/"))
	{
	  float_swap_space_is_needed = true;
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + OP1 + " +1", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addComment( "Use the Floating Point Swap Space" );
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  
	  addAsm( str_JSR + "$BB12" + commentmarker + "ARG/FAC -> FAC", 3, false );
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "**" ) )
	{
	  addAsm( str_LDY + OP1, 3, false );
	  addAsm( str_LDA + OP1 + "+1", 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_JSR + "$BC0F" + commentmarker + "FAC -> ARG", 3, false );
	  addAsm( str_LDA + "#<" + OP2, 3, false );
	  addAsm( str_LDY + "#>" + OP2, 3, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
	  addAsm( str_JSR + "$BF7B" + commentmarker + "ARG ** FAC -> FAC", 3, false );
	  strcpy($$.name, "_FAC" );
	}
      else
	{
	  addCompilerMessage( "WordID math FloatID: Unknown Operation", 3 );
	}
    }
  else if( isWordID($1.name) && isFloatIMM($4.name) )
    {
      addComment( "WordID math FloatIMM: TOC" );
      addAsm( str_LDY + getNameOf(getAddressOf($1.name)), 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + " +1", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      pushFAC();
      inlineFloat($4.name);
      popARG();
      if( op == string( "+" ) )
	{	  
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "WordID math FloatIMM: Unknown Operation", 3 );
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isWordID($1.name) && isUintID($4.name) )
    {
      addComment( "WordID math UintID: TOC" );
      if( op == string("+") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  addComment( "WordID + UintID --> XA" );
	  addAsm( str_CLC, 1, false );

	  int size_op1=2;
	  int size_op2=2;
	  if( addr_op1 > 255 ) size_op1=3;
	  if( addr_op2 > 255 ) size_op2=3;
	  
	  addAsm( str_LDA +  getNameOf(getAddressOf($1.name)), size_op1, false );
	  addAsm( str_ADC +  getNameOf(getAddressOf($4.name)), size_op2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );

	  size_op1=2;
	  if( addr_op1+1 > 255 ) size_op1=3;
	  addAsm( str_ADC + getNameOf(getAddressOf($1.name)) + " +1", size_op1, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  addComment( "WordID - UintID --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + "+1", 3, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );

	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  // TODO: REWORK THIS
	  addComment( "WordID * UintID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  // TEST THIS
	  addComment( "WordID / UintID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordID ** UintID --> XA" );
	  addCompilerMessage( "WordID ** UintID cant't have OP2 > 0x000F, the result is > 0xFFFF", 0 );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O1 + "+1", 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("WordID * UintID: Unknown Operation", 3 );
	}
    }  
  else if( isWordID($1.name) && isIntID($4.name))
    {
      addComment( "WordID math IntID: TOC" );
      if( op == string("+") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  addComment( "WordID + IntID --> XA" );
	  addAsm( str_CLC, 1, false );

	  int size_op1=2;
	  int size_op2=2;
	  if( addr_op1 > 255 ) size_op1=3;
	  if( addr_op2 > 255 ) size_op2=3;
	  
	  addAsm( str_LDA +  getNameOf(getAddressOf($1.name)), size_op1, false );
	  addAsm( str_ADC +  getNameOf(getAddressOf($4.name)), size_op2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );

	  size_op1=2;
	  if( addr_op1+1 > 255 ) size_op1=3;
	  addAsm( str_ADC + getNameOf(getAddressOf($1.name)) + "+1", size_op1, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  addComment( "WordID - IntID --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + "+1", 3, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );

	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  addComment( "WordID * IntID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addComment( "WordID / IntID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );	  
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );

	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordID ** IntID  --> XA" );
	  addCompilerMessage( "WordID ** IntID cant't have OP2 > 0x000F, the result is > 0xFFFF", 0 );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_LDY + O2, 3, false );
	  addAsm( str_BMI + "!+", 2, false );
	  
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O1 + " +1", 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  //addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("WordID * IntID: Unknown Operation", 3 );
	}
    }
  else if( isWordID($1.name) && isUintIMM($4.name) )
    {
      addComment( "WordID math UintIMM: TOC" );
      int a = getAddressOf($1.name);
      int IMMvalue = atoi(stripFirst($4.name).c_str());
      if( op == string( "+" ) )
	{
	  addAsm( str_CLC, 1, false );
	  addComment( "vvv OPTIMIZE vvv" );
	  addComment( "WordID + UIntIMM --> XA" );      
	  int size_of_instruction = 3;
	  if( a < 256 ) size_of_instruction = 2;
	  addAsm( str_LDA + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_ADC + getNameOf(a), size_of_instruction, false );
	  addAsm( str_TAY );
	  a++;
	  if( a < 256 )
	    {
	      size_of_instruction = 2;
	    }
	  else
	    {
	      size_of_instruction = 3;
	    }
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + getNameOf(a-1) + " +1", size_of_instruction, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  // Does this _acutally_ work?
	  addComment( "WordID - UintIMM --> XA" );      
	  int size_of_instruction = 3;
	  if( a < 256 ) size_of_instruction = 2;
	  addAsm( str_SEC );
	  addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
	  addAsm( str_SBC + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_TAY );
	  a++;
	  if( a < 256 )
	    {
	      size_of_instruction = 2;
	    }
	  else
	    {
	      size_of_instruction = 3;
	    }
	  addAsm( str_LDA + getNameOf(a-1) + " +1", size_of_instruction, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("*") )
	{
	  addComment( "WordID * UIntIMM --> XA" );
	  
	  if( IMMvalue == 40 )
	    {
	      addComment( "multiply by 40" );
	      if( !arg_unsafe_math )
		{
		  addComment( "save ZP $02/$03/$04/$05" );
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$04", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$05", 2, false );
		  addAsm( str_PHA, 1, false );
		  addComment( "----------------------" );
		}
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_STA + "$04", 2, false );
	      addAsm( str_LDA + O1 + " +1", sizeOP1A, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_STA + "$05", 2, false );

	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      
	      addAsm( str_CLC, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_ADC + "$04", 2, false );
	      addAsm( str_STA + "$02", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );	      
	      addAsm( str_ADC + "$05", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );	      
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_TAX, 1, false );
	      if( !arg_unsafe_math )
		{
		  addAsm( str_LDY + "$02", 2, false );
		  addComment( "-------------------" );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$05", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$04", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$02", 2, false );
		  addAsm( str_TYA, 1, false );
		}
	      else
		{
		  addAsm( str_LDA + "$02", 2, false );
		}
	      strcpy($$.name, "_XA" );
	    }
	  else if( IMMvalue == 8 )
	    {
	      addComment( "multiply by 8" );
	      addComment( "save ZP $02/$03" );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA, 1, false );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA, 1, false );
	      addComment( "-------------------" );
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addComment( "-------------------" );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA, 1, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_LDX + "$03", 2, false );
	      addAsm( str_LDA + "$02", 2, false );
	      strcpy($$.name, "_XA" );
	    }
	  else
	    {
	      mul16_is_needed = true;
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_LDA + O1 +"+1", sizeOP1B, false );
	      addAsm( str_STA + "_MUL16_FC", 3, false);
	      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	      strcpy($$.name, "_XA" );
	    }
	}
      else if( op == string("/") )
	{
	  addComment( "WordID / UIntIMM" );
	  int addr_op1 = getAddressOf($1.name);
	  div16_is_needed = true;
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + getNameOf(addr_op1) + " +1", 3, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  int addr_op1 = getAddressOf($1.name);
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addCompilerMessage( "WordID ** UintIMM: exponent restricted to < 0x0F", 1);
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + getNameOf(addr_op1) + "+1", 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else 
	{
	  addCompilerMessage( "WordID math UintIMM: unknown operation", 3 );
	}
    }
  else if( isWordID($1.name) && isIntIMM($4.name) )
    {
      addComment( "WordID math IntIMM: TOC" );
      // it would be possible to add some specific optimizations here.
      // if the IMM is a power of 2 then just add lsr's until it's divided out
      int a = getAddressOf($1.name);
      int IMMvalue = atoi(stripFirst(stripFirst($4.name).c_str()).c_str());
      if( op == string( "+" ) )
	{
	  addAsm( str_SEC, 1, false );
	  addComment( "vvv OPTIMIZE vvv" );
	  addComment( "WordID + IntIMM --> XA" );
	  int size_of_instruction = 3;
	  if( a < 256 ) size_of_instruction = 2;
	  addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
	  addAsm( str_SBC + "#$" + toHex(IMMvalue), 2, false );
	  addAsm( str_TAY );
	  a++;
	  if( a < 256 )
	    {
	      size_of_instruction = 2;
	    }
	  else
	    {
	      size_of_instruction = 3;
	    }
	  addAsm( str_LDA + getNameOf(a-1) + " +1", size_of_instruction, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordID - IntIMM --> XA" );      
	  int size_of_instruction = 3;
	  if( a < 256 ) size_of_instruction = 2;
	  addAsm( str_SEC );
	  addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
	  addAsm( str_SBC + "#$" + toHex(twos_complement(IMMvalue)), 2, false );
	  addAsm( str_PHA );
	  a++;
	  if( a < 256 )
	    {
	      size_of_instruction = 2;
	    }
	  else
	    {
	      size_of_instruction = 3;
	    }
	  addAsm( str_LDA + getNameOf(a-1) + " +1", size_of_instruction, false );
	  addAsm( str_SBC + "#$FF", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("*") )
	{
	  addComment( "WordID * IntIMM --> XA" );
	  
	  if( IMMvalue == 40 )
	    {
	      addComment( "multiply by -40" );

	      if( !arg_unsafe_math )
		{
		  
		  addComment( "save ZP $02/$03/$04/$05" );	      
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$04", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$05", 2, false );
		  addAsm( str_PHA, 1, false );
		  addComment( "----------------------" );
		}
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_STA + "$04", 2, false );
	      addAsm( str_LDA + O1 + " +1", sizeOP1A, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_STA + "$05", 2, false );

	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_ASL + "$04", 2, false );
	      addAsm( str_ROL + "$05", 2, false );
	      
	      addAsm( str_CLC, 1, false );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_ADC + "$04", 2, false );
	      addAsm( str_STA + "$02", 2, false );
	      
	      addAsm( str_LDA + "$03", 2, false );	      
	      addAsm( str_ADC + "$05", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );	      
	      addAsm( str_ROL + "$03", 2, false );
	      
	      addAsm( str_LDX + "$03", 2, false );
	      
	      if( !arg_unsafe_math )
		{
		  addAsm( str_LDY + "$02", 2, false );		  
		  addComment( "-------------------" );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$05", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$04", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$02", 2, false );
		  addAsm( str_TYA, 1, false );
		}
	      else
		{
		  addAsm( str_LDA + "$02", 2, false );
		}

	      addAsm( str_EOR + "#$FF", 2, false );
	      addAsm( str_CLC, 1, false );
	      addAsm( str_ADC + "#$01", 2, false );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_TXA, 1, false );
	      addAsm( str_EOR + "#$FF", 2, false );
	      addAsm( str_ADC + "#$00", 2, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_TYA, 1, false );

	      strcpy($$.name, "_XA" );
	    }
	  else if( IMMvalue == 8 )
	    {
	      addComment( "multiply by -8" );
	      addComment( "save ZP $02/$03" );
	      if( !arg_unsafe_math )
		{
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA, 1, false );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA, 1, false );
		  addComment( "-------------------" );
		}
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );


	      if( !arg_unsafe_math )
		{
		  addAsm( str_LDX + "$03", 2, false );
		  addAsm( str_LDY + "$02", 2, false );

		  addComment( "-------------------" );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA, 1, false );
		  addAsm( str_STA + "$02", 2, false );
		  addAsm( str_TYA, 1, false );
		}
	      else
		{
		  addAsm( str_LDX + "$03", 2, false );
		  addAsm( str_LDA + "$02", 2, false );		  
		}

	      addAsm( str_EOR + "#$FF", 2, false );
	      addAsm( str_CLC, 1, false );
	      addAsm( str_ADC + "#$01", 2, false );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_TXA, 1, false );
	      addAsm( str_EOR + "#$FF", 2, false );
	      addAsm( str_ADC + "#$00", 2, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_TYA, 1, false );

	      strcpy($$.name, "_XA" );
	    }
	  else
	    {
	      mul16_is_needed = true;
	      addAsm( str_LDA + O1, sizeOP1A, false );
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_LDA + O1 +"+1", sizeOP1B, false );
	      addAsm( str_STA + "_MUL16_FC", 3, false);
	      addAsm( str_LDA + "#$" + toHex(twos_complement(atoi(stripFirst($4.name).c_str()))), 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_LDA + "#$FF", 2, false );
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	      strcpy($$.name, "_XA" );
	    }
	}
      else if( op == string("/") )
	{
	  addComment( "WordID / IntIMM" );
	  int addr_op1 = getAddressOf($1.name);
		 
	  div16_is_needed = true;
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + getNameOf(addr_op1) + " +1", 3, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( str_LDA + "#$" + toHex(atoi(stripFirst(stripFirst($4.name).c_str()).c_str())), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  // make the result negative
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "WordID ** IntIMM: always returns zero", 1 );
	  addComment( "WordID ** IntIMM --> XA" );
	  addAsm( str_LAX + "#$00", 2, false );
	  strcpy($$.name, "_XA" );
	}
      else 
	{
	  addCompilerMessage( "WordID math UintIMM: unknown operation", 3 );
	}
    }
  else if( isWordID($1.name) && isWordID($4.name) )
    {
      addComment( "WordID math WordID: TOC" );
      if( op == string( "+" ) )
	{
	  addComment( "WordID + WordID --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_ADC + O2 + "+1", sizeOP2B, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordID - WordID --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_SBC + O2 + "+1", sizeOP2B, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  addComment( "WordID * WordID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + O2 + "+1", sizeOP2B, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addComment( "WordID / WordID --> XA" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + O2 + "+1", sizeOP2B, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordID ** WordID --> XA" );
	  addCompilerMessage( "WordID ** WordID cant't have OP2 > 0x000F, the result is > 0xFFFF", 0 );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O1 + "+1", 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else 
	{
	  addCompilerMessage( "WordID math WordID: Unknown Operation", 3 );
	}
    }

  else if( isWordID($1.name) && isWordIMM($4.name) )
    {
      addComment( "WordID math WordIMM: TOC" );
      int addr_op1 = getAddressOf( $1.name );
      string OP1 = getNameOf(addr_op1);
      int OP2 = atoi( stripFirst($4.name).c_str() );

      
      if( op == string("+"))
	{
	  addComment( "(OPTIMIZE)" );
	  addComment( "WordID + WordIMM -> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_L( OP2 )), 2, false );	  
	  addAsm( str_TAY );
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_H( OP2 )), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-"))
	{
	  addComment( "(OPTIMIZE)" );
	  addComment( "WordID - WordIMM -> XA" );
	  addAsm( str_SEC );
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_SBC + "#$" + toHex(get_word_L( OP2 )), 2, false );	  
	  addAsm( str_TAY );
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_SBC + "#$" + toHex(get_word_H( OP2 )), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  // TODO: Add Special Cases like WordID / 0x0002 and 0x0800 etc
	  addComment( "WordID / WordIMM --> XA" );
	  addAsm( str_SEI );
	  int op2 = atoi(stripFirst($4.name).c_str());
	  div16_is_needed = true;
	  addAsm( str_LDA + O1, sizeOP1A, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + O1 + "+1", sizeOP1B, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(op2)), 2, false  );      
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_H(op2)), 2, false  );      
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_CLI );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  int op2 = atoi(stripFirst($4.name).c_str());
	  addComment( "WordID * WordIMM --> XA" );
	  // Special Cases
	  if( op2 == 0 )
	    {
	      addComment( "Special Case: WordID * 0x0000 -> XA" );
	      addAsm( str_LAX + "#$00", 2, false );
	    }
	  else if( op2 == 1 )
	    {
	      addComment( "Special Case: WordID * 0x0001 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1), 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1", 3, false );
	    }
	  else if( op2 == 2 )
	    {
	      // tested for 0 - 254
	      addComment( "Special Case: WordID * $0002 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1), 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1", 3, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL, 1, false );
	      addAsm( str_BCC + "!+", 2, false );
	      addAsm( str_INX, 1, false );
	      addAsm( "!:", 0, true );
	    }
	  else if( op2 == 4 )
	    {
	      addComment( "Special Case: WordID * 0x0004 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1" + commentmarker + "(4)", 3, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
   
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );	      
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 8 )
	    {
	      addComment( "Special Case: WordID * 0x0008 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1" + commentmarker + "(4)", 3, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_LDY + "#$03" + commentmarker + "(2)", 2, false );
	      addAsm( "!:\t" + str_ROL + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	      addAsm( str_DEY + commentmarker + "(2)", 1, false );
	      addAsm( str_BNE + "!-" + commentmarker + "(2)", 2, false );
	    }
	  else if( op2 == 16 )
	    {
	      addComment( "Special Case: WordID * 0x0010 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1" + commentmarker + "(4)", 3, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_LDY + "#$04" + commentmarker + "(2)", 2, false );
	      addAsm( "!:\t" + str_ROL + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TXA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	      addAsm( str_DEY + commentmarker + "(2)", 1, false );
	      addAsm( str_BNE + "!-" + commentmarker + "(2)", 2, false );
	    }
	  else if( op2 == 32 )
	    {
	      addComment( "Special Case: WordID * 0x0020 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1" + commentmarker + "(4)", 3, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$E0" + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$1F" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	    }
	  else if( op2 == 64 )
	    {
	      addComment( "Special Case: WordID * 0x0040 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1" + commentmarker + "(4)", 3, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$C0" + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$3F" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	    }
	  else if( op2 == 128 )
	    {
	      addComment( "Special Case: WordID * 0x0080 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDX + getNameOf(tmp_op1) + " +1" + commentmarker + "(4)", 3, false );
	      addAsm( str_TAY + commentmarker + "(2)", 1, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$80" + commentmarker + "(2)", 2, false );
	      addAsm( str_PHA + commentmarker + "(3)", 1, false );
	      addAsm( str_TYA + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_ROL + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$7F" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_PLA + commentmarker + "(4)", 1, false );
	    }
	  else if( op2 == 256 )
	    {
	      addComment( "Special Case: WordID * 0x0100 -> XA" );
	      addAsm( str_LDX + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 3, false );
	    }
	  else if( op2 == 512 )
	    {
	      addComment( "Special Case: WordID * 0x0200 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 1024 )
	    {
	      addComment( "Special Case: WordID * 0x0400 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 2048 )
	    {
	      addComment( "Special Case: WordID * 0x0800 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 4096 )
	    {
	      addComment( "Special Case: WordID * 0x1000 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 8192 )
	    {
	      addComment( "Special Case: WordID * 0x2000 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 16384 )
	    {
	      addComment( "Special Case: WordID * 0x4000 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_ASL + commentmarker + "(2)", 1, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else if( op2 == 32768 )
	    {
	      addComment( "Special Case: WordID * 0x8000 -> XA" );
	      addAsm( str_LDA + getNameOf(tmp_op1) + commentmarker + "(4)", 3, false );
	      addAsm( str_CLC + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_ROR + commentmarker + "(2)", 1, false );
	      addAsm( str_AND + "#$80" + commentmarker + "(2)", 2, false );
	      addAsm( str_TAX + commentmarker + "(2)", 1, false );
	      addAsm( str_LDA + "#$00" + commentmarker + "(2)", 1, false );
	    }
	  else
	    {
	      mul16_is_needed = true;
	      addComment( "WordID * WordIMM --> XA" );
	      addAsm( str_LDA + "#$" + toHex(get_word_L(op2)), 2, false  );      
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_LDA + "#$" + toHex(get_word_H(op2)), 2, false  );      
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      addAsm( str_LDA + O1, sizeOP1A, false  );
	      addAsm( str_STA + "_MUL16_FC", 3, false);
	      addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  int op2 = atoi(stripFirst($4.name).c_str());
	  addComment( "WordID ** WordIMM --> XA" );
	  addCompilerMessage( "WordID ** WordIMM: exponent restricted to low byte and < 0x0F", 1 );
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(op2)), 2, false  );      
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordID math WordIMM: Unknown Operation", 3);
	}
    }
  else if( isWordID($1.name) && isXA($4.name) )
    {
      addComment( "WordID math XA: TOC" );
      if( op == string("+") )
	{
	  addComment( "WordID + XA --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O1, sizeOP1A, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "WordID - XA --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_STX + "!++", 3, false );
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true ); // A
	  addAsm( str_TAY );
	  
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  addComment( "WordID * XA --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addComment( "WordID / XA --> XA" );
	  int tmp_op1 = getAddressOf( $1.name );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + O1, sizeOP1A, false  );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + O1 + " +1", sizeOP1B, false  );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordID ** XA --> XA" );

	  addCompilerMessage( "WordID ** XA: exponent restricted to low-byte and < 0x0F", 1 );

	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_TAX, 1, false );
	  addAsm( str_LDA + O1, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O1 + "+1", 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordID math XA: Unknown Operation", 3 );
	}
    }
  else if( isWordIMM($1.name) && isA($4.name) )
    {
      addComment( "WordIMM math A: TOC" );
      
      int OP1 = atoi( stripFirst($1.name).c_str() );
      int OP1H = get_word_H( OP1 );
      int OP1L = get_word_L( OP1 );
      if( op == string("+") )
	{
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addAsm( str_STA + "!+" + commentmarker + "Save A a little further ahead", 3, false );	  
	  addAsm( str_SEC );
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00" + commentmarker + "Low", 1, true );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false);
	  addAsm( str_TYA, 1, false );
	  
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("*") )	
	{
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_TAY, 1, false );	  
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math A: unknown operation", 3 );
	}
    }
  else if(isWordIMM($1.name) && isFAC($4.name) )
    {
      addComment( "WordIMM math FAC: TOC" );

      string OP1h = toHex(get_word_H(atoi(stripFirst($1.name).c_str())));
      string OP1l = toHex(get_word_L(atoi(stripFirst($1.name).c_str())));

      if( op == string( "+" ) )
	{
	  addComment( "WordIMM + FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_LDY + "#$" + OP1l, 2, false );
	  addAsm( str_LDA + "#$" + OP1h, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fAddT();
	  strcpy($$.name, "_FAC" );
	}	  
      else if( op == string( "-" ) )
	{
	  addComment( "WordIMM - FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM0", 3, false );
	  addAsm( str_LDY + "#$" + OP1l, 2, false );
	  addAsm( str_LDA + "#$" + OP1h, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM1", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM0 -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fSubT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "*" ) )
	{
	  addComment( "WordIMM * FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
	  addAsm( str_LDY + "#$" + OP1l, 2, false );
	  addAsm( str_LDA + "#$" + OP1h, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fMultT();
	  strcpy($$.name, "_FAC" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "WordIMM / FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM0", 3, false );
	  addAsm( str_LDY + "#$" + OP1l, 2, false );
	  addAsm( str_LDA + "#$" + OP1h, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM1", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM0 -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fDivT();
	  strcpy($$.name, "_FAC" );

	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordIMM ** FAC --> FAC" );
	  float_swap_space_is_needed = true;
	  addAsm( str_LDX + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM0", 3, false );
	  
	  addAsm( str_LDY + "#$" + OP1l, 2, false );
	  addAsm( str_LDA + "#$" + OP1h, 2, false );
	  addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
	  addAsm( str_LDX + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM1", 3, false );
	  addAsm( str_LDA + "#<!fp0+", 2, false );
	  addAsm( str_LDY + "#>!fp0+", 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM0 -> FAC", 3, false );
	  addAsm( str_LDA + "#<!fp1+", 2, false );
	  addAsm( str_LDY + "#>!fp1+", 2, false );
	  addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
	  fPwrT();

	  strcpy($$.name, "_FAC" );

	}
      else
	{
	  addCompilerMessage( "WordIMM math FAC: Unknown Operation", 3 );
	}
    }
  else if( isWordIMM($1.name) && isFloatID($4.name) )
    {
      addComment( "WordIMM math FloatID: TOC" );
      string OP1h = toHex(get_word_H(atoi(stripFirst($1.name).c_str())));
      string OP1l = toHex(get_word_L(atoi(stripFirst($1.name).c_str())));

      addAsm( str_LDY + "#$" + OP1l, 2, false );
      addAsm( str_LDA + "#$" + OP1h, 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      pushFAC();
      addAsm( str_LDA + "#<" + O2, 3, false );
      addAsm( str_LDY + "#>" + O2, 3, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      popARG();
      
      if( op == string( "+" ) )
	{	  
	  addComment( "WordIMM + FloatID --> FAC" );
	  fAddT();
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordIMM - FloatID --> FAC" );
	  fSubT();
	}
      else if( op == string( "*" ) )
	{
	  addComment( "WordIMM * FloatID --> FAC" );
	  fMultT();
	}
      else if( op == string( "/" ) )
	{
	  addComment( "WordIMM / FloatID --> FAC" );
	  fDivT();
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordIMM ** FloatID --> FAC" );
	  fPwrT();
	}
      else
	{
	  addCompilerMessage( "WordIMM math FloatID: Unknown Operation", 3 );
	}
      strcpy($$.name, "_FAC" );
    }
  else if( isWordIMM($1.name) && isFloatIMM($4.name) )
    {
      addComment( "WordIMM math FloatIMM: TOC (compile-time operation)" );
      float tmp_int1 = atof( stripFirst($1.name).c_str() );
      float tmp_int2 = atof( stripFirst($4.name).c_str() );
      float tmp_int3;
      if( op == "+" )
	{
	  addComment( "WordIMM + FloatIMM --> XA" );
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( get_word_L(tmp_int3) == get_word_H(tmp_int3) )
	    {
	      addAsm( str_LAX + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	    }
	  else
	    {
	      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	      addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  addComment( "WordIMM - FloatIMM --> XA" );
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( get_word_L(tmp_int3) == get_word_H(tmp_int3) )
	    {
	      addAsm( str_LAX + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	    }
	  else
	    {
	      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	      addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  addComment( "WordIMM * FloatIMM --> XA" );
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( get_word_L(tmp_int3) == get_word_H(tmp_int3) )
	    {
	      addAsm( str_LAX + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	    }
	  else
	    {
	      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	      addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  addComment( "WordIMM / FloatIMM --> XA" );
	  tmp_int3 = tmp_int1 /tmp_int2;
	  if( get_word_L(tmp_int3) == get_word_H(tmp_int3) )
	    {
	      addAsm( str_LAX + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	    }
	  else
	    {
	      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	      addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  addComment( "WordIMM ** FloatIMM --> XA" );
	  if( tmp_int2 >= 2 )
	    {
	      addCompilerMessage( "value too large for type", 3 );
	    }
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( get_word_L(tmp_int3) == get_word_H(tmp_int3) )
	    {
	      addAsm( str_LAX + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	    }
	  else
	    {
	      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	      addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	    }
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math FloatIMM: unknown operation", 3 );
	}
    }
  else if( isWordIMM($1.name) && isIntID($4.name) )
    {
      addComment( "WordIMM math IntID: TOC" );
      int tmp_int = atoi(stripFirst($1.name).c_str());
      if( op == string( "+" ) )
	{
	  addAsm( str_CLC, 1, false );
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_ADC + "#$" + toHex(get_word_L(tmp_int)), 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_H(tmp_int)), 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{	  
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:\t" + str_STX + "!+", 0, true );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int)), 2, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int)), 2, false );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_BYTE + "$E9", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "*" ) )
	{
	  addComment( "WordIMM * IntID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int)), 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEX, 1, false );	  
	  addAsm( "!:\t" + str_STX + "_MUL16_FC", 3, true);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "WordIMM / IntID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int)), 2, false );
  	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
  	  addAsm( str_LDA + "_DIV16_FB", 3, false);
	  addAsm( str_LDX + "_DIV16_FC", 3, false);
	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );

	  strcpy( $$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordIMM ** IntID --> XA" );
	  pow16_is_needed = true;
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_LDY + getNameOf(getAddressOf($4.name)), 3, false );
	  addAsm( str_BMI + "!+", 2, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int)), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_int)), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy( $$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math IntID: Unknown Operation", 3 );
	}
    }  
  else if( isWordIMM($1.name) && isIntIMM($4.name) )
    {
      addComment( "WordIMM math IntIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math IntIMM: unknown operation", 3 );      
	}
    }
  else if( isWordIMM($1.name) && isUintID($4.name) )
    {
      addComment( "WordIMM math UintID: TOC" );
      int tmp_int = atoi(stripFirst($1.name).c_str());
      int tmp_int_H = get_word_H(tmp_int);
      int tmp_int_L = get_word_L(tmp_int);
      
      if( op == string( "+" ) )
	{	  
	  addComment( "WordIMM + UintID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_BCC + "!+", 2, false );
	  addAsm( str_INX, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordIMM - UintID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_BCS+ "!+", 2, false );
	  addAsm( str_DEX, 1, false );
	  addAsm( "!:", 0, true );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "*" ) )
	{
	  // TODO: Add Special cases here...
	  // if WordIMM == 0, 1, 2, 4, 8, 16, 32, 64...
	  mul16_is_needed = true;
	  addComment( "WordIMM * UintID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "WordIMM / UintID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_LDX + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "WordIMM ** UintID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addCompilerMessage( "WordIMM ** UintID: exponent restricted to < 0x0F", 1 );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math UintID: Unknown Operation", 3 );
	}
    }
  else if( isWordIMM($1.name) && isUintIMM($4.name) )
    {
      addComment( "WordIMM math UintIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 /tmp_int2;
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  addAsm( str_LDA + "#$" + toHex ( get_word_L(tmp_int3)  ), 2, false );
	  addAsm( str_LDX + "#$" + toHex ( get_word_H(tmp_int3)  ), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math UintIMM: unknown operation", 3 );
	}
    }
  else if( isWordIMM($1.name) && isWordID($4.name) )
    {
      addComment( "WordIMM math WordID: TOC" );
      int tmp_int = atoi(stripFirst($1.name).c_str());
      int tmp_int_H = get_word_H(tmp_int);
      int tmp_int_L = get_word_L(tmp_int);
      if( op == string( "+" ) )
	{	  
	  addComment( "WordIMM + WordID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_ADC + getNameOf(getAddressOf($4.name)) + " +1", 3, false);
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordIMM - WordID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_SBC + getNameOf(getAddressOf($4.name)) + " +1", 3, false);
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "*" ) )
	{
	  // TODO: Add Special cases here...
	  // if WordIMM == 0, 1, 2, 4, 8, 16, 32, 64...
	  mul16_is_needed = true;
	  addComment( "WordIMM * WordID --> XA" );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_LDX + getNameOf(getAddressOf($4.name)) + " +1", 3, false);
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R +1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "WordIMM / WordID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_LDX + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_LDX + getNameOf(getAddressOf($4.name)) + " +1", 3, false);
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "WordIMM ** WordID: exponent restricted to low-byte and < 0x0F", 1 );
	  addComment( "WordIMM ** WordID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_LDA + "#$" + toHex(tmp_int_L), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_int_H), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + getNameOf(getAddressOf($4.name)), 3, false);
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math WordID: Unknown Operation", 3 );
	}
    }
  else if(isWordIMM($1.name) && isWordIMM($4.name) )
    {
      addComment( "WordIMM math WordIMM: TOC (compile-time operation)" );      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+" )
	{
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int3)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int3)), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "-" )
	{
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int3)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int3)), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int3)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int3)), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "/" )
	{
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int3)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int3)), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == "**" )
	{
	  tmp_int3 = pow(tmp_int1,tmp_int2);
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 =(abs(tmp_int3) ^ 65535) + 1;
	    }	  
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_int3)), 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int3)), 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math WordIMM: unknown operation", 3 );      
	}
    }
  else if( isWordIMM($1.name) && isXA($4.name) )
    {
      addComment( "WordIMM math XA: TOC" );
      
      int OP1 = atoi( stripFirst($1.name).c_str() );
      int OP1H = get_word_H( OP1 );
      int OP1L = get_word_L( OP1 );
      if( op == string("+") )
	{
	  addComment( "WordIMM + XA --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "WordIMM + XA --> XA" );
	  addAsm( str_STA + "!+" + commentmarker + "Save XA a little further ahead", 3, false );
	  addAsm( str_STX + "!++", 3, false );

	  addAsm( str_SEC );
	  
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00" + commentmarker + "Low", 1, true );
	  addAsm( str_TAY, 1, false );


	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00" + commentmarker + "High", 1, true );
	  addAsm( str_TAX, 1, false);
	  addAsm( str_TYA, 1, false );
	  
	  strcpy( $$.name, "_XA" );
	}
      else if( op == string("*") )	
	{
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "WordIMM ** XA uses only Low-byte of exponent", 1 );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_TAY, 1, false );	  
	  addAsm( str_LDA + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "WordIMM math XA: unknown operation", 3 );
	}
    }
  else if( isXA($1.name) && isA($4.name) )
    {
      addComment( "XA math A: TOC" );
      // XA is on stack
      // A is in A
      if( op == string( "+" ) )
	{
	  addComment( "This uses self-modifying code" );
	  addComment( "XA + A --> XA" );

	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_PLA );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_BYTE + "$69" + commentmarker + "ADC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "This uses self-modifying code" );
	  addComment( "XA - A --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_STA + "!+", 3, false );
	  addAsm( str_PLA );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	  addAsm( str_BYTE + "$E9" + commentmarker + "SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * A --> XA" );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / A --> XA" );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "XA ** A --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_PHA, 1, false );

	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "XA math A: Unknown Operation", 3 ); 
	}
    }
  else if( isXA($1.name) && isFAC($4.name) )
    {      
      addComment( "XA math FAC: TOC" );
      addAsm( str_PHA, 1, false ); // A
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false ); // X
      addComment( "^^-- OPTIMIZE --^^" );
      float_swap_space_is_needed = true;
      addAsm( str_LDX + "#<!fp0+", 2, false );
      addAsm( str_LDY + "#>!fp0+", 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
      
      
      addAsm( str_PLA, 1, false ); // X
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false ); // A
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );  
      addAsm( str_JSR + "$B391" + commentmarker + "WORD16 -> FAC", 3, false );      
      addAsm( str_LDX + "#<!fp1+", 2, false );
      addAsm( str_LDY + "#>!fp1+", 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

      addAsm( str_LDA + "#<!fp0+", 2, false );
      addAsm( str_LDY + "#>!fp0+", 2, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );

      
      addAsm( str_LDA + "#<!fp1+", 2, false );
      addAsm( str_LDY + "#>!fp1+", 2, false );
      addAsm( str_JSR + "$BA8C" + commentmarker + "MEM -> ARG (+)", 3, false );
      if( op == string( "+" ))
	{
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  fPwrT();
	}      
      else
	{
	  addCompilerMessage( "XA math FAC: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isXA($1.name) && isFloatID($4.name) )
    {
      addComment( "XA math FloatID: TOC" );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      pushFAC();	  
      addAsm( str_LDA + "#<" + O2, 3, false );
      addAsm( str_LDY + "#>" + O2, 3, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      popARG();
      if( op == string( "+" ))
	{
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  fPwrT();
	}      
      else
	{
	  addCompilerMessage( "XA math FloatID: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isXA($1.name) && isFloatIMM($4.name) )
    {
      addComment( "XA math FloatIMM: TOC" );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      pushFAC();
      inlineFloat( $4.name );
      popARG();
      if( op == string( "+" ))
	{
	  fAddT();
	}
      else if( op == string( "-" ))
	{
	  fSubT();
	}
      else if( op == string( "*" ))
	{
	  fMultT();
	}
      else if( op == string( "/" ))
	{
	  fDivT();
	}
      else if( op == string( "**" ))
	{
	  fPwrT();
	}      
      else
	{
	  addCompilerMessage( "XA math FloatIMM: unknown operation", 3);
	}
      strcpy( $$.name, "_FAC" );
    }
  else if( isXA($1.name) && isIntID($4.name) )
    {
      addComment( "XA math IntID: TOC" );
      if( op == string( "+" ) )
	{	  
	  addComment( "XA + IntID --> XA" );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "!++", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "!++", 3, false );
	  addAsm( "!:\t" + str_CLC );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_BYTE + "$69" + commentmarker + "<-- ADC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true ); // A
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "-" ) )
	{
	  addComment( "XA - IntID --> XA" );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "!++", 3, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "!++", 3, false );
	  addAsm( "!:\t" + str_SEC );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );	  
	  addAsm( str_BYTE + "$E9" + commentmarker + "<-- SBC Immediate", 1, false );
	  addAsm( "!:\t" + str_BYTE + "$00", 1, true ); // A
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "*" ) )
	{
	  addComment( "XA * IntID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_BPL + "!+", 2, false );
	  addAsm( str_DEC + "_MUL16_FE", 3, false);
	  addAsm( "!:\t" + str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "XA / IntID --> XA" );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);

	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);


	  // the sign of A here is the sign of quotient
	  addAsm( str_LDA + O2, sizeOP2A, false);
	  addAsm( str_PHP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );	  
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( "!:\t" + str_STA + "_DIV16_FD", 3, true );
	  
	  addAsm( str_JSR + "DIV16", 3, false );
  	  addAsm( str_LDA + "_DIV16_FB", 3, false);
	  addAsm( str_LDX + "_DIV16_FC", 3, false);

	  addAsm( str_PLP, 1, false );
	  addAsm( str_BPL + "!+", 2, false );
	  
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  addAsm( "!:", 0, true );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "XA ** IntID --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, sizeOP2A, false);
	  addAsm( str_BPL + "!+", 2, false );
	  
	  addAsm( str_PLA, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_LAX + "#$00", 2, false );
	  addAsm( str_JMP + "!++", 3, false );

	  addAsm( "!:\t" + str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( "!:", 0, true );
	}
      else
	{
	  addCompilerMessage( "XA math IntID: Unknown Operation", 3 );
	}
    }
  else if( isXA($1.name) && isIntIMM($4.name) )
    {
      addComment( "XA math IntIMM: TOC" );
      if( op == string( "+" ) )
	{	  
	  addComment( "XA + IntIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(twos_complement(tmp_v)), 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_ADC + "#$FF", 2, false );	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "-" ) )
	{
	  addComment( "XA - IntIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SEC, 1, false );
	  addAsm( str_SBC + "#$" + toHex(twos_complement(tmp_v)), 2, false );
	  addAsm( str_TAY, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_SBC + "#$FF", 2, false );	  
	  addAsm( str_TAX, 1, false );
	  addAsm( str_TYA, 1, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "*" ) )
	{
	  addComment( "XA * IntIMM --> XA" );
	  mul16_is_needed = true;
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(twos_complement(tmp_v)), 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$FF", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "/" ) )
	{
	  addComment( "XA / IntIMM --> XA" );
	  div16_is_needed = true;
	  int tmp_v = atoi(stripFirst(stripFirst($4.name).c_str()).c_str());
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  
	  addAsm( str_JSR + "DIV16", 3, false );

	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$01", 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "_DIV16_FC", 3, false );
	  addAsm( str_EOR + "#$FF", 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addComment( "XA / IntIMM --> XA (always will be zero)" );
	  addAsm( str_LAX + "#$00", 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "XA math IntIMM: Unknown Operation", 3 );
	}
    }
  else if( isXA($1.name) && isUintID($4.name) )
    {
      addComment( "XA math UintID: TOC" );
      if( op == string("+") )
	{
	  // 2024 05 19 - mkpellegrino
	  addComment( "XA + UintID --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("-") )
	{
	  addComment( "XA - UintID --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * UintID --> XA" );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );	  
	  strcpy($$.name, "_XA");
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / UintID --> XA" );
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC" + commentmarker + "OPTIMIZE", 3, false );
	  strcpy($$.name, "_XA");
	}
      else if( op == string( "**" ) )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;

	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, 3, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "XA math UintID: Unknown Operation", 3 );
	}
    }
  else if( isXA($1.name) && isUintIMM($4.name) )
    {
      addComment( "XA math UintIMM: TOC" );
      if( op == string("-") )
	{
	  addComment( "XA - UintIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_v), 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("+") )
	{
	  addComment( "XA + UintIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(tmp_v), 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*" ) )
	{
	  addComment( "XA * UintIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  switch(tmp_v)
	    {
	    case 0:
	      addComment( "XA * 0 --> XA" );
	      addAsm( str_LAX + "#$00", 2, false );
	      strcpy($$.name, "_XA");
	      break;
	    case 1:
	      addComment( "XA * 1 --> XA" );
	      strcpy($$.name, "_XA");
	      break;
	    case 128:
	      addComment( "XA * 128 --> XA" );

	    case 64:
	      addComment( "XA * 64 --> XA" );
	      // TODO: Check for unsafe math (arg_unsafe_math==true)
	      if( !arg_unsafe_math )
		{
		  addAsm( str_TAY );
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_STY + "$02", 2, false );
		}
	      else
		{
		  addAsm( str_STA + "$02", 2, false );                 // 3 cyc
		}
	      addAsm( str_STX + "$03", 2, false );                     // 3 cyc
	      addAsm( str_LDX + "#$" + toHex(log2(tmp_v)), 2, false ); // 2 cyc
	      addAsm( "!:\t" + str_ASL + "$02", 2, true );                // 2 cyc
	      addAsm( str_ROL + "$03", 2, false );                        // 2
	      addAsm( str_DEX );                                          // 2
	      addAsm( str_BNE + "!-", 2, false );	                  // 2
	      addAsm( str_LDY + "$02", 2, false );                     // 3
	      addAsm( str_LDX + "$03", 2, false );                     // 3
	      if( !arg_unsafe_math )
		{
		  addAsm( str_PLA );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA );
		  addAsm( str_STA + "$02", 2, false );
		}
	      addAsm( str_TYA );
	      break;
	    case 32:
	      addComment( "XA * 2 --> XA (12 cyc)" );
	      addAsm( str_ASL ); // 2
	      addAsm( str_TAY ); // 2
	      addAsm( str_TXA ); // 2
	      addAsm( str_ROL ); // 2
	      addAsm( str_TAX ); // 2
	      addAsm( str_TYA ); // 2
	    case 16:
	      addComment( "XA * 2 --> XA (12 cyc)" );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 8:
	      addComment( "XA * 2 --> XA (12 cyc)" );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 4:
	      addComment( "XA * 2 --> XA (12 cyc)" );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 2:
	      addComment( "XA * 2 --> XA (12 cyc)" );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    case 5:
	      addComment( "XA * 5 --> XA" );
	      // TODO: Check for unsafe math (arg_unsafe_math==true)
	      if( !arg_unsafe_math )
		{
		  addAsm( str_TAY );
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_STY + "$02", 2, false );
		  addAsm( str_TYA );
		}
	      else
		{
		  addAsm( str_STA + "$02", 2, false );                 // 3 cyc
		}
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_CLC );
	      addAsm( str_ADC + "$02", 2, false );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ADC + "$03", 2, false );
	      addAsm( str_TAX );
	      if( !arg_unsafe_math )
		{
		  addAsm( str_PLA );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA );
		  addAsm( str_STA + "$02", 2, false );
		}
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;

	    case 3:
	      // TODO: check for unsafe math
	      addComment( "XA * 3 --> XA" );
	      if( !arg_unsafe_math )
		{
		  addAsm( str_TAY );
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_STY + "$02", 2, false );
		  addAsm( str_TYA );
		}
	      else
		{
		  addAsm( str_STA + "$02", 2, false );
		}
	      addAsm( str_STX + "$03", 2, false );
	      //addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_CLC );
	      addAsm( str_ADC + "$02", 2, false );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ADC + "$03", 2, false );
	      addAsm( str_TAX );

	      if( !arg_unsafe_math )
		{
		  addAsm( str_PLA );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA );
		  addAsm( str_STA + "$02", 2, false );
		}
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    case 10:
	      addComment( "XA * 10 --> XA" );
	      if( !arg_unsafe_math )
		{
		  addAsm( str_TAY );
		  addAsm( str_LDA + "$02", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_LDA + "$03", 2, false );
		  addAsm( str_PHA );
		  addAsm( str_STY + "$02", 2, false );
		  addAsm( str_TYA );
		}
	      else
		{
		  addAsm( str_STA + "$02", 2, false );
		}
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_CLC );
	      addAsm( str_ADC + "$02", 2, false );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ADC + "$03", 2, false );
	      addAsm( str_TAX );
	      if( !arg_unsafe_math )
		{
		  addAsm( str_PLA );
		  addAsm( str_STA + "$03", 2, false );
		  addAsm( str_PLA );
		  addAsm( str_STA + "$02", 2, false );
		}
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    default:
	      mul16_is_needed = true;
	      addComment( "XA * UintIMM --> XA" );
	      addAsm( str_STX + "_MUL16_FC", 3, false);
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	      strcpy($$.name, "_XA" );
	    }		
	}
      else if( op == string("/" ) )
	{
	  // TODO: Add more special cases
	  addComment( "XA / UintIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  switch(tmp_v)
	    {
	    case 0:
	      addCompilerMessage( "Division by Zero is forbidden!", 3 );
	      break;
	    case 1:
	      strcpy($$.name, "_XA" );
	      break;
	    case 2:
	      addComment( "XA / 2 --> XA" );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_TXA, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_TYA, 1, false );
	      addAsm( str_ROR, 1, false );
	      strcpy($$.name, "_XA" );
	      break;
	    case 4:
	      addComment( "XA / 4 --> XA" );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_TXA, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_TYA, 1, false );
	      addAsm( str_ROR, 1, false );
	      addAsm( str_TAY, 1, false );
	      addAsm( str_TXA, 1, false );
	      addAsm( str_LSR, 1, false );
	      addAsm( str_TAX, 1, false );
	      addAsm( str_TYA, 1, false );
	      addAsm( str_ROR, 1, false );
	      strcpy($$.name, "_XA" );
	      break;

	      
	    default:
	      div16_is_needed = true;
	      addComment( "XA / UintIMM --> XA" );
	      addAsm( str_STA + "_DIV16_FB", 3, false);
	      addAsm( str_STX + "_DIV16_FC", 3, false);
	      addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false );
	      addAsm( str_STA + "_DIV16_FD", 3, false);
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_STA + "_DIV16_FE", 3, false);
	      addAsm( str_JSR + "DIV16", 3, false );
	      addAsm( str_LDA + "_DIV16_FB", 3, false );
	      addAsm( str_LDX + "_DIV16_FC", 3, false );

	      strcpy($$.name, "_XA" );
	      break;
	    }
	}
      else if( op == string( "**" ) )
	{
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addComment( "XA ** UintIMM --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(tmp_v), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );	  
	}
      else
	{
	  addCompilerMessage( "XA math UintIMM: Unknown Operation", 3 );
	}
    }
  else if( isXA($1.name) && isWordID($4.name) )
    {
      addComment( "XA math WordID: TOC" );
      if( op == string("+") )
	{
	  addComment( "XA + WordID --> XA" );
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + O2, sizeOP2A, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + O2 + " +1", sizeOP2B, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "XA - WordID --> XA" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + O2, sizeOP2A, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + O2 + " +1", sizeOP2B, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * WordID --> XA" );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_LDA + O2 + " +1", sizeOP2B, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / WordID --> XA" );
	  addAsm( str_TAY );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_STA + "$FD", 2, false);
	  addAsm( str_LDA + O2 + " +1", sizeOP2B, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_TYA );
	  addAsm( str_STX + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addCompilerMessage( "XA ** WordID: exponent restricted to Low Byte", 1 );
	  addComment( "XA ** WordID --> XA" );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + O2, sizeOP2A, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "XA math WordID: Unknown Operation", 3 );
	}
    }
  else if( isXA($1.name) && isWordIMM($4.name) )
    {
      addComment( "XA math WordIMM: TOC" );
      if( op == string("+") )
	{
	  addComment( "XA + WordIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_L(tmp_v)), 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$" + toHex(get_word_H(tmp_v)), 2, false  );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("-") )
	{
	  addComment( "XA - WordIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(get_word_L(tmp_v)), 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "#$" + toHex(get_word_H(tmp_v)), 2, false  );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*") )
	{
	  addComment( "XA * WordIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  switch(tmp_v)
	    {
	    case 0:
	      addComment( "XA * WordIMM --> XA (0)" );

	      illegal_operations_are_needed = true;
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_TAX );
	    case 1:
	      strcpy($$.name, "_XA");
	      break;
	    case 32768:
	      addComment( "XA * WordIMM (32768) --> XA" );

	      // saves 2 bytes
	      addAsm( str_CLC );                 // 2 cycles
	      addAsm( str_ROR );                 // 2 cycles
	      addAsm( str_LDA + "#$00", 2, false );  // 2 cycles
	      addAsm( str_ROR );                 // 2 cycles
	      addAsm( str_TAX );                 // 2 cycles
	      addAsm( str_LDA + "#$00", 2, false );  // 2 cycles
	      strcpy($$.name, "_XA");
	      break;
	    case 16384:
	      addComment( "XA * WordIMM --> XA (16384)" );
	      addAsm( str_ASL );                 // 2 cycles
	    case 8192:
	      addAsm( str_ASL );                 // 2 cycles
	    case 4096:
	      addAsm( str_ASL );                 // 2 cycles
	    case 2048:
	      addAsm( str_ASL );                 // 2 cycles
	    case 1024:
	      addAsm( str_ASL );                 // 2 cycles
	    case 512:
	      addAsm( str_ASL );                 // 2 cycles
	    case 256:
	      addAsm( str_TAX );                 // 2 cycles
	      addAsm( str_LDA + "#$00", 2, false );  // 2 cycles
	      strcpy($$.name, "_XA");
	      addCompilerMessage( "Multiplying a Word by # >= 256... Losing some fidelity (and you may be eaten by a grue).", 0 );
	      break;
	    case 128:
	      addComment( "XA * WordIMM (128) --> XA" );
	    case 64:
	      // TODO: Add Unsafe Math Flag here
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_LDX + "#$" + toHex(log2(tmp_v)), 2, false );
	      addAsm( "!:\t" + str_ASL + "$02", 2, true );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_DEX );
	      addAsm( str_BNE + "!-", 2, false );
	      addAsm( str_LDY + "$02", 2, false );
	      addAsm( str_LDX + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    case 32:
	      addComment( "XA * WordIMM (32) --> XA" );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 16:
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 8:
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 4:
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	    case 2:
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    case 5:
	      // TODO: Add unsafe math flag here
	      addComment( "XA * WordIMM (5) --> XA" );
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_CLC );
	      addAsm( str_ADC + "$02", 2, false );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ADC + "$03", 2, false );
	      addAsm( str_TAX );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    case 3:
	      // TODO: Add unsafe math flag here
	      addComment( "XA * WordIMM (3) --> XA" );
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_CLC );
	      addAsm( str_ADC + "$02", 2, false );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ADC + "$03", 2, false );
	      addAsm( str_TAX );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    case 10:
	      // TODO: Add unsafe math flag here
	      addComment( "XA * WordIMM (10) --> XA" );
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      addAsm( str_CLC );
	      addAsm( str_ADC + "$02", 2, false );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ADC + "$03", 2, false );
	      addAsm( str_TAX );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA );
	      addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      addAsm( str_TYA );
	      strcpy($$.name, "_XA");
	      break;
	    default:
	      mul16_is_needed = true;
	      addComment( "XA * WordIMM --> XA (?)" );
	      addAsm( str_STX + "_MUL16_FC", 3, false);
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_v)), 2, false );
	      addAsm( str_STA + "_MUL16_FD", 3, false);
	      addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_v)), 2, false );
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	      strcpy($$.name, "_XA" );
	    }		
	}
      else if( op == string( "/" ) )
	{
	  addComment( "XA / WordIMM --> XA" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  int tmp_v_L = get_word_L( tmp_v );
	  int tmp_v_H = get_word_H( tmp_v );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FB", 3, false);
	  addAsm( str_STX + "_DIV16_FC", 3, false);
	  addAsm( str_LDA + "#$" + toHex(tmp_v_L), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_LDA + "#$" + toHex(tmp_v_H), 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "XA ** WordIMM: exponent restricted to Low Byte", 1 );	  
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  if( tmp_v > 15 )
	    {
	      addCompilerMessage( "Exponent overflow: Your power is too great young Jedi", 3 );
	    }
	  addComment( "XA ** WordIMM --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_TXA, 1, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_v)), 2, false );
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );	  
	}
      else
	{
	  addCompilerMessage( "XA math WordIMM: Unknown Operation", 3 );
	}
    }
  else if( isXA($1.name) && isXA($4.name) )
    {
      addComment( "XA math XA: TOC" );
      if( op == string("+") )
	{
	  addComment( "XA + XA --> XA" );
	  addAsm( str_STA + "$FB", 2, false ); // the A in 
	  addAsm( str_STX + "$FC", 2, false );
	  addAsm( str_PLA ); // the X in XA
	  addAsm( str_TAX );
	  addAsm( str_PLA ); // the A in XA
	  addAsm( str_CLC, 1, false );
	  addAsm( str_ADC + "$FB", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "$FC", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "XA - XA --> XA" );
	  addAsm( str_STA + "$FB", 2, false ); // the A in 
	  addAsm( str_STX + "$FC", 2, false );
	  addAsm( str_PLA ); // the X in XA
	  addAsm( str_TAX );
	  addAsm( str_PLA ); // the A in XA
	  addAsm( str_SEC );
	  addAsm( str_SBC + "$FB", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "$FC", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * XA --> XA" );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / XA --> XA" );
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string( "**" ) )
	{
	  addCompilerMessage( "XA ** XA: exponent restricted to Low Byte", 1 );
	  addComment( "XA ** XA --> XA" );
	  mul16_is_needed = true;
	  pow16_is_needed = true;
	  addAsm( str_PHA, 1, false );
	  addAsm( str_JSR + "pow16", 3, false );
	  addAsm( str_PLA, 1, false );
	  addAsm( str_TAX, 1, false );
	  addAsm( str_PLA, 1, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage("XA math XA: Unknown Operation", 3);
	}
    }
  else
    {
      addCompilerMessage( O1 + op + O2, 0 );
      addCompilerMessage( "Unknown Types (for the indicated operation)", 3 );
    }
  //if( FAC == 1 )
  //  {
  //    strcpy($$.name, "_FAC" );
  //  }
  // END OF MATH
};
| tNULL
{
  strcpy( $$.name, "NULL" );
};
| tPOP '(' ')'
{
  // merely for testing out the software stack
  stack_is_needed = true;
  addAsm( str_JSR + "POP", 3, false );
  strcpy( $$.name, "_A" );
};
| tSPRPTR '(' expression ')'
{
  addComment( "sprptr(exp)" );
  scrmem_is_needed=true;
  bnkmem_is_needed=true;
  stack_is_needed=true;
  
  // save $02 and $03 on stack (not processor stack)
  addAsm( str_LDA + "$02", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$03", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );

  // offset from bank start
  addAsm( str_LDA + "#$F7", 2, false );
  addAsm( str_STA + "$02", 2, false );
  addAsm( str_LDA + "#$03", 2, false );
  addAsm( str_LDA + "$03", 2, false );
  
  
  // sprite pointer = bank_mem + screen_mem + 0x03F7 + sprite_number
  // $02/$03 already hold 0xF7 and 0x03 respecfully
  if( isUintIMM( $3.name ) || isIntIMM( $3.name ))
    {
      int sprite_number = atoi(stripFirst($3.name).c_str());
      addAsm( str_CLC );
      addAsm( str_LDA + "#$" + toHex( sprite_number ), 2, false );
      addAsm( str_ADC + "$02", 2, false );
      addAsm( str_STA + "$02", 2, false );
      
      addAsm( str_JSR + "SCRMEM", 3, false );
      addAsm( str_PLA );
      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );

      addAsm( str_JSR + "BNKMEM", 3, false );
      addAsm( str_PLA );
      addAsm( str_ADC + "$03", 2, false );
      
      addAsm( str_PHA );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );

      
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
    }
  else if( isUintID( $3.name ) || isIntID( $3.name ))
    {
      addCompilerMessage( "nyi", 3 );

    }
  else if( isWordID( $3.name ) )
    {
      string msg = string( "Only using the Low byte of Word: ") + $3.name + " to get sprite pointer.";
      addCompilerMessage( msg, 0);
    }
  else if( isA( $3.name ) )
    {
      addCompilerMessage( "nyi", 3 );

    }
  else if( isXA( $3.name ))
    {
      string msg = string( "Only using the A register (not the X): ") + $3.name + " to get sprite pointer.";
      addCompilerMessage( msg, 0);
    }

  strcpy( $$.name, "_XA" );
};
| tASL '(' expression ')'
{
  addComment( "asl expression" );
  if( isA( $3.name ) )
    {
      addComment( "asl( A ) -> A" );
      addAsm( str_ASL, 1, false );
      strcpy( $$.name, "_A" );
    }
  else if( isXA( $3.name ) )
    {
      addComment( "asl( XA ) -> XA" );
      addAsm( str_ASL, 1, false );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_ROL, 1, false );
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($3.name))
    {
      addComment( "asl( WordID ) -> XA" );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_TAY, 1, false );
      if( a+1 < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a) + "+1", size_of_instruction, false );
      addAsm( str_ROL );
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID($3.name ))
    {
      addComment( "asl( UintID ) -> A" );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
      addAsm( str_ASL, 1, false );
      strcpy( $$.name, "_A" );
    }
  else if( isWordIMM($3.name))
    {
      addComment( "asl( WordIMM ) -> A" );
      addAsm( str_LDA + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_ASL, 1, false );
      strcpy( $$.name, "_A" );
    }
  else
    {
      addCompilerMessage("some kind of error occurred.  look at the ASL instructions", 3 );
    }
};
| tROL '(' expression ')'
{
  if( isUintID($3.name) || isIntID($3.name)  )
    {
      addComment( "rol( UIntID ) -> A" );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      //addAsm( str_CLC, 1, false );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), size_of_instruction, false );
      addAsm( str_ASL ); 
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_A" );
    }
  else if( isXA($3.name) )
    {
      addComment( "rol( XA ) -> XA" );
      addAsm( str_ASL, 1, false );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_ROL, 1, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_TYA, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($3.name) )
    {
      addComment( "rol( WordID ) -> XA" );

      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), size_of_instruction, false );
      addAsm( str_ASL ); 
      addAsm( str_TAY );
      
      size_of_instruction = 3;
      if( a+1 < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a) + "+1", size_of_instruction, false );
      
      addAsm( str_ROL );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_XA" );
    }
  else if( isA($3.name) )
    {
      addComment( "rol( A ) -> A" );
      //addAsm( str_CLC );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_A" );
    }
  else if( isWordIMM($3.name) )
    {
      addAsm( str_ASL + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_XA" );
    }
  else addCompilerMessage( "ROL of type not permitted", 3 );
};
| tROR '(' expression ')'
{
  addComment( "ror expression" );
  if( isA( $3.name ) )
    {
      addComment( "ror( A ) -> A" );
      //addAsm( str_CLC );
      addAsm( str_LSR, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_A" );
    }
  else if( isXA( $3.name ) )
    {
      addComment( "ror( XA ) -> XA" );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_LSR );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_ROR );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID( $3.name )|| isIntID($3.name) )
    {
      addComment( "ror( UIntID ) -> A" );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), size_of_instruction, false );
      //addAsm( str_CLC, 1, false );
      addAsm( str_LSR, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_A" );
    }
  else if( isWordID( $3.name ) )
    {
      addComment( "ror( WordID ) -> XA" );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
      addAsm( str_TAY );
      size_of_instruction = 3;
      if( a+1 < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a) + "+1", size_of_instruction, false );
      addAsm( str_LSR );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_ROR );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordIMM($3.name) )
    {
      addAsm( str_LSR + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( "!:", 0, true );
      strcpy( $$.name, "_XA" );
    }
  else
    {
      addCompilerMessage("some kind of error occurred.  look at the ROR instructions", 3 );
    }
};
| tLSR '(' expression ')'
{
  addComment( "lsr(expression)" );
  if( isA( $3.name ) )
    {
      addComment( "lsr( A ) -> A" );
      addAsm( str_LSR, 1, false );
      strcpy( $$.name, "_A" );
    }
  else if( isXA( $3.name ) )
    {
      addComment( "lsr( XA ) -> XA" );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_LSR, 1, false );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_ROR, 1, false );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($3.name ))
    {
      addComment( "lsr( WordID ) -> XA");
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a+1 < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a) + "+1", size_of_instruction, false );
      addAsm( str_LSR, 1, false );
      addAsm( str_TAX, 1, false );
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
      addAsm( str_ROR );
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID($3.name) || isIntID($3.name))
    {
      addComment( "lsr( UintID ) -> A" );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LDA + getNameOf(a), size_of_instruction, false );
      addAsm( str_LSR, 1, false );
      strcpy( $$.name, "_A" );
    }
  else if( isWordIMM($3.name))
    {
      addComment( "lsr( WordIMM ) -> A" );
      addAsm( str_LDA + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_LSR, 1, false );
      strcpy( $$.name, "_A" );
    }

  else
    {
      addCompilerMessage("some kind of error occurred.  look at the LSR instructions", 3 );
    }
};
| '(' ID ')' '[' expression ']'
{
  pushScope( "INDIRECT" );

  if( isUintIMM( $5.name ) || isIntIMM( $5.name ))
    {
      int addr = getAddressOf( $2.name );
      int index_addr = getAddressOf( $5.name );
      addAsm( str_LDA + getNameOf( addr ), 3, false );
      //addAsm( str_STA + getLabel( label_vector[label_major], false), 3, false );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_LDA + getNameOf( addr ) + "+1", 3, false );
      //addAsm( str_STA + getLabel( label_vector[label_major], false) + "+1", 3, false );
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($5.name).c_str())), 2, false );
      addAsm( str_BYTE + "$BD"+ commentmarker + "LDA Absolute,X", 1, false );
      //addAsm( generateNewLabel(), 0, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    
      //addAsm( ".byte #$00", 1, false );
      //addAsm( ".byte #$00", 1, false );
    }
  else if( isUintID( $5.name ) || isIntID( $5.name ))
    {
      int addr = getAddressOf( $2.name );
      int index_addr = getAddressOf( $5.name );
      addComment( string("Dereference: ") + $2.name  );
      addAsm( str_LDA + getNameOf( addr ), 3, false );
      //addAsm( str_STA + getLabel( label_vector[label_major], false), 3, false );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_LDA + getNameOf(addr) + "+1", 3, false );      
      //addAsm( str_STA + getLabel( label_vector[label_major], false) + "+1", 3, false );   
      addAsm( str_STA + "!++", 3, false );
      addAsm( str_LDX + getNameOf(index_addr), 3, false );
      addAsm( str_BYTE + "$BD"+ commentmarker + "LDA Absolute, X", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else if( isA( $5.name ) )
    {
      int addr = getAddressOf( $2.name );
      int index_addr = getAddressOf( $5.name );
      addComment( string("Dereference: ") + $2.name );
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(addr), 3, false );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_LDA + getNameOf(addr)+"+1", 3, false );
      addAsm( str_STA + "!++", 3, false );

      addAsm( str_BYTE + "$BD"+ commentmarker + "<-- LDA Absolute,X", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
    }
  else
    {
      addCompilerMessage( "(ID)[i] error - index of improper type", 3 );
    }
  strcpy($$.name, "_A" );
  popScope();
}
| ID '[' expression ']'
{
  if( (isUintID($1.name)||isIntID($1.name)) && (isUintID($3.name) || isIntID($3.name)))
    {
      addComment( "UIntID '[' UIntID ']' -> A" );
      int addr = hexToDecimal( stripFirst($3.name).c_str());
      addAsm( str_LDX + getNameOf(addr), 3, false );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",X", 3, false );
      strcpy($$.name, "_A" );  
    }
  else if((isUintID($1.name)||isIntID($1.name)) && isA($3.name))
    {
      addComment( "UIntID[A] -> A" );
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",X", 3, false );
      strcpy($$.name, "_A" );
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && (isIntIMM($3.name) || isUintIMM($3.name)) )
    {
      addComment( "UintID[UintIMM] -> A" );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + "+" + itos(atoi( stripFirst($3.name).c_str() )), 3, false );
      strcpy($$.name, "_A" );
    }

  else if(isWordID($1.name) && isA($3.name))
    {
      addComment( "WordID[A] -> XA" );
      addAsm( str_ASL ); //  because a word is twice as long as a byte!

      addAsm( str_TAY );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",Y", 3, false );
      addAsm( str_INY );
      addAsm( str_LDX + getNameOf(getAddressOf($1.name)) + ",Y", 3, false );
      strcpy($$.name, "_XA" );

    }
  else if( isWordID( $1.name ) && (isUintIMM($3.name)||isIntIMM($3.name))  )
    {
      addComment( "WordID[UIntIMM] -> XA" );
 
      int tmp_i = atoi( stripFirst($3.name).c_str() );
      tmp_i*=2; // *2 because a word is twice as long as a byte!
      //addAsm( str_LDX + "#$" + toHex(tmp_i), 2, false);
      // 2024 05 03 - mkpellegrino
      // addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + "+" + itos(tmp_i), 3, false );
      //addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",X", 3, false );
      //addAsm( str_PHA );
      //addAsm( str_INX );
      //addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_LDX + getNameOf(getAddressOf($1.name)) + "+" + itos(tmp_i+1), 3, false );
      //addAsm( str_TAX );
      //addAsm( str_PLA );
      strcpy($$.name, "_XA" );
    }
  else if( isWordID( $1.name ) && (isUintID($3.name)||isIntID($3.name)))
    {
      addComment( "WordID '[' UIntID ']' -> XA" );
 
      int tmp_i = getAddressOf( $3.name );
      addAsm( str_LDA + getNameOf(tmp_i), 3, false );
      addAsm( str_ASL );
      addAsm( str_TAY );
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",Y", 3, false );
      addAsm( str_INY );
      addAsm( str_LDX + getNameOf(getAddressOf($1.name)) + ",Y", 3, false );
      strcpy($$.name, "_XA" );
    }
  else
    {
      addCompilerMessage( "Unhandled array type", 3 );
    }

};
| tRND '(' expression ')' 
{
  addComment( "=========================================================");  
  addComment( string( "           rnd(") + string($3.name) + string( ");") );
  addComment( "=========================================================");
  sidrnd_is_needed = true;
  if( !sidrnd_is_initialised  )
    {
      addAsm( str_JSR + "SIDRND" + commentmarker + "initialize random number generator", 3, false );
      sidrnd_is_initialised = true;
    }
  addAsm( str_LDA + "$D41B", 3, false );
  strcpy($$.name, "_A" );
};
| tbwNOT expression
{
  addComment( "~ expression (bitwise not)" );
  if( isWordID($2.name) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($2.name))+" +1", 3, false );
      addAsm( str_EOR + "#$FF", 3, false );
      addAsm( str_TAX );
      addAsm( str_LDA + getNameOf(getAddressOf($2.name)), 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      strcpy( $$.name, "_XA" );
    }
  else if( isIntID($2.name) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($2.name)), 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_LDX + "#$FF", 2, false );
      strcpy($$.name, "_XA" );
    }
  else if( isUintID($2.name) )
    {      
      addAsm( str_LDA + getNameOf(getAddressOf($2.name)), 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_LDX + "#$FF", 2, false );
      strcpy($$.name, "_XA" );
    }
  else if( isXA($2.name) )
    {
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_TYA, 1, false );
      strcpy($$.name, "_XA" );
    }
  else if( isA($2.name) )
    {
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_LDX + "#$FF", 2, false );
      strcpy($$.name, "_XA" );
    }
  else if( isWordIMM($2.name) )
    {
      int val = atoi(stripFirst($2.name).c_str());
      addAsm( str_LDA + "#$" + toHex(get_word_L(val) ^ 255), 2, false  );
      addAsm( str_LDX + "#$" + toHex(get_word_H(val) ^ 255), 2, false  );
      strcpy($$.name, "_XA" );
    }
  else if( isIntIMM($2.name) || isUintIMM($2.name) )
    {
      int addr = atoi(stripFirst($2.name).c_str());
      addAsm( str_LDA + "#$" + toHex(get_word_L(addr) ^ 255), 2, false  );
      addAsm( str_LDX + "#$FF", 2, false  );
      strcpy($$.name, "_XA" );
    }
  else
    {
      addCompilerMessage( "Bitwise Not (~): Unknown type.", 3 );
    }
};
| expression tbwOR expression
{
  addComment( "expression tbwOR expression" );
  if( isWordID($1.name) && isWordID($3.name) )
    {
      addComment( "WordID | WordID" );

      // preserve one of the operands
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);
      
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_ORA + getNameOf(addr2), 3, false);
      addAsm( str_TAY );
      //addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(addr1)+ "+1", 3, false);
      addAsm( str_ORA + getNameOf(addr2) + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_TYA );
      //addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isXA($3.name) )
    {
      addComment( "WordID | XA" );

      int addr = getAddressOf($1.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_ORA + getNameOf(addr), instr_size, true );
      //addAsm( str_PHA );
      addAsm( str_TAY );
      addAsm( str_TXA );
      if( addr + 1 > 255 ) instr_size = 3;

      addAsm( str_ORA + getNameOf(addr) + "+1", instr_size, true );
      addAsm( str_TAX );
      addAsm( str_TYA );
      //addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isWordIMM($3.name) )
    {
      addComment( "WordID | WordIMM" );

      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + "#$" + toHex(get_word_L(addr)), 2, false  );
      addAsm( str_ORA + getNameOf(hexToDecimal(stripFirst($1.name))), 3, false);
      addAsm( str_TAY );
      addAsm( str_LDA + "#$" + toHex(get_word_H(addr)), 2, false  );
      addAsm( str_ORA + getNameOf(hexToDecimal(stripFirst($1.name))) + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy( $$.name, "_XA" );      
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintID($3.name) )
    {
      addComment( "UIntID | UIntID" );
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_ORA + getNameOf(addr2), 3, false);
      strcpy( $$.name, "_A" );
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintIMM($3.name) )
    {
      addComment( "UIntID | UintIMM" );
      int addr1 = getAddressOf($1.name);
      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + "#$" + toHex(addr), 2, false  );      
      addAsm( str_ORA + getNameOf(addr1), 3, false);
      strcpy( $$.name, "_A" );
    }
  else if( isUintID($1.name) && isA($3.name) )
    {
      addComment( "UintID | A" );
      int addr = getAddressOf($1.name);
      if( addr > 255 )
	{
	  addAsm( str_ORA + getNameOf(addr), 3, false);
	}
      else
	{
	  addAsm( str_ORA + getNameOf(addr), 2, false);
	}
      strcpy( $$.name, "_A" );
    }
  else if( isA($1.name) && isUintID($3.name) )
    {
      addComment( "A | UIntID" );

      int addr = getAddressOf($3.name);
      if( addr > 255 )
	{
	  addAsm( str_ORA + getNameOf(addr), 3, false);
	}
      else
	{
	  addAsm( str_ORA + getNameOf(addr), 2, false);
	}
      strcpy( $$.name, "_A" );
    }
  else if( (isUintIMM($1.name)||isIntIMM($1.name)) && isA($3.name) )
    {
      addComment( "UIntIMM | A" );

      int OP1 = atoi(stripFirst($1.name).c_str());
      addAsm( str_ORA + "#$" + toHex(OP1), 2, false );
      strcpy( $$.name, "_A" );
    }
  else if( isA($1.name) && (isUintIMM($3.name)|isIntIMM($3.name)) )
    {
      addComment( "A | UIntIMM" );
      int OP2 = atoi(stripFirst($3.name).c_str());
      addAsm( str_ORA + "#$" + toHex(OP2), 2, false );
      strcpy( $$.name, "_A" );
    }
  else
    {
      addCompilerMessage( "Bitwise OR (|) not implemented for type", 3 );
    }
};
| expression tbwAND expression
{
  addComment("expression tbwAND expression");
  if( isWordID($1.name) && isWordID($3.name) )
    {
      addComment( "WordID & WordID" );

      // preserve one of the operands
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);
      
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_AND + getNameOf(addr2), 3, false);
      addAsm( str_TAY );
      addAsm( str_LDA + getNameOf(addr1) + "+1", 3, false);
      addAsm( str_AND + getNameOf(addr2) + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isXA($3.name) )
    {
      addComment( "WordID & XA" );

      int addr = getAddressOf($1.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_AND + getNameOf(addr), instr_size, true );
      addAsm( str_TAY );
      addAsm( str_TXA );
      if( addr + 1 > 255 ) instr_size = 3;

      addAsm( str_AND + getNameOf(addr) + "+1", instr_size, true );
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isWordIMM($3.name) )
    {
      addComment( "WordID & WordIMM" );

      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(get_word_L(addr)), 2, false  );
      // 2024 05 03 - mkpellegrino
      //addAsm( str_AND + "$" + stripFirst($1.name), 3, false);
      addAsm( str_AND + getNameOf(hexToDecimal(stripFirst($1.name))), 3, false);
      //addAsm( str_PHA );
      addAsm( str_TAY );
      addAsm( str_LDA+"#$" + toHex(get_word_H(addr)), 2, false  );      
      // 2024 05 03 - mkpellegrino
      //addAsm( str_AND + "$" + stripFirst($1.name) + "+1", 3, false);
      addAsm( str_AND + getNameOf(hexToDecimal(stripFirst($1.name))) + "+1", 3, false);
      addAsm( str_TAX );
      //addAsm( str_PLA );
      addAsm( str_TYA );
      strcpy( $$.name, "_XA" );      
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintID($3.name) )
    {

      addComment( "(U)intID & UintID" );

      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);
      
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_AND + getNameOf(addr2), 3, false);

      strcpy( $$.name, "_A" );
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintIMM($3.name) )
    {
      addComment( "(U)intID & UintIMM" );
      int addr1 = getAddressOf($1.name);

      
      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(addr), 2, false  );      
      addAsm( str_AND + getNameOf(addr1), 3, false);
      //addAsm( str_AND + "$" + stripFirst($1.name), 3, false);
      strcpy( $$.name, "_A" );
    }
  else if( isUintID($1.name) && isA($3.name) )
    {
      addComment( "UintID & A" );

      int addr = getAddressOf($1.name);
      if( addr > 255 )
	{
	  addAsm( str_AND + getNameOf(addr), 3, false);

	}
      else
	{
	  addAsm( str_AND + getNameOf(addr), 2, false);

	}
      strcpy( $$.name, "_A" );
    }
  else if( isA($1.name) && isUintID($3.name) )
    {
      addComment( "A & UintID" );

      int addr = getAddressOf($3.name);
      if( addr > 255 )
	{
	  addAsm( str_AND + getNameOf(addr), 3, false);
	}
      else
	{
	  addAsm( str_AND + getNameOf(addr), 2, false);
	}
      strcpy( $$.name, "_A" );


    }
  else if( (isUintIMM($1.name)||isIntIMM($1.name)) && isA($3.name) )
    {
      addComment( "(U)intIMM & A" );

      int OP1 = atoi(stripFirst($1.name).c_str());
      addAsm( str_AND + "#$" + toHex(OP1), 2, false );
      strcpy( $$.name, "_A" );
    }
  else if( isA($1.name) && (isUintIMM($3.name)|isIntIMM($3.name)) )
    {
      addComment( "A & (U)intIMM" );

      int OP2 = atoi(stripFirst($3.name).c_str());
      addAsm( str_AND + "#$" + toHex(OP2), 2, false );
      strcpy( $$.name, "_A" );
    }
  else
    {
      addCompilerMessage( "Bitwise AND (&) not implemented for type (yet)", 3 );
    }
};
| tGETBANK '(' ')'
{
  bnkmem_is_needed=true;
  addAsm( str_JSR + "BNKMEM", 3, false );
  addAsm( str_PLA );
  addAsm( str_TAX );
  addAsm( str_LDA + "#$00", 2, false );
  strcpy( $$.name, "_XA" );
}
| tGETSCR '(' ')'
{
  addAsm( str_LDA + "#$00", 2, false );
  addAsm( str_STA + "$03", 2, false );
  scrmem_is_needed=true;
  addAsm( str_JSR + "SCRMEM", 3, false );
  addAsm( str_PLA );
  
  addAsm( str_CLC ); 
  addAsm( str_ADC + "$03", 2, false );
  addAsm( str_STA + "$03", 2, false );
  bnkmem_is_needed=true;
  addAsm( str_JSR + "BNKMEM", 3, false );
  addAsm( str_PLA );
  addAsm( str_ADC + "$03", 2, false );
  addAsm( str_TAX );
  addAsm( str_LDA + "#$00", 2, false );
  strcpy( $$.name, "_XA" );
}
| tGETBMP '(' ')'
{
  // getBMP
  addAsm( str_SEI );
  addAsm( str_LDA + "$D018", 3, false );
  addAsm( str_AND + "#$08", 2, false );
  //addAsm( str_CLC );
  addAsm( str_ASL );
  addAsm( str_ASL );      
  
  addAsm( str_STA + "$FF", 2, false );

  // get BNK
  addAsm( str_LDA + "$DD00", 3, false );
  addAsm(str_EOR + "#$FF", 2, false );
  addAsm( str_AND + "#$03", 2, false );
  //addAsm( str_CLC );
  addAsm( str_ASL );
  addAsm( str_ASL );
  addAsm( str_ASL );
  addAsm( str_ASL );	
  addAsm( str_ASL );
  addAsm( str_ASL );
  
  addAsm( str_ADC + "$FF", 2, false );
  addAsm( str_TAX );
  addAsm( str_LDA + "#$00", 2, false );
  addAsm( str_CLI );
  strcpy( $$.name, "_XA" );
}
| tGETADDR '(' expression ',' expression ')'
{
  // NEEDS WORK
  // TO DO SAVE/RESTORE ZP registers
  getplot_is_needed = true;

  int x_addr = getAddressOf($3.name);
  int y_addr = getAddressOf($5.name);

  
  // X Low
  addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
  addAsm( str_STA + "$FA", 2, false );

  if( isWordID( $3.name ) )
    {
      // X High
      addAsm( str_LDA + "$" + toHex(x_addr+1), 3, false );
    }
  else
    {
      addAsm( str_LDA + "#$00", 2, false );
    }
  addAsm( str_STA + "$FB", 2, false );

  // Y
  addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
  addAsm( str_STA + "$FC", 2, false );
  addAsm( str_JSR + "GETPLOT", 3, false );
  addAsm( str_LDA + "$02", 2, false );
  addAsm( str_LDX + "$03", 2, false );
  strcpy( $$.name, "_XA" );  
};
| tGETXY '(' expression {if(isXA($3.name)){addAsm( str_PHA );addAsm( str_TXA );addAsm( str_PHA );}} ',' expression ')'
{
  string arg0 = string($3.name);
  string arg1 = string($6.name);
  
  addComment( "Save $02, $03, $5C, and $5D" );

  if( isA( arg1.c_str() ))
    {
      addAsm( str_TAY );
    }
  addAsm( str_LDA + "$02", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$03", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$5C", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );
  addAsm( str_LDA + "$5D", 2, false );
  addAsm( str_JSR + "PUSH", 3, false );

  if( isA($6.name) )
    {
      addAsm( str_TYA );
    }
  
  if(isWordID($3.name) && (isUintID($6.name)||isIntID($6.name)) )
    {
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + getNameOf(x_addr) + "+1", 3, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
    }
  else if(isUintID($3.name) && (isUintID($6.name)||isIntID($6.name)) )
    {
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + getNameOf(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
    }
  else if(isUintID($3.name) && isA($6.name))
    {
      addAsm( str_STA + "$FC", 2, false );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$FB", 2, false );
    }
  else if(isWordID($3.name) && isA($6.name))
    {
      addAsm( str_STA + "$FC", 2, false );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + getNameOf(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + getNameOf(x_addr) + "+1", 3, false );
      addAsm( str_STA + "$FB", 2, false );
    }
  else if( isXA($3.name) && isA($6.name) )
    {
      addComment("getxy(XA, A);");
      addAsm( str_STA + "$FC", 2, false );
      addAsm( str_PLA ); // this is the High Byte
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_PLA ); // this is the High Byte
      addAsm( str_STA + "$FA", 2, false );
    }
  else
    {
      addCompilerMessage( "Invalid arguments for getxy", 3 );
    }

  addAsm( str_JSR + "GETPLOT", 3, false );
  addAsm( str_LDY + "#$00", 2, false );
  addAsm( str_LDA + "($02),Y", 2, false );
  getplot_is_needed = true;

  // 2024 05 22 - mkpellegrino
  addAsm( str_TAY );
  //addAsm( str_PHA );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$5d", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$5C", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$03", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$02", 2, false );

  //addAsm( str_PLA );
  addAsm( str_TYA );
  strcpy( $$.name, "_A" );  
}
| tBANK '(' ')'
{
  addComment( "bank()" );
  addAsm( str_LDA + "$DD00", 3, false );
  addAsm( str_EOR + "#$FF", 2, false );
  addAsm( str_AND + "#$03", 2, false );
  strcpy( $$.name, "_A" );  
};
| tTOBIT '(' expression ')'
{
  if( isUintID($3.name) || isIntID($3.name ) )
    {
      addAsm( str_LDX + "$" + toHex( getAddressOf( $3.name ) ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      
      addAsm( str_BNE + "!-" + commentmarker + "BNE top-of-loop", 2, false );

    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      addAsm( str_BNE + "!-" + commentmarker + "BNE top-of-loop", 2, false );
    }
  else if( isA( $3.name) )
    {
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addAsm( "!:\t" + str_ROL, 1, true);
      addAsm( str_DEX );
      addAsm( str_BNE + "!-" + commentmarker + "BNE top-of-loop", 2, false );
    }
  else
    {
      addCompilerMessage( "incorrect type for operation tobit(exp)", 3 );
    }
  strcpy( $$.name, "_A" );   
};
| tINTTOWORD '(' expression ')'
{
  // takes a signed 8-but integer and
  // turns it into a 16-bit word
  if( isA($3.name) )
    {
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_TAY, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addComment( "This could be a DEX instruction" );
      addComment( "... but that would affect flags" );
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!:\t" + str_TYA, 1, true );
    }
  else if( isIntIMM($3.name) )
    {
      int v = twos_complement(atoi( stripFirst($3.name).c_str() ));
      addCompilerMessage( $3.name, 0 );
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      addAsm( str_LDX + "#$FF", 2, false ); 
    }
  else if( isIntID($3.name) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_TAY, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addComment( "This could be a DEX instruction" );
      addComment( "... but that would affect flags" );
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!:\t" + str_TYA, 1, true );
    }
  else if( isUintID($3.name) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_TAY, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!+", 2, false );
      addComment( "This could be a DEX instruction" );
      addComment( "... but that would affect flags" );
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!:\t" + str_TYA, 1, true );
    }
  else if( isUintIMM($3.name) )
    {
      int v = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      addAsm( str_LDX + "#$00", 2, false ); 
    }
  else
    {
      addCompilerMessage( "inttoword(expression): unknown argument type", 3 );
    }
  strcpy( $$.name, "_XA" );
};

| tTOWORD '(' expression ')'
{
  // TODO: Convert EXPRESSION to a Word
  int t = getTypeOf($3.name);
  if( isFloatID($3.name))
    {
      addComment( "toword(FloatID) --> XA");
      int base_address = hexToDecimal( string($3.name) );      
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // MEM ->FAC
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false ); // FAC -> WORD
      addAsm( str_TAX );
      addAsm( str_TYA );      
      strcpy($$.name, "_XA" );
    }
  else if( isFAC($3.name) )
    {
      addComment( "toword(FAC) --> XA");
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false);
      addAsm( str_TAX, 1, false );
      addAsm( str_TYA, 1, false );
      strcpy($$.name, "_XA" );
    }
  else if( isFloatIMM($3.name) )
    {
      addComment( "toword(FloatIMM) --> XA");
      addCompilerMessage( "Just hard-code the value as a word, please.", 1 );
      inlineFloat( $3.name );
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false);
      addAsm( str_TAX, 1, false );
      addAsm( str_TYA, 1, false );      
      strcpy($$.name, "_XA" );
    }
  else if( isWordID($3.name) )
    {
      addComment( "toword(WordID) --> XA");
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_LDX + getNameOf(getAddressOf($3.name)) + " +1", 3, false );
      strcpy($$.name, "_XA" );      
    }
  else if( isIntID($3.name) )
    {
      // TODO: FIX THIS!
      addCompilerMessage( "toword(intid): broken" );
      int base_address =  getAddressOf($3.name);
      int inst_size = 3;
      if( base_address < 256 ) inst_size = 2;
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDA + getNameOf(base_address), inst_size, false  );
      addAsm( str_BPL + "!+", 2, false );
      addAsm( str_DEX, 1, false );
      addAsm( "!:", 0, true );
      strcpy($$.name, "_XA" );
    }
  else if( isUintID($3.name)  )
    {
      addComment( "toword(UintID) --> XA");

      int base_address =  getAddressOf($3.name);
      int inst_size = 3;
      if( base_address < 256 ) inst_size = 2;
      addAsm( str_LDA + getNameOf(base_address), inst_size, false  );
      addAsm( str_LDX + "#$00", 2, false );
      strcpy($$.name, "_XA" );
    }
  else if( isA($3.name ) )
    {
      addComment("toword(A) --> XA" );
      addAsm( str_LDX + "#$00", 2, false );
      strcpy($$.name, "_XA" );
    }
  else if( isXA($3.name) )
    {
      // do nothing, XA is already in XA
      addComment( "toword(XA) --> XA... nothing to do");
      strcpy($$.name, "_XA" );
    }
  else if( isWordIMM($3.name) )
    {
      addComment("toword(WordIMM) --> XA" );

      int tmp_int = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int) ), 2, false);
      addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int) ), 2, false);
      strcpy($$.name, "_XA" );

    }
  else if( isUintIMM($3.name) )
    {
      addComment("toword(UintIMM) --> XA" );
      int tmp_int = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int) ), 2, false);
      addAsm( str_LDX + "#$00", 2, false);
      strcpy($$.name, "_XA" );
    }
  else if( isIntIMM($3.name) )
    {
      addComment("toword(IntIMM) --> XA" );
      int tmp_int = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( get_word_L(tmp_int) ), 2, false);
      addAsm( str_LDX + "#$FF", 2, false);
      strcpy($$.name, "_XA" );
    }
  else
    {
      addCompilerMessage( "toword(exp): unknown argument type", 3 );
    }
};

| tTOUINT '(' expression ')'
{
  int t = getTypeOf($3.name);
  if( isFloatID($3.name))
    {
      addComment( "touint(FloatID) --> A");
      int base_address = hexToDecimal( string($3.name) );      
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      addAsm( str_TYA );
    }
  else if( isFAC($3.name) )
    {
      addComment( "touint(FAC) --> A (QINT Function)" );
      addAsm( str_JSR + "$BC9B" + commentmarker + "FAC -> ZP $62,$63,$64,$65", 3, false);
      addAsm( str_LDA + "$65", 2, false );
    }
  else if( isWordID($3.name) || isUintID($3.name) || isIntID($3.name) )
    {
      addComment( "touint(WordID|UIntID|IntID) --> A");

      int base_address =  getAddressOf($3.name);
      int inst_size = 3;
      if( base_address < 256 ) inst_size = 2;
      addAsm( str_LDA + getNameOf(base_address), inst_size, false  );
    }
  else if( isXA($3.name) || isA($3.name) )
    {
      // do nothing - low byte is in A already
      addComment( "touint(XA|A) --> A");
    }
  else if( isUintIMM($3.name) )
    {
      int tmp_val = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_val )), 2, false );
    }
  else
    {
      addCompilerMessage( "touint(exp): argument of unknown type", 3);
    }
  strcpy($$.name, "_A" );
};
| tFCHRIN '(' ')'
{
  addComment( "fchrin() --> A" );
  addAsm( str_JSR + "$FFCF", 3, false );
  strcpy( $$.name, "_A");
};
| tFREADST '(' ')'
{
  addComment( "freadst() --> A" );
  addAsm( str_JSR + "$FFB7", 3, false );
  strcpy( $$.name, "_A");
};
| tPOINTER '(' ID ')'
{
  string s = string( "ptr(" ) + string( $3.name ) + string( ") --> XA" );
  addComment( s );
  addAsm( str_LDA + "#<" + $3.name, 2, false);
  addAsm( str_LDX + "#>" + $3.name, 2, false);
  strcpy($$.name, "_XA" );
};
| tSTRTOWORD '(' expression ')'
{
  if( isUintID($3.name) )
    {
      addParserComment( "expression: tSTRTOWORD '(' expression ')'" );
      int addr = getAddressOf($3.name);

      // save 7A and 7B
      addAsm( str_LDA + "$7A", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$7B", 2, false );
      addAsm( str_PHA );

      // point chrget to buffer
      addAsm( str_LDA + "#$" + toHex(get_word_L(addr)), 2, false  );
      addAsm( str_STA + "$7A", 2, false );
      addAsm( str_LDA + "#$" + toHex(get_word_H(addr)), 2, false  );
      addAsm( str_STA + "$7B", 2, false );

      addAsm( str_JSR + "$79", 3, false );
      addAsm( str_JSR + "$BCF3" + commentmarker + "STR -> FAC", 3, false );

      // restore 7A and 7B
      addAsm( str_PLA );
      addAsm( str_STA + "$7B", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$7A", 2, false );

      // Now turn the FAC -> Word
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> WORD", 3, false );
      addAsm( str_TAX );
      addAsm( str_TYA );
      //addAsm( str_JSR + "$AABC" + commentmarker + "FAC -> CRT (for debugging purposes)", 3, false );
    }
  else
    {
      addCompilerMessage( "only UINT buffers can be strings", 3 );
    }
  strcpy($$.name, "_XA" );

};
| tSTRTOFLOAT '(' expression ')'
{
  if( isUintID($3.name) )
    {
      addParserComment( "expression: tSTRTOFLOAT '(' expression ')'" );
      int addr = getAddressOf($3.name);

      // save 7A and 7B
      addAsm( str_LDA + "$7A", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$7B", 2, false );
      addAsm( str_PHA );

      // point chrget to buffer
      //addAsm( str_LDA+"#$" + toHex(get_word_L(addr)), 2, false  );
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_STA + "$7A", 2, false );
      //addAsm( str_LDA+"#$" + toHex(get_word_H(addr)), 2, false  );
      addAsm( str_LDA + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_STA + "$7B", 2, false );


      //addAsm( str_LDA + "$" + toHex(addr), 3, false ); 
      //addAsm( str_CLC );
      // JSR CHRGET
      addAsm( str_JSR + "$79", 3, false );
      addAsm( str_JSR + "$BCF3" + commentmarker + "STR -> FAC", 3, false );

      // restore 7A and 7B
      addAsm( str_PLA );
      addAsm( str_STA + "$7B", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$7A", 2, false );      
    }
  else if( isXA($3.name) )
    {
      addAsm( str_TAY, 1, false );
      addAsm( str_LDA + "$7A", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$7B", 2, false );
      addAsm( str_PHA );

      addAsm( str_STY + "$7A", 2, false );
      addAsm( str_STX + "$7B", 2, false );
      addAsm( str_JSR + "$79", 3, false );
      addAsm( str_JSR + "$BCF3" + commentmarker + "STR -> FAC", 3, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$7B", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$7A", 2, false );
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDA + "$7A", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$7B", 2, false );
      addAsm( str_PHA );

      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_STA + "$7A", 2, false );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)) + " +1", 3, false );
      addAsm( str_STA + "$7B", 2, false );
      addAsm( str_JSR + "$79", 3, false );
      addAsm( str_JSR + "$BCF3" + commentmarker + "STR -> FAC", 3, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$7B", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$7A", 2, false );
    }
  else
    {
      addCompilerMessage( "only UINT buffers can be strings", 3 );
    }
  strcpy($$.name, "_FAC" );
};
| tTOFLOAT '(' expression ')'
{
  if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else if(isWordID($3.name) )
    {
      addCompilerMessage( "16-bit word is SIGNED", 1 );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)) + "+1", 3, false ); 
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else if( isXA($3.name) )
    {
      addCompilerMessage( "16-bit word is SIGNED", 1 );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else if( isA($3.name) )
    {
      addAsm( str_TAY );
      addAsm( str_LDA + "#$00", 2, false);
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      int v = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDY + "#$" + toHex(v), 2, false );
      addAsm( str_LDA + "#$00", 2, false);
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else if( isIntIMM($3.name) )
    {
      int v = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDY + "#$" + toHex(v), 2, false );
      addAsm( str_LDA + "#$FF", 2, false);
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else if( isWordIMM($3.name) )
    {
      addCompilerMessage( "16-bit word is SIGNED", 1 );
      int L = get_word_L(atoi( stripFirst($3.name).c_str() ));
      int H = get_word_H(atoi( stripFirst($3.name).c_str() ));
      addAsm( str_LDY + "#$" + toHex(L), 2, false );
      addAsm( str_LDA + "#$" + toHex(H), 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
    }
  else
    {
      addCompilerMessage( "Unable to convert to float", 3 );
    }
  strcpy($$.name, "_FAC" );
};
| '{' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ','
value ',' value ',' value ',' value ',' value ',' value ',' value ',' value ',' value '}'
{
  int sprite_number = atoi($2.name);
  if( sprite_number > 7 || sprite_number < 0 )
    {
      addCompilerMessage( "invalid MOB number: should be 0-7", 3 );
    }
  int sprite_area = atoi($4.name);
  if( sprite_area > 255 || sprite_area < 0 )
    {
      addCompilerMessage( "invalid MOB location: should be 0-255", 3 );
    }
  
  mob_vector.push_back( atoi(stripFirst($2.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($4.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($6.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($8.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($10.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($12.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($14.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($16.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($18.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($20.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($22.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($24.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($26.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($28.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($30.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($32.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($34.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($36.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($38.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($40.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($42.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($44.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($46.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($48.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($50.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($52.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($54.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($56.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($58.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($60.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($62.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($64.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($66.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($68.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($70.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($72.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($74.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($76.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($78.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($80.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($82.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($84.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($86.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($88.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($90.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($92.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($94.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($96.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($98.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($100.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($102.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($104.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($106.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($108.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($110.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($112.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($114.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($116.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($118.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($120.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($122.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($124.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($126.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($128.name).c_str()) );
  mob_vector.push_back( atoi(stripFirst($130.name).c_str()) );
  strcpy($$.name, "_MOB" );
  //strcpy($$.name, "m" ); // 0404
};
| tGETIN '(' ')'
{
  addComment( "=========================================================");  
  addComment( string("                 getin()" ));
  addComment( "=========================================================");
  addAsm( str_LDA + "$CB", 2, false );
  strcpy($$.name, "_A" );
};
| tGETCHAR '(' ')'
{
  addComment( "=========================================================");  
  addComment( string("                 getchar()" ));
  addComment( "=========================================================");
  addAsm( str_JSR + "$FFE4", 3, false );
  strcpy($$.name, "_A" );
};
| tTWOS '(' expression ')'
{
  //twos_complement_is_needed = true;
  addComment( "=========================================================");  
  addComment( string("                 twos(expression)"));
  addComment( "=========================================================");

  if( isUintID( $3.name ) || isIntID( $3.name ))
    {
      //addAsm( str_LDA + "$" + toHex(getAddressOf( string($3.name))), 3, false );
      addAsm( str_LDA + getNameOf(getAddressOf( string($3.name))), 3, false );
      addAsm( str_EOR + "#$FF", 2, false);
      addAsm( str_CLC );
      addAsm( str_ADC + "#$01", 2, false);
      strcpy($$.name, "_A");
    }
  else if( isIntIMM( $3.name ) || isUintIMM( $3.name ))
    {
      int value = atoi(stripFirst($3.name).c_str());
      if( value < 0 )
	{
	  value = twos_complement( value );
	}
      addAsm( str_LDA + "#$" + toHex( value ), 2, false );
      strcpy($$.name, "_A");

    }
  else if( isA( $3.name ) )
    {
      addAsm( str_CLC );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_ADC + "#$01", 2, false );
      strcpy($$.name, "_A");

    }
  else if( isWordID( $3.name ) )
    {
      int tmp_addr = getAddressOf( $3.name );

      addAsm( str_LDA + "#$FF", 2, false );
      // 2024 04 15 - mkpellegrino
      addAsm( str_EOR + getNameOf( tmp_addr ) + " +1", 3, false ); // 4 cycles
      //addAsm( str_EOR + "$" + toHex( tmp_addr + 1 ), 3, false ); // 4 cycles
      addAsm( str_PHA );
      addAsm( str_LDA + "#$FF", 2, false );

      // 2024 04 15 - mkpellegrino
      addAsm( str_EOR + getNameOf( tmp_addr ), 3, false );
      //addAsm( str_EOR + "$" + toHex( tmp_addr ), 3, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$01", 2, false );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_ADC + "#$00", 2, false );
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy($$.name, "_XA");
    }
  else if( isXA( $3.name ) )
    {
      int tmp_addr = getAddressOf( $3.name );

      addAsm( str_CLC );
      addAsm( str_EOR + "#$FF" );
      addAsm( str_ADC + "#$01" );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_EOR + "#$FF" );
      addAsm( str_ADC + "#$00" );
      addAsm( str_TAX );
      addAsm( str_TYA );
      strcpy($$.name, "_XA");
    }
  else
    {
      addCompilerMessage( "Type not implemented for twos(exp)", 3 );
    }
};
| tE
{
  //inlineFloat("2.71828183");
  strcpy($$.name, "f2.71828183" );
};
| tPI
{
  //inlineFloat("3.14159265");
  strcpy($$.name, "f3.14159265" );
};
| tLN '(' expression ')'
{
  if( isFloatIMM($3.name) )
    {
      addCompilerMessage( "ln(FloatIMM): compile-time operation", 0 );

      if( atof(stripFirst($3.name).c_str()) <= 0 )
	{
	  addCompilerMessage( "Natural Log Domain Error", 3 );
	}
      float tmp_v = log(atof(stripFirst($3.name).c_str()));
     
      inlineFloat( string( "f" ) + to_string(tmp_v).c_str());
      strcpy($$.name, "_FAC");
    }
  else if( isFAC($3.name) )
    {
      addComment( "ln( FAC )" );
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($3.name) )
    {
      addComment( "ln( FloatID )" );
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // FP ->FAC
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isWordID($3.name) )
    {
      addComment( "ln( WordID )" );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false  );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)) + " +1", 3, false  );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntID($3.name) )
    {
      addComment( "ln( IntID )" );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_TYA, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!pos+", 2, false );
      // result is negative
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!pos:", 0, true );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_JSR + "$BC44" + commentmarker + "signed word16 -> FAC", 3, false );
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name) )
    {
      addComment( "ln(UintID)" );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isXA($3.name) )
    {
      addComment( "ln( XA )" );
      addAsm( str_TAY, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addComment( "ln( A )" );
      addAsm( str_TAY, 1, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "WORD -> FAC", 3, false );
      addAsm( str_JSR + "$B9EA" + commentmarker + "ln(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isUintIMM($3.name) )
    {
      addCompilerMessage( "ln(UintIMM): compile-time operation", 0 );
      float tmp_v = log(atof(stripFirst($3.name).c_str()));
      inlineFloat(string("f") + to_string(tmp_v).c_str());
      strcpy($$.name, "_FAC");
    }
  else if( isIntIMM($3.name) )
    {
      addCompilerMessage( "Natural Log: Domain Error", 3 );
    }
  else if( isWordIMM($3.name) )
    {
      addCompilerMessage( "ln(WordIMM): compile-time operation", 0 );
      float tmp_v = log(atof(stripFirst($3.name).c_str()));
      inlineFloat(string("f") + to_string(tmp_v).c_str());
      strcpy($$.name, "_FAC");
    }
  else
    {
      addCompilerMessage( "trying to calculate natural log of unknown type", 3);
    }
}
| tSIN '(' expression ')'
{
  if( isFAC($3.name) )
    {
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($3.name) )
    {
      addComment( "sin( FloatID )" );
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // FP ->FAC
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
  else if( isWordID($3.name) )
    {
      addComment( "sin( WordID )" );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false  );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)) + " +1", 3, false  );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntID($3.name) )
    {
      addComment( "sin( IntID )" );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_TYA, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!pos+", 2, false );
      // result is negative
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!pos:", 0, true );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_JSR + "$BC44" + commentmarker + "signed word16 -> FAC", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name) )
    {
      addComment( "sin(UintID)" );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_LDA + "#$00", 2, false );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isXA($3.name) )
    {
      addComment( "sin( XA )" );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STA + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addComment( "sin( A )" );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STA + "$63", 2, false );      
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "sin(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntIMM($3.name) || isUintIMM($3.name) || isWordIMM($3.name) || isFloatIMM($3.name)  )
    {
      float tmp_v = sin(atof(stripFirst($3.name).c_str()));     
      inlineFloat( string( "f" ) + to_string(tmp_v).c_str());
      strcpy($$.name, "_FAC");
    }
  else
    {
      addCompilerMessage( "trying to calculate sine of unknown type", 3);
    }
};
| tCOS '(' expression ')'
{
  if( isFAC($3.name ) )
    {
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false ); 
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($3.name) )
    {
      int base_address = getAddressOf($3.name);
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false  );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)) + " +1", 3, false  );
      addComment( "https://c64os.com/post/floatingpointmath" );
	addAsm( str_STY + "$63", 2, false );
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntID($3.name) )
    {
      addComment( "cos( IntID )" );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_TYA, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!pos+", 2, false );
      // result is negative
      addAsm( str_LDX + "#$FF", 2, false );
      //addAsm( str_DEX, 1, false );
      addAsm( "!pos:", 0, true );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_JSR + "$BC44", 3, false );
      
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name) )
    {
      addComment( "cos( UintID )" );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_LDA + "#$00", 2, false );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isXA($3.name) )
    {
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STA + "$63", 2, false );      
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STA + "$63", 2, false );      
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "cos(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntIMM($3.name) || isUintIMM($3.name) || isWordIMM($3.name) || isFloatIMM($3.name)  )
    {
      float tmp_v = cos(atof(stripFirst($3.name).c_str()));     
      inlineFloat( string( "f" ) + to_string(tmp_v).c_str());
      strcpy($$.name, "_FAC");
    }
  else    
    {
      addCompilerMessage( "trying to calculate cosine of unknown type" );
    }
};
| tTAN '(' expression ')'
{
  if( isFloatID($3.name)  )
    {
      // float
      int base_address = getAddressOf($3.name);
      addAsm( str_LDA + "#<" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(getAddressOf($3.name)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isFAC($3.name) )
    {
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false  );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)) + " +1", 3, false  );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STY + "$63", 2, false );      
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntID($3.name) )
    {
      addComment( "tan( IntID )" );
      addComment( "https://skoolkid.github.io/sk6502/c64rom/asm/B391.html" );

      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_TYA, 1, false );
      addAsm( str_ASL, 1, false );
      addAsm( str_BCC + "!pos+", 2, false );
      // result is negative
      addAsm( str_LDX + "#$FF", 2, false );
      addAsm( "!pos:", 0, true );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_JSR + "$BC44", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name) )
    {
      addComment( "tan( UintID )" );
      addAsm( str_LDY + getNameOf(getAddressOf($3.name)), 3, false ); 
      addAsm( str_LDA + "#$00", 2, false );
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STY + "$63", 2, false );
      addAsm( str_STA + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isXA($3.name) )
    {
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STA + "$63", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addComment( "https://c64os.com/post/floatingpointmath" );
      addAsm( str_STA + "$63", 2, false );      
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_STX + "$62", 2, false );
      addAsm( str_LDX + "#$90", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( str_JSR + "$BC49", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "tan(FAC) -> FAC", 3, false );
      strcpy($$.name, "_FAC");
    }
  else if( isIntIMM($3.name) || isUintIMM($3.name) || isWordIMM($3.name) || isFloatIMM($3.name)  )
    {
      float tmp_v = tan(atof(stripFirst($3.name).c_str()));     
      inlineFloat( string( "f" ) + to_string(tmp_v).c_str());
      strcpy($$.name, "_FAC");
    }
  else
    {
      addCompilerMessage( "trying to calculate tangent of unknown type" );
    }
};
| '(' expression ')'
{
  strcpy( $$.name, $2.name ); 
};
| value
{
  addParserComment( string("RULE: expression: value: (") + $1.name + ")" );
  addParserComment( string($1.name) );
  strcpy($$.name, $1.name);
};
| ID
{
  addParserComment(string( "RULE: expression: ID : ") + $1.name);
  addComment( "ID: " + string($1.name) );
  int base_address = getAddressOf($1.name);
  int t = getTypeOf($1.name);
  strcpy($$.name, (string( "$" ) + toHex(getAddressOf($1.name))).c_str() );
};
| tSPRITECOLLISION '(' ')'
{
  addAsm( str_LDA + "$D01E" + commentmarker + "MOB-MOB Collision Register", 3, false );
  strcpy( $$.name, "_A" );
};
| tSPRITECOLLISION '(' expression ')'
{
  addComment( "Sprite Collision - Argument is bit# b7654321" );
  addComment( "as in ( 0x08 ) would test sprite #4" );
  
  if( isUintID($3.name) )
    {
      addAsm( str_LDA + "$D01E" + commentmarker + "MOB-MOB Collision Register", 3, false );
      //addAsm( str_AND + "$" + toHex(getAddressOf($3.name)), 3, false );
      addAsm( str_AND + getNameOf(getAddressOf($3.name)), 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addAsm( str_LDA + "$D01E" + commentmarker + "MOB-MOB Collision Register", 3, false );
      addAsm( str_AND + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isA( $3.name ) )
    {
      addCompilerMessage( "Slowest possible method... could you use an ID or IMM instead of A?", 0 );
      addAsm( str_LDY + "$02", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "$D01E" + commentmarker + "MOB-MOB Collision Register", 3, false );
      addAsm( str_AND + "$02", 2, false );
      addAsm( str_STY + "$02", 2, false );      
    }
  else
    {
      addCompilerMessage( "invalid argument for spritecollision( UintID / UintIMM )", 3 );
    }

  // 2023 06 29 - mkpellegrino - changed from ASL to STA
  //addAsm( str_STA + "$D01E", 3, false );
  //addComment( "Ack $D019 bit 4 - not sure if this needs to be done" );
  //addAsm( str_LDA + "#$04", 2, false );
  //addAsm( str_STA + "$D019", 3, false );

    
  strcpy($$.name, "_A" );
};
| tMOBBKGCOLLISION '(' expression ')'
{
  if( isUintID($3.name) )
    {
      addAsm( str_LDA + "$D01F" + commentmarker + "MOB-Background Collision Register", 3, false );
      //addAsm( str_AND + "$" + toHex(getAddressOf($3.name)), 3, false );
      addAsm( str_AND + getNameOf(getAddressOf($3.name)), 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addAsm( str_LDA + "$D01F" + commentmarker + "MOB-Background Collision Register", 3, false );
      addAsm( str_AND + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isA( $3.name ) )
    {
      addCompilerMessage( "Slowest possible method... could you use an ID or IMM instead of A?", 0 );
      addAsm( str_LDY + "$02", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "$D01F" + commentmarker + "MOB-Background Collision Register", 3, false );
      addAsm( str_AND + "$02", 2, false );
      addAsm( str_STY + "$02", 2, false );      
    }

  else
    {
      addCompilerMessage( "invalid argument for mobbkgcollision( UintID / UintIMM )", 3 );
    }
  strcpy($$.name, "_A" );
};
| tGETH '(' expression ')'
{
  addComment( "Get the High-Byte of a Word" );
  if( isWordID( $3.name ) )
    {
      //addAsm( str_LDA + ">" + $3.name, 2, false );
      int addr = getAddressOf( $3.name );
      int inst_size = 3;
      if( addr+1 < 256 ) inst_size = 2;
      //addAsm( str_LDA + "$" + string( toHex( addr+1) ), inst_size, false );
      addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($3.name))) + " +1", inst_size, false );
    }
  else if( isXA( $3.name ))
    {
      addAsm( str_TXA );
    }
  else if( isWordIMM( $3.name ) )
    {
      int v = (atoi(stripFirst($3.name).c_str()) & 0xFF00)/255;
      addAsm( str_LDA + "#$" + toHex(v), 2, false );

    }
  else
    {
      addCompilerMessage( "Cannot return 'hi-byte' of specified type", 3 );
    }
  strcpy( $$.name, "_A" );
};
| tGETL '(' expression ')'
{
  addComment( "Get the Low-Byte of a Word" );
  if( isWordID( $3.name ) )
    {
      int addr = getAddressOf( $3.name );
      int inst_size = 3;
      if( addr < 256 ) inst_size = 2;
      //addAsm( str_LDA + "$" + toHex(addr), inst_size, false );
      addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($3.name))), inst_size, false );

    }
  else if( isXA( $3.name ))
    {
      // do nothing because Lo-Byte is in A already
    }
  else if( isWordIMM( $3.name ) )
    {
      int v = atoi(stripFirst($3.name).c_str()) & 0xFF;
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
    }
  else if( isUintIMM( $3.name ) )
    {
      int v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
    }
  else if( isIntIMM( $3.name ) )
    {
      int v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
    }
  else if( isUintID( $3.name ) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 2, false );      
      addCompilerMessage("getting lo-byte of UINT not necessary", 0 );      
    }
  else if( isIntID( $3.name ) )
    {
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 2, false );      
      addCompilerMessage("getting lo-byte of INT not necessary", 0 );      
    }
  else
    {
      addCompilerMessage( "Cannot return 'lo-byte' of specified type", 3 );
    }
  strcpy( $$.name, "_A" );
};
| tSQRT '(' expression ')'
{
  int addr = getAddressOf( $3.name );
  if( isFloatID( $3.name ) )
    {
      addAsm( str_LDA + "#<" + getNameOf(addr), 2, false  );
      addAsm( str_LDY + "#>" + getNameOf(addr), 2, false  );
      
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_JSR + "$BF71" + commentmarker + "sqrt(FAC) -> FAC", 3, false );
    }
  else
    {
      addCompilerMessage( "sqrt takes a float as its argument", 3 );
    }
  strcpy($$.name, "_FAC");
};
| ID '(' parameterlist ')' 
{
  addComment( "Call a function as an expression" );
  proposed_ids_vector.push_back( new id_and_line( $1.name, countn+1 ));
  addAsm( str_JSR + $1.name, 3, false );

  // move to ID init and datatype ID init
  addComment( "Pop Return Value off of Processor Stack - 2023 04 02" );
  addComment( "Modified on 2025 06 17 to use relative labels instead of static ones" );
  // TODO: This seems...  fishy - 2023 08 05
  
  // at this point the compiler will need to know what type the function returns
  // it _could_ search through the rest of the source code until it finds it.
  // 
  
  // THIS DOES NOT ACCOUNT FOR RETURNING ANYTHING OVER 2 BYTES
  // Like Doubles, Floats, or MOBs
  addComment( "OPTIMIZE - pop the correct number of bytes off" );
  addComment( "the stack.  This can be hardcoded to match the" );
  addComment( "function." );
  
  addAsm( str_PLA ); // the number of bytes in the stack

  //  addAsm( str_CMP + "#$05", 2, false );
  //addAsm( str_BEQ + getLabel( label_vector[label_major]+1,false), 2, false ); // branch to ***
  
  addAsm( str_TAY );

  // commented out code
  addAsm( "//\t" + str_LDA + "#$00", 0, true );
  addAsm( "//\t" + str_LDX + "#$00", 0, true );	  
  addAsm( str_LAX + "#$00", 2, false );
  
  addAsm( str_CPY + "#$00", 2, false );
  addAsm( str_BEQ + "!+ +1", 2, false ); 
  addAsm( str_CPY + "#$01", 2, false );
  addAsm( str_BEQ + "!+", 2, false );

  // get 1 value and put it in X
  addAsm( str_PLA );
  addAsm( str_TAX );
  // get 1 value and put it in A
  addAsm( "!:\t" + str_PLA, 1, true  );
  //addAsm( "!:", 0, true );
  addCommentBreak(2);
  // floats will store the address of the 5 bytes in XA
  strcpy($$.name, "_XA" ); 
};
| tPEEK '(' expression ')'
{
  addComment( "tPEEK '(' expression ')' " );

  if( isARG($3.name) || isFAC($3.name) )
    {
      addCompilerMessage( "peek argument type conflict ARG/FAC", 3 );
    }
  else if( isWordID($3.name) )
    {
      addComment( "peek( WordID );" );

      int addr = hexToDecimal($3.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_LDY + "#$00", 2, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr), instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr), instr_size, false );

      instr_size = 3;
      if( addr+1 < 256 ) instr_size = 2;

      addAsm( str_LDX + getNameOf(addr) + " +1", instr_size, false );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_STX + "!++", 3, false );
      addAsm( str_BYTE + "$AD" + commentmarker + "<-- LDA Absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      
    }
  else if( isXA($3.name) )
    {
      addComment( "peek( XA );" );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_STX + "!++", 3, false );

      addAsm( str_BYTE + "$AD" + commentmarker + "<-- LDA Absolute", 1, false );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      
      
    }
  else if( isIntID($3.name) || isUintID($3.name) )
    {
      addComment( "peek( (U)IntID );" );
      addAsm( str_LDA + getNameOf(getAddressOf($3.name)), 3, false );
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_BYTE + "$A9" + commentmarker + "LDA immediate", 1, false );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
    }
  else if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      addComment( "peek( UIntIMM );" );

      int v = atoi( stripFirst($3.name).c_str() );
      addAsm(str_LDA + "$" + toHex(v), 2, false );
    }
  else if( isWordIMM($3.name ) )
    {
      int addr = atoi( stripFirst($3.name).c_str() );
      int instr_size =3;
      if( addr < 256 ) instr_size = 2;
      addAsm(str_LDA + "$"  + toHex(addr), instr_size, false );
    }
  else if( isA($3.name) )
    {
      addAsm( str_STA + "!+", 3, false );
      addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA immediate", 1, false );
      addAsm( "!:\t"+str_BYTE + "$00", 1, true );
    }
  else
    {
      addCompilerMessage( "invalid argument type", 3);
    }
  strcpy($$.name, "_A" );
}
|
;


arithmetic:
ADD
{
  addParserComment( "RULE: arithmetic ADD" );
  current_state = string("+");
  strcpy($$.name, "+" );  
}
| SUBTRACT
{
  addParserComment( "RULE: arithmetic SUBTRACT" );
  current_state = string("-");
  strcpy($$.name, "-" );
}
| MULTIPLY
{
  addParserComment( "RULE: arithmetic MULTIPLY" );
  current_state = string("*");
  strcpy($$.name, "*" );
}
| DIVIDE
{
  addParserComment( "RULE: arithmetic DIVIDE" );
  current_state = string("/");
  strcpy($$.name, "/" );
}
| EXPONENT
{
  addParserComment( "RULE: arithmetic EXPONENT" );
  current_state = string("**");
  strcpy($$.name, "**" );
}
;

relop: LT { current_state = string( "LT" );  }
| GT { current_state = string( "GT" ); }
| LE { current_state = string( "LE" ); }
| GE { current_state = string( "GE" ); }
| EQ { current_state = string( "EQ" ); }
| NE { current_state = string( "NE" ); }
;

value: FLOAT_NUM
{
  //addDebugComment(string("RULE: value: FLOAT_NUM: (") + string($1.name) + string(")") );
  strcpy($$.name, string( string("f") + $1.name).c_str());
};
| HEX_NUM
{
  /* convert the hex number to decimal */
  string N = string($1.name);
  if( N.length() > 4 )
    {
      N.erase(0,2);
      int val = hexToDecimal(N);
      string return_value = string("w") + toString(val);
      //addAsm( str_LDA + "#$" + N[2] + N[3], 2, false );
      //addAsm( str_LDX + "#$" + N[0] + N[1], 2, false );
      //strcpy( $$.name, "_XA" );
      strcpy( $$.name, return_value.c_str() );
      //addComment(string("RULE: value: HEX_NUM: (") + string($1.name) + string(")->(") + return_value + string(")") );
    }
  else
    {
      N.erase(0,2);
      int val = hexToDecimal(N);
      string return_value = string("u") + toString(val);
      //addAsm( str_LDA + "#$" + N, 2, false );
      //strcpy( $$.name, "_A" );
      strcpy( $$.name, return_value.c_str() );
      // addComment(string("RULE: value: HEX_NUM: (") + string($1.name) + string(")->(") + return_value + string(")") );
    }
};
| INT
{
  //addDebugComment(string("RULE: value: INT :") +  string($1.name));
  strcpy($$.name, $1.name);
};
| NUMBER
{
  int v = atoi($1.name);

  if( getTypeOf($1.name) != -1 )
    {
      current_variable_type = getTypeOf($1.name);
    }

  if( atoi($1.name) > 255 ) current_variable_type = 2;
  else if( atoi($1.name) < 0 ) current_variable_type = 1;
  else current_variable_type = 0;
  
  if( current_variable_type == 0 )
    {
      if( atoi($1.name) > 255 || atoi($1.name) < 0 ) addCompilerMessage( "uint out of range (0-255)", 3 );
      strcpy($$.name, string( string("u") + string($1.name)).c_str());
    }
  else if( current_variable_type == 1 )
    {
      if( atoi($1.name) > 127 || atoi($1.name) < -128 )
	{

	  addCompilerMessage( "int out of range (-128 to +127) converting to word in 2's comp.", 0 );
	  int tmp_i = atoi( $1.name );
	  tmp_i = twos_complement( tmp_i );
	  current_variable_type = 2;
	  strcpy($$.name, string( string("w") + itos(tmp_i)).c_str());	  
	}
      else
	{
	  strcpy($$.name, string( string("i") + string($1.name)).c_str());
	}
      
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

  //addDebugComment(string("RULE: value: WORD :") +  string($1.name));
  strcpy($$.name, $1.name);
}
| CHARACTER
{
  if( $1.name[1] == '\\' )
    {
      // escape codes
      switch( $1.name[2] )
	{
	case 'n':
	  addAsm( str_LDA + "#$0D", 2, false );
	  break;
	case '\"':
	  addAsm( str_LDA + "#$22", 2, false );
	  break;
	case '\'':
	  addAsm( str_LDA + "#$27", 2, false );
	  break;
	case '\\':
	  addAsm( str_LDA + "#$5C", 2, false );
	  break;	  
	  //case '0':
	  //addAsm( str_LDA + "#$00", 2, false );
	  //break;
	default:
	  addAsm( str_LDA + "#$00", 2, false );
	}
    }
  else
    {
      addAsm( str_LDA + ascii2petscii(string($1.name)[1] ), 2, false );
    }
  strcpy( $$.name, "_A" );
}
| STR
{
  addString( string("STRLBL") + itos(string_number), string($1.name).substr(1,string($1.name).length()-2), 0   );

  addAsm( str_LDA + "#<STRLBL" + itos(string_number), 2, false );
  addAsm( str_LDX + "#>STRLBL" + itos(string_number++), 2, false );
  strcpy( $$.name, "str" );
}
;

return: RETURN ';'
  {
    addAsm( str_RTS );
    

  }
| RETURN
{
  addAsm( "// MARKED_FOR_DELETION", 0, true );
  stack_is_needed = true;
  addAsm( str_TAY );
  addAsm( str_TXA );
  addAsm( str_JSR + "PUSH",3,false);
  addAsm( str_TYA );
  addAsm( str_JSR + "PUSH",3,false);} expression ';'
  {


  // if $3.name is NOT an XA ... remove the previous 5 lines
  if( !isXA($3.name) )
    {
      deletePreviousAsmUntil( "// MARKED_FOR_DELETION");
      addCompilerMessage( "Deleted Mneumonics", 0 );
    }
  addComment( "Deleted Mneumonics" );
  addComment( "Save return address locally" );
  addAsm( str_PLA, 1, false );
  addAsm( str_STA + "!rx-", 3, false );
  addAsm( str_PLA, 1, false );
  addAsm( str_STA + "!ry-", 3, false );

  int v = getAddressOf($3.name);
  if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDA + getNameOf(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_PHA );
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDA + getNameOf(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(v) + " +1", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      addCompilerMessage( "this should really be a hardcoded return value", 2 );

      
      v = atoi(stripFirst($3.name).c_str());

      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_PHA );
    }
  else if( isWordIMM($3.name) )
    {
      addCompilerMessage( "this should really be a hardcoded return value", 2 );
      v = atoi(stripFirst($3.name).c_str());
      int a_register = get_word_L( v );
      int x_register = get_word_H( v );
      addAsm( str_LDA + "#$" + toHex(a_register), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$" + toHex(x_register), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isWordID($3.name) )
    {
      v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + getNameOf(v) + " +1", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isXA($3.name) )
    {
      stack_is_needed = true;
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isFloatID($3.name) )
    {
      v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA + getNameOf(v) + " +1", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$05", 2, false );
      addAsm( str_PHA );
    }
  else if( isFloatIMM($3.name) )
    {
      addCompilerMessage( "Just hardcode the value", 3 );
    }
  else if( isFAC($3.name) )
    {
      addCompilerMessage( "FAC is an unsupported return type", 3 );
    }
  else
    {
      addCompilerMessage( "invalid return type", 3 );
    }

  addComment( "Restore return address" );
  addAsm( str_LDA + "!ry-", 3, false );
  addAsm( str_PHA, 1, false );
  addAsm( str_LDA + "!rx-", 3, false );
  addAsm( str_PHA, 1, false );
  addAsm( str_RTS );
  addAsm( string( "// returned: ") + getNameOf(getAddressOf($3.name)), 0, true );
  addComment( "Returning a value via the stack" );
  }
|
{
  //addAsm( str_RTS );
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
  // process command line arguments

  commentmarker = string( " ; ");
  setWebDialect();

  for( int i=1; i<argc; i++ )
    {
      string a=string(argv[i]);
#ifdef DEBUG
      cerr << "command line arg: " << i << " " << a << endl;
#endif
      if( a == "--memory-locations" ) arg_memory_locations  = true;
      if( a == "--no-optimize" ) arg_optimize = false;
      if( a == "--show-cycles" ) arg_show_cycles = true;
      if( a == "--no-asm-comments" ) arg_asm_comments = false;
      if( a == "--parser-comments" ) arg_parser_comments = true;
      //if( a == "--symbol-table" ) symbol_table_is_needed = true;
      if( a == "--no-labels" ) arg_show_labels = false;
      if( a == "--short-branches" ) long_branches = false;
      if( a == "--debug" ) { debug_flag_is_on = true; arg_debug_comments = true; }
      if( a == "--basic" || a == "--basicupstart" ) basic_upstart = true;
      if( a == "--scanf-buffer-size" )
	{
	  scanf_buffer_size = atoi( argv[i+1] );
	  if( scanf_buffer_size > 254 || scanf_buffer_size < 1 )
	    {
	      addCompilerMessage( "invalid scanf buffer size, defaulting to 16.", 0 );
	      scanf_buffer_size = 16;
	    }
	  i++;
	}
      if( a == "--unsafe-ifs" )
	{
	  arg_unsafe_ifs = true;
	}
      if( a == "--unsafe-math" )
	{
	  arg_unsafe_math = true;
	  addCompilerMessage( "Unsafe Math", 1);
	}
      if( a == "--kick" )
	{
	  kick = true;
	  setKickDialect();
	  commentmarker = string(" // ");
	}
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
	  input_file_name = string( argv[i+1] );
	  i++;
	}
      if( a == "--help" )
	{
	  cerr << "\n\nusage:" << endl << argv[0] << " <options> inputfile.c outputfile.asm\n\n"
	       << "\t--memory-locations\twill show the memory addresses of the assembler instructions\n" 
	       << "\t--unsafe-math\tcompile with math operations that are potentially destructive to ZP\n" 
	       << "\t--no-labels\t\twill supress the labels (and turn them into memory addresses)\n" 
	       << "\t--no-asm-comments\twill supress most comments pertaining to flow of control\n" 
	       << "\t--no-optimize\twill generate code with NO optimizations\n" 
	       << "\t--parser-comments\twill show the comments intended to help debug the parser\n"
	       << "\t--kick\t\t\tcreate .asm file that is compatible with Kick Assembler\n"
	       << "\t--basic\t\t\tput BASIC Upstart code at $0801\n"
	       << "\t--help\t\t\tthis message\n" 
	       << "\t--code-segment address\tsets the start of code segment to a memory addres (default is 49152)\n"
	       << "\t--data-segment address\tsets the start of data segment to a memory addres (default is 828)\n"
	       << "\t--scanf_buffer_size (1-254)\tthe size of the buffer needed for scanf... default is 16.\n\n" << endl;
	  exit(-1);
	}
    }

  //  FILE* file_pointer = fopen(input_file_name.c_str(), "a");
 
  current_state = string("unknown" );
  current_code_location = code_start;
  
      
  yyparse(); 
  
  int i=0;
  //for(i=0;i<count;i++){free(symbol_table[i].id_name);free(symbol_table[i].type);}
  
  if(sem_errors>0)
    {
      printf( commentmarker.c_str() );
      printf(" *** Semantic analysis completed with %d errors\n", sem_errors);
      for(int i=0; i<sem_errors; i++)
	{
	  printf("\t - %s", errors[i]);
	}
    }
  else
    {
      //printf("Semantic analysis completed with no errors");
    }

  if( load_is_needed )
    {
      addAsm( "LOAD:", 0, true );
      saveReturnAddress();

      // save $02/$03 in software stack (pretty slow!)
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );

      addAsm( str_PLA );
      addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + " +1", 3, false );

      addComment( "SETFN" );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_JSR + "$FFBD", 3, false );


      addComment( "SETFLS" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_TAY );
      addAsm( str_LDX + "#$08", 2, false );
      addAsm( str_JSR + "$FFBA", 3, false );
      
      addComment( "OPEN" );
      addAsm( str_JSR + "$FFC0", 3, false );
      
      addComment( "CHKIN" );
      addAsm( str_LDX + "#$03", 2, false );
      addAsm( str_JSR + "$FFC6", 3, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_TYA );
      addAsm( str_PHA );
      addAsm( str_JSR + "$FFCF", 3, false );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_STA + "($02),Y", 2, false );
      addAsm( str_INY );
      // ???
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_CPY + "#$00", 2, false );
      // ???
      addAsm( str_BNE + getLabel( label_vector[label_major]-2, false), 2, false );

      addComment( "close the file" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_JSR + "$FFC3", 3, false );
      addAsm( str_JSR + "$FFCC", 3, false );
      
      // restore $02/$03
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$02", 2, false );
      restoreReturnAddress();

      addAsm( str_RTS );
    }


  if( load16_is_needed )
    {
      addAsm( "LOAD16I:", 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );
      addAsm( "LOAD16L:", 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );
      addAsm( "LOAD16A:", 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );

      
      addComment( "Load more that 255 bytes from disk" );
      addAsm( "LOAD16:", 0, true );
      saveReturnAddress();

      
      // save $02/$03 in software stack (pretty slow!)
      addComment( "save $02/$03" );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      //addAsm( str_CLC );

      
      addComment( "number of bytes" );
      addAsm( str_PLA );
      addAsm( str_STA + "LOAD16L+1", 3, false );
      addAsm( str_PLA );
      addAsm( str_STA + "LOAD16L", 3, false );

      addComment( "memory address" );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      
      // clear out the index
      addComment( "clear out the index" );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "LOAD16I", 3, false );
      addAsm( str_STA + "LOAD16I+1", 3, false );

	  
      addComment( "SETFN" );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_JSR + "$FFBD", 3, false );


      addComment( "SETFLS" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_TAY );
      addAsm( str_LDX + "#$08", 2, false );
      addAsm( str_JSR + "$FFBA", 3, false );
      
      addComment( "OPEN" );
      addAsm( str_JSR + "$FFC0", 3, false );
      
      addComment( "CHKIN" );
      addAsm( str_LDX + "#$03", 2, false );
      addAsm( str_JSR + "$FFC6", 3, false );

      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );


      // TOP OF LOOP
      addAsm( generateNewLabel(), 0, true );

      addAsm( str_LDA + "LOAD16I+1", 3, false );
      addAsm( str_CMP + "LOAD16L+1", 3, false );
      addAsm( str_BYTE + "$D0, $06", 2, false );
      addAsm( str_LDA + "LOAD16I", 3, false );
      addAsm( str_CMP + "LOAD16L", 3, false );
      addAsm( str_BYTE + "$90, $03", 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major], false), 3, false );

      addComment( "read a byte from disk" );
      addAsm( str_JSR + "$FFCF", 3, false );


      addComment( "poke it into memry" );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_STA + "($02),Y", 2, false );
      
      addComment( "add #$01 to $02/$03 (the address)" );
      addAsm( str_CLC );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_ADC + "$02", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );
      //addAsm( str_CLC );

      addComment( "add #$01 to LOAD16I/LOAD16I+1 (the index)" );
      addAsm( str_CLC );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_ADC + "LOAD16I", 3, false );
      addAsm( str_STA + "LOAD16I", 3, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_ADC + "LOAD16I+1", 2, false );
      addAsm( str_STA + "LOAD16I+1", 2, false );
      //addAsm( str_CLC );
      
      addAsm( str_JMP + getLabel( label_vector[label_major]-2, false), 3, false );
      
      // BOTTOM OF LOOP
      addAsm( generateNewLabel(), 0, true );

      addComment( "close the file" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_JSR + "$FFC3", 3, false );
      addAsm( str_JSR + "$FFCC", 3, false );
      
      // restore $02/$03
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$02", 2, false );
      restoreReturnAddress();

      addAsm( str_RTS );

    }

  
  if( sidirq_is_needed )
    {
      //music_play_addr = atoi( stripFirst( $5.name ).c_str() );

      addComment( "This is the SID Player Interrupt Routine" );
      addAsm( "SIDIRQ:", 0, true );
      addAsm( str_ASL + "$D019", 3, false );

      if( sid_was_imported )
	{
	  addAsm( str_JSR + "music.play" + commentmarker + "play_music routine", 3, false );
	}
      else
	{
	  addAsm( str_JSR + "$" + toHex( music_play_addr ) + commentmarker + "play_music routine", 3, false );
	}
      addAsm( str_JMP + "$EA31" + commentmarker + "return to normal operation", 3, false );
    }
  if( bin2bit_is_needed )
    {
      addAsm( string("BIN2BIT:\t\t") + commentmarker + "Convert an integer in A to the Ath bit", 0, true );
      saveReturnAddress();
      // ==================================================================================
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addComment( "top-of-loop:" );
      addAsm( str_ROL );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );
      addAsm( str_PHA + commentmarker + "return value on processor stack", 1, false);// the return value will be on the stack
      // ==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( signed_comparison_is_needed )
    {
      stack_is_needed = true;
      addAsm( string("SIGNEDCMP: ") + commentmarker + string(" Signed Comparison"), 0, true );
      saveReturnAddress();
      // ==================================================================================

      // save $02/$03 in software stack (pretty slow!)
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      
      
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false ); 
      addAsm( str_PLA ); // OP2
      addAsm( str_STA + "$03", 2, false );

      
      addAsm( str_EOR + "$02", 2, false);
      addAsm( str_ROL ); // C is now set (if warrented)
      addAsm( str_BCS + "!+", 2, false );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addComment( "SGNCMPSKIP" );
      addAsm( "!:\t" + str_LDA + "$02", 2, true );
      addAsm( str_CMP + "$03", 2, false );
      addAsm( str_PHP );// push the status register to the stack with the correct values after cmp

      // restore $02/$03
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$02", 2, false );

      
      // ==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( word2dec_is_needed )
    {
      addAsm( "HTD_STR:", 0, true );
      addAsm( str_BYTE + "$00, $00, $00, $00, $00, $00, $00", 7, false );
      addComment( "------------------------------------------------------------" );
      addComment( "This chunk of code is by: Andrew Jacobs, 28-Feb-2004" );
      addComment( "Taken from: http://6502.org/source/integers/hex2dec-more.htm" );
      addComment( "------------------------------------------------------------" );
      addAsm( "HTD_IN:", 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );
      addAsm( "HTD_OUT:", 0, true );
      addAsm( str_BYTE + "$00, $00, $00", 3, false );
      addAsm( string("WORD2DEC:\t\t") + commentmarker + "2 Byte Word to Decimal", 0, true );

      saveReturnAddress();
      // ==================================================================================

      addAsm( str_SED );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "HTD_OUT", 3, false );
      addAsm( str_STA + "HTD_OUT+1", 3, false );
      addAsm( str_STA + "HTD_OUT+2", 3, false );
      addAsm( str_LDX + "#$10", 2, false );
      addAsm( "CNVBIT:",0,true );
      addAsm( str_ASL + "HTD_IN", 3, false );
      addAsm( str_ROL + "HTD_IN+1", 3, false );
      addAsm( str_LDA + "HTD_OUT", 3, false );
      addAsm( str_ADC + "HTD_OUT", 3, false );
      addAsm( str_STA + "HTD_OUT", 3, false );
      addAsm( str_LDA + "HTD_OUT+1", 3, false );
      addAsm( str_ADC + "HTD_OUT+1", 3, false );
      addAsm( str_STA + "HTD_OUT+1", 3, false );
      addAsm( str_LDA + "HTD_OUT+2", 3, false );
      addAsm( str_ADC + "HTD_OUT+2", 3, false );
      addAsm( str_STA + "HTD_OUT+2", 3, false );
      addAsm( str_DEX );
      addAsm( str_BNE + "CNVBIT", 2, false );
      addAsm( str_CLD );
      addComment( "------------------------------------------------------------" );
      addAsm( str_LDA + "HTD_OUT", 3, false);
      addAsm( str_PHA );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_ORA + "#$30", 2, false);
      addAsm( str_STA + "HTD_STR+4", 3, false);
      addAsm( str_PLA );
      addAsm( str_AND + "#$0F", 2, false);
      addAsm( str_ORA + "#$30", 2, false);
      addAsm( str_STA + "HTD_STR+5", 3, false);
      

      addAsm( str_LDA + "HTD_OUT+1", 3, false);
      addAsm( str_PHA );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );

      addAsm( str_ORA + "#$30", 2, false);
      addAsm( str_STA + "HTD_STR+2", 3, false);
      addAsm( str_PLA );
      addAsm( str_AND + "#$0F", 2, false);
      addAsm( str_ORA + "#$30", 2, false);
      addAsm( str_STA + "HTD_STR+3", 3, false);

      addAsm( str_LDA + "HTD_OUT+2", 3, false);
      addAsm( str_PHA );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );

      addAsm( str_ORA + "#$30", 2, false);
      addAsm( str_STA + "HTD_STR", 3, false);
      addAsm( str_PLA );
      addAsm( str_AND + "#$0F", 2, false);
      addAsm( str_ORA + "#$30", 2, false);
      addAsm( str_STA + "HTD_STR+1", 3, false);

      
      // now put it into a 7 byte buffer
      // (6 bytes for digits and a null termination)
      //       00 00 03 04 05 06 00
      // then convert them to petcii
      //       30 30 33 34 35 36 00
      // find first non 30 from the left
      //       30 30 33 34 35 36 00
      //             ^^
      // return this memory location in stack
      // low  then   high
      
      // far left - no need fpr high byte
      /* addAsm( str_LDA + "HTD_OUT+1", 3, false ); */
      /* addAsm( str_CMP + "#$00", 2, false ); */
      /* addAsm( "BEQ BYTE_2", 2, false ); */
      /* addAsm( str_AND + "#$0F", 2, false ); */
      /* addAsm( str_CLC ); */
      /* addAsm( str_ADC + "#$30", 2, false ); */
      // ==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( unsigned_signed_cmp_is_needed )
    {
      stack_is_needed = true;      
      addAsm( string( "USCMP:\t\t" ) + commentmarker + "Uint/Int Comparison", 0, true );
      saveReturnAddress();
      // ==================================================================================
      addAsm( str_LDA + "$05", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      
      // BNE: #$D0   BEQ: #$F0   BCC: #$B0   BCS: #$90
      addAsm( str_PLA ); // pull the signed value off the stack
      addAsm( str_STA + "$05", 2,false ); // save the signed byte in Zeropage ($0005)
      addAsm( str_AND + "#$80", 2, false );          // SIGNED INT: F3 -> 80 (it's negative)
      addAsm( str_CMP + "#$80", 2, false );          // IF IT's NEGATIVE
      addAsm( str_PLA ); // get the unsigned byte
      //addAsm( str_BYTE + "$B0, $0A" + commentmarker + "BCS +10", 2, false );  // JumpRel 10 bytes fwd   -> (***)
      addAsm( str_BCS + "!+", 2 );
      addAsm( str_CMP + "$05", 2, false );           // A = UINT
      //addAsm( str_BYTE + "$B0, $06" + commentmarker + "BCS +6", 2, false );  // JumpRel +6             -> (+++)
      addAsm( str_BCS + "!+", 2 );
      //addAsm( str_BYTE + "$90, $04" + commentmarker + "BCC +4", 2, false );  // JumpRel +4             -> (+++)
      addAsm( str_BCC + "!+", 2 );
      addAsm( str_LDA + string("#$01"), 2, false );          // A=1                       (***)
      addAsm( str_CMP + "#$00", 2, false );          // CMP A with 0
      addAsm( "!:\t" + str_PHP, 1, true);

      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$05", 2, false );
      // ==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );

    }
  if( float_swap_space_is_needed )
    {
      addComment( "Floating Point Swap Space" );
      addAsm( "!fp0:\t .byte $00, $00, $00, $00, $00", 5, true );
      addAsm( "!fp1:\t .byte $00, $00, $00, $00, $00", 5, true );
    }
  if( div16_is_needed )
    {
      // 16-bit division
      // NUM1  / NUM2  = RESULT + REMAINDER 
      // FC/FB / FE/FD = FC/FB     03/02
      addAsm( "_DIV16_FD:", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( "_DIV16_FE:", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( "_DIV16_FB:", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( "_DIV16_FC:", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( "DIV16:", 0, true );
      
      //addAsm( str_SEI );
      
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_LDX + "#$10", 2, false );
      // Label 1
      //addAsm( "_DIV16_L1:", 0, true );
      addAsm( "!:", 0, true );
      addAsm( str_ASL + "_DIV16_FB", 3, false );
      addAsm( str_ROL + "_DIV16_FC", 3, false );
      addAsm( str_ROL + "$02", 2, false );
      addAsm( str_ROL + "$03", 2, false );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_SEC );
      addAsm( str_SBC + "_DIV16_FD", 3, false );
      addAsm( str_TAY );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_SBC + "_DIV16_FE", 3, false );
      //addAsm( str_BYTE + "$90, $06" + commentmarker + "BCC Label2", 2, false ); // BCC Label 2
      //addAsm( str_BCC + "_DIV16_L2", 2, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_STY + "$02", 2, false );
      addAsm( str_INC + "_DIV16_FB", 3, false );
      // Label 2
      //addAsm( "_DIV16_L2:", 0, true );
      addAsm( "!:", 0, true );
      addAsm( str_DEX );
      //addAsm( str_BYTE + "$D0, $E3", 2, false ); // BNE Label 1
      //addAsm( str_BNE + "_DIV16_L1", 2, false );
      addAsm( str_BNE + "!--", 2, false );
      //addAsm( str_CLI );
      
      addAsm( str_RTS );

    }
  if( multicolour_plot_is_needed )
    {
      // from p164 of Advanced Machine Code Programming for the Commodore 64
      addComment( "vvv------------------------------------vvv" );
      addComment( "vvv from p164 of Advanced Machine Code vvv" );
      addComment( "vvv  Programming for the Commodore 64  vvv" );
      addComment( "vvv w/ some changes to deal with banks vvv" );
      addComment( "vvv------------------------------------vvv" );
      addAsm( commentmarker + "x = $FA, y = $FC, colour = $FD", 0, true );
      addAsm( commentmarker + "STORE is at $FE(l), $FF(h)", 0, true);
      addAsm( commentmarker + "LOC is at $02(l), $03(h)", 0, true);
      
      addAsm( "MCPLOT:", 0, true );
      addAsm( "#if SAFEMCPLOT", 0, true );
      addAsm( str_SEI );
      addAsm( "#endif", 0, true );

      // -------------------------------------------------
      // LDX #$03  - 2 cycles
      // LDA $FA   - 3 cycles
      // SAX $FE   - 3 cycles - 2 bytes
      //
      //                  OR
      //
      addAsm( str_LDA + "$FA" + commentmarker + "xcoord", 2, false );  // 3 cycles
      addAsm( str_AND + "#$03", 2, false );  // 2 cycles
      addAsm( str_STA + "$FE" + commentmarker + "store", 2, false ); // 3 cycles

      addAsm( str_LDA + string("#$00"), 2, false );
      addAsm( str_STA + "$02" + commentmarker + "loc", 2, false );
      addAsm( str_STA + "$FF" + commentmarker + "store + 1", 2, false );
      addAsm( str_LDA + "$FD" + commentmarker + "colcode", 2, false );
      addAsm( str_CLC );
      addAsm( str_ROR );
      // loop here
      addAsm( "!:\t" + str_ROR, 1, true );
      addAsm( str_ROR );
      addAsm( str_DEC + "$FE" + commentmarker + "store", 2, false );
      addAsm( str_BPL + "!-", 2, false );
      addAsm( str_STA + "$50" + commentmarker + "mask", 2, false );
      addAsm( str_LDA + "$FA" + commentmarker + "xcoord", 2, false );  // 3 cycles
      addAsm( str_AND + "#$FC", 2, false );
      addAsm( str_ASL );
      addAsm( str_ROL + "$FF" + commentmarker + "store + 1", 2, false );
      addAsm( str_STA + "$FE" + commentmarker + "store", 2, false );
      addAsm( str_LDA + "$FC" + commentmarker + "ycoord", 2, false );  // 3 cycles
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_STA + "$03" + commentmarker + "loc + 1", 2, false );
      addAsm( str_LSR );
      addAsm( str_ROR + "$02" + commentmarker + "loc", 2, false );
      addAsm( str_LSR );
      addAsm( str_ROR + "$02" + commentmarker + "loc", 2, false );
      addAsm( str_CLC );
      
      addAsm( str_ADC + "$03" + commentmarker + "loc + 1", 2, false );
      addAsm( str_STA + "$03" + commentmarker + "loc + 1", 2, false );
      addAsm( str_LDA + "$FC" + commentmarker + "ycoord", 2, false );  // 3 cycles
      addAsm( str_AND + "#$07", 2, false );
      addAsm( str_ADC + "$02" + commentmarker + "loc", 2, false );
      addAsm( str_ADC + "$FE" + commentmarker + "store ", 2, false );
      addAsm( str_STA + "$02" + commentmarker + "loc", 2, false );

      addAsm( str_LDA + "$03" + commentmarker + "loc+1", 2, false );  // 3 cycles

      //addAsm( str_LDA + "$03; loc + 1", 2, false );
      addAsm( str_ADC + "$FF" + commentmarker + "store + 1", 2, false );
      

      addAsm( str_STA + "$22" + commentmarker + "tmpstore", 2, false );
      addAsm( commentmarker + string(" These subroutines I added to calculate the addresses based on VICII settings"), 0, true );
      bnkmem_is_needed=true;
      addAsm( str_JSR + "BNKMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00, #$40, #$80, #$C0 based on Bank #      
      addAsm( str_CLC );
      addAsm( str_ADC + "$22", 2, false );
      addAsm( str_STA + "$22" + commentmarker + "tmpstore", 2, false );
      bmpmem_is_needed = true;
      addAsm( str_JSR + "BMPMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00 or a #$20
      addAsm( str_CLC );
      addAsm( str_ADC + "$22" + commentmarker + "tmpstore", 2, false );
      //addAsm( str_ADC + "$03; loc + 1", 2, false );
      //addAsm( "; =========================", 0, true );


      addAsm( str_STA + "$03" + commentmarker + "loc + 1", 2, false );
      
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_LDA + "($02),Y", 2, false );
      //addAsm( str_LDA + "($02),Y", 2, false );
      addAsm( str_ORA + "$50" + commentmarker + "mask", 2, false );
      addAsm( str_STA + "($02),Y" + commentmarker + "what is @ $50?", 2, false );

      addAsm( "#if SAFEMCPLOT", 0, true );
      addAsm( str_CLI );
      addAsm( "#endif", 0, true );

      addAsm( str_RTS );
      addComment( "^^^------------------------------------^^^" );
      addComment( "^^^ from p164 of Advanced Machine Code ^^^" );
      addComment( "^^^  Programming for the Commodore 64  ^^^" );
      addComment( "^^^ w/ some changes to deal with banks ^^^" );
      addComment( "^^^------------------------------------^^^" );

    }
  if( getplot_is_needed )
    {
      // from p164 of Advanced Machine Code Programming for the Commodore 64 
      addComment( "vvv------------------------------------vvv" );
      addComment( "vvv from p164 of Advanced Machine Code vvv" );
      addComment( "vvv  Programming for the Commodore 64  vvv" );
      addComment( "vvv w/ some changes to deal with banks vvv" );
      addComment( "vvv------------------------------------vvv" );
      addAsm( commentmarker + string("       L    H"), 0, true );
      addAsm( commentmarker + string(" x = ($FA, $FB), y = $FC"), 0, true );
      addAsm( "GETPLOT:", 0, true );



      addAsm( str_SEI );
      addAsm( str_LDA + "$FA", 2, false ); 

      //addAsm( str_LDA + "$FA", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$5C", 2, false );

      
      addAsm( str_LDA + "#$00", 2, false ); 
      //addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STA + "$5D", 2, false );
      addAsm( str_LDA + "$FD", 2, false ); 

      //addAsm( str_LDA + "$FD", 2, false );
      addAsm( str_CLC );
      addAsm( str_ROR );
      // loop here
      addAsm( "!:\t" + str_ROR, 1, true);
      addAsm( str_ROR );
      addAsm( str_DEC + "$5C", 2, false );
      addAsm( str_BPL + "!-", 2, false );
      //addAsm( str_BYTE + "$10, $FA", 2, false );  // BPL "loop here"

      addAsm( str_STA + "$50", 2, false );
      addAsm( str_LDA + "$FA", 2, false ); 
      //addAsm( str_LDA + "$FA", 2, false );
      addAsm( str_AND + "#$FC", 2, false );
      addAsm( str_ASL );
      addAsm( str_ROL + "$5D", 2, false );
      addAsm( str_STA + "$5C", 2, false );
      addAsm( str_LDA + "$FC", 2, false ); 
      //addAsm( str_LDA + "$FC", 2, false );
      
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_LSR );
      addAsm( str_ROR + "$02", 2, false );
      addAsm( str_LSR );
      addAsm( str_ROR + "$02", 2, false );
      addAsm( str_CLC );
      
      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_LDA + "$FC", 2, false ); 

      addAsm( str_AND + "#$07", 2, false );
      addAsm( str_ADC + "$02", 2, false );
      addAsm( str_ADC + "$5C", 2, false );
      addAsm( str_STA + "$02", 2, false );      

      addAsm( str_LDA + "$03", 2, false ); 
      addAsm( str_ADC + "$5D", 2, false );
      addAsm( str_STA + "$03", 2, false );
      bnkmem_is_needed=true;
      addComment( "OPTIMIZE" );
      addComment( "After this call, A should contain #$00, #$40, #$80, or #$C0" );
      addAsm( str_JSR + "BNKMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00, #$40, #$80, #$C0 based on Bank #
      addAsm( str_CLC ); 
      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );
      bmpmem_is_needed = true;
      addComment( "OPTIMIZE" );
      addComment( "After this call, A should contain a #$00 or #$20" );
      addAsm( str_JSR + "BMPMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00 or a #$20
      addAsm( str_CLC );      

      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );
      
      addAsm( str_CLI );
      // -----------------------------------

 
      addAsm( str_RTS );
      addComment( "^^^------------------------------------^^^" );
      addComment( "^^^ from p164 of Advanced Machine Code ^^^" );
      addComment( "^^^  Programming for the Commodore 64  ^^^" );
      addComment( "^^^ w/ some changes to deal with banks ^^^" );
      addComment( "^^^------------------------------------^^^" );

    }

  if( pow16_is_needed )
    {
      mul16_is_needed = true;
      addAsm( "!lv_arg0:\t" + str_BYTE + "$00, $00", 2, true );
      addAsm( "!lv_arg1:\t" + str_BYTE + "$00, $00", 2, true );
      addAsm( "!lv_ret:\t" + str_BYTE + "$00, $00", 2, true );
      addAsm( "!lv_mem0:\t" + str_BYTE + "$00, $00", 2, true );

      addAsm( "pow16:", 0, true );
      addAsm( str_PLA, 1, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_TAY, 1, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "!lv_arg1-", 3, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "!lv_arg0- +1", 3, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "!lv_arg0-", 3, false );
      addAsm( str_TYA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false );

      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( str_STA + "!lv_ret-", 3, false );
      addAsm( str_STX + "!lv_ret- +1", 3, false );
      addAsm( str_STX + "!lv_mem0-", 3, false );
      addAsm( str_STX + "!lv_mem0- +1", 3, false );

      addAsm( str_LDA + "!lv_arg1- +1", 3, false );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_LDA + "!lv_arg1-", 3, false );
      addAsm( str_CMP + "#$01", 2, false );
      addAsm( "!:\t" + str_BNE + "!_skip+", 2, true );
      addAsm( str_LDA + "!lv_arg0-", 3, false );
      addAsm( str_LDX + "!lv_arg0- +1", 3, false );
      addAsm( str_STA + "!lv_ret-", 3, false );
      addAsm( str_STX + "!lv_ret- +1", 3, false );
      addAsm( "!_skip:\t" + str_LDA + "!lv_arg1- +1", 3, true );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BNE + "!+", 2, false );
      addAsm( str_LDA + "!lv_arg1-", 3, false );
      addAsm( str_CMP + "#$01", 2, false );
      addAsm( "!:\t" + str_BCC + "!+++", 2, true );
      addAsm( str_BEQ + "!+++", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "!lv_mem0-", 3, false );
      addAsm( str_STA + "!lv_mem0- +1", 3, false );
      addAsm( "!:\t" + str_LDA + "!lv_mem0- +1", 3, true );
      addAsm( str_CMP + "!lv_arg1- +1", 3, false );
      addAsm( str_BNE + "!+", 2, false );


      
      addAsm( str_LDA + "!lv_mem0-", 3, false );
      addAsm( str_CMP + "!lv_arg1-", 3, false );
      addAsm( "!:\t" + str_BCS + "!+", 2, true );
      addAsm( str_LDA + "!lv_ret-", 3, false );
      addAsm( str_STA + "_MUL16_FB", 3, false );
      addAsm( str_LDA + "!lv_ret- +1", 3, false );
      addAsm( str_STA + "_MUL16_FC", 3, false );

      
      addAsm( str_LDA + "!lv_arg0-", 3, false );
      addAsm( str_STA + "_MUL16_FD", 3, false );
      addAsm( str_LDA + "!lv_arg0- +1", 3, false );
      addAsm( str_STA + "_MUL16_FE", 3, false );
      addAsm( str_JSR + "MUL16", 3, false );
      addAsm( str_LDA + "MUL16R", 3, false );
      addAsm( str_LDX + "MUL16R +1", 3, false );
      addAsm( str_STA + "!lv_ret-", 3, false );
      addAsm( str_STX + "!lv_ret- +1", 3, false );
      addAsm( str_CLC, 1, false );
      addAsm( str_LDA + "!lv_mem0-", 3, false );
      addAsm( str_ADC + "#$01", 2, false );
      addAsm( str_STA + "!lv_mem0-", 3, false );
      addAsm( str_LDA + "!lv_mem0- +1", 3, false );
      addAsm( str_ADC + "#$00", 2, false );
      addAsm( str_STA + "!lv_mem0- +1", 3, false );
      addAsm( str_JMP + "!--", 3, false );
      addAsm( "!:\t" + str_PLA, 1, true );
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_TAY, 1, false );
     
      addAsm( str_LDA + "!lv_ret-", 3, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_LDA + "!lv_ret- +1", 3, false );
      addAsm( str_PHA, 1, false );

      addAsm( str_TYA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_RTS, 1, false );
 
    }
  if( pow8_is_needed )
    {
      umul_is_needed = true;
      addAsm( "!lv_arg0:\t.byte $00", 1, false );
      addAsm( "!lv_mem0:\t.byte $00", 1, false );
      addAsm( "!lv_mem1:\t.byte $00", 1, false );
      addAsm( "pow8:", 0, true );
      
      addAsm( str_PLA, 1, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_TAY, 1, false );

      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "!lv_arg1+", 3, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "!lv_arg0-", 3, false );
      
      addAsm( str_TYA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false );
      
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "!lv_mem0-", 3, false );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "!lv_mem1-", 3, false );
      addAsm( "!:\t" + str_LDA + "!lv_mem1-", 3, true );
      addAsm( str_BYTE + "$C9" + commentmarker + "<-- CMP Immediate", 1, false );
      addAsm( "!lv_arg1:", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
	      
      addAsm( str_BCS + "!+", 2, false );
      
      addAsm( str_LDX + "!lv_mem0-", 3, false );

      
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_LDY + "$03", 2, false );
      addAsm( str_STX + "$02", 2, false );
      addAsm( str_LDA + "!lv_arg0-", 3, false );
      
      
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_JSR + "UMUL", 3, false );
      addAsm( str_LDX + "$03", 2, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STY + "$03", 1, false );
      addAsm( str_TXA, 1, false );
      
      addAsm( str_STA + "hack", 3, false );
      addAsm( str_INC + "!lv_mem1-", 3, false );
      addAsm( str_JMP + "!-", 3, false );
      
      addAsm( "!:\t" + str_PLA, 1, true );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_STA + "$02", 2, false );

      
      addAsm( str_PLA, 1, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_TAY, 1, false );

      addAsm( str_BYTE + "$A9" + commentmarker + "<-- LDA Immediate", 1, false );
      addAsm( "hack:", 0, true ); // lv_mem0
      addAsm( str_BYTE + "$00", 1, false );
      
      addAsm( str_PHA, 1, false );
      
      addAsm( str_TYA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false );
      
      addAsm( str_RTS, 1, false );
    }
  if( mul16_is_needed )
    {
      // 16-bit multiplication
      // NUM1  * NUM2  = RESULT
      // L  H    L  H    L  H
      // FB/FC * FD/FE = 02/03

      /* 2023 06 19 */
      addDebugComment( "2023 06 19:" );
      addDebugComment( "This will slow down the MUL16 routine, but" );
      addDebugComment( "it's safer because it doesn't use ZP" );
      addAsm( "!:", 0, true );
      addAsm( "_MUL16_FB:", 0, true ); // OP2A
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( "!:", 0, true );
      addAsm( "_MUL16_FC:", 0, true ); // OP2B
      addAsm( str_BYTE + "$00", 1, false);
      addAsm( "!:", 0, true );
      addAsm( "_MUL16_FD:", 0, true );  // OP1A
      addAsm( str_BYTE + "$00", 1, false);
      addAsm( "!:", 0, true );
      addAsm( "_MUL16_FE:", 0, true );   // OP1B
      addAsm( str_BYTE + "$00", 1, false);

      
      /* ^^^^^^^^^^ */
      addAsm( "MUL16R:", 0, true );
      addAsm( str_BYTE + "$00, $00, $00, $00", 4, false);
      addAsm( "MUL16:", 0, true );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "MUL16R", 3, false );
      addAsm( str_STA + "MUL16R +1", 3, false );
      addAsm( str_STA + "MUL16R +2", 3, false );
      addAsm( str_STA + "MUL16R +3", 3, false );
      addAsm( str_LDX + "#$10", 2, false );
      addAsm( "!:\t" + str_LSR + "!--", 3, true );
      addAsm( str_ROR + "!---", 3, false );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_TAY );
      addAsm( str_CLC );
      addAsm( str_LDA + "!-----", 3, false ); 
      addAsm( str_ADC + "MUL16R+2", 3, false );
      addAsm( str_STA + "MUL16R+2", 3, false );
      addAsm( str_TYA );
      addAsm( str_ADC + "!----", 3, false);
      addAsm( "!:\t" + str_ROR , 1, true );
      addAsm( str_ROR + "MUL16R+2", 3, false );
      addAsm( str_ROR + "MUL16R+1", 3, false );
      addAsm( str_ROR + "MUL16R", 3, false );
      addAsm( str_DEX );
      addAsm( str_BNE + "!--", 2, false );
      addAsm( str_STA + "MUL16R+3", 3, false );
      addAsm( str_RTS );
    }
  if( umul_is_needed )
    {
      // unsigned int multiplication
      // =================================================================================
      addAsm( "UMUL:", 0, true );
      addAsm( str_LDA + "#$00", 2, false ); 
      //addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_LDX + "#$08", 2, false );
      addAsm( "!:\t" + str_LSR + "$03", 2, true );
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "$02", 2, false );
      addAsm( "!:\t" + str_ASL + "$02", 2, true );
      //addAsm( str_CLC );
      addAsm( str_DEX );
      addAsm( str_BNE + "!--", 2, false );
      addAsm( str_STA + "$03", 2, false ); // 8 bit result in $0042
      // =================================================================================
      addAsm( str_RTS );

    }
  if( sidrnd_is_needed )
    {
      addAsm( "SIDRND:", 0, true );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_STA + "$D40E", 3, false );
      addAsm( str_STA + "$D40F", 3, false );
      addAsm( str_LDA + "#$80", 2, false );
      addAsm( str_STA + "$D412", 3, false );
      addAsm( str_PLA );
      addAsm( str_RTS );       
    }
  if( bmpmem_is_needed )
    {
      addComment( "Get the bitmap mem location from the vic II" );
      addComment( "OPTIMIZE: This address can be hardcoded later" );
      addAsm( "BMPMEM:\t\t", 0, true);
      //  saveReturnAddress();
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      // =================================================================================
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$08", 2, false );
      //addAsm( str_CLC );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_PHA );
      // =================================================================================
      //restoreReturnAddress();
      addAsm( str_TYA );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );
      addAsm( str_RTS );
    }

  if( chrmem_is_needed )
    {
      addComment( "Get the character mem location from the vic II" );
      addComment( "OPTIMIZE: This address can be hardcoded later" );

      addAsm( "CHRMEM:\t\t", 0, true );
      //saveReturnAddress();
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );

      // =================================================================================
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$0E", 2, false );
      //addAsm( str_CLC );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_PHA );
      // =================================================================================
      //restoreReturnAddress();
      addAsm( str_TYA );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );

      addAsm( str_RTS );
    }

  if( scrmem_is_needed )
    {
      stack_is_needed = true;
      addComment( "Get the screen mem location from the vic II" );
      addComment( "OPTIMIZE: This address can be hardcoded later" );
      addAsm( string("SCRMEM:\t\t"), 0, true );
      

      //saveReturnAddress();
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );

      // =================================================================================
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$F0", 2, false );
      //addAsm( str_CLC );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_PHA );
      // =================================================================================
      //      restoreReturnAddress();
      addAsm( str_TYA );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );

      addAsm( str_RTS );
    }
  if( bnkmem_is_needed )
    {
      addComment( "Get the bank memory from the vic II" );
      addComment( "OPTIMIZE: This address can be hardcoded later" );
      addAsm( string("BNKMEM:\t\t"), 0, true );
      //saveReturnAddress();
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );

      // =================================================================================
      addAsm( str_LDA + "$DD00", 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      //addAsm( str_CLC );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );	
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_PHA );
      // =================================================================================
      //      restoreReturnAddress();
      addAsm( str_TYA );
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_PHA );



      addAsm( str_RTS );
    }
  if( byte2hex_is_needed )
    {
      addComment( "Display a Hexadecimal Byte" );
      addAsm( string("BYTE2HEX:\t\t"), 0, true );
      saveReturnAddress();
      // =================================================================================
      addAsm( str_CLD );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addComment( string("\t") + str_AND + "#$F0" );
      addComment( string("\t") + str_LSR );
      addComment( "Undocumented Instruction (replaces the two lines above)" );
      addAsm( str_ALR + string("#$F0"), 2, false );
      illegal_operations_are_needed = true;// <--+
      addAsm( str_LSR );//                       |
      addAsm( str_LSR );//                       |
      addAsm( str_LSR );//                       |
      //                                         |
      addAsm( str_CMP + "#$0A", 2, false);//     |
      addAsm( str_BCC + "!+", 2, false ); //     |     
      addAsm( str_CLC );//                       |
      addAsm( str_ADC + "#$07", 2, false );//    |
      addAsm( "!:\t" + str_ADC + "#$30", 2, true);
      addAsm( str_JSR + "$FFD2", 3, false );//   |
      //                                         |
      addComment( "\t" + str_TXA );//            |
      addComment( "\t" + str_AND + "#$0F" );//   |
      //                                         |
      addComment( "Undocumented Instruction (replaces the two lines above)" );

      addAsm( str_XAA + "#$0F", 2, false );
      
      addAsm( str_CMP + "#$0A", 2, false);
      addAsm( str_BCC + "!+", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$07", 2, false );
      addAsm( "!:\t" + str_ADC + "#$30", 2, true);
      addAsm( str_JSR + "$FFD2", 3, false );

      // =================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
      
    }
  if( byt2str_is_needed  )
    {
      return_addresses_needed = true;
      addComment( "Turns a 1 byte value into 3 PETSCII chars on stack" );
      addAsm( string("BYT2STR:\t\t"), 0, true );

      saveReturnAddress();
      //==================================================================================
      addAsm( str_PLA ); // the value to be put into the string
      addComment( "Taken from: codebase64.org/doku.php?id=base:tiny_.a_to_ascii_routine" );
      addAsm( str_LDY + "#$2F", 2, false );
      addAsm( str_LDX + "#$3A", 2, false );
      addAsm( str_SEC, 1, false );
      addAsm( "!:\t" + str_INY, 1, true );
      addAsm( str_SBC + "#$64", 2, false );
      addAsm( str_BCS + "!-", 2, false );
      addAsm( "!:\t" + str_DEX, 1, true );
      addAsm( str_ADC + "#$0A", 2, false );
      addAsm( str_BMI + "!-", 2, false );
      addAsm( str_ADC + "#$2F", 2, false );
      // push A onto STACK
      addAsm( str_JSR + "PUSH", 3, false );
      addAsm( str_TYA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_PHA, 1, false );
      //==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );

      
    }
  if( false )
    {
      // this is the template to use for a built-in function
      addAsm( string("FUNCTION:\t\t") + commentmarker + "Function Comment", 0, true );
      // put return address on the stack
      saveReturnAddress();
      //==================================================================================
      
      
      
      //==================================================================================
      // get return address from the stack
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( split_byte_is_needed )
    {
      addAsm( "SPLITBYTE:\t\t" + commentmarker + "S1 -> S1=Hi Bits   S0=Lo Bits", 0, true );

      // save return address from the stack
      saveReturnAddress();
      //==================================================================================
      addAsm( str_PLA );
      addAsm( str_STA + "$52", 2, false);
      addAsm( str_AND + "#$0F", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$30", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$52", 2, false );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_AND + "#$0F", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$30", 2, false );
      addAsm( str_PHA );      
      //==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );

    }
  if( decimal_digit_is_needed )
    {
      addComment( "Turn number on stack into a decimal" );
      addAsm( string("DECDIG:\t\t"), 0, true );

      // put return address on the stack
      saveReturnAddress();
      //==================================================================================
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_DEX );
      addAsm( str_BMI + "!++", 2, false);
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_CLC );
      addAsm( str_PHP );
      addAsm( str_SED );
      addAsm( "!:\t" + str_ADC + "#$01", 2, true );
      addAsm( str_DEX );
      addAsm( str_BPL + "!-", 2, false );
      addAsm( str_PLP );
      addAsm( "!:\t" + str_PHA, 1, true);
      //==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( div10_is_needed )
    {
      // DIVIDE BY 10 ROUTINE
      addAsm( string("DIV10:\t\t") + commentmarker + "Divide number on stack by 10", 0, true );

      // save return address to the stack
      saveReturnAddress();
      //==================================================================================
      
      addAsm( str_PLA );
      addAsm( str_LSR );
      addAsm( str_STA + "$2A", 2, false );
      addAsm( str_LSR );
      addAsm( str_ADC + "$2A", 2, false );
      addAsm( str_ROR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_ADC + "$2A", 2, false );
      addAsm( str_ROR );
      addAsm( str_ADC + "$2A", 2, false );
      addAsm( str_ROR );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_PHA ); // put result on processor stack
      //==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( cls_is_needed )
    {
      addAsm( string("CLS:\t\t") + commentmarker + "Clear Screen Routine", 0, true );
      addAsm( str_LDA + "#$20", 2, false ); // space
      addAsm( str_LDX + "#$00", 2, false ); // (essentially 256)
      addAsm( "!:\t" + str_STA + "$0400,X", 3, true );
      addAsm( str_STA + "$0500,X", 3, false );
      addAsm( str_STA + "$0600,X", 3, false );
      addAsm( str_STA + "$06E8,X", 3, false );
      addAsm( str_DEX );
      addAsm( str_BNE + "!-", 2, false );
      addAsm( str_RTS );
    }
  if( mobcpy_is_needed  )
    {
      // a QUICK and DIRTY MEMCPY of 63 BYTES
      addAsm( string("MOBCPY:\t\t") + commentmarker + "Copy 63 bytes from $FB/$FC to $FD/$FE", 0, true );
      addAsm( str_SEI );
      addAsm( str_LDY + "#$3F", 2, false );
      addAsm( "!:\t" + str_CPY + "#$FF", 2, true );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_LDA + "($FB),Y", 2, false );
      addAsm( str_STA + "($FD),Y", 2, false );
      addAsm( str_DEY  );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:\t" + str_CLI,1, true);
      addAsm( str_RTS );
    }
  if( memcpy_is_needed )
    {
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( string("MEMCPY:\t\t") + commentmarker + "Copy STACK[0] bytes from $FB/$FC to $FD/$FE", 0, true );
      // save return address from the stack
      //saveReturnAddress();
      stack_is_needed = true;
      addAsm( str_PLA, 1, false );
      addAsm( str_TAX, 1, false );
      addAsm( str_PLA, 1, false );
      addAsm( str_JSR + "PUSH", 3, false );
      
      //==================================================================================
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( "!:\t" + str_CPY + "#$FF", 2, true );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_LDA + "($FB),Y", 2, false );
      addAsm( str_STA + "($FD),Y", 2, false );
      addAsm( str_DEY, 1, false );
      addAsm( str_JMP + "!-", 3, false );
      //==================================================================================
      //restoreReturnAddress();
      addAsm( "!:\t" + str_JSR + "POP", 3, true );
      addAsm( str_PHA, 1, false );
      addAsm( str_TXA, 1, false );
      addAsm( str_PHA, 1, false );
      addAsm( str_RTS );
    }
  if( twos_complement_is_needed )
    {
      //return_addresses_needed = true;

      addAsm( string("TWOS:\t\t") + commentmarker + string("Two's Complement Function"), 0, true );
      
      // get the return address and status flag from the stack
      // save return address

      saveReturnAddress();
      //==================================================================================

      addComment( "The argument is pulled off of the stack here" );
      addAsm( str_PLA );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$01", 2, false );
      addComment( "The return value is pushed onto the stack here" );
      addAsm( str_PHA );
      //==================================================================================
      restoreReturnAddress();  
      addAsm( str_RTS );

    }
  if( printf_is_needed )
    {
      /* a Simple printf for strings */   
      addAsm( "PRN:", 0, true );
      addAsm( str_LDY + "#$00", 2, false);
      addAsm( "!:\t" + str_LDA + "($02),Y", 2, true);
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_INY );
      addAsm( str_JMP + "!-", 3, false );
      addAsm( "!:\t" + str_RTS, 1, true );
    }
  
  if( scanf_is_needed )
    {
      addComment( "Robust Scanf" );
      addAsm( string("SCANF:"), 0, true );
      addComment( "Taken from: https://codebase64.org/doku.php?id=base:robust_string_input" );
      addComment( "Code by: Schema" );
      addComment( "I modified it _slightly_ to make the naming conventions of the labels" );
      addComment( "consistent with the rest of the code." );
      addAsm( str_LDA + "#>TEXT", 2, false );
      addAsm( str_LDX + "#<TEXT", 2, false );
      addAsm( str_LDY + "#38", 2, false );

      //addAsm( "FINPUT:", 0, true );
      addAsm( str_STY + "MAXCHARS", 3, false );
      addAsm( str_STX + "CHECKALLOWED+1", 3, false ); 
      addAsm( str_STA + "CHECKALLOWED+2", 3, false );

      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "INPUTY", 3, false );

      addAsm("INPUTGET:", 0, true );
      addAsm( str_JSR + "$FFE4", 3, false );

      
      //addAsm("beq INPUTGET", 2, false );
      addAsm( str_BYTE + "$F0, $FB" + commentmarker + "BEQ -4", 2, false );
      addAsm( str_STA + "LASTCHAR", 3, false );

      addAsm( str_CMP + "#$14" + commentmarker + "Delete key", 2, false );
      
      addAsm( str_BYTE + "$F0, $39" + commentmarker + "BEQ +57", 2, false );
      //addAsm("beq DELETE", 2, false );
      addAsm( str_CMP + "#$0d" + commentmarker + "Return", 2, false );
      //addAsm("beq INPUTDONE", 2, false );
      addAsm( str_BYTE + "$F0, $2A" + commentmarker + "BEQ +42", 2, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm("CHECKALLOWED:", 0, true );
      addAsm( str_LDA + "$FFFF,X" + commentmarker + "Overwritten", 3, false );

      //addAsm("beq INPUTGET;Reached end of list (NULL)", 2, false );
      addAsm( str_BYTE + "$F0, $E8" + commentmarker + "BEQ -23 (i think)", 2, false );
      addAsm( str_CMP + "LASTCHAR", 3, false );
      //addAsm("beq INPUTOK;Match found", 2, false );
      //addAsm( str_BYTE + "$F0, $04" + commentmarker + "BEQ 4", 2, false );
      addAsm( str_BEQ + "!+", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "CHECKALLOWED", 3, false );
      addAsm("INPUTOK:", 0, true );
      addAsm( "!:\t" + str_LDA + "LASTCHAR" + commentmarker + "Get the char back", 3, true );
      addAsm( str_LDY + "INPUTY", 3, false );
      addAsm( str_STA + "GOTINPUT,y" + commentmarker + "Add it to string", 3, false );
      addAsm( str_JSR + "$FFD2" + commentmarker + "Print it", 3, false );
      
      addAsm( str_INC + "INPUTY" + commentmarker + "Next character", 3, false );

      addAsm("lda INPUTY", 3, false );
      addAsm("cmp MAXCHARS", 3, false );
      //addAsm("beq INPUTDONE", 2, false );
      addAsm(str_BYTE + "$F0, $03" + commentmarker + "BEQ +3", 2, false );
      //addAsm(".byte #$F0, #$03; BEQ +3", 2, false );
     
      addAsm("jmp INPUTGET", 3, false );

      addAsm("INPUTDONE:", 0, true );
      addAsm("ldy INPUTY", 3, false );
      addAsm("lda #$00", 2, false );
      addAsm("sta GOTINPUT,y" + commentmarker + "Zero-terminate", 3, false );

      addAsm(str_RTS );	
      addAsm("DELETE:", 0, true );
      addAsm("lda INPUTY", 3, false );
      //addAsm( str_BNE + "+3", 2, false ); // BNE +3

      addAsm( str_BYTE + "$D0, $03", 2, false );
      //addAsm("bne DELETEOK", 2, false );
      addAsm("jmp INPUTGET", 3, false );

      
      //addAsm("DELETEOK:", 0, true );
      addAsm("dec INPUTY", 3, false );
      addAsm("ldy INPUTY", 3, false );
      addAsm("lda #$00", 2, false );
      addAsm("sta GOTINPUT,y", 3, false );
      addAsm("lda #$14", 2, false );
      addAsm("jsr $ffd2", 3, false );
      addAsm("jmp INPUTGET", 3, false );


      addAsm("TEXT:", 0, true );
      // these are the acceptable characters for scanf
      //              123456789 123456789 123456789 123456789 123456789 


      addComment( "acceptable PETSCII characters for input" );
      if( kick )
	{
	  addAsm( str_BYTE + "$20, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $31, $32, $33, $34, $35, $36, $37, $38, $39, $30, $2E, $2C, $2D, $2B, $21, $23, $24, $25, $26, $28, $29, $2A", 49, false );
	}
      else
	{
	  addAsm( str_BYTE + "\" ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.,-+!#$%&()*\"", 49, false );
	}
      addAsm( str_BYTE + "$00", 1, false );
      addAsm("MAXCHARS:", 0, true );
      addAsm(str_BYTE + "$00", 1, false );

      addAsm("LASTCHAR:", 0, true );
      addAsm(str_BYTE + "$00", 1, false );
      addAsm("INPUTY:", 0, true );
      addAsm(str_BYTE + "$00", 1, false );

      addAsm("GOTINPUT:", 0, true );
      addAsm(str_BYTE + "$39", 1, false );
      addAsm("SCANFBUF:", 0, true );
      if( kick )
	{
	  string sbs = str_BYTE;
	  for(int i=0; i<scanf_buffer_size; i++ )
	    {
	      sbs+=string("$00");
	      if( i<scanf_buffer_size-1 )
		{
		  sbs+=string(", ");
		}
	    }
	  addAsm( sbs, scanf_buffer_size, false );
	}
      else
	{
	  string sbs = str_BYTE + "\"";
	  for(int i=0; i<scanf_buffer_size; i++ )
	    {
	      sbs+=string(" ");
	    }
	  sbs+=string("\"");
	  addAsm( sbs, scanf_buffer_size, false );

	  addAsm(str_BYTE + "\"                \"", scanf_buffer_size, false );
	}
      addAsm(str_BYTE + "$00", 1, false );
      addAsm(commentmarker + string("-------------------------------------------------"), 0, true );
    }
  if( getkey_is_needed )
    {
      // puts a keypress on the stack
      addAsm( "GETKEY:", 0, true );
      addAsm( str_JSR + "$FFE4", 3, false );

      // 2023 06 07 - maybe take out the following line ??
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "GETKEY", 2, false );
      /* this memory loc could be anywhere */
      /* I chose $CFDF because it's right */
      /* before the input buffer for "scanf" */
      addAsm( str_STA + "$CFDF", 3, false );
      addAsm( str_RTS );
    }
  if( stack_is_needed )
    {
      addComment( "software stack" );
      addDebugComment( "my rendition of a software stack at $CF00" );
      addDebugComment( "Y is not destroyed" );
      addAsm( "!:\t" + str_BYTE + "$00", 1, true);
      addAsm( "!:\t" + str_BYTE + "$00", 1, true );
      addAsm( "PUSH:", 0, true );
      addAsm( str_STX + "!-", 3, false );
      addAsm( str_LDX + "!--", 3, false );
      addAsm( str_INX );
      addAsm( str_STA + "$CF00,X", 3, false );
      addAsm( str_STX + "!--", 3, false );
      addAsm( str_LDX + "!-", 3, false );
      addAsm( str_RTS );
      addAsm( "POP:", 0, true );
      addAsm( str_STX + "!-", 3, false );
      addAsm( str_LDX + "!--", 3, false );
      addAsm( str_LDA + "$CF00,X", 3, false );
      addAsm( str_DEX );
      addAsm( str_STX + "!--", 3, false );
      addAsm( str_LDX + "!-", 3, false );
      addAsm( str_RTS );
    }

  if( illegal_operations_are_needed )
    {
      if( !kick ) cout << ".OPT ILLEGALS" << endl;
    }

  //addCompilerMessage( "TODO: Process Includes Here!", 0 );
  //ProcessIncludes();
  int countn_tmp = countn;
  processing_includes = true;
  for( int i = 0; i < include_file_vector.size(); i++ )
    {
      countn = 0;
      addCompilerMessage( string( "Processing included file: " ) + include_file_vector[i], 0 );      
      yyin = fopen( include_file_vector[i].c_str(), "r" );
      yyparse();
      fclose(yyin);
    }
  countn = countn_tmp;
  

  
  if( arg_optimize ) Optimize();
  ProcessComments();
  ProcessVariables();
  //ProcessFunctions();
  ProcessReturnTypes();
  ProcessMemoryLocationsOfCode();
  ProcessStrings();
  //ProcessMobs();
  current_code_location = code_start;  // reset the memory counter
  
  ProcessMemoryLocationsOfCode();
  //ProcessStrings();
  
  /* replace labels with addresses */
  if( !arg_show_labels ) ProcessLabels();

  if( symbol_table_is_needed) SymbolTable();

  //NodeTable();
  
  /* dump all of the assembler instructions */
  for(int i=0; i<asm_instr.size(); i++){cout << *asm_instr[i];}
  
  //cout << "ending memory location: " << current_code_location << endl;
  /* dump all the strings */
  for( int i=0; i<asm_strings.size(); i++){ cout << *asm_strings[i];}
  //cout << " bytes: " << current_code_location-code_start << endl;
  for( int i=0; i<asm_datum.size(); i++){ cout << *asm_datum[i];}

}

int search(char *type) {
  int i;
  //  for(i=count-1; i>=0; i--) {
  //  if(strcmp(symbol_table[i].id_name, type)==0) {
  //   return -1;
  //   break;
  // }
  //}
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
  //for(int i=0; i<count; i++) {
  // Handle case of use before declaration
  //  if(!strcmp(symbol_table[i].id_name, var)) {
  //    return symbol_table[i].data_type;
  // }
  // }
}

void add(char c) {
  if(c == 'V'){
    for(int i=0; i<10; i++){
      if(!strcmp(reserved[i], strdup(yytext)))
	{
	  sprintf(errors[sem_errors], "Line %d: Variable name \"%s\" is a reserved keyword!\n", countn+1, yytext);
	  sem_errors++;
	  return;
	}
    }
  }
  q=search(yytext);

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

/* multicolour hi-res screen  */

/* setup */

/* poke( 0xD011, 59 ); */
/* poke( 0xD016, 24 ); */
/* poke( 0xD018, 24 ); */

/* multicolours: */
/* 0xD021  = 00 */ 
/* 0x0400H = 01 */
/* 0x0400L = 10 */
/* 0xD800  = 11 */

/* bit data */
/* 0x2000 */
