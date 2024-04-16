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
  string str_ADC;
  string str_AND;
  string str_ASL;
  string str_ALR; // undocumented
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
    str_BYTE = string( ".BYTE " );
    commentmarker = " ; ";

    return;
  }
  
  /* The extra parameter is also given to yyerror */
  void yyerror(FILE* fp, const char* msg);

  /* forward declarations */
  void addAsm( string s, int instruction_size, bool l);
  void addDebugComment( string s );

  // compiler internal flags
  bool kick=false;

  int function_argument_count = 0;
  
  // parameter booleans
  bool p0=false;
  bool p1=false;
  bool p2=false;
  bool p3=false;

  bool load_is_needed=false;
  bool load16_is_needed=false;
  bool save_is_needed=false;
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
  bool multicolour_plot_is_needed=false;
  bool getplot_is_needed=false;
  bool unsigned_signed_cmp_is_needed=false;
  bool split_byte_is_needed=false;
  bool decimal_digit_is_needed=false;
  bool modulus_is_needed=false;
  bool div10_is_needed=false;
  bool return_addresses_needed=true;
  bool umul_is_needed=false;
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
  
  bool debug_comments_are_needed = false;
  bool debug_flag_is_on = false;


  int label=0;
  int label_major=0;

  // command line arguments
  bool arg_memory_locations=false;
  bool arg_unsafe_ifs=false;
  bool arg_show_labels=true;
  bool arg_asm_comments=true;
  bool arg_parser_comments=false;
  
  string current_state;

  int data_start=828; // 98 2 byte variables
  int code_start=2049;
  int current_code_location=0;
  int string_number=0;
  int data_number=0;
  int kbd_bfr_addr = 0xCFE0;
  int current_variable_type=-1;
  int current_variable_base_address=-1;

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

  bool isVoidDT(string s)
  {
    bool return_value = false;
    if(s == string("VOID")) return_value = true;
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
	addAsm( "PHA" + commentmarker + "DEBUG", 1, false);
	addAsm( "PHA" + commentmarker + "DEBUG", 1, false);
	addAsm( str_JSR + "BYTE2HEX" + commentmarker + "DEBUG", 3, false );
	addAsm( "PLA" + commentmarker + "DEBUG", 1, false);
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


  void inlineFloatPush( string s, int addr=105)
  {
    //addComment( "FloatIMM -> Stack" );
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
	addAsm( str_LDA+"#$" + fp_in_hex[v] + fp_in_hex[v+1], 2, false );
	addAsm( str_PHA, 1, false );
	v+=2;
      }

    return;
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
	addAsm( str_LDA+"#$" + fp_in_hex[v] + fp_in_hex[v+1], 2, false );
	addAsm( str_STA + "$" + toHex( addr+i ), size_of_instruction, false );
	v+=2;
      }

    if( addr == 105 )
      {
	addAsm( str_LDA + "#$69", 2, false );
	addAsm( str_LDY + "#$00", 2, false );
	addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false );
      }
    addDebugComment( "=================================" );
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
    //cerr << "adding data " << identifier << " (" << i << ")" << endl;
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
    //if( return_value )  cerr << "isMobID" << endl;
 
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
  };

  ostream & operator << (ostream &out, const asm_instruction &a) 
    {
      if( !a.b_label )
	{
	  out << "\t" << a.text; // the instructions
	  if( arg_memory_locations) out << a.mycommentmarker << "$" << toHex(a.memory_address);
	}
      else
	{
	  out << a.text;
	}
      out << endl;
      return out;
    }
  
  vector<asm_instruction*> asm_instr;

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
    my_asm->setAddress( 0 ); 
    asm_instr.push_back( my_asm );
    return;
  }

  void addParserComment( string s )
  {
    if( arg_parser_comments ) addAsm( stripFirst(commentmarker.c_str()) + s, 0, true );
    return;
  }
  
  void addDebugComment( string s )
  {
    if( debug_comments_are_needed ) addAsm( stripFirst(commentmarker.c_str()) + s, 0, true );
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
    //if( asm_instr[ asm_instr.size()-1 ]->getString() == s ) return true;
    return false;
  }

  void deletePreviousAsm()
  {
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
    string plp = string("plp");
    string pla = string("pla");
    string sta03 = string("sta $03");
    string sta02 = string("sta $02");
    string lda02 = string("lda $02");
    string pha = string("pha");
    string lda03 = string("lda $03");
    string php = string("php");    

    for( int i=0; i<asm_instr.size(); i++ )
      {
	// POP-PUSH removal (IFIF)
	if( cmpstr( asm_instr[i]->getString(), plp ) &&
	    cmpstr( asm_instr[i+1]->getString(), pla ) &&
	    cmpstr( asm_instr[i+2]->getString(), sta03 ) &&
	    cmpstr( asm_instr[i+3]->getString(), pla ) &&
	    cmpstr( asm_instr[i+4]->getString(), sta02 ) &&
	    cmpstr( asm_instr[i+5]->getString(), lda02 ) &&
	    cmpstr( asm_instr[i+6]->getString(), pha ) &&
	    cmpstr( asm_instr[i+7]->getString(), lda03 ) &&
	    cmpstr( asm_instr[i+8]->getString(), pha ) &&
	    cmpstr( asm_instr[i+9]->getString(), php ))
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+10);
	    addCompilerMessage( "removing POP-PUSH IFIF" );
	  }
      }

    string jmp = string("jmp");
    string lbl = string("LBL");

    for( int i=0; i<asm_instr.size(); i++ )
      {
	// Unnecessary JMP removal
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
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addCompilerMessage( "removing unnecessary JMP (keeping the labels)" );
	  }
      }

    string rts = string("rts");
    for( int i=0; i<asm_instr.size(); i++ )
      {
	// Unnecessary JMP removal
	if( cmpstr( asm_instr[i]->getString(), rts ) &&
	    cmpstr( asm_instr[i+1]->getString(), rts ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+1);
	    addCompilerMessage( "removing double returns" );
	  }
      }
    
    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), pla ) &&
	    cmpstr( asm_instr[i+1]->getString(), pha ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addCompilerMessage( "removing pop pushes" );
	  }
      }

    for( int i=0; i<asm_instr.size(); i++ )
      {
	if( cmpstr( asm_instr[i]->getString(), pha ) &&
	    cmpstr( asm_instr[i+1]->getString(), pla ) )
	  {
	    asm_instr.erase(asm_instr.begin()+i,asm_instr.begin()+i+2);
	    addCompilerMessage( "removing push pops" );
	  }
      }

    return;
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
    addComment(  OP1 + string( " v. " ) + OP2 );
    // FP Operations
    inlineFloat( OP1, 105);
    current_variable_base_address = getAddressOf( OP2 );
    addAsm( str_LDA+"#$"+ toHex( get_word_L( current_variable_base_address )), 2, false );
    addAsm( str_LDY+"#$"+toHex( get_word_H( current_variable_base_address )), 2, false );
    addAsm( str_JSR+"$BBA2"+commentmarker+"RAM -> FAC", 3, false );
    addAsm( str_LDA+"#$69", 2, false );
    addAsm( str_LDY+"#$00", 2, false );
    addAsm( str_JSR+"$BC5B"+commentmarker+"CMP(FAC, RAM)", 3, false );
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
%token <nd_obj> CHAR tFCLOSE tFOPEN tFCLRCHN tFCHROUT tFCHRIN tFREADST tFCHKOUT tFCHKIN tSETLFS tSETNAM tSAVE tLOAD tIMPORT tSPRPTR tPUSH tPOP tCOMMENT tDATA tBANK tPLUSPLUS tMINUSMINUS tSPRITECOLLISION tGETIN tGETCHAR tSPRITEXY tSPRITEX tSPRITEY tSPRITECOLOUR tSPRITEON tWORD tBYTE tDOUBLE tUINT tPOINTER tSIN tCOS tTAN tMOB tSIDIRQ tSIDOFF tSTRTOFLOAT tSTRTOWORD tTOFLOAT tTOUINT tTOBIT tDEC tINC tROL tROR tLSR tGETBANK tGETBMP tGETSCR tGETADDR tGETXY tPLOT tJUMP tSETSCR tJSR tIRQ tROMOUT tROMIN tLDA tASL tSPRITESET  tSPRITEOFF tSPRITETOGGLE tRND tXXX tJMP tCURSORXY tNOP tCLS tBYTE2HEX tTWOS tRTS tPEEK tPOKE NEWLINE CHARACTER tPRINTS PRINTFF SCANFF INT FLOAT WHILE FOR IF ELSE TRUE FALSE NUMBER HEX_NUM FLOAT_NUM ID LE GE EQ NE GT LT tbwNOT tbwAND tbwOR tAND tOR STR ADD SUBTRACT MULTIPLY DIVIDE tSQRT UNARY INCLUDE RETURN tMOBBKGCOLLISION tGETH tGETL tSCREEN tNULL tMEMCPY tSEED
%type <nd_obj> headers main body return function datatype statement arithmetic relop program else 
   %type <nd_obj2> init value expression charlist numberlist parameterlist argumentlist
      %type <nd_obj3> condition

      %%

      program: headers main '(' ')' '{' body return '}' function { /*$2.nd = mknode($6.nd, $7.nd, "main"); $$.nd = mknode($1.nd, $2.nd, "program");
     
     head = $$.nd; */
   } 
;


headers: /* empty */
| 
| headers headers
{
  //$$.nd = mknode($1.nd, $2.nd, "headers");
  //strcpy($$.name, $1.name);
}
| INCLUDE
{
  addCompilerMessage( $1.name, 0 );
  string tmp_str = string( $1.name );
  tmp_str.erase (tmp_str.begin(), tmp_str.begin()+10);
  tmp_str.erase (tmp_str.end()-1, tmp_str.end());
  cerr << "included filename: [" << tmp_str  << "]" << endl;
  addIncludeFile( tmp_str );
  // add the include file to an include-file vector - process them at the end
  //yyin = fopen( tmp_str.c_str(), "rt" );
  //strcpy($$.name, $1.name);

};

argumentlist: /*empty*/
|
| datatype ID
{
  addComment(string("Argument: ") + $2.name);
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
      addAsm(str_STA+$2.name+"+1", 3, false);
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
      addAsm(str_STA+$2.name+"+1", 3, false);

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
  addComment(string("Argument: ") + $2.name);
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
      addAsm(str_STA+$2.name+"+1", 3, false);

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
      addAsm(str_STA+$2.name+"+1", 3, false);
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
  addComment(string("Parameter: ") + $1.name);
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
      addAsm( str_LDA + getNameOf(getAddressOf( $1.name )) + "+1", 3, false );
      //addAsm( str_LDA + $1.name + "+1", 3, false );

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
  else if( isUintIMM($1.name) || isIntIMM($1.name) )
    {
      int tmp_v = atoi(stripFirst($1.name).c_str());
      
      addAsm( str_LDA + "#$" + toHex( tmp_v ), 2, false );
      addAsm( str_PHA );
    }
  else if( isFloatID($1.name) )
    {
      int addr = atoi(stripFirst($1.name).c_str());
      string OP1 = getNameOf(addr);
      // 2024 04 15 - mkpellegrino
      
      //addAsm( str_LDA + "$" + toHex( getAddressOf($1.name) ), 3, false );
      addAsm( str_LDA + OP1, 3, false );

      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($1.name)+1 ), 3, false );
      addAsm( str_LDA + OP1 + "+1", 3, false );

      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($1.name)+2 ), 3, false );
      addAsm( str_LDA + OP1 + "+2", 3, false );
      
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($1.name)+3 ), 3, false );
      addAsm( str_LDA + OP1 + "+3", 3, false );
      
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($1.name)+4 ), 3, false );
      addAsm( str_LDA + OP1+ "+4", 3, false );
      
      addAsm( str_PHA );
    }
  else if( isFloatIMM($1.name) )
    {

      inlineFloatPush( $1.name, 105 );
      
    }
  else
    {
      addCompilerMessage( "Unhandled Parameter Type for function call" );
    }
}
| parameterlist ',' expression
{
  addComment(string("Last Parameter: ") + $3.name );
  if( isUintID($3.name) || isIntID($3.name) )
    {
      //addAsm( str_LDA + "$" + toHex( getAddressOf( $3.name ) ), 3, false );
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
      addAsm( str_LDA + getNameOf(getAddressOf( $3.name )) + "+1", 3, false );
      //addAsm( str_LDA + $3.name + "+1", 3, false );
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
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      int tmp_v = atoi(stripFirst($3.name).c_str());
      
      addAsm( str_LDA + "#$" + toHex( tmp_v ), 2, false );
      addAsm( str_PHA );
    }
    else if( isFloatID($3.name) )
    {

      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name) ), 3, false );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+1 ), 3, false );
      addAsm( str_LDA + $3.name + "+1", 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+2 ), 3, false );
      addAsm( str_LDA + $3.name + "+2", 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+3 ), 3, false );
      addAsm( str_LDA + $3.name + "+3", 3, false );
      addAsm( str_PHA );
      //addAsm( str_LDA + "$" + toHex( getAddressOf($3.name)+4 ), 3, false );
      addAsm( str_LDA + $3.name + "+4", 3, false );
      addAsm( str_PHA );
    }
  else if( isFloatIMM($3.name) )
    {

      inlineFloatPush( $3.name, 105 );
      
    }
  else
    {
      addCompilerMessage( "Unhandled Parameter Type for function call" );
    }
  
  strcpy($$.name, $1.name );
};


numberlist: /* empty */
|  
| value
{
  //addAsm( generateNewLabel(), 0, true );

  int v = atoi( stripFirst( $1.name ).c_str());
  addData( generateNewLabel() + " " + str_BYTE + "$" + toHex( v ), 1 );
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
};

function: function function
| datatype ID
{
  addAsm( generateNewLabel(), 0, true );
  addAsm(string($2.name)+":", 0, true);
  addFunction( string($2.name), getLabel( label_vector[label_major]-1 ), getDataTypeValue($1.name));
  addComment( "save return address in XY" );
  addAsm( str_PLA );
  addAsm( str_TAX );
  addAsm( str_PLA );
  addAsm( str_TAY );
 
} '(' argumentlist ')'
{
  // this is where it needs to put the return address back on the stack
  addComment( "put the return address back on the stack" );
  addAsm( str_TYA );
  addAsm( str_PHA );
  addAsm( str_TXA );
  addAsm( str_PHA );

  if( function_argument_count == 0 )
    {
      /* remove the last 8 lines from the asm code */
      for( int i = 0; i < 8; i++ ) deletePreviousAsm();
      if(arg_asm_comments)
	{
	  deletePreviousAsm();
	  deletePreviousAsm();
	}
    }
  else
    {
      /* do nothing */
    }
  addComment( "Deleted previous 8 Mnemonics" );

} '{'
{
  addComment( string("======================== ") + $2.name + "========================");
} body return '}'
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
;

body: WHILE
{
  // 2023 06 27
  string s = gen_random_str(10);
  addCommentBreak(2);
  addDebugComment( string( ">>>>> ") + s );
  rnd_str_vector.push(s);
  /* addComment( "Preserve AXY" ); */
  /* addAsm( str_PHA ); */
  /* addAsm( str_TXA ); */
  /* addAsm( str_PHA ); */
  /* addAsm( str_TYA ); */
  /* addAsm( str_PHA ); */
  
  addComment( "Preserve $02/$03" );
  addAsm( str_LDA + "$02", 2, false);
  addAsm( str_PHA );

  addAsm( str_LDA + "$03", 2, false);
  addAsm( str_PHA );

  addComment( "Preserve Status Register" );
  addAsm( str_PHP );

  addCommentBreak(2);
  
  addAsm( str_CLC );
  
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
  
  addCommentBreak(2);
  // 2023 06 27
  string s = rnd_str_vector.top();
  addDebugComment( string( "<<<<< ") + s );
  rnd_str_vector.pop();

  addComment( "Restore status register" );
  addAsm( str_PLP );
  
  addComment( "Restore $02/$03" );
  addAsm( str_PLA );
  addAsm( str_STA + "$03", 2, false);
  addAsm( str_PLA );
  addAsm( str_STA + "$02", 2, false);

  /* addComment( "Restore AXY" ); */
  /* addAsm( str_PLA ); */
  /* addAsm( str_TAY ); */
  /* addAsm( str_PLA ); */
  /* addAsm( str_TAX ); */
  /* addAsm( str_PLA ); */

  
  addCommentBreak(2);

}
'}'

| FOR
{
  string s = gen_random_str(10);
  addCommentBreak(2);
  addDebugComment( string( ">>>>> ") + s );
  rnd_str_vector.push(s);
 
  addComment( "Preserve $02/$03" );
  addAsm( str_LDA + "$02", 2, false);
  addAsm( str_PHA );
  addAsm( str_LDA + "$03", 2, false);
  addAsm( str_PHA );
  
  addComment( "Preserve Status Register" );
  addAsm( str_PHP );
  addCommentBreak(2);

  addAsm( str_CLC );
  
  pushScope("FOR");
  addCommentSection( "FOR LOOP" );
  addAsm( generateNewLabel(), 0, true );
}
'(' statement {addCommentBreak();}
';' condition {addCommentBreak();}
{
  addAsm( generateNewLabel(), 0, true );
}
';' statement
{
  addAsm(str_JMP + getLabel( label_vector[label_major]-2, false) + commentmarker + "jump to top of FOR loop", 3, false );
  addCommentBreak();
} ')'
{  addAsm( generateNewLabel(), 0, true ); }
'{' body '}'
{
  addCommentBreak();
  addAsm( str_JMP + getLabel( ((int)label_vector[label_major]-2), false ) + commentmarker +  "jump to iterator" , 3, false );
  
  addAsm( generateNewLabel(), 0, true );
  //  addAsm( str_PLA );  
  //addCommentBreak();
  if( scope_stack.top() != string("FOR") )
    {
      addComment( "ERROR: Scope out of Sync" );
      addComment( scope_stack.top() );
    }
  else
    {
      popScope();

      addCommentBreak(2);
      // 2023 06 27
      string s = rnd_str_vector.top();
      addDebugComment( string( "<<<<< ") + s );
      rnd_str_vector.pop();

      // 2023 06 25
      addComment( "Restore status register" );
      addAsm( str_PLP );

      addComment( "Restore $02/$03" );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false);
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false);
      addCommentBreak(2);

    }
};
| IF
{

  string s = gen_random_str(10);
  addCommentBreak(2);
  addDebugComment( string( ">>>>> ") + s );
  rnd_str_vector.push(s);

  if( !arg_unsafe_ifs )
    {
      addComment( "Preserve $02/$03" );
      addAsm( str_LDA + "$02", 2, false);
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false);
      addAsm( str_PHA );
    }

  /* addComment( "Preserve AXY" ); */
  /* addAsm( str_PHA ); */
  /* addAsm( str_TXA ); */
  /* addAsm( str_PHA ); */
  /* addAsm( str_TYA ); */
  /* addAsm( str_PHA ); */

  addComment( "Preserve Status Register" );
  addAsm( str_PHP );

  addCommentBreak(2);

  addAsm( str_CLC );

  pushScope("IF");
  addCommentSection("IF STATEMENT" );
  addAsm( generateNewLabel(), 0, true );
  
}
'(' condition ')'
{

  addCommentBreak();
  addComment( "                      THEN:" );
  addAsm( generateNewLabel(), 0, true );
}
'{' body '}'
{
  addAsm( str_JMP + getLabel( label_vector[label_major]+1, false), 3, false);
  addAsm( generateNewLabel(), 0, true );

  addCommentBreak();
  addComment( "                      ELSE:" );
}
 else
   {
     addCommentBreak();
     addParserComment( "post-process the ELSE" );
   }
{
  addCommentBreak();
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
      // 2023 06 25
      addCommentBreak(2);
      // 2023 06 27
      string s = rnd_str_vector.top();
      addDebugComment( string( "<<<<< ") + s );
      rnd_str_vector.pop();

      addComment( "Restore status register" );
      addAsm( str_PLP );

      /* addComment( "Restore AXY" ); */
      /* addAsm( str_PLA ); */
      /* addAsm( str_TAY ); */
      /* addAsm( str_PLA ); */
      /* addAsm( str_TAX ); */
      /* addAsm( str_PLA ); */

      if( !arg_unsafe_ifs )
	{
	  addComment( "Restore $02/$03" );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false);
	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false);
	}

      addCommentBreak(2);
      
    }
};
| statement ';'
{
  addCommentBreak(2);
};
| return
  {
  
  };
| body body
{
  $$.nd = mknode($1.nd, $2.nd, "statements");
};
| tDATA {pushScope( "DATA" );} ID
{
  // 2024 04 09
  addComment( "Data" );
  addAsmVariable($3.name, 2);
  int addr = getAddressOf( $3.name );
  addAsm( str_LDA + "#<" + getLabel( label_vector[label_major],false), 2, false );

  // 2024 04 14 - mkpellegirno
  addAsm( str_STA + getNameOf( addr ), 3, false );
  //addAsm( str_STA + "$" + toHex( addr ), 3, false );
  addAsm( str_LDA + "#>"  + getLabel( label_vector[label_major],false), 2, false );
  addAsm( str_STA + getNameOf( addr ) + "+1", 3, false );
  //addAsm( str_STA + "$" + toHex( addr +1 ), 3, false );
  // these 2 lines were commented out
  //addAsm( string( "JMP !+"), 3, false );
  //addAsm( str_JMP + getLabel( label_vector[label_major]+1,false), 3, false );

  //addAsm( generateNewLabel(), 0, true );
}
'=' '{' numberlist '}' ';'
{
  //addAsm( generateNewLabel(), 0, true );
  popScope();

};

| tLDA '(' expression ')' ';' 
{
  if( isA($3.name) || isXA($3.name) )
    {
      // it's already in A... do nothing
    }
  else if( isIntID($3.name) || isUintID($3.name) )
    {
      addAsm( str_LDA + $3.name, 3, false );
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
	  addAsm( str_LDA + "$" + toHex(val), 3, false );
	}
      else if( val < 256 )
	{
	  addAsm( str_LDA + "#$" + toHex(val), 2, false );
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
| tPUSH '(' expression ')' ';'
{
  stack_is_needed = true;

  // merely for testing out the software stack
  if( isA($3.name) )
    {
      addAsm( str_JSR + "PUSH", 3, false );
    }
  else if( isUintID($3.name) )
    {
      addAsm( str_LDA + "$" + toHex(getAddressOf( $3.name )), 3, false );
      addAsm( str_JSR + "PUSH", 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addAsm( str_LDA + "#$" + toHex( atoi( stripFirst($3.name).c_str() )), 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
    }
};
| tSEED '(' ')' ';' 
{
  addComment( "=========================================================");  
  addComment( "                         seed();" );
  addComment( "=========================================================");
  sidrnd_is_needed = true;
  addAsm( str_JSR + "SIDRND" + commentmarker + "initialize random number generator", 3, false );
  sidrnd_is_initialised = true;
};

| tSPRITEON '(' expression ')' ';'
{
  addComment( "spriteon( exp );" );
  
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
      addAsm( str_ORA + "$D015", 3, false );
    }
  else if( isA( $3.name ) )
    {
      addAsm( str_ORA + "$D015", 3, false );
    }
  else
    {
      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$D015", 3, false );
      addAsm( str_LDA + "$" + toHex( x ), 3, false );
    }
  addAsm( str_STA + "$D015", 3, false );
};
| tSPRITEOFF '(' expression ')' ';'
{
  addComment( "TODO: this could be implemented better for IMMs" );
  addComment( "spriteoff( exp );" );

  
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
    }
  else if( isA( $3.name ) )
    {
      addComment( "not yet implemented" );
      //addAsm(str_EOR + "#$FF", 2, false );
      //addAsm( str_AND + "$D015", 3, false );
    }
  else
    {
      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$" + toHex( x ), 3, false );
    }
  addAsm( str_EOR + "#$FF", 2, false );
  addAsm( str_AND + "$D015", 3, false );
  addAsm( str_STA + "$D015", 3, false );
};
| tSPRITETOGGLE '(' expression ')' ';'
{
  addComment( "spritetoggle( exp );" );
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
    }
  else
    {
      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$" + toHex( x ), 3, false );
    }
  addAsm( str_EOR + "$D015", 3, false );
  addAsm( str_STA + "$D015", 3, false );
};
| tSPRITESET '(' expression ')' ';'
{
  addComment( "spriteset( exp );" );
  if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      int x = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x ), 2, false );
    }
  else if( isA($3.name) )
    {

      // nothing to be done - value is in A already
    }
  else
    {
      int x = getAddressOf($3.name);
      addAsm( str_LDA + "$" + toHex( x ), 3, false );
    }
  addAsm( str_STA + "$D015", 3, false );
};
| tSPRITEXY '(' expression ',' expression ',' expression ')' ';'
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
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      
      x_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      y_coord = atoi( stripFirst($7.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( y_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );
    }
  else if((isIntIMM($3.name) && isWordID($5.name) && isIntID($7.name)) ||
	  (isIntIMM($3.name) && isWordID($5.name) && isUintID($7.name)) ||
	  (isUintIMM($3.name) && isWordID($5.name) && isIntID($7.name)) ||
	  (isUintIMM($3.name) && isWordID($5.name) && isUintID($7.name)))
    {
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;

      int addr = hexToDecimal($5.name);

      addAsm( str_LDA + "$" + toHex(addr) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      // need to put the high byte
      // in 0xD010 as a bit
      addCompilerMessage( "Use spritex( UintIMM, Word ) instead", 0 );
      addAsm( str_STA + "$" + toHex(addr+1), 3, false );
      addAsm( str_STA + "$D010", 3, false );
      
      addAsm( str_LDA + string($7.name) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );
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
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      x_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( x_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      addAsm( str_LDA + string($7.name) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );
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
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_LDA + string($5.name) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      addAsm( str_LDA + string($7.name) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );
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
      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_LDA + string($5.name), 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
      y_coord = atoi( stripFirst($7.name).c_str() );
      addAsm( str_LDA + "#$" + toHex( y_coord), 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address+1 ), 3, false );
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
      addComment( "All 3 parameters are variables" );
      addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + string($5.name), 3, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + string($7.name), 3, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );      
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
      addComment( "All 3 parameters are variables" );
      addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_CLC );
      addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + stripFirst(string($5.name)), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

      addAsm( str_INX );
      addAsm( str_LDA + "#$" + stripFirst(string($7.name)), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the y-coord", 3, false );
    }
  else
    {
      addCompilerMessage( "unidentified argument type in spritexy" );
    }
};
| tSPRITEX '(' expression ',' expression ')' ';'
{
  addComment( string( "spritex( ") + string($3.name) + string(", ") + string($5.name) + string( " );" ) );
  int base_address = 53248;
  int sprite_address = 0;
  int x_coord = 0;
  int y_coord = 0;
  if( (isIntIMM($3.name) && isIntIMM($5.name)) ||
      (isIntIMM($3.name) && isUintIMM($5.name)) ||
      (isUintIMM($3.name) && isIntIMM($5.name)) ||
      (isUintIMM($3.name) && isUintIMM($5.name)) )
    {
      addComment( "spritex( UintIMM, UintIMM );" );
      
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
  else if(isA($3.name) &&  isWordID($5.name))
    {
      addComment( "spritex( A, WordID );" );
      
      int value_addr = getAddressOf( $5.name );
      
      
      // A is already set
      //addAsm( str_LDA + "$" + toHex( var_addr ), 3, false );
      addAsm( str_PHA ); 
      addAsm( str_ASL ); // multiply by 2
      addAsm( str_TAX ); // move it to X
      addAsm( str_LDA + "$" + toHex( value_addr ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_STA + "$D000,X", 3, false );

      // for the high byte of the x
      // 2023 03 07 - mkpellegrino
      addAsm( str_LDA + "$" + toHex( value_addr + 1), 3, false ); // this is the HIGH byte of the X coord
      //addAsm( str_TAX );
      /// this next line isn't correct... it should be loading the original "A" again
      //addAsm( str_LDA + "$" + toHex( value_addr ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_PLA );
      addComment( "top-of-loop" );
      addAsm( str_ASL  );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + string("BNE top-of-loop"), 2, false );
      addAsm( str_ORA + "$D010,X", 3, false );
      addAsm( str_STA + "$D010,X", 3, false );
    }
  else if(isUintIMM($3.name) && isWordIMM($5.name))
    {

      int sprite_base = 53248;
      
      addComment( "spritex( UINTIMM, WORDIMM );" );

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
  else if(isUintID($3.name) && isWordID($5.name))
    {
      addComment( "spritex( UINTID, WORDID );" );
      bin2bit_is_needed = true;
      
      int sprite_addr = getAddressOf( $3.name );
      int value_addr = getAddressOf( $5.name );

      // the low byte
      addAsm( str_LDA + "$" + toHex( sprite_addr ), 3, false );
      addAsm( str_ASL ); // multiply by 2
      addAsm( str_TAX ); // move it to X
      addAsm( str_LDA + "$" + toHex( value_addr ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_STA + "$D000,X", 3, false );

      // the high byte
      addAsm( str_LDA + "$" + toHex( sprite_addr ), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BIN2BIT", 3, false);
      addAsm( str_PLA );  
      addAsm(str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$02", 2, false );

      // 2023 03 07 - mkpellegrino
      addAsm( str_LDX + "$" + toHex( sprite_addr ), 3, false );
      //addAsm( str_TAX );
      addAsm( str_LDA + "$" + toHex( value_addr +1 ), 3, false ); // this is the HIGH byte of the X coord
      addComment( "top-of-loop" );
     addAsm( str_ASL );
      addAsm( str_DEX );
      addAsm( str_BYTE + string("$D0, $FC") + commentmarker + string("BNE top-of-loop"), 2, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if(isUintID($3.name) && isXA($5.name))
    {
      //============================================
      addComment( "spritex( UINTID, XA );" );
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
      
      bin2bit_is_needed = true;
      
      int sprite_number = getAddressOf( $3.name );

      // the low byte
      addAsm( str_LDA + "$" + toHex( sprite_number ) + commentmarker + "sprite # -> A", 3, false );
      addAsm( str_ASL + commentmarker + "multiply it by 2", 1, false ); // multiply by 2
      addAsm( str_TAX + commentmarker + "make Sprite# * 2 the index (X)", 1, false); // move it to X
      addAsm( str_TYA + commentmarker + "move the Low Byte of x-coord to A", 1, false);
      //addAsm( str_LDA + "$02; this puts the Low Byte of the X coord into A", 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the low-byte value", 3, false );

      // the high byte
      addAsm( str_LDA + "$" + toHex( sprite_number ), 3, false );
      //addAsm( str_LDA + "$02", 2, false );
      //addAsm( str_TXA );
      //addAsm( str_LSR );
      addAsm( str_PHA );
      addAsm( str_JSR + "BIN2BIT", 3, false);
      addAsm( str_PLA );
      
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$05", 2, false );
      
      addAsm( str_LDX + "$" + toHex( sprite_number ), 3, false );
      addAsm( str_INX );
      //addAsm( str_LDX + "$02; puts the sprite number into X", 2, false );
      addAsm( str_LDA + "$03" + commentmarker + "puts the High Byte of the x-coord into A (it's a 1 or a 0)", 2, false );
      addAsm( str_LSR + commentmarker + "puts that 1 or 0 into the carry flag", 1, false  );
      addComment( "top-of-loop" );
      addAsm( str_ROL ); // used to be ASL
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );
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
  else if(isUintID($3.name) && isA($5.name))
    {
      addComment( "spritex( UINTID, A );" );
      bin2bit_is_needed = true;
      
      int sprite_addr = getAddressOf( $3.name );
      
      int value_addr = getAddressOf( $5.name );
      addAsm( str_PHA );

      // the low byte
      addAsm( str_LDA + "$" + toHex( sprite_addr ), 3, false );
     addAsm( str_ASL ); // multiply by 2
      addAsm( str_TAX ); // move it to X
      addAsm( str_PLA );
      //addAsm( str_LDA + "$" + toHex( value_addr ), 3, false ); // this is the LOW byte of the X coord
      addAsm( str_STA + "$D000,X", 3, false );

      // the high byte
      addAsm( str_LDA + "$" + toHex( sprite_addr ), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BIN2BIT", 3, false);
      addAsm( str_PLA );  
      addAsm(str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$02", 2, false );

      // 2023 03 07 - mkpellegrino
      addAsm( str_LDX + "$" + toHex( sprite_addr ), 3, false );
      //addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_LDA+"#$00", 2, false );
      addComment( "top-of-loop" );
     addAsm( str_ASL );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if(isUintIMM($3.name) && isWordID($5.name))
    {
      addComment( "spritex( IMM, WORDID );" );

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      int addr = hexToDecimal($5.name);
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr) , 3, false );
      //addAsm( str_LDA + "$" + toHex(addr) , 3, false );
      
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );


      // need to put the high byte
      // in 0xD010 as a bit
      // 2023 01 01 - mkpellegrino
      //we should _really_ OR the sprite number's bit with the current value
      //addAsm( string("LDX $") + toHex(addr+1), 3, false );
      //addAsm( "CPX #$00", 2, false );
      //addAsm( ".byte #$F0, #$08", 2, false );
      
      // load the Hibyte into A
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr)+"+1", 3, false );
      //addAsm( str_LDA + "$" + toHex(addr+1), 3, false );
      addAsm( str_STA + "$2A", 2, false );
      addAsm( str_LDA + "#$01", 2, false );
      // find out which sprite number we're talking about
      int sprite_number = atoi( stripFirst($3.name).c_str() );
      switch( sprite_number )
	{
	case 7:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 6:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 5:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 4:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 3:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 2:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 1:
	 addAsm( str_ASL );
	  addAsm(str_ASL + "$2A", 2, false );
	case 0:
	  break;
	default:
	  addCompilerMessage( "Non-sprite number used as IMMEDIATE value\nRange is: 0 to 7", 3 );
	  break;
	}

      // now A contains the correct bit
      //addAsm( str_PHA );
      
      addAsm(str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "$D010", 3, false );
      addAsm( str_STA + "$A7", 2, false );  // Zero Page 0xA7 is used during RS232 comms
      //addAsm( str_PLA );
      //addAsm( str_LDA + "$" + toHex(addr+1), 3, false );
      addAsm( str_LDA + "$2A", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "$A7", 2, false );
      addAsm( str_STA + "$D010", 3, false );
    }
  else if( (isIntIMM($3.name) && isIntID($5.name)) ||
	   (isIntIMM($3.name) && isUintID($5.name)) ||
	   (isUintIMM($3.name) && isIntID($5.name)) ||
	   (isUintIMM($3.name) && isUintID($5.name)) )
    {
      addComment( "spritex( IMM, UINT/INT ID );" );

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      addAsm( str_LDA + string($5.name) , 3, false );
      addAsm( str_STA + "$" + toHex( sprite_address ), 3, false );
    }
  else if( (isUintID($3.name) && isUintID($5.name)) ||
	   (isUintID($3.name) && isIntID($5.name)) ||
	   (isIntID($3.name) && isUintID($5.name)) ||
	   (isIntID($3.name) && isIntID($5.name)) )
    {
      addComment( "spritex( UINTID, UINT/INT ID );" );

      addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_CLC );
     addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + string($5.name), 3, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );
      
    }
  else if( (isUintID($3.name) && isUintIMM($5.name)) ||
	   (isUintID($3.name) && isIntIMM($5.name)) ||
	   (isIntID($3.name) && isUintIMM($5.name)) ||
	   (isIntID($3.name) && isIntIMM($5.name)) )
    {
      addComment( "spritex( UINT/INT ID, IMM );" );
	    
      addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_CLC );
     addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA+"#$" + stripFirst(string($5.name)), 2, false );
      addAsm( str_STA + "$D000,X" + commentmarker + "set the x-coord", 3, false );

    }
  else if( isUintID($3.name) && isWordIMM($5.name) )
    {
      addCompilerMessage( "spritex( UintID, WordIMM ) not YET implemented!", 3 );
    }
  else
    {
      addCompilerMessage( "spritex error - invalid type", 1 );
    }
};
| tSPRITEY '(' expression ',' expression ')' ';'
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
      addComment( "spritey( (U)IntIMM, (U)IntIMM );" );

      sprite_address = atoi( stripFirst($3.name).c_str() );
      sprite_address*=2;
      sprite_address+=base_address;
      y_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDA+"#$" + toHex( y_coord) , 2, false );
      addAsm( str_STA + "$" + toHex( sprite_address + 1 ), 3, false );
    }
  else if((isIntIMM($3.name) && isIntID($5.name))    ||
	  (isIntIMM($3.name) && isUintID($5.name))   ||
	  (isUintIMM($3.name) && isIntID($5.name))   ||
	  (isUintIMM($3.name) && isUintID($5.name)) )
    {
      addComment( "spritey( (U)IntIMM, (U)IntID );" );

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
      addComment( "spritey( (U)IntID, (U)IntID );" );

      addAsm( str_LDA + string($3.name), 3, false );
     addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + string($5.name), 3, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );
    }
  else if((isA($3.name) && isUintID($5.name)) ||
	  (isA($3.name) && isIntID($5.name)))
    {
      addComment( "spritey( A, (U)IntID );" );
     addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA + string($5.name), 3, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );

    }
  else if( (isUintID($3.name) && isIntIMM($5.name)) ||
	   (isUintID($3.name) && isUintIMM($5.name)) ||
	   (isIntID($3.name) && (isIntIMM($5.name))) ||
	   (isIntID($3.name) && (isUintIMM($5.name))) )
    {
      addComment( "spritey( (U)IntID, (U)IntIMM );" );
       
      addAsm( str_LDA + string($3.name), 3, false );
     addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_LDA+"#$" + stripFirst(string($5.name)), 2, false );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );

    }
  else if( (isUintID($3.name) && isA($5.name)) ||
	   (isIntID($3.name) && isA($5.name)) )
    {
      addComment( "spritey( (U)IntID, A );" );
		 
      addAsm( str_PHA );
      addAsm( str_LDA + string($3.name), 3, false );
      //addAsm( str_CLC );
     addAsm( str_ASL ); // 2x
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_STA + "$D001,X" + commentmarker + "set the y-coord", 3, false );
  }
  else
    {
      addCompilerMessage( "spritey error - invalid type", 1 );
    }
}
| ID '(' parameterlist ')' ';'
{
  addComment( "Call a function as a statement" );
  proposed_ids_vector.push_back( new id_and_line( $1.name, countn+1 ));
  addAsm( str_JSR + $1.name, 3, false );
  
};
| tSPRITECOLOUR '(' expression ',' expression ')' ';'
{
  addParserComment( "statement: tSPRITECOLOUR '(' expression ',' expression ')' ';'" );

  int base_addr = 53248;
  int sprite_number = 0;
  int sprite_colour = 0;

  // COLOUR
  if( isIntIMM($5.name) || isUintIMM($5.name))
    {
      sprite_colour = atoi( stripFirst($5.name).c_str() ); // the sprite colour
      addAsm( str_LDA+"#$" + toHex( sprite_colour ), 2, false );
    }
  else if(isIntID($5.name) || isUintID($5.name))
    {
      sprite_colour = getAddressOf($5.name);
      addAsm( str_LDA + "$" + toHex( sprite_colour ), 3, false );
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
      addAsm( str_LDX + "$" + toHex( getAddressOf($3.name)), 3, false );
      addAsm( str_STA + "$D027,X", 3, false );
    } 
};
| SCANFF '(' ID ')' ';'
{
  addCommentSection("scanf(ID)");
  getkey_is_needed=true;
  scanf_is_needed=true;
  memcpy_is_needed=true;
  addAsm( str_JSR + "SCANF", 3, false );  
  addAsm( str_LDA + "#<SCANFBUF-2", 2, false );
  addAsm( str_STA + "$FB", 2, false );
  addAsm( str_LDA + "#>SCANFBUF-2", 2, false );
  addAsm( str_STA + "$FC", 2, false );

  int addr = getAddressOf($3.name);

  addAsm( str_LDA + "#$" + toHex( get_word_L( addr-1 )), 2, false );
  addAsm( str_STA + "$FD", 2, false );
  addAsm( str_LDA + "#$" + toHex( get_word_H( addr-1 )), 2, false );
  addAsm( str_STA + "$FE", 2, false );

  addAsm( str_LDA + "#$0F", 2, false );
  addAsm( str_PHA );
  //addAsm( str_LDY + "#$" + toHex( get_word_H( addr )), 2, false );
  addAsm( str_JSR + "MEMCPY", 3, false );
  
};
| SCANFF '(' STR ')' ';'
{
  addCommentSection("scanf(STR)");
  getkey_is_needed=true;
  scanf_is_needed=true;
  addAsm( str_JSR + "SCANF", 3, false );  
};
| tPRINTS '(' expression ')' ';'
{
  addCommentSection( string("prints(") + string($3.name) + string( ");") );
  if( isUintID($3.name) )
    {
      pushScope( "PRINTS" );
      int addr = getAddressOf( $3.name );
      string OP3 = getNameOf(addr);
      
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( generateNewLabel() + commentmarker + string( "\t\t\ttop of prints"), 0, true ); // LABEL BB

      addAsm( str_LDA + OP3 + string(",X"), 3, false );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major],false), 2, false ); 
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_INX );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false ); 
      addAsm( generateNewLabel() + commentmarker + string( "\t\t\tbottom of prints"), 0, true ); // LABEL BB

      popScope();
    }
  else if( isWordIMM($3.name) )
    {
      printf_is_needed = true;
      int tmp_v = atoi(stripFirst($3.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);
      addAsm( str_LDA+"#$"+toHex(tmp_L), 2, false );
      addAsm( str_STA+"$02", 2, false );
      addAsm( str_LDA+"#$"+toHex(tmp_H), 2, false );
      addAsm( str_STA+"$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false );
    }
  
  else if( isWordID($3.name) )
    {
      printf_is_needed = true;
      int addr = getAddressOf( $3.name );
      string OP3 = getNameOf(addr);
     
      addAsm( str_LDA + OP3, 3, false );
      addAsm( str_STA+"$02", 2, false );
      addAsm( str_LDA + OP3 + "+1", 3, false );
      addAsm( str_STA+"$03", 2, false );
      addAsm( str_JSR + "PRN", 3, false );
    }
  else if( isXA($3.name) )
    {
      addCompilerMessage( "If you're using a pointer here, you could pass the WordID instead to reduce the size of the code.", 0 );
      printf_is_needed = true;
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STX + "$03", 2, false );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_LDA + "($02),Y", 2, false );
      addAsm( str_PHA );
      addAsm( str_INY );
      addAsm( str_LDA + "($02),Y", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_JSR + "PRN", 3, false );
    }
  else
    {
      addCompilerMessage( string("prints of unknown type: ") + $3.name, 3 );
    }
};
| PRINTFF '(' expression ')' ';'
{
  addCommentSection( string("printf(") + string($3.name) + string( ");") );
  if( isUintID($3.name) )
    {
      addComment( "printf(UintID);" );

      pushScope( "PRINTF(UintID)" );
      int addr = hexToDecimal(stripFirst($3.name).c_str());
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr), 3, false );
      //addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYT2STR", 3, false ); byt2str_is_needed = true;
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major]+2,false), 2, false ); // BNE AA
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_TYA );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "Just Two Bytes", 0, true ); // LABEL BB
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "Only One Byte", 0, true ); // LABEL CC
      addAsm( str_TXA );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( commentmarker + "jump to label below ", 0, true );
      addAsm( str_JMP + getLabel( label_vector[label_major]+1,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + "Label CMP2", 0, true ); // LABEL AA
      addAsm( str_TYA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major]-2,false), 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-3,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + "Done", 0, true );
      popScope();
    }
  else if( isA($3.name) )
    {
      pushScope( "PRINTF(A)" );
      addComment( "printf(A);" );

      //addAsm( str_LDA + string($3.name), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYT2STR", 3, false ); byt2str_is_needed = true;
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major]+2,false), 2, false ); // BNE AA
      addAsm( str_JSR + "$FFD2", 3, false );

      addAsm( str_TYA );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + string( " Just Two Bytes"), 0, true ); // LABEL BB
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + string( " Only One Byte"), 0, true ); // LABEL CC
      addAsm( str_TXA );
      addAsm( str_JSR + "$FFD2", 3, false );

      addAsm( commentmarker + "jump to label below ", 0, true );
      addAsm( str_JMP + getLabel( label_vector[label_major]+1,false), 3, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "Label CMP2", 0, true ); // LABEL AA
      addAsm( str_TYA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major]-2,false), 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-3,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + string( " Done"), 0, true );
      popScope();
    }
  else if( isIntID($3.name) )
    {
      addComment( "printf(IntID);" );

      pushScope( "PRINTF" );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_CMP + "#$7F", 2, false );
      addAsm( str_BCC + getLabel( label_vector[label_major],false), 2, false ); // BCC Skip
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_LDA + "#$2D", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );

      
      // put it into two's complement
      addAsm( str_PLA );
      addAsm( str_SEC );
      addAsm( str_SBC + "#$01", 2, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_PHA );
      addAsm( generateNewLabel() , 0, true ); // LABEL BB      
      addAsm( str_JSR + "BYT2STR", 3, false ); byt2str_is_needed = true;

      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major]+2,false), 2, false ); // BNE AA
      
      addAsm( str_JSR + "$FFD2", 3, false );

      addAsm( str_TYA );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + "Just Two Bytes", 0, true ); // LABEL BB
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t") + commentmarker + "Only One Byte", 0, true ); // LABEL CC
      addAsm( str_TXA );
      addAsm( str_JSR + "$FFD2", 3, false );
      addComment( "jump to label below " );
      addAsm( str_JMP + getLabel( label_vector[label_major]+1,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t" ) + commentmarker + "Label CMP2", 0, true ); // LABEL AA
      addAsm( str_TYA );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major]-2,false), 2, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-3,false), 3, false );
      addAsm( generateNewLabel() + string( "\t\t\t" ) + commentmarker + "Done", 0, true );
      popScope();
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
      addAsm( str_JSR + "PRN", 3, false); printf_is_needed = true;
    }
  else if( isFAC($3.name) )
    {
      addComment( "printf(FAC);" );

      addAsm( str_JSR + "$BDDD" + commentmarker + "FAC -> PETSCII ($0100)", 3, false );
      pushScope("PRINTFFAC" );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true ); 

      addAsm( str_LDA + "$0100,X", 3, false );
      addAsm( str_CMP + "#$00", 2, false );

      addAsm( str_BYTE + "$F0, $06" + commentmarker + "BEQ +6", 2, false );
      //addAsm( string(".byte #$F0, #$06") + commentmarker + string( " BEQ +6"), 2, false );
      //addAsm( "BEQ #$06", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );

      popScope();
    }
  else if( isFloatID($3.name) )
    {
      addComment( "printf(FloatID);" );

      current_variable_base_address = getAddressOf($3.name);

      addAsm( str_LDA + "#$" + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( str_LDY + "#$" + toHex( get_word_H( current_variable_base_address )), 2, false );
      
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
      pushScope("PRINTF(WORD)");
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      current_variable_base_address = getAddressOf($3.name);
      int base_address_op1 = hexToDecimal($3.name);
      int inst_size = 3;
      if( base_address_op1 < 256 ) inst_size = 2;
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(base_address_op1), inst_size, false );
      //addAsm( str_LDA + "$" + toHex( ( base_address_op1 )), inst_size, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(base_address_op1) + "+1", inst_size, false );
      //addAsm( str_LDA + "$" + toHex( ( base_address_op1+1 )), inst_size, false );
      addAsm( str_STA + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );


      // find the 1st non-30 ('0') byte
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA + "HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$30", 2, false );

      addAsm( str_BYTE + "$D0, $04" + commentmarker + "BNE SKIP", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP +  getLabel( label_vector[label_major]-1,false), 3, false );
      // ---------------------------------
      // 2022 12 16 - mkpellegrino
      // make sure it prints a 0 if it's 0
      // and not just a blank space!
      addAsm( str_CPX + "#$06", 2, false );
      addAsm( str_BYTE + string("$D0, $01") + commentmarker + "BNE SKIP", 2, false ); // BNE to skip
      addAsm( str_DEX );
      // ---------------------------------
      addAsm( generateNewLabel(), 0, true );

      addAsm( str_LDA + "HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BYTE + string("$F0, $07") + commentmarker + "BEQ #$07", 2, false );  // beq to pop scope
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      popScope();
    }
  else if( isXA($3.name) )
    {
      pushScope("PRINTF(XA)");
      addComment( "printf(XA);" );
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      current_variable_base_address = getAddressOf($3.name);
      int base_address_op1 = hexToDecimal($3.name);
      int inst_size = 3;
      if( base_address_op1 < 256 ) inst_size = 2;
      //addAsm( str_LDA + "$" + toHex( ( base_address_op1 )), inst_size, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      //addAsm( str_LDA + "$" + toHex( ( base_address_op1+1 )), inst_size, false );
      addAsm( str_STX + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );


      // find the 1st non-30 ('0') byte
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA + "HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$30", 2, false );
   
      addAsm( str_BYTE + string("$D0, $04") + commentmarker + string( "BNE SKIP"), 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      // ---------------------------------
      // 2022 12 16 - mkpellegrino
      // make sure it prints a 0 if it's 0
      // and not just a blank space!
      addAsm( str_CPX + "#$06", 2, false );
      addAsm( str_BYTE + string("$D0, $01") + commentmarker + string( " BNE SKIP"), 2, false ); // BNE to skip
      addAsm( str_DEX );
      // ---------------------------------
      addAsm( generateNewLabel(), 0, true );

      addAsm( str_LDA + "HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BYTE + string("$F0, $07") + commentmarker + string( " BEQ #$07"), 2, false );  // beq to pop scope
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );

      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      popScope();
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "printf(WordIMM);" );
      addCompilerMessage( "This is very inefficient.  Your could just print the value as a string.", 0 );
      int tmp = atoi( stripFirst($3.name).c_str() );
      pushScope("PRINTF(WORD)");
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      addAsm( str_LDA + "#$"  + toHex( get_word_L( tmp )), 2, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      addAsm( str_LDA + "#$" + toHex( get_word_H( tmp )), 2, false );
      addAsm( str_STA + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA +"HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$30", 2, false );
      addAsm( str_BYTE + "$D0, $04" + commentmarker + "BNE SKIP", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      addAsm( str_CPX + "#$06", 2, false );
      addAsm( str_BYTE + "$D0, $01" + commentmarker + "BNE SKIP", 2, false ); // BNE to skip
      addAsm( str_DEX );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA +"HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BYTE + "$F0, $07" + commentmarker + "BEQ #$07", 2, false );  // beq to pop scope
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      popScope();
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      addComment( "printf((U)IntIMM);" );
      addCompilerMessage( "This is very inefficient.  Your could just print the value as a string.", 0 );
      int tmp = atoi( stripFirst($3.name).c_str() );
      pushScope("PRINTF(A)");
      word2dec_is_needed = true;
      byte2hex_is_needed = true;
      addAsm( str_LDA + "#$" + toHex( tmp ), 2, false );
      addAsm( str_STA + "HTD_IN", 3, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "HTD_IN+1", 3, false );
      addAsm( str_JSR + "WORD2DEC", 3, false );
      addAsm( str_LDX + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA + "HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$30", 2, false );

      addAsm( str_BYTE + "$D0, $04" + commentmarker + "BNE SKIP", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      addAsm( str_CPX + "#$06", 2, false );
      addAsm( str_BYTE + "$D0, $01" + commentmarker + "BNE SKIP", 2, false ); // BNE to skip
      addAsm( str_DEX );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_LDA + "HTD_STR,X", 3, false );
      addAsm( str_CMP + "#$00", 2, false );

      addAsm( str_BYTE + "$F0, $07" + commentmarker + "BEQ +7", 2, false );  // beq to pop scope
      addAsm( str_INX );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      popScope();
    }
  else
    {
      addCompilerMessage( "printf of unknown type", 3 );
    }
};
| PRINTFF '(' STR ')' ';'
{
  addCommentSection( string("printf(") + string($3.name) + string( ");") );

  addComment( "save $02/$03" );
  addAsm( str_LDA + "$02", 2, false );
  addAsm( str_PHA );
  addAsm( str_LDA + "$03", 2, false );
  addAsm( str_PHA );
  
  addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );
  addAsm( str_LDA + "#<STRLBL" + itos(string_number), 2, false );
  addAsm( str_STA + "$02", 2, false );
  addAsm( str_LDA + "#>STRLBL" + itos(string_number++), 2, false );
  addAsm( str_STA + "$03", 2, false );
  
  addAsm( str_JSR + "PRN", 3, false );

  addComment( "restore $02/$03" );
  addAsm( str_PLA ); 
  addAsm( str_STA + "$03", 2, false );
  addAsm( str_PLA ); 
  addAsm( str_STA + "$02", 2, false );
  printf_is_needed = true;
};
| tBYTE2HEX '(' expression ')' ';'
{
  // this byte2hex section is all wonky
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

  addCommentSection( string("byte2hex(") + string($3.name) + string(")"));
  addParserComment($3.name  );
  if( isUintID($3.name) || isIntID($3.name) ) 
    {
      // uint and int
      addComment( "byte2hex((U)IntID);" );
      addAsm( str_LDA + "$" + toHex(getAddressOf($3.name)).c_str(), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addComment( "byte2hex(UintIMM);" );
      int tmp = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDA+"#$" + toHex( tmp), 2, false );
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
      addAsm( str_LDA + "$" + toHex(getAddressOf($3.name)).c_str(), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$" + toHex(getAddressOf($3.name)+1).c_str(), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isFloatIMM( string($3.name) ))
    {
      addCompilerMessage( "cannot byte2hex a float... try printf", 3 );
      addComment("cannot byte2hex a float");
    }
  else if( isA($3.name) )
    {
      addComment( "byte2hex(A);" );

      addDebugComment( "Straight from A r" );
      //addAsm( str_LDA + string($3.name), 3, false );
      addDebugComment("Push the argument onto the stack before function call" );
      addAsm( str_PHA );
      addAsm( str_JSR + "BYTE2HEX", 3, false );
    }
  else if( isXA($3.name) )
    {
      addComment( "byte2hex(XA);" );

      addDebugComment( "Straight from X and Acc registers" );
      //addAsm( str_LDA + string($3.name), 3, false );
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
| tCURSORXY '(' expression ',' expression ')' ';'
{
  // TODO: um... like... completely redo this
  // update: 2023 04 11 - yes - I agree
  addComment( string("cursorxy(") + string($3.name) + string(",") + string($5.name) + string( ")" ));
  addAsm( str_CLC ); // carry must be set in order to SET the cursor position using kernal call
  if( getTypeOf($3.name) > 1 || getTypeOf($5.name) > 1 )
    {
      addCompilerMessage( "cursorxy arguments must be uint or int", 3 );
    }
  if( atoi($3.name) < 0 || atoi($5.name) < 0 )
    {
      addCompilerMessage( "cursorxy arguments must be > 0", 3 );
    }

  
  if( isIntIMM($3.name) || isUintIMM($3.name))
    {
      int x_coord = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDY + "#$"  + toHex( x_coord ), 2, false );
    }
  else if( isAddress($3.name) ) // TODO: Fix this _old_ style of what it is
    {
      int x_coord = getAddressOf($3.name);
      addAsm( str_LDY + "$" + toHex( x_coord ), 3, false );
    }
  else
    {
      addCompilerMessage( string( "unknown type: ") + string($3.name) , 3 );
    }
  
  if( isIntIMM($5.name) || isUintIMM($5.name))
    {
      int y_coord = atoi( stripFirst($5.name).c_str() );
      addAsm( str_LDX + "#$" + toHex( y_coord ), 2, false );
    }
  else if( isAddress($5.name) )// TODO: Fix this _old_ style of what it is
    {
      int y_coord = getAddressOf($5.name);
      addAsm( str_LDX + "$" + toHex( y_coord ), 3, false );
    }
  else if( isXA($5.name) || isA($5.name) )
    {
      addAsm( str_TAX );
    }

  else
    {
      addCompilerMessage( string( "unknown type: ") + string($5.name) , 3 );
    }
  addAsm( str_JSR + "$FFF0", 3, false );
};
| tCLS '(' ')' ';'
{
  addCommentSection( "cls()");
  cls_is_needed = true;
  addAsm( str_JSR + "CLS" + commentmarker + "deep cls()", 3, false );
};
| tCLS '(' expression ')' ';'
{
  addCommentSection( "cls(expression)");
  if( isUintIMM( $3.name ) )
    {
      int v = atoi(stripFirst($3.name).c_str());
      switch( v )
	{
	case 1:
	case 2:
	case 3:
	  v*=4;
	case 0:
	case 4:
	case 8:
	case 12:
	  addAsm( str_LDA + "#$20", 2, false ); // space
	  addAsm( str_LDX + "#$00", 2, false ); // (essentially 256)
	  //addAsm( "CLSLOOP:", 0, true );
	  addComment( "top-of-cls-loop" );
	  addAsm( str_STA + "$" + toHex( v ) +  "400,X", 3, false );
	  addAsm( str_STA + "$" +  toHex( v ) +  "500,X", 3, false );
	  addAsm( str_STA + "$" +  toHex( v ) +  "600,X", 3, false );
	  addAsm( str_STA + "$" +  toHex( v ) +  "6E8,X", 3, false );
	  addAsm( str_DEX );
	  addAsm( str_BYTE + "$D0, $F1" + commentmarker + "BNE -14", 2, false ); // BNE top-of-loop
	  break;
	default:
	  addAsm( str_JSR + "$FF81" + commentmarker + "kernal cls()", 3, false );
	  break;
	}
    }
  else if( isUintID( $3.name ) )
    {
      int addr = getAddressOf( $3.name );
      
      pushScope("CLS(ID)");
      addAsm( str_LDA + "$" + toHex(addr), 3, false );
      addAsm( str_CMP + "#$04", 2, false );
      addAsm( str_BYTE + "$B0, $02" + commentmarker + "BCS +2", 2, false );
      addAsm( str_ASL );
      addAsm( str_ASL );

      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ORA + "#$04", 2, false );
      addAsm( str_TAX );
      
      addAsm( str_STX + getLabel( label_vector[label_major], false) + "+2", 3, false );
      addAsm( str_INX );
      addAsm( str_STX + getLabel( label_vector[label_major]+1, false) + "+2", 3, false );
      addAsm( str_INX );
      addAsm( str_STX + getLabel( label_vector[label_major]+2, false) + "+2", 3, false );
      addAsm( str_STX + getLabel( label_vector[label_major]+3, false) + "+2", 3, false );
     
      addAsm( str_LDA + "#$20", 2, false );
      addAsm( str_LDX + "#$00", 2, false );
      
      addComment( "top-of-cls-loop" );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_STA + "$0000,X", 3, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_STA + "$0000,X", 3, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_STA + "$0000,X", 3, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_STA + "$00E8,X", 3, false );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $F1" + commentmarker + "bnz top-of-cls-loop", 2, false );
      popScope();
    }
  else
    {
      addCompilerMessage( "Unhandled argument type for cls( expression );", 3 );
    }

};
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
      addAsm( str_ORA + "$" + toHex(v), 3, false );
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
| tROMIN '(' ')' ';'
{
  addComment( "------------------------------------------------" );
  addComment( "romin() : Restore the default ROMS configuration" );
  addAsm( str_SEI );
  addAsm( str_LDA + "#$37" + commentmarker + "Default Value", 2, false );
  addAsm( str_STA + "$01", 2, false );
  addAsm( str_CLI );
  addComment( "------------------------------------------------" );

}
| tSIDOFF '(' expression ')' ';'
{
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
	  addAsm( str_JSR+getNameOf(tmp_addr), 3, false );
	  //addAsm( str_JSR+"$"+toHex(tmp_addr), 3, false );
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
| tSIDIRQ '(' expression ',' expression ')' ';'
{
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

      addAsm( str_AND + "$D011", 3, false );
      addAsm( str_STA + "$D011", 3, false );

      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );

      // enable the raster int.  2023 05 15
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
    
      addAsm( str_LDY + "#$7E" + commentmarker + "raster line for trigger", 2, false );
      addAsm( str_STY + "$D012", 3, false );

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
/* | tSCREEN '(' expression ')' ';' */
/* { */
/*   pushScope( "SCREEN" ); */
/*   // exp1 shl 4 times */
/*   // or it with d011 */
/*   // sta d011 */
/*   addComment( "screen(exp); : set bit 4 of $D011 to LSB of expression" ); */
/*   //addAsm( str_SEI ); */
/*   if( isUintID( $3.name ) ) */
/*     { */
/*       int v = getAddressOf( $3.name ); */
/*       addAsm( str_LDA + "$" + toHex(v), 3, false ); */

/*       addAsm( str_LDA + "#$EF", 2, false );   */
/*       addAsm( str_AND + "$D011", 3, false ); */
/*       addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + commentmarker + "store A after the ORA instruction below", 3, false ); */
/*       addAsm( str_LDA + "$" + toHex(v), 3, false ); */
/*       addAsm( str_AND + "#$01", 2, false ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ORA + getLabel( label_vector[label_major]+1, false) + commentmarker + "OR the argument with the old value of D011", 3, false ); */
   
/*       addAsm( generateNewLabel(), 0, true ); */
/*       addAsm( str_BYTE + "$A9, $00" + commentmarker + "LDA IMM", 2, false ); */
/*       addAsm( str_STA + "$D011", 3, false ); */

      
/*     } */
/*   else if( isUintIMM( $3.name ) ) */
/*     { */
/*       int v = atoi( stripFirst($3.name).c_str()); */
/*       //addAsm( str_LDA + "#$" + toHex(v), 2, false ); */


/*       if( v == 0 ) */
/* 	{ */
/* 	  addAsm( str_LDA + "#$EF", 2, false ); */
/* 	  addAsm( str_AND + "$D011", 3, false ); */
/* 	  addAsm( str_STA + "$D011", 3, false ); */
/* 	} */
/*       else */
/* 	{ */
/* 	  addAsm( str_LDA + "#$10", 2, false ); */
/* 	  addAsm( str_ORA + "$D011", 3, false ); */
/* 	  addAsm( str_STA + "$D011", 3, false ); */
/* 	} */
/*     } */
/*   else if( isA( $3.name ) ) */
/*     { */
/*       addAsm( str_PHA ); */
/*       // do nothing because the value is already in A */
/*       addAsm( str_LDA + "#$EF", 2, false );   */
/*       addAsm( str_AND + "$D011", 3, false ); */
/*       addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + commentmarker + "store A after the ORA instruction below", 3, false ); */
/*       addAsm( str_PLA ); */
/*       //addAsm( str_LDA + "$" + toHex(v), 3, false ); */
/*       addAsm( str_AND + "#$01", 2, false ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ASL ); */
/*       addAsm( str_ORA + getLabel( label_vector[label_major]+1, false) + commentmarker + "OR the argument with the old value of D011", 3, false ); */
   
/*       addAsm( generateNewLabel(), 0, true ); */
/*       addAsm( str_BYTE + "$A9, $00" + commentmarker + "LDA IMM", 2, false ); */
/*       addAsm( str_STA + "$D011", 3, false ); */

/*     } */
/*   else */
/*     { */
/*       addCompilerMessage( "incorrect type for blank must be UintID/IMM or A", 3 ); */
/*     } */
/*   popScope(); */
/* }; */
| tIRQ '(' expression {if(isXA($3.name)){p0=true;addAsm( str_PHA );addAsm( str_TXA );addAsm( str_PHA );}} ',' expression ',' NUMBER ')' ';'
{
  addCompilerMessage( "Don't forget to acknowledge the interrupt", 0 );
  addCompilerMessage( "in your function and then return control", 0 );
  addCompilerMessage( "back to the processor!\n\n" );
  addCompilerMessage( "\tpoke( 0xD019, 0x01 ); // ACK",0);
  addCompilerMessage( "\tjmp( 0xEA31 );  // RTN CTL",0);
  addCompilerMessage( "           OR", 0 );
  addCompilerMessage( "\tjmp( 0xEA7E );  // RTN CTL\n\n\n",0);
  addComment( " tIRQ '(' expression ',' expression ',' NUMBER ')' ';'" );
  int addr = getAddressOf( $3.name );
  int b = atoi($8.name);

  if(  b == 255 || b == -1 )
    {
      addComment( "Disable Raster Interrupt Signals from Vic" );
      addAsm( str_SEI );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      //addAsm( str_LDA + "#$FE", 2, false );
      //addAsm( str_AND + "$D01A", 3, false );
      //addAsm( str_STA + "$D01A", 3, false );
      //addAsm( str_LDA + "#$31", 2, false );
      //addAsm( str_STA + "$0314",3, false );
      //addAsm( str_LDA + "#$EA", 2, false );
      //addAsm( str_STA + "$0315",3, false );
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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );

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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );

      addComment( "Enable Raster Interrupts" );

      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );

      addAsm( str_LDA +"$" + toHex(getAddressOf($6.name)), 3, false );
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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
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
      addAsm( str_LDA + $3.name + "+1", 2, false ); 
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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );

      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA +"$" + toHex(getAddressOf($6.name)), 3, false );
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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
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
      addComment( "irq(XA, UintIMM, #)" );
      addComment( "Address is on the Processor Stack" );
      int rasterline = atoi( stripFirst($6.name).c_str() );
      int functionaddr = atoi( stripFirst($3.name).c_str() );
      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
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

      if( b == 1 ) addAsm( str_SEI );
      addComment( "Disable CIA IRQs and NMIs" );
      addAsm( str_LDA + "#$7F", 2, false );
      addAsm( str_STA + "$DC0D", 3, false );
      addAsm( str_STA + "$DD0D", 3, false );
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
      addComment( "Enable Raster Interrupts" );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_STA + "$D01A", 3, false );
      addComment( "Raster line to generate the Interrupt at" );
      addAsm( str_LDA +"$" + toHex(getAddressOf($6.name)), 3, false );
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
      addAsm( str_LDA + "$DC0D", 3, false );
      addAsm( str_LDA + "$DD0D", 3, false );
      
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
      addCompilerMessage( $3.name, 0 );
      addCompilerMessage( $6.name, 0 );
      addCompilerMessage( $8.name, 0 );
      
      addCompilerMessage( "Invalid raster line in irq function", 3 );
    }

};
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

| tJSR '(' expression ')' ';'
{
  addComment( "jsr(WordIMM);");
  if( isWordIMM( $3.name ) )
    {
      int where_to = atoi(stripFirst($3.name).c_str());
      if( where_to > 65535 || where_to < 0 ) addCompilerMessage( "invalid jsr (address out of range)", 3 );
      addAsm(str_JSR + "$" + toHex(where_to), 3, false );
    }
  else
    {
      addCompilerMessage( "invalid JSR - argument needs to be a WordIMM", 3 );
    }
};
// TODO : these two JSRs should really be just one rule
// tJSR '(' expression ')' ';'
/* | tJSR '(' NUMBER ')' ';' */
/* { */
/*   addCommentSection( "jsr(NUMBER)"); */
/*   addAsm(str_JSR + "$"  + toHex( atoi($3.name)), 3, false ); */
/* }; */
/* | tJSR '(' HEX_NUM ')' ';' */
/* { */
/*   addCommentSection( "jsr(HEX_NUM)"); */
/*   addAsm(str_JSR + "$" + stripFirst(stripFirst($3.name)), 3, false ); */
/* }; */
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
      
      addAsm(str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$02", 2, false );

      addAsm( str_LDA + "#$FC", 2, false );
      addAsm( str_AND + "$DD00", 3, false );
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
      addAsm( str_LDA + "$" + toHex( addr ), 3, false );
      addAsm(str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$02", 2, false );
      
      addAsm( str_LDA + "#$FC", 2, false );
      addAsm( str_AND + "$DD00", 3, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$DD00", 3, false );
    }
  else if( isUintIMM( $3.name ) || isIntIMM( $3.name ) )
    {
      addComment( "bank( UintIMM );" );
      addAsm( str_LDA + "#$03", 2, false );
      addAsm( str_ORA + "$DD02", 3, false );
      addAsm( str_STA + "$DD02", 3, false );

      int v = atoi( stripFirst( $3.name ).c_str());
      addAsm( str_LDA + "#$" + toHex( v ), 2, false );      
      addAsm(str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$02", 2, false );

      addAsm( str_LDA + "#$FC", 2, false );
      addAsm( str_AND + "$DD00", 3, false );
      addAsm( str_ORA + "$02", 2, false );
      addAsm( str_STA + "$DD00", 3, false );
    }
  else  
    {
      addCompilerMessage( "Error setting VIC-II Bank - unknown type", 3 );
    }
};
// 2023 05 02 : this IS needed to support Interrupt Routines
| tJMP '(' expression ')' ';'
{
  if( isWordIMM( $3.name ) )
    {
      addCommentSection( "jmp(WordIMM)");
      int where_to = atoi(stripFirst($3.name).c_str());
      if( where_to > 65535 || where_to < 0 ) addCompilerMessage( "invalid JMP (address out of range)", 3 );
      addAsm(str_JMP + "$" + toHex(where_to), 3, false );
    }
  else
    {
      addCompilerMessage( "invalid JMP", 3 );
    }
};
| tXXX '(' ')' ';'
{
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
| tNOP '(' ')' ';'
{
  addAsm(str_NOP, 1, false );
};
| tRTS '(' ')' ';'
{
  addCommentSection( "rts");
  addAsm( str_RTS );
};
| tMEMCPY '(' expression {} ',' expression {} ',' expression {} ')' ';'
{
  // TODO: Implement all the other types of arguments! - mkpellegrino 20230407
  addComment( string("memcpy(") + $3.name + "," + $6.name + "," + $9.name + ");" );
  if( isWordIMM($3.name) && isWordIMM($6.name) && isUintIMM($9.name) )
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
	  //addAsm( str_CLI );
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
	  //addAsm( str_CLI );

	}
      popScope();
    }
  else if( isWordIMM($3.name) && isWordIMM($6.name) && isUintID($9.name) )
    {
      pushScope("memcpy");
      // 2023 04 25 - mkpellegrino
      //addAsm( str_SEI );
      int addr_src = atoi(stripFirst($3.name).c_str());
      int addr_dst = atoi(stripFirst($6.name).c_str());
      int memcpy_size_addr = getAddressOf($9.name);
      if( addr_src > 65535 ) addCompilerMessage("memcpy source out of range",3);
      if( addr_dst > 65535 ) addCompilerMessage("memcpy destination out of range",3);
      int instr_size = 2;
      if( memcpy_size_addr > 255 ) instr_size = 3;
      addAsm( str_LDY + "$" + toHex(memcpy_size_addr) + commentmarker + getNameOf(memcpy_size_addr), instr_size, false );

      addAsm( generateNewLabel(), 0, true );
      addAsm( str_CPY + "#$FF", 2, false );
      addAsm( str_BEQ + getLabel( label_vector[label_major],false), 2, false );
      addAsm( str_LDA + "$" + toHex(addr_src) + ",Y", 3, false );
      addAsm( str_STA + "$" + toHex(addr_dst) + ",Y", 3, false );
      addAsm( str_DEY, 1, false );
      addAsm( str_JMP + getLabel( label_vector[label_major]-1,false), 3, false );
      addAsm( generateNewLabel(), 0, true );
      // 2023 04 25 - mkpellegrino
      //addAsm( str_CLI );

      popScope();

    }
  else if( isWordID($3.name) && isWordID($6.name) && isUintIMM($9.name) )
    {
      pushScope("memcpy");
      
      addCompilerMessage( "Not Yet Implemented", 3 );
      popScope();
    }
  else
    {
      addCompilerMessage( "memcpy not yet implemented for arguments of those types", 3 );
    }
}
| tPOKE '(' expression ',' expression ')' ';'
{
  // TODO: add poke( XA, A );
  addComment( "poke( expression, expression );" );
  if( isWordID($3.name) && (isUintID($5.name) || isIntID($5.name)) )
    {
      addComment( "poke(ID, ID)" );
      pushScope("POKE( ID, ID)");
      int addr_addr = getAddressOf($3.name);
      int valu_addr = getAddressOf($5.name);
      string tmp_addr_name = getNameOf(addr_addr);
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2;
      
      /* get & store the low byte of the poke address */

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + tmp_addr_name, instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr_addr) + commentmarker +  tmp_addr_name, instr_size, false );

      
      addAsm( str_STA + getLabel( label_vector[label_major],false), 3, false );
      /* get & store the high byte of the poke address */
      instr_size = 3;
      if( addr_addr+1 < 256 ) instr_size = 2;


      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + tmp_addr_name + "+1", instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr_addr+1), instr_size, false );


      addAsm( str_STA + getLabel( label_vector[label_major]+1,false), 3, false );

      instr_size = 3;
      if( valu_addr < 256 ) instr_size = 2;

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(getAddressOf($5.name)), instr_size, false );
      //addAsm( str_LDA + "$" + toHex( valu_addr ), instr_size, false );

      addAsm( str_BYTE + "$8D\t" + commentmarker + "STA absolute", 1, false );
      //addAsm( ".byte $8D;\t  <-- STA absolute", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- low byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- hi byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      popScope();
    }
  else if( isXA($3.name) && (isUintID($5.name) || isIntID($5.name)) )
    {
      addComment( "poke( XA, (U)IntID )" );

      pushScope("poke( XA, (U)IntID )");
      int valu_addr = getAddressOf($5.name);
      string value_name = getNameOf(valu_addr);
      addAsm( str_STA + getLabel( label_vector[label_major],false), 3, false );
      addAsm( str_STX + getLabel( label_vector[label_major]+1,false), 3, false );

      int instr_size = 3;
      if( valu_addr < 256 ) instr_size = 2;
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + value_name, instr_size, false );
      // addAsm( str_LDA + "$" + toHex( valu_addr ) + commentmarker +  value_name, instr_size, false );

      addAsm( str_BYTE + "$8D\t" + commentmarker + "<-- STA absolute", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- low byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- hi byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      popScope();
    }
  else if( isXA($3.name) && (isUintIMM($5.name) || isIntIMM($5.name)) )
    {
      addComment( "poke( XA, (U)IntIMM)" );

      pushScope("poke( XA, (U)IntIMM )");
      int valu_addr = getAddressOf($5.name);
      addAsm( str_STA + getLabel( label_vector[label_major],false), 3, false );
      addAsm( str_STX + getLabel( label_vector[label_major]+1,false), 3, false );


      int value = atoi( stripFirst($5.name).c_str() );

      addAsm( str_LDA + "#$" + toHex( value ), 2, false );

      addAsm( str_BYTE + "$8D\t" + commentmarker + "<-- STA absolute", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- low byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- hi byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      popScope();
    }
  else if( isWordID($3.name) && (isUintIMM($5.name) || isIntIMM($5.name)) )
    {
      addComment( "poke(ID, IMM)" );

      pushScope("POKE( ID, IMM )");
      int addr_addr = getAddressOf($3.name);
      int value = atoi( stripFirst($5.name).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2; // it's in Zero Page
      
      /* get & store the low byte of the poke address */

      addAsm( str_LDA + getNameOf(addr_addr), instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr_addr), instr_size, false );
      
      addAsm( str_STA + getLabel( label_vector[label_major],false), 3, false );
      /* get & store the high byte of the poke address */
      instr_size = 3;
      if( addr_addr+1 < 256 ) instr_size = 2;

      addAsm( str_LDA + getNameOf(addr_addr)+"+1", instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr_addr+1), instr_size, false );
      addAsm( str_STA + getLabel( label_vector[label_major]+1,false), 3, false );

      /* load the value into acc */
      addAsm( str_LDA+"#$" + toHex( value ), 2, false );

      /* store it in the instruction */
      addAsm( str_BYTE + "$8D" + commentmarker + "<-- STA absolute", 1, false );
      //addAsm( ".byte $8D;\t  <-- STA absolute", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- low byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- hi byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      popScope();
    }
  else if( isWordIMM($3.name) && (isUintID($5.name) || isIntID($5.name)) )
    {
      addComment("POKE(IMM,ID)" );
      int addr = atoi( stripFirst($3.name).c_str() );
      if( addr < 0 || addr > 65536 ) addCompilerMessage( "address out of range [0,65535]", 3 );
      
      int value_addr = getAddressOf($5.name);
      
      int instr_size = 3;
      if( value_addr < 256 ) instr_size = 2;
      
      //addAsm( str_LDA + "$" + toHex(value_addr), instr_size, false );
      addAsm( str_LDA + getNameOf(value_addr), instr_size, false );
      //addAsm( str_LDA + $5.name, instr_size, false );
      instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr ), instr_size, false );
    }
  else if( isWordIMM($3.name) && (isUintIMM($5.name) || isIntIMM($5.name)) )
    {
      addComment("POKE(wIMM,IMM)");
      int addr = atoi( stripFirst($3.name).c_str() );
      if( addr < 0 || addr > 65536 ) addCompilerMessage( "address out of range [0,65535]", 3 );

      int value = atoi( stripFirst($5.name).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );

      addAsm( str_LDA + "#$" + toHex( value ), 2, false );
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr ), instr_size, false );
    }
  else if( isWordIMM($3.name) && isA($5.name) )
    {
      addComment("POKE(IMM,A)");
      int addr = atoi( stripFirst($3.name).c_str() );
      if( addr < 0 || addr > 65536 ) addCompilerMessage( "address out of range [0,65535]", 3 );
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;      
      addAsm( str_STA + "$" +  toHex( addr ), instr_size, false );
      
    }
  else if( isWordID($3.name) && isA($5.name) )
    {
      addComment( "poke(WordID, A)" );

      pushScope("POKE( WordID, A )");
      //addComment( "POKE( WordID, A )");
      addAsm( str_STA + getLabel( label_vector[label_major],false) + "-2" , 3, false );

      int addr_addr = getAddressOf($3.name);
      int value = atoi( stripFirst($5.name).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );
      int instr_size = 3;
      if( addr_addr < 256 ) instr_size = 2; // it's in Zero Page
      
      /* get & store the low byte of the poke address */
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr_addr), instr_size, false );
      //addAsm( str_LDA + "$"  + toHex(addr_addr), instr_size, false );
      addAsm( str_STA + getLabel( label_vector[label_major],false), 3, false );
      /* get & store the high byte of the poke address */
      instr_size = 3;
      if( addr_addr+1 < 256 ) instr_size = 2;

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr_addr)+"+1", instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr_addr+1), instr_size, false );
      
      addAsm( str_STA + getLabel( label_vector[label_major]+1,false), 3, false );

      /* load the value into acc */
      addAsm( str_LDA+"#$" + toHex( value ), 2, false );
      addAsm( str_BYTE + "$A9, $00", 2, false );

      /* store it in the instruction */
      addAsm( str_BYTE + "$8D" + commentmarker + "<-- STA absolute", 1, false );
      //addAsm( ".byte $8D;\t  <-- STA absolute", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- low byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "<-- hi byte", 0, true );
      addAsm( str_BYTE + "$00", 1, false );

      popScope();

      ////
      
      
    }
  else if( (isUintIMM($3.name)||isIntIMM($3.name)) && (isUintIMM($5.name)||isIntIMM($5.name)))
    {
      addComment("POKE( (U)Int, IMM); Zero Page");
      int addr = atoi( stripFirst($3.name).c_str() );
      
      int value = atoi( stripFirst($5.name).c_str() );
      if( value < 0 || value > 255) addCompilerMessage( "value out of range [0,255]", 3 );

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


// TODO: mkpellegrino - 2023 04 06
// there needs to be a change here:
// condition: expression {if(isA($1.name) addAsm( str_PHA );} relop expression
// which would make $2.name -> $3.name and $3.name -> $4.name
// then, when comparing anything with an A as OP1, it will need to be
// popped off of the processor stack
condition: expression relop expression
{
  addDebugComment( "=========================================================");
  addDebugComment( string( "condition in ") + scope_stack.top() );
  addParserComment( scope_stack.top() + " " + $1.name + $2.name + $3.name);
  addDebugComment( "=========================================================");
  string tc;
  if( isXA($1.name ) ) tc+=string( "XA" );
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
  tc+=string($1.name);
  tc+=string( " vs. " );
  if( isA($3.name ) )
    {
      tc+=string( "A" );
      addAsm( str_STA + "$02", 2, false );
    }
  if( isXA($3.name ) ) tc+=string( "XA" );
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
  tc+=string($3.name);

  addComment( tc );
  
  if( scope_stack.top() == "FOR" ) addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "Top of FOR Loop", 0, true );  
  if( scope_stack.top() == "WHILE" ) addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "Top of WHILE Loop", 0, true );  
  if( scope_stack.top() == "IF" ) addAsm( generateNewLabel() + "\t\t\t" + commentmarker + "Top of IF statement", 0, true );  

  
  // at this point, we need to look at the type of the variable that is located
  // at the $1.name address, so we know how to compare it with another number

  if( isUintID($1.name) && string($2.name) == string( ">=" ) && atoi(stripFirst($3.name).c_str()) == 0 )
    {
      addCompilerMessage( "UINTs can ONLY be >= 0... this line of code will lead to an infinite loop ", 3 );
    }

  if( isUintID($1.name) && string($2.name) == string( "<" ) && (isUintIMM($3.name) || isIntIMM($3.name) ) &&  atoi(stripFirst($3.name).c_str()) == 0 )
    {
      addCompilerMessage( "UINTs can ONLY be >= 0... this line of code will lead to an infinite loop ", 3 );
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
      
      // FP Operations
      inlineFloat($1.name, 105);
      current_variable_base_address = getAddressOf($3.name);
      string tmp_name = getNameOf(current_variable_base_address);
      
      addAsm( str_LDA + "#$" + toHex( get_word_L( current_variable_base_address )) + commentmarker + tmp_name + " (LO)", 2, false );
      addAsm( str_LDY + "#$" + toHex( get_word_H( current_variable_base_address )) + commentmarker + tmp_name + " (HI)", 2, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "RAM -> FAC", 3, false );
      addAsm( str_LDA + "#$69", 2, false );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_JSR + "$BC5B" + commentmarker + "CMP(FAC, RAM)", 3, false );
      //addAsm( string("JSR $BC5B") + commentmarker + "CMP(FAC, RAM)", 3, false );
      //addAsm( str_PHA );  // why was this even here?
    }
  else if( isXA($1.name) && isWordIMM($3.name))  // mismatch
    {
      addComment( "XA relop WordIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());
      int tmp_L = get_word_L(tmp_v);
      int tmp_H = get_word_H(tmp_v);

      addAsm( str_TAY );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA );

      addAsm( str_LDA+"#$" + toHex( tmp_H ), 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_LDA+"#$" + toHex( tmp_L ), 2, false );
      addAsm( str_STA + "$02", 2, false );

      addAsm( str_TXA );
      addAsm( str_CMP + "$03", 2, false );
      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3
      addAsm( str_TYA );
      addAsm( str_CMP + "$02", 2, false );

      
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
    }
  else if( isXA($1.name) && isUintIMM($3.name))  // mismatch
    {
      addComment( "XA relop UintIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());

      // save A in Y
      addAsm( str_TAY );

      // save $02/$03
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA );

      
      addAsm( str_LDA + "#$" + toHex( tmp_v ), 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$03", 2, false );
      
      addAsm( str_TXA );
      addAsm( str_CMP + "$03", 2, false );
      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3
      addAsm( str_TYA );
      addAsm( str_CMP + "$02", 2, false );

      // restore $02/$03
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
    }
  else if( isXA($1.name) && isWordID($3.name))  // mismatch
    {
      addComment( "XA relop WordID" );
      int tmp_v = getAddressOf( $3.name );
      addAsm( str_CPX + "$" + toHex( tmp_v + 1), 3, false );
      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3
      addAsm( str_CMP + "$" + toHex( tmp_v ), 3, false );


    }
  else if( isWordID($1.name) && isXA($3.name))  // mismatch
    {
      addComment( "WordID relop XA" );
      int addr = getAddressOf( $1.name );
      addAsm( str_TAY );

      // save $02 and $03
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA );

      
      addAsm( str_STX + "$03", 2, false );
      addAsm( str_STY + "$02", 2, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDX + getNameOf(addr) + "+1", 3, false );
      //addAsm( str_LDX + "$" + toHex( addr + 1 ), 3, false );
      addAsm( str_CPX + "$03", 2, false );
      //addAsm( str_TAY );
      //addAsm( str_TXA );
      //addAsm( string( "CMP $") + toHex( tmp_v + 1), 3, false );
      addAsm( str_BYTE + "$D0, $05" + commentmarker +"BNE +5", 2, false ); // BNE +5
      // 2024 04 14 - mkpellegrino
      //addAsm( str_LDA + "$" + toHex( addr ), 3, false );
      addAsm( str_LDA + getNameOf(addr), 3, false );
      //addAsm( str_TYA );
      addAsm( str_CMP + "$02", 2, false );
      //addAsm( string( "CMP $") + toHex( tmp_v ), 3, false );

      // restore $02 and $03
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );


    }
  else if( isA($1.name) && isWordID($3.name))  // mismatch
    {
      addComment( "A relop WordID" );
      int tmp_v = getAddressOf( $3.name );
      addAsm( str_TAY );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_CMP + "$" + toHex( tmp_v + 1), 3, false );
      addAsm( str_BYTE + "$D0, $04" + commentmarker + "BNE +4", 2, false ); // BNE +4
      addAsm( str_TYA );
      addAsm( str_CMP + "$" + toHex( tmp_v ), 3, false );
    }
  else if( isA($1.name) && isUintID($3.name))
    {
      addComment( "A relop UintID" );
      int tmp_v = getAddressOf($3.name);
      addAsm( str_CMP + "$" + toHex( tmp_v ), 3, false );
    }
  else if( isA($1.name) && isUintIMM($3.name))
    {
      addComment( "A relop UintIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());
      addAsm( str_CMP + "#$" + toHex( tmp_v ), 2, false );
    }
  else if( isA($1.name) && isIntIMM($3.name))  // mismatch
    {
      addComment( "A relop IntIMM" );
      int tmp_v = atoi(stripFirst($3.name).c_str());
      addAsm( str_CMP + "#$" + toHex( tmp_v ), 2, false );

    }
  else if( isUintID($1.name) && isIntID($3.name))  // mismatch
    {
      unsigned_signed_cmp_is_needed = true;
      addAsm( str_LDA + $1.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isUintIMM($1.name) && isIntID($3.name) )  // mismatch
    {
      unsigned_signed_cmp_is_needed = true;
      int i = atoi(stripFirst($1.name).c_str());
      if( i > 255 ) addCompilerMessage( "uint out of range (0-255)", 2 );
      addAsm( str_LDA + "#$" + toHex(i), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isUintID($1.name) && isIntIMM($3.name) )  // mismatch
    {
      unsigned_signed_cmp_is_needed = true;

      addAsm( str_LDA + $1.name, 3, false );
      addAsm( str_PHA );
      int i = atoi(stripFirst($3.name).c_str());
      if( i < 0 )
	{
	  i = twos_complement(i);
	}
      addAsm( str_LDA + "#$" + toHex(i), 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isIntIMM($1.name) && isUintID($3.name) )  // mismatch
    {
      unsigned_signed_cmp_is_needed = true;

      int i = atoi(stripFirst($1.name).c_str());
      if( i < 0 )
	{
	  i = twos_complement(i);
	}
      addAsm( str_LDA + "#$" + toHex(i), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "USCMP", 3, false );
      addAsm( str_PLP );
    }
  else if( isUintID($1.name) && isA($3.name) )  // mismatch
    {
      // TODO: what is it already in $02?   I didn't put it in there, so WTF?
      addComment( "value to compare is already in $02" );
      //addAsm( str_STA + "$02", 2, false );      
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)), 3, false );
      addAsm( str_CMP + "$02", 2, false );
      
    }
  else if( isIntID($1.name) && isA($3.name) )  // mismatch
    {
      addComment( "value to compare is already in $02" );
      addAsm( str_LDA + $1.name, 3, false );

      addAsm( str_CMP + "$02", 2, false );
      //addAsm( string("CMP ") + string($3.name), 3, false );
    }
  else if( isA($1.name) && isA($3.name) )
    {
      addComment( "both values to compare are in A" );
      addCompilerMessage( "illegal compare ... LHS and RHS are both in accumulator.", 3  );
			  
    }
  else if( isUintID($1.name) && isUintID($3.name))
    {
      addComment("UintID relop UintID");
      // 2024 04 14 - mkpellegrino
      int a1 = getAddressOf($1.name);
      int a3 = getAddressOf($3.name);
      //cerr << "a1 = " << getNameOf(a1) << "\t\ta2 = " << getNameOf(a3) << endl;
      addAsm( str_LDA + getNameOf(a1), 3, false );
      addAsm( str_CMP + getNameOf(a3), 3, false );
    }
  else if( isUintID($1.name) && isUintIMM($3.name))
    {
      int tmp_addr = getAddressOf($1.name);
      string tmp_name = getNameOf(tmp_addr);
      addComment("UintID relop UintIMM");
      // Done
      addAsm( str_LDA + tmp_name + commentmarker + $1.name, 3, false );
      addAsm( str_CMP + "#$"  + toHex( atoi(stripFirst($3.name).c_str() )), 2, false );
    }
  else if( isUintIMM($1.name) && isUintID($3.name))
    {
      // Done
      int tmp_addr = getAddressOf($3.name);
      string tmp_name = getNameOf(tmp_addr);
      addAsm( str_LDA + "#$" + toHex( atoi(stripFirst($1.name).c_str() )), 2, false );
      addAsm( str_CMP + $3.name + commentmarker + tmp_name, 3, false );
    }
  else if( isUintIMM($1.name) && isUintIMM($3.name))
    {
      // Done
      addCompilerMessage( "Comparing of 2 Immediate values", 1 );
      addAsm( str_LDA + "#$" + toHex( atoi(stripFirst($1.name).c_str() )), 2, false );
      addAsm( str_CMP + "#$" + toHex( atoi(stripFirst($3.name).c_str() )), 2, false );
    }
  else if( isIntID($1.name) && isIntID($3.name) )
    {
      signed_comparison_is_needed = true;
      addAsm( str_LDA + $1.name, 3, false );

      addAsm( str_PHA );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );     
    }
  else if( isIntID($1.name) && isIntIMM($3.name) )
    {
      signed_comparison_is_needed = true;
      addAsm( str_LDA + $1.name, 3, false );

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
      if( atoi($3.name) > 127 || atoi($3.name) < -127 ) addCompilerMessage( "value out of range for INT comparison", 3 );
	
      signed_comparison_is_needed = true;
      
      addAsm( str_LDA + $1.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$" + toHex( atoi(stripFirst($3.name).c_str() )), 2, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );     
    }
  else if( isIntIMM($1.name) && isIntID($3.name) )
    {
      signed_comparison_is_needed = true;
      int OP1 = atoi(stripFirst($1.name).c_str());
      if( OP1 < 0 )
	{
	  OP1 = twos_complement( OP1 );
	}
      addAsm( str_LDA + "#$" + toHex( OP1 ), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + $3.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR + "SIGNEDCMP", 3, false );
      addAsm( str_PLP );     
    }
  else if( isIntIMM($1.name) && isIntIMM($3.name) )
    {
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
      // FP Operations
      inlineFloat($3.name, 105 );
      current_variable_base_address = getAddressOf($1.name);
      addAsm( str_LDA + "#$" + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( str_LDY + "#$" + toHex( get_word_H( current_variable_base_address )), 2, false );
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
      addAsm( str_LDX + "#$01", 2, false );
      addAsm( str_LDA + $1.name + ",X",3, false );      
      addAsm( str_CMP + "#$00", 2, false );
      // if A is NOT 0, then WORD > UINT
      addAsm( str_BYTE + "$D0, $06" + commentmarker +"BNE +6", 2, false ); // BNE +6
      addCompilerMessage( "If address of OP1 or OP2 is in Zero Page, instruction size may vary", 0);
      addAsm( str_LDA + $1.name, 3, false );
      addAsm( str_CMP + $3.name, 3, false );
    }
  else if( isFloatID($1.name) && isFloatID($3.name) )
    {
      // store the first one in FAC
      int current_variable_base_address = getAddressOf($1.name);
      addAsm( str_LDA + "#$" + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( str_LDY + "#$" + toHex( get_word_H( current_variable_base_address )), 2, false );
      // store it in FAC
      addAsm( str_JSR + "$BBA2" + commentmarker + "FP -> FAC", 3, false ); // FP ->FAC
      current_variable_base_address = getAddressOf($3.name);
      addAsm( str_LDA + "#$" + toHex( get_word_L( current_variable_base_address )), 2, false );
      addAsm( str_LDY + "#$" + toHex( get_word_H( current_variable_base_address )), 2, false );   
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
      addCommentSection( "WORD ID relop WORD ID" );
      int OP1L = getAddressOf( $1.name );
      int OP2L = getAddressOf( $3.name );
      //cerr << "OP1L: " << OP1L << "\tOP2L: " << OP2L << endl;

      // compare the Hi bytes first
      int OP1H = OP1L+1;
      int OP2H = OP2L+1;

      // addAsm(str_LDA + "$" + toHex(OP1H), 3, false );
      //addAsm(str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))) + "+1", 3, false );

      addAsm(str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))) + "+1", 3, false );
      //addAsm(str_CMP + "$" + toHex(OP2H), 3, false );
      addAsm(str_CMP + getNameOf(hexToDecimal(stripFirst($3.name))) + "+1", 3, false );
      addAsm(str_BYTE + "$D0, $06" + commentmarker +"BNE +6", 2, false ); // BNE +6

      addAsm(str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))), 3, false );
      addAsm(str_CMP + getNameOf(hexToDecimal(stripFirst($3.name))), 3, false );
      
      //addAsm(str_LDA + "$" + toHex(OP1L), 3, false );
      //addAsm(str_CMP + "$" + toHex(OP2L), 3, false );
    }
    else if( isWordID($1.name) && isWordIMM($3.name))
    {
      // TODO: FIX THIS!!!
      addCommentSection( "WORD ID relop  WORD IMM" );
      addComment( string($1.name) + " relop " + $3.name );

      int OP1L = getAddressOf( $1.name );
      int OP1H = OP1L+1;

      // 2023 06 27
      addAsm(str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))) + "+1", 3, false );
      //addAsm(str_LDA + "$" + toHex(OP1H), 3, false );

      // we need to get just the High Byte here.
      // we could use the length... OR use math.
      
      int HB = 0xFF00 & atoi( stripFirst($3.name).c_str());
      HB/=256;
      int LB = 0x00FF & atoi( stripFirst($3.name).c_str());
      //cerr << "HB: " << HB << "\tLB: " << LB << endl;

      // TMP vvvvvv
      //addAsm( str_CLC );
      //addAsm( str_SBC + "#$") + toHex(HB), 2, false );
      //addAsm( string(".byte #$B0, #$05") + commentmarker +string("BCS +5"), 2, false ); // BNE +5
      // TMP ^^^^^

      
      addAsm( str_CMP + "#$" + toHex(HB), 2, false );
      addAsm( str_BYTE + "$D0, $05" + commentmarker + "BNE +5", 2, false ); // BNE +5

      //addAsm( string(".byte #$D0, #$05") + commentmarker +string("BNE +5"), 2, false ); // BNE +5


      // 2023 06 27
      //addAsm(str_LDA + $1.name, 3, false );
      addAsm(str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))), 3, false );

      //addAsm(str_LDA + "$" + toHex(OP1L), 3, false );
      //addAsm(string("CMP #$") + toHex(atoi(stripFirst($3.name).c_str())).substr(2,2), 2, false );
      //addAsm(string("CMP #$") + toHex(atoi(stripFirst($3.name).c_str())).substr(2,2), 2, false );
      addAsm(str_CMP + "#$" + toHex(LB), 2, false );
      
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
	      addAsm( str_BYTE + "$B0, $03" + commentmarker + "BCS +3", 2, false ); 
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to BODY", 3, false );
	      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to BODY", 3, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	}
      else if( string($2.name) == string( "==" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to BODY", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + string("$D0, $03") + commentmarker +"BNE +3", 2, false ); // BNE +3
	     
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to BODY", 3, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	}
      else if( string($2.name) == string( ">" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+2, false) + commentmarker + "if z==1 jump out of FOR", 2, false );
	      addAsm( str_BCC + getLabel( label_vector[label_major]+2, false) + commentmarker + "if c==0 jump out of FOR", 2, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to body of FOR", 3, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + "$D0, $03" + commentmarker +"BNE +3", 2, false ); // BNE +3
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "if z==1 jump out of FOR", 3, false );
	      addAsm( str_BYTE + "$B0, $03" + commentmarker + "BCS +3", 2, false ); 
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "if c==0 jump out of FOR", 3, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to body of FOR", 3, false );
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
	      addAsm( str_BYTE + "$B0, $03" + commentmarker + "BCS +3", 2, false ); 

	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to BODY", 3, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR" , 3, false );
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
	      addAsm( str_BYTE + "$90, $03" + commentmarker + "BCC +3", 2, false ); 
	      addAsm( str_JMP  + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to BODY", 3, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
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
	      addAsm( str_BYTE + "$F0, $03" + commentmarker + "BEQ +3", 2, false ); 
	      addAsm( str_JMP +  getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==0 jump to BODY", 3, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+2, false) + commentmarker + "jump out of FOR", 3, false );
	    }
	}
    }
  else if( scope_stack.top() == "IF" || scope_stack.top() == "WHILE" )
    {
      if( string($2.name) == string( "<=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major], false) + commentmarker + "if c==0 jump to THEN", 2, false );
	      addAsm( str_BEQ + getLabel( label_vector[label_major], false) + commentmarker + "if z==1 jump to THEN", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE", 3, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + "$B0, $03" + commentmarker + "BCS +3", 2, false ); 
	      addAsm(str_JMP + getLabel( label_vector[label_major], false) + commentmarker + "if c==0 jump to THEN", 3, false );
	      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3

	      addAsm(str_JMP + getLabel( label_vector[label_major], false) + commentmarker + "if z==1 jump to THEN", 3, false );
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE", 3, false );
	    }
	}   
      else if( string($2.name) == string( "==" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BYTE + "$F0, $03" + commentmarker + "BEQ +3", 2, false ); 
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE", 3, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + "$F0, $03" + commentmarker + "BEQ +3", 2, false ); 
	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE", 3, false );
	    }
	}
      else if( string($2.name) == string( ">" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to ELSE", 2, false );
	      addAsm( str_BEQ + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE", 2, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + "$B0, $03" + commentmarker + "BCS +3", 2, false ); 

	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==0 jump to ELSE" , 3, false );
	      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3

	      addAsm(str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE" , 3, false );
	    }
	}
      else if( string($2.name) == string( "<" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major], false) + commentmarker + "if c==0 jump to THEN", 2, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + " jump to ELSE", 3, false );
	    }
	  else
	    {
	      // 2022 10 28 - mkpellegrino - changed from #$90 to #$B0
	      addAsm( str_BYTE + "$90, $03" + commentmarker + "BCC +3", 2, false ); 

	      //addAsm(str_JMP + getLabel( label_vector[label_major], false) + commentmarker + string( " if c==0 jump to THEN" ), 3, false );
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "jump to ELSE", 3, false );
	    }
	}
      else if( string($2.name) == string( ">=" ) )
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BCC + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to ELSE", 2, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + "$B0, $03" + commentmarker + "BCS +3", 2, false ); 
	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if c==1 jump to ELSE", 3, false );
	    }
	}
      else /* != ... NOT EQUAL TO */
	{
	  if( long_branches == false )
	    {
	      addAsm( str_BEQ  + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE", 2, false );
	    }
	  else
	    {
	      addAsm( str_BYTE + "$D0, $03" + commentmarker + "BNE +3", 2, false ); // BNE +3

	      addAsm( str_JMP + getLabel( label_vector[label_major]+1, false) + commentmarker + "if z==1 jump to ELSE", 3, false );
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
  //  ASSIGNMENTS
  addParserComment( "RULE: statement: datatype ID init" );
  addParserComment( string($1.name) + " " + $2.name + "=" + $3.name + " datatype#: " + toHex( current_variable_type ));
  
  current_variable_type = getDataTypeValue( $1.name );


  // this adds the variable to the list of variables
  if( !isMOB($3.name) )
    {
      addAsmVariable($2.name, current_variable_type );
    }
  else
    {
      //addParserComment("The Mob variable should be added as a word and set equal to" );
      //addParserComment("scr_addr + 0x03F7 + sprite#" );
      addParserComment( "Add the variable that will hold the pointer" );
      addAsmVariable($2.name, 0);
    }

  current_variable_base_address = getAddressOf($2.name);
  
  if(isFloatDT($1.name) && isFloatID($2.name) && isARG($3.name))
    {
      addComment( "FP ARG --> FAC --> MEM" );
      addAsm( str_LDA + "#69", 2, false );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_LDX + "#$" + toHex(get_word_L(current_variable_base_address)) + commentmarker +  "ADDR_L", 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(current_variable_base_address)) + commentmarker +  "ADDR_H", 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM" + $2.name, 3, false );
    }
  else if( isNULL($3.name) )
    {
      addComment( "NULL expression... variable is ghosted" );
    }
  else if( string($3.name) == string("Slipstream"))
    {
      // I have nbo idea WTF I was thinking here... Slipstream?!?
      if(  (isIntDT($1.name) || isUintDT($1.name)) &&  (isIntID($2.name) || isUintID($2.name)) )
	{
	  addComment( "Slipstream (U)Int" );
	  int addr1 = getAddressOf($2.name);
	  int instr_size = 3;
	  if( addr1 < 256 ) instr_size = 2;
	  //addAsm( str_STA + "$" + toHex( addr1 ) + commentmarker + $2.name, instr_size, false );
	  addAsm( str_STA + $2.name+ commentmarker + "$" + toHex(addr1), instr_size, false );

	}
      else if( isWordDT($1.name) && isWordID($2.name) )
	{
	  addComment( "Slipstream Word" );

	  int addr1 = getAddressOf($2.name);
	  int addr2 = getAddressOf($2.name)+1;
	  int instr_size = 3;
	  if( addr1 < 256 ) instr_size = 2;
	  //addAsm( str_STA + "$" + toHex( addr1 ) + commentmarker +  $2.name, instr_size, false );
	  addAsm( str_STA + $2.name + commentmarker + "$" + toHex(addr1), instr_size, false );

	  instr_size = 3;
	  if( addr2 < 256 ) instr_size = 2;
	  addAsm( str_STX + $2.name + "+1" + commentmarker + "$" + toHex(addr1+1), instr_size, false );
	  //addAsm( str_STX + "$" + toHex( addr2 ), instr_size, false );
	}
      else
	{
	  addCompilerMessage( "unable to Slipstream variable type", 3 );
			      
	}
	

    }
  else if( (isIntDT($1.name) || isUintDT($1.name)) && (isIntID($2.name) || isUintID($2.name)) && isNULL($3.name) )
    {
      addComment("IntDT||UintDT  IntID||UintID  =   NULL" );

      int addr1 = getAddressOf($2.name);
      int instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr1 ) + commentmarker + $2.name, instr_size, false );

    }
  else if( isWordDT($1.name) && isWordID($2.name) && isNULL($3.name) )
    {
      addComment("IntDT||UintDT  IntID||UintID  =   NULL" );

      int addr1 = getAddressOf($2.name);
      int addr2 = getAddressOf($2.name)+1;
      int instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr1 ) + commentmarker + $2.name, instr_size, false );
      instr_size = 3;
      if( addr2 < 256 ) instr_size = 2;
      addAsm( str_STX + "$" + toHex( addr2 ), instr_size, false );

    }
  else if( (isIntDT($1.name) || isUintDT($1.name)) && (isIntID($2.name) || isUintID($2.name)) && isWordID($3.name) )
    {
      addComment("IntDT||UintDT  IntID||UintID  =   WordID" );
      addCompilerMessage( "Setting (U)INT = WORD, losing high byte", 0 );

      int addr1 = getAddressOf($2.name);
      int instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr1 ) + commentmarker + $2.name, instr_size, false );
    }

  else if(isFloatDT($1.name) && isFloatID($2.name) && isXA($3.name))
    {
      // TODO: This needs to be changed so that if isXA($3.name) then
      // it uses that as the address of a float
      addComment( "FLOAT FloatID = XA" );
      int src_addr_L = get_word_L(hexToDecimal(stripFirst($3.name)));
      int src_addr_H = get_word_H(hexToDecimal(stripFirst($3.name)));

      int dst_addr_L = get_word_L((getAddressOf($2.name)));
      int dst_addr_H = get_word_H((getAddressOf($2.name)));
      addComment(toHex(getAddressOf($2.name)));
      
      //addCompilerMessage( "FloatID -> FloatID not yet implemented", 1 );
      //addAsm( str_LDA + "#$" + toHex(src_addr_L), 3, false );
      //addAsm( str_LDY + "#$" + toHex(src_addr_H), 3, false );
      addAsm( str_PHA ); //move X -> Y
      addAsm( str_TXA ); //
      addAsm( str_TAY ); //
      addAsm( str_PLA ); //
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_LDX + "#$" + toHex(dst_addr_L), 3, false );
      addAsm( str_LDY + "#$" + toHex(dst_addr_H), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM" + $2.name, 3, false );
    }
  else if(isFloatDT($1.name) && isFloatID($2.name) && isFloatID($3.name))
    {
      addComment( "FLOAT FloatID FLoatID" );

      int src_addr_L = get_word_L(hexToDecimal(stripFirst($3.name)));
      int src_addr_H = get_word_H(hexToDecimal(stripFirst($3.name)));

      int dst_addr_L = get_word_L((getAddressOf($2.name)));
      int dst_addr_H = get_word_H((getAddressOf($2.name)));
     
      addAsm( str_LDA + "#$" + toHex(src_addr_L), 3, false );
      addAsm( str_LDY + "#$" + toHex(src_addr_H), 3, false );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );
      addAsm( str_LDX + "#$" + toHex(dst_addr_L), 3, false );
      addAsm( str_LDY + "#$" + toHex(dst_addr_H), 3, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if(isFloatDT($1.name) && isFloatID($2.name) && isFAC($3.name))
    {
      addComment( "FLOAT FloatID FAC" );
      addAsm( str_LDX + "#$" + toHex(get_word_L(current_variable_base_address) ), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(current_variable_base_address) ), 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> RAM", 3, false );
    }
  else if(isFloatDT($1.name) && isFloatID($2.name) && isFloatIMM($3.name))
    {
      addComment( "FLOAT FloatID FLoatIMM" );

      inlineFloat($3.name, current_variable_base_address );
    }
  else if(isIntDT($1.name) && isIntID($2.name) && isIntIMM($3.name))
    {
      addComment( "INT IntID = IntIMM" );

      int v = atoi( stripFirst($3.name).c_str() );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      if( v < 0 ) v = twos_complement(v);
      addAsm(str_LDA + "#$" + toHex(v), 2, false );

      addAsm( str_STA + string($3.name), instr_size, false );
      //addAsm(str_STA + "$" + toHex( current_variable_base_address) + commentmarker + string( getNameOf( getIndexOf($3.name))), instr_size, false );
    }
  else if(isUintDT($1.name) && isUintID($2.name) && isA($3.name))
    {
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addComment( "UINT UintID A" );
      addAsm(str_STA + $2.name, instr_size, false );
		    
      //addAsm(str_STA + "$"  + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if((isUintDT($1.name)||isIntDT($1.name)) && (isUintID($2.name)||isIntID($2.name)) && (isUintID($3.name)||isIntID($3.name)))
    {
      addComment( "(U)INT (U)IntID = (U)INT" );
      int addr2 = getAddressOf( $3.name );
      
      int instr_size = 3;
      if( addr2 < 256 ) instr_size = 2;
      addAsm( str_LDA + $3.name, instr_size, false );

      //addAsm(str_LDA + "$" + toHex(addr2), instr_size, false );
      instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      
      addAsm( str_STA + $2.name, instr_size, false );
      //addAsm(str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if(isIntDT($1.name) && isIntID($2.name) && isA($3.name))
    {
      addComment( "INT IntID A" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      addAsm(str_STA + $2.name, instr_size, false );

      //addAsm(str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if((isUintDT($1.name)||isIntDT($1.name)) && (isUintID($2.name)||isIntID($2.name)) && isXA($3.name))
    {
      addComment( "UINT|INT IntID|UintID XA" );

      addCompilerMessage("Initialising a 1 byte memory location with a 2 byte value... losing High Byte",0);
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      addAsm(str_STA + $2.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if(isUintDT($1.name) && isUintID($2.name) && isUintIMM($3.name) )
    {
      addComment( "UINT UintID UintIMM" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      int v = atoi( stripFirst($3.name).c_str() );
      if( v < 0 )
	{
	  addCompilerMessage("an unsigned integer is being initialized with a signed integer",0);
	  v = twos_complement(v);
	}
      addAsm( str_LDA + "#$" + toHex(v) , 2, false );
      addAsm( str_STA + $2.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker + string( getNameOf( getIndexOf($3.name))), instr_size, false );      
    }
  else if( isUintDT($1.name) && isUintID($2.name) && isUintIMM($3.name))
    {
      addComment( "UINT UintID UintIMM" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      int v = atoi( stripFirst($3.name).c_str() );
      addAsm(str_LDA + "#$" + toHex(v), 2, false );

      addAsm(str_STA + $3.name, instr_size, false );

      //addAsm(str_STA + "$" + toHex( current_variable_base_address) + commentmarker + string( getNameOf( getIndexOf($3.name))), instr_size, false );
    }
  else if(isUintDT($1.name) && (isUintID($2.name)||isIntID($2.name)) && isIntIMM($3.name) )
    {
      addComment( "UINT UintID||IntID IntIMM" );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      int v = atoi( stripFirst($3.name).c_str() );
      if( v < 0 ) v = twos_complement(v);      
      addAsm( str_LDA + "#$" + toHex(v) , 2, false );
      addAsm( str_STA + $3.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker + string( getNameOf( getIndexOf($3.name))), instr_size, false );
    }
  else if(isUintDT($1.name) && isUintID($2.name) && isWordIMM($3.name) )
    {
      addCompilerMessage("Initialising an UINT to a WORD value... losing High Byte",0);
            int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      int value = atoi(stripFirst($3.name).c_str());
      value = value & 255;
      addAsm( str_LDA + "#$" + toHex(value), 2, false );
      addAsm( str_STA + $2.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if(isIntDT($1.name) && isIntID($2.name) && isIntIMM($3.name))
    {
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      addAsm( str_LDA + "#$" + toHex( atoi( stripFirst($3.name).c_str() ) ), 2, false);
      addAsm( str_STA + $3.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker + string( getNameOf( getIndexOf($3.name))), instr_size, false );
    }
  else if( isIntDT($1.name) && isIntID($2.name) && isWordIMM($3.name) )
    {
      addCompilerMessage("Initialising an INT to a WORD value... losing High Byte",0);
      int value = atoi(stripFirst($3.name).c_str());
      value = value & 255;
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      addAsm( str_LDA + "#$" + toHex(value), 2, false );
      addAsm( str_STA + $2.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && (isUintIMM($3.name)||isIntIMM($3.name)) )
    {
      int v = atoi(stripFirst($3.name).c_str());
      if( v<0 ) v = twos_complement(v);
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      addAsm( str_LDX + "#$00", 2, false );

      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      addAsm( str_STA + $2.name, instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address), instr_size, false );
      instr_size = 3;
      if( current_variable_base_address+1 < 256 ) instr_size = 2;

      addAsm( str_STX + $2.name + "+1", instr_size, false );
      
      //addAsm( string("STX $") + toHex( current_variable_base_address+1) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && (isUintID($3.name)||isIntID($3.name)) )
    {
      int instr_size = 3;
      int byte_addr = hexToDecimal( stripFirst($3.name).c_str() );
      if( byte_addr < 256 ) instr_size = 2;
      addAsm( str_LDA + string("$") + toHex(byte_addr), instr_size, false );
      addAsm( str_LDX + string("#$00"), 2, false );

      instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;

      addAsm(str_STA +  string($2.name), instr_size, false );
	    
      //addAsm( str_STA + "$" + toHex( current_variable_base_address), instr_size, false );
      instr_size = 3;
      if( current_variable_base_address+1 < 256 ) instr_size = 2;

      addAsm( str_STX + $2.name + "+1", instr_size, false );

      //addAsm( string("STX $") + toHex( current_variable_base_address+1) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && isA($3.name) )
    {
      illegal_operations_are_needed = true;
      addAsm( str_LDA + string(" #$00"), 2, false );
      addAsm( str_TAX  );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm(str_STA +  string($2.name), instr_size, false );	    
      //addAsm( str_STA + "$" + toHex( current_variable_base_address), instr_size, false );
      instr_size = 3;
      if( current_variable_base_address+1 < 256 ) instr_size = 2;
      addAsm(str_STX + $2.name + "+1", instr_size, false );

      //addAsm( string("STX $") + toHex( current_variable_base_address+1) + commentmarker +  string( $2.name ), instr_size, false );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && isFloatID($3.name) )
    {
      addCompilerMessage( "Float -> Word type conversion not yet implemented", 3 );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && isFloatIMM($3.name) )
    {
      addCompilerMessage( "Float -> Word type conversion not yet implemented", 3 );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && isWordID($3.name) )
    {
      addDebugComment( "word wordID = wordID" );
      int addr = hexToDecimal( string($3.name) );
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm(str_LDA + $3.name, instr_size, false );

      //addAsm( str_LDA + "$" + toHex(addr), instr_size, false );
      if( addr+1 > 255 )
	{
	  instr_size = 3;
	}
      else
	{
	  instr_size = 2;
	}
      //addAsm( string("LDX $") + toHex(addr+1), instr_size, false );
      addAsm(str_LDX + $3.name + "+1", instr_size, false );

      // we _really_ should make sure we have the correct instr sizes
      // here... just in case someone wants to store the variable
      // in zero-page

      addAsm(str_STA + $2.name, instr_size, false );
      addAsm(str_STX + $2.name + "+1", instr_size, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), 3, false );
      //addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );
    }
  else if( isWordDT($1.name) && isWordID($2.name) && isXA($3.name))
    {
      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), 3, false );
      //addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );

      addAsm(str_STA + $2.name, 3, false );
      addAsm(str_STX + $2.name + "+1", 3, false );
    }
  else if(isWordDT($1.name) && isWordID($2.name) && isWordIMM($3.name))
    {
      int v = atoi( string($3.name).substr( 1, 6 ).c_str());
      addAsm( str_LDA + "#$" + toHex(get_word_L(v)), 2, false  );
      addAsm( str_LDX + "#$" + toHex(get_word_H(v)), 2, false  );


      addAsm( str_STA + $2.name, 3, false );
      addAsm( str_STX + $2.name + "+1", 3, false );

      //addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker +  string( $2.name ), 3, false );
      //addAsm( string("STX $") + toHex( current_variable_base_address+1), 3, false );
    }
  //else if(string($3.name) == string("m")) // 0404
  else if(isMOB($3.name))
    {
      addParserComment( "MOB Detected" );

      // check to make sure the first 2 values are in the proper range
      //if( mob_vector[0] > 8 || mob_vector[0] < 1 ) addCompilerMessage( "MOB # out of range (must be 1-8)", 3 );
      if( mob_vector[1] > 255 || mob_vector[1] < 0 ) addCompilerMessage( "MOB Pointer out of range", 3 );
      pushScope("MOB");
      
      // store the pointer number in the variable with name $2.name
      // addAsm( str_LDA + "#$" + toHex(mob_vector[1]), 2, false );

      addAsm( str_LDA + "#$" + toHex(mob_vector[1]), 2, false );
      addAsm( str_STA + $2.name, 3, false );

      // first 2 bytes are: sprite # and sprite location
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

      
      // store the pointer in the variable name $2.name
      //addAsm( str_LDA + getLabel( ((int)label_vector[label_major]), false ) + "+1", 3, false );
      //addAsm( str_STA + $2.name + "+1", 3, false );
      //addAsm( str_LDA + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      //addAsm( str_STA + $2.name, 3, false );


      
      //addAsm( str_CLC );
      //addAsm( str_LDA + "#$01", 2, false );
      //addAsm( str_ADC + $2.name, 3, false );
      //addAsm( str_STA + $2.name, 3, false );
      //addComment( "not sure if the next 3 lines are needed" );
      //addAsm( str_LDA + "#$00", 2, false );
      //addAsm( str_ADC + $2.name + "+1", 3, false );
      //addAsm( str_STA + $2.name + "+1", 3, false );

      
      // Load the sprite area and store it at the address
      addAsm( str_LDA + "#$" + toHex( mob_vector[1] ) + commentmarker + "sprite pointer", 2, false );
      addAsm( str_BYTE + "$8D" + commentmarker + "STA Absolute", 1, false ); // STA
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );

      
      int sprite_base_address = sprite_area*64;

      string BA_L = toHex(get_word_L(sprite_base_address)); 
      string BA_H = toHex(get_word_H(sprite_base_address));
      //cerr << "mob_vector[2] = " << mob_vector[2] << endl;
      string byte_string = string($2.name) + "_data:\n\t" + str_BYTE;
      for( int i=2; i<mob_vector.size(); i++ )
	{
	  byte_string += string( "$" ) + toHex( mob_vector[i]);
	  if( i<(mob_vector.size()-1) ) byte_string+=string(", ");
	}
      mobs.push_back( byte_string );
      mob_vector.erase(mob_vector.begin(),mob_vector.end());
      addAsm( str_JMP + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      //addAsm( string( "JSR " ) + getLabel( ((int)label_vector[label_major]), false ), 3, false );
      addAsm( byte_string, 63, true );
      addAsm( generateNewLabel(), 0, true );
      //addAsm( str_PLA );
      addAsm( str_LDA + "#<" + $2.name + "_data", 2, false ); /// $2.name is the name of the MOB
      addAsm( str_STA + "$FB", 2, false );
      //addAsm( str_PLA );
      addAsm( str_LDA + "#>" + $2.name + "_data", 2, false );
      addAsm( str_STA + "$FC", 2, false );
      // we need to subtract one from $FB/$FC
      // and take care of a borrow if necessary
      /* addAsm( str_SEC ); */
      /* addAsm( str_LDA + "$FB", 2, false ); */
      /* addAsm( str_SBC + "#$01", 2, false ); */
      /* addAsm( str_STA + "$FB", 2, false ); */
      /* addAsm( str_LDA + "$FC", 2, false ); */
      /* addAsm( str_SBC + "#$00", 2, false ); */
      /* addAsm( str_STA + "$FC", 2, false ); */
      
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
      //cerr << getTypeOf( $2.name ) << endl;
      string msg = string( "Undefined variable: ") + string( $1.name ) + string(" ") +  string( $2.name ) + string("=") + string( $3.name );
      addCompilerMessage( msg, 3);
    }
};
| datatype ID '[' expression ']'
{
  //cerr << "array of datatype: " << $1.name << endl;
  if( isUintIMM( $4.name ) || isIntIMM( $4.name ) )
    {
      addParserComment( "RULE: statement: datatype ID '[' (U)INTIMM ']'  <== ARRAY" );
      int length = atoi(stripFirst($4.name).c_str());
      if( length > 255 || length < 1 ) addCompilerMessage( "Array index out of range 1-255",3);
      
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
| ID tMINUSMINUS
{
  string tmp_str = string( $1.name ) + string( "--" );
  addComment(tmp_str);
  int a = getAddressOf($1.name);
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  if( isWordID($1.name ) )
    {
      /* Words must use SBC so that Carry can get set if > 0xFF */
      addAsm( str_SEC );
      addAsm( str_LDA + "$" + toHex(a), size_of_instruction, false );
      addAsm( str_SBC + "#$01", 2, false );
      addAsm( str_STA + "$" + toHex(a), size_of_instruction, false );
      a++;
      if( a < 256 )
	{
	  size_of_instruction = 2;
	}
      else
	{
	  size_of_instruction = 3;
	}
      addAsm( str_LDA + "$" + toHex(a), size_of_instruction, false );
      addAsm( str_SBC + "#$00", 2, false );
      addAsm( str_STA + "$" + toHex(a), size_of_instruction, false );
    }
  else if( isUintID($1.name) || isIntID($1.name) )
    {
      addAsm( str_DEC + "$" + toHex( a ), size_of_instruction, false );
    }
};
| ID tPLUSPLUS
{
  string tmp_str = string( $1.name ) + "++";
  addComment(tmp_str);

  int a = getAddressOf($1.name);
  int size_of_instruction = 3;
  
  if( isUintID($1.name) )
    {
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_INC + "$" +  toHex( a ), size_of_instruction, false );
    }
  else if( isIntID($1.name) )
    {
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_INC + "$" +  toHex( a ), size_of_instruction, false );
    }
  else if( isWordID($1.name) )
    {
      addAsm(str_CLC);
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_INC + "$" +  toHex( a ), size_of_instruction, false );
      a++;
      if( a < 256 ) size_of_instruction = 2;
      if( size_of_instruction == 2 ) addAsm( str_BYTE + "$90, $02", 2, false );
      if( size_of_instruction == 3 ) addAsm( str_BYTE + "$90, $03", 2, false );
      addAsm( str_INC + toHex( a ), size_of_instruction, false );
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
  for( int i = 0; i < l; i++ ) addAsm( str_DEC + "$" + toHex( a ), size_of_instruction, false );
};
| tINC '(' ID ',' NUMBER ')'
{
  // TODO: Fix this to not use addresses unless necessary
  addComment( "inc( ID, IMM )   [for bytes only!]");
  int a = getAddressOf($3.name);
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  
  int l = atoi($5.name);
  for( int i = 0; i < l; i++ ) addAsm( str_INC + "$" + toHex( a ), size_of_instruction, false );
};
| tINC '(' expression ')'
{
  addComment( "inc(expression)");
  int a = getAddressOf($3.name);
  string a_name = getNameOf( a );
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  if( isWordID($3.name ) )
    {
      /* Words must use ADC so that Carry can get set if > 0xFF */
      addAsm( str_CLC );
      addAsm( str_LDA + "#$01", 2, false );
      // 2024 04 14 - mkpellegrino
      addAsm( str_ADC + a_name, size_of_instruction, false );
      addAsm( str_STA + a_name, size_of_instruction, false );
      //      addAsm( str_ADC + "$" + toHex(a), size_of_instruction, false );
      //addAsm( str_STA + "$" + toHex(a), size_of_instruction, false );
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
      //addAsm( str_ADC + "$" + toHex(a), size_of_instruction, false );
      //addAsm( str_STA + "$" + toHex(a), size_of_instruction, false );
    }
  else if( isUintID($3.name) || isIntID($3.name) )
    {
      //addAsm( str_INC + "$" + toHex( a ), size_of_instruction, false );
      //addComment( "isUintID($3.name);");
      addAsm( str_INC + getNameOf(a), size_of_instruction, false );
    }
  else if( isWordIMM($3.name) )
    {
      // increase the value at a specific address
      addAsm( str_INC + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false);
    }
  else
    {
      addCompilerMessage( "inc(expression) error - invalid argument type", 3 );
    } 
};
| tDEC '(' expression ')'
{
  /* int a = getAddressOf($3.name); */
  /* int size_of_instruction = 3; */
  /* if( a < 256 ) size_of_instruction = 2; */
  /* addAsm( string( "DEC $") +  toHex( a ), size_of_instruction, false ); */
  int a = getAddressOf($3.name);
  int size_of_instruction = 3;
  if( a < 256 ) size_of_instruction = 2;
  if( isWordID($3.name ) )
    {
      addComment( "dec(WordID)");

      addAsm( str_LDA + "#$FF", 2, false );
      illegal_operations_are_needed = true;
      
      addAsm( str_DCP + "$" + toHex(a), size_of_instruction, false );
      a++;
      if( a < 256 )
	{
	  size_of_instruction = 2;
      }
      else
      {
       size_of_instruction = 3;
      }
      addAsm( str_BYTE + "$D0, $" + toHex(size_of_instruction) + commentmarker + "BNE +3", 2, false );
      //addAsm( string(".byte #$D0, #$") + toHex(size_of_instruction) + commentmarker + string( " BNE +3"), 2, false );
      addAsm( str_DEC + "$" + toHex(a), size_of_instruction, false );
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

      addComment( "Decrement the byte @ Memory Address 0x????" );		  
      addAsm( str_DEC + "$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
    }
  else
    {
      addCompilerMessage( "dec(??) error - invalid argument type", 3 );
    } 

};
| tROL '(' ID ')'
{
  if( isUintID($3.name) || isIntID($3.name)  )
    {
      addComment( "This does NOT roll into carry." );
      addComment( "10000000 -> 00000001 -> 00000010" );

      pushScope("ROL");
      addComment( "rol(ID) [int]");
      //addAsm( str_CLC );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      
      addAsm( str_LDA + "$" + toHex(a), size_of_instruction, false );
      addAsm( str_ASL, 1, false );
      //addAsm( str_ASL + "$" + toHex(a), size_of_instruction, false );
      //addAsm( str_ROL + "$" + toHex(a), size_of_instruction, false );
      addAsm( str_BCC + getLabel( label_vector[label_major],false), 2, false ); // BCC Skip
      addAsm( str_ORA + "#$01", 2, false );
      addAsm( generateNewLabel() , 0, true ); // LABEL BB      
      addAsm( str_STA + "$" + toHex(a), size_of_instruction, false );
      popScope();
    }
  else if( isWordID($3.name) )
    {
      addComment( "This rolls into the carry" );
      addComment( "rol(ID) [word]");
      //addAsm( str_CLC );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm(  str_ROL + "$"  + toHex(a), size_of_instruction, false );
      if( a+1 > 255 ) size_of_instruction = 3;
      addAsm(  str_ROL + "$" + toHex(a+1), size_of_instruction, false );
    }
  else if( isWordIMM($3.name) )
    {
      addComment( "rol(WordIMM)");

      int addr = atoi(stripFirst($3.name).c_str());
      //addAsm( str_CLC );
      addAsm(  str_ROL + "$"  + toHex(addr), 3, false );
    }
  else addCompilerMessage( "ROL of type not permitted... yet", 3 );
};
| tROR '(' ID ')'
{
  if( isUintID($3.name) || isIntID($3.name))
    {
      addComment( "This does NOT roll into carry." );
      addComment( "00000001 -> 10000000 -> 01000000" );
      pushScope("ROR");

      addComment( "ror(ID) [int]");
      //addAsm( str_CLC );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;

      addAsm( str_LDA + "$" + toHex(a), size_of_instruction, false );
      addAsm( str_LSR, 1, false );
      //addAsm( str_ASL + "$" + toHex(a), size_of_instruction, false );
      //addAsm( str_ROL + "$" + toHex(a), size_of_instruction, false );
      addAsm( str_BCC + getLabel( label_vector[label_major],false), 2, false ); // BCC Skip
      addAsm( str_ORA + "#$80", 2, false );
      addAsm( generateNewLabel() , 0, true ); // LABEL BB      
      addAsm( str_STA + "$" + toHex(a), size_of_instruction, false );
      //addAsm( str_ROR + "$"  + toHex(a), size_of_instruction, false );
      popScope();

    }
  else if( isWordID($3.name) )
    {
      addComment( "This rolls into the carry" );
      addComment( "ror(ID) [word]");
      addAsm( str_CLC );
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a+1 < 256 ) size_of_instruction = 2;
      addAsm( string("ROR $") + toHex(a+1), size_of_instruction, false );
      if( a > 255 ) size_of_instruction = 3;
      addAsm( string("ROR $") + toHex(a), size_of_instruction, false );
      addAsm( str_CLC ); // 1/2/23
    }
  else addCompilerMessage( "ROR of type not permitted... yet", 3 );
  
};
| tPLOT '(' expression {addComment("mid-rule action");if(isA($3.name))addAsm(str_PHA + commentmarker + "\t\t\t\tx",1,false);} ',' expression {addComment("mid-rule action");if(isA($6.name))addAsm(str_PHA + commentmarker + "\t\t\t\ty",1,false);} ',' expression {addComment("mid-rule action");if(isA($9.name))addAsm(str_TAY + commentmarker + "\t\t\t\tc",1,false);} ')'
{
  string arg0 = string($3.name);
  string arg1 = string($6.name);
  string arg2 = string($9.name);

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
  
  
  multicolour_plot_is_needed = true;
  if( isWordID(arg0) && (isWordID(arg1)||isUintID(arg1)) && isUintID(arg2) )
    {
      addComment( "MC PLOT [WORD  WORD|UINT  UINT]" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c_addr = getAddressOf($9.name);
      
      // X Low - because this is Multicolour - the X coordinate fites into 1 byte
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // X High
      //addAsm( str_LDA+"#$00", 2, false ); // High Byte not needed
      //addAsm( str_STA + "$FB", 2, false );

      // Y
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
      //addAsm( str_JSR + "MCPLOT", 3, false );


      // colour
      addAsm( str_LDA + "$" + toHex(c_addr), 3, false );
      addAsm( str_STA + "$FD", 2, false );

      addAsm( str_JSR + "MCPLOT", 3, false );
      
    }
  else if( isWordID($3.name) && (isWordID($6.name)||isUintID($6.name)) && isUintIMM($9.name) )
    {
      addComment( "MC PLOT [WORD  WORD|UINT  UINT]" );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      int c_addr = getAddressOf($9.name);
      
      // X Low - because this is Multicolour - the X coordinate fites into 1 byte
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // X High
      //addAsm( str_LDA+"#$00", 2, false ); // High Byte not needed
      //addAsm( str_STA + "$FB", 2, false );

      // Y
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
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
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // Y
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
      //addAsm( str_JSR + "MCPLOT", 3, false );

      // colour
      addAsm( str_LDA + "$" + toHex(c_addr), 3, false );
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
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // Y
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
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
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      
      // Y
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
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
      //cerr << "HERE: plot(" << $3.name << ", " << $6.name << ", " << $9.name << ");" << endl;
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
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
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
  
};
| tCOMMENT '(' STR  ')'
{
  string commentstring = string($3.name);
  // strip the quotes off of the string
  addAsm( commentmarker + commentstring.substr(1,commentstring.length()-2), 0, true );
};
| tLSR '(' expression ')'
{
  if( isUintID($3.name) || isIntID($3.name)  )
    {    
      addCommentSection( "lsr(ID) [uint||int]");
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_LSR + "$" + toHex(a), size_of_instruction, false );
    }
  else if( isWordID($3.name) )
    {
      addCommentSection( "lsr(ID) [word]");
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a+1 < 256 ) size_of_instruction = 2;
      addAsm( str_LSR + "$" + toHex(a+1), size_of_instruction, false );
      if( a < 256 ) size_of_instruction = 2;
      addAsm( string("ROR $") + toHex(a), size_of_instruction, false );
    }
  else if( isWordIMM( $3.name ) )
    {
      int addr = atoi( stripFirst( $3.name ).c_str());
      addAsm( string( "LSR $") + toHex(addr), 3, false );
    }
  else addCompilerMessage( "LSR of type not permitted... yet", 3 );
};
| tASL '(' expression ')'
{
  if( isUintID($3.name) || isIntID($3.name) )
    {    
      addComment( "asl(expression);");
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_ASL + "$" + toHex(a), size_of_instruction, false );
    }
  else if( isWordID($3.name) )
    {
      addComment( "asl(expression)");

      //addAsm( str_CLC );
      
      int a = getAddressOf($3.name);
      int size_of_instruction = 3;
      if( a < 256 ) size_of_instruction = 2;
      addAsm( str_ASL + getNameOf(a), size_of_instruction, false );
      // 2024 04 14 - mkpellegrino
      //addAsm( str_ASL + "$" + toHex(a), size_of_instruction, false );
      if( a+1 > 255 ) size_of_instruction = 3;
      addAsm( str_ROL + getNameOf(a) + "+1", size_of_instruction, false );
      //addAsm( str_ROL + "$" + toHex(a+1), size_of_instruction, false );
    }
  else if( isWordIMM( $3.name ) )
    {
      addComment( "asl( memory_address );" );
		  
      int addr = atoi( stripFirst( $3.name ).c_str());
      addAsm( str_ASL + "$" + toHex(addr), 3, false );
    }
  else
    addCompilerMessage( "ASL of type not permitted... yet", 3 );
};

// THIS IS BROKEN - mkpellegrino 2023 02 15
// 2023 06 13 - working on it

| ID '[' expression {if(isA($3.name)){addAsm(str_PHA);}} ']' init
{
  string arg0 = string($1.name);
  string arg1 = string($3.name);
  string arg2 = string($6.name);

  if( isA(arg1.c_str() ) && !isXA(arg2.c_str() ) )
    {
      // remove last instruction
      // it should be a "pha"
      deletePreviousAsm();
    }
  
  addComment( "Array Initialisation" );
  addParserComment( "RULE: statement: ID '[' expression ']' init" );
  current_variable_type=getTypeOf(arg0.c_str());
  current_variable_base_address = getAddressOf(arg0.c_str());

  //string s = toHex( getAddressOf(arg0.c_str()) ) + string( "[" ) + string( arg1.c_str()) + string("]") + string( arg2.c_str() );
  //addCompilerMessage( s, 0 );
  //cerr << current_variable_type << endl;

  
  if( isUintID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isA(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntID] = A" );
		 
      int addr_of_index = getAddressOf(arg1.c_str());
      addAsm( str_LDX + arg1.c_str(), 3, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + ",X", 3, false );
    }
  else if( isUintID(arg0.c_str())  && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isXA(arg2.c_str()) )
    {
      addComment( "UINT array[(U)IntID] = XA;" );
      addCompilerMessage( "Setting UINT = WORD, losing high byte", 0 );
      addAsm( str_TAY );
      //addAsm( str_TXA );
      //addAsm( str_PHA );

      int tmp_i = getAddressOf( arg1.c_str() );
      int tmp_v = getAddressOf( arg0.c_str() );

      addAsm( str_LDA + "$" + toHex(tmp_i), 3, false ); 
      //addAsm( "ASL" );// 2* because it's a word array... not a byte array
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_STA + "$" + toHex( tmp_v ) + string( ",X" ), 3, false );
      //addAsm( str_PLA );
      //addAsm( str_INX );
      //addAsm( str_STA + "$" + toHex( tmp_v ) + string( ",X" ), 3, false );
      
    }
  else if( isUintID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isA(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntIMM] = A" );

      int tmp_index = atoi(stripFirst(arg1.c_str()).c_str());
      addAsm( str_LDX + "#$" + toHex(tmp_index), 2, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) +",X" , 3, false );
    }
  else if( isUintID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isUintID(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntIMM] = UintID" );
      int tmp_v = getAddressOf(arg2.c_str());
      int tmp_index = atoi(stripFirst(arg1.c_str()).c_str());
      addAsm( str_LDA + "$" + toHex(tmp_v), 3, false );
      addAsm( str_LDX + "#$"  + toHex(tmp_index), 2, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + ",X" , 3, false );
    }
  else if( isUintID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isUintID(arg2.c_str()) )
    {
      addComment( "UintID_array[(U)IntID] = UintID" );
	    
      int tmp_v = getAddressOf(arg2.c_str());
      int tmp_index = getAddressOf(arg1.c_str());
      addAsm( str_LDA + "$" + toHex(tmp_v), 3, false );
      addAsm( str_LDX + "$" + toHex(tmp_index), 3, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + ",X", 3, false );
    }
  else if( isWordID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isXA(arg2.c_str()) )
    {
      addComment( "wordarray[(U)IntID] = XA;" );

      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_PHA );
      int tmp_i = getAddressOf( arg1.c_str() );
      int tmp_v = getAddressOf( arg0.c_str() );
      addAsm( str_LDA + "$" + toHex(tmp_i), 3, false ); 
     addAsm( str_ASL );// 2* because it's a word array... not a byte array
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_STA + "$" + toHex( tmp_v ) + ",X", 3, false );
      addAsm( str_PLA );
      addAsm( str_INX );
      addAsm( str_STA + "$" + toHex( tmp_v ) + ",X", 3, false );
    }
  else if( isWordID( arg0.c_str() ) && (isUintID(arg1.c_str()) || isIntID(arg1.c_str())) && isWordIMM(arg2.c_str()) )
    {
      addComment( "WordID[UintID] = WordIMM;" );

      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = getAddressOf(arg1.c_str());
      int tmp_w = atoi( stripFirst(arg2.c_str()).c_str() );
      addAsm( str_LDA + "$" + toHex( tmp_i ), 3, false );
     addAsm( str_ASL );  // 2* because it's a word array... not a byte array
      addAsm( str_TAX );
      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + string( ",X" ), 3, false );
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
      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + string( ",X" ), 3, false );
     

   }
  else if( isWordID(arg0.c_str()) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isWordID(arg2.c_str()) )
   {
     addComment( "WordID[UintIMM] = WordID;" );

      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = 2*atoi( stripFirst(arg1.c_str()).c_str() );  // 2* because it's a word array... not a byte array
      int tmp_w = getAddressOf(arg2.c_str());
      addAsm( str_LDX + "#$" + toHex( tmp_i ), 2, false ); 
      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + string( ",X" ), 3, false );
     

   }
  else if( isWordID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isWordIMM(arg2.c_str()) )
    {
      addComment( "WordID[UintIMM] = WordIMM" );
      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = 2*atoi( stripFirst(arg1.c_str()).c_str() );  // 2* because it's a word array... not a byte array

      int tmp_w = atoi( stripFirst(arg2.c_str()).c_str() );
      addAsm( str_LDX + "#$" + toHex( tmp_i ), 2, false ); 

      //addAsm( str_LDA + "$" + toHex( tmp_i ), 3, false );
      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( current_variable_base_address ) + string( ",X" ), 3, false );
    }
  else if( isWordID( arg0.c_str() ) && (isUintIMM(arg1.c_str()) || isIntIMM(arg1.c_str())) && isXA(arg2.c_str()) )
    {
      addComment( "word array[(U)IntIMM] = XA;" );
      int tmp_base = getAddressOf( arg0.c_str() );
      int tmp_i = 2*atoi( stripFirst(arg1.c_str()).c_str() );  // 2* because it's a word array... not a byte array

      int tmp_w = atoi( stripFirst(arg2.c_str()).c_str() );

      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_PHA );
      addAsm( str_TYA );
      addAsm( str_LDX + "#$" + toHex( tmp_i ), 2, false ); 
      //addAsm( string("LDA #$" ) + toHex(get_word_L(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( tmp_base ) + string( ",X" ), 3, false );
      addAsm( str_INX );
      addAsm( str_PLA );
      //addAsm( string("LDA #$" ) + toHex(get_word_H(tmp_w) ), 2, false );
      addAsm( str_STA + "$" + toHex( tmp_base ) + string( ",X" ), 3, false );
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
      addAsm( str_ASL+commentmarker+"*2 b/c its a WORD array", 1, false);
      addAsm( str_TAY );
      addAsm( str_INY+commentmarker+"b/c we will store X first",1,false);
      addAsm( str_LDA + "$02" );
      addAsm( str_PHA ); // push $02 onto processor stack
      addAsm( str_LDA + "$03" );
      addAsm( str_PHA ); // push $03 onto processor stack

      addAsm( str_LDA + "#$" +  toHex(get_word_L(tmp_base_address)), 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "#$" +  toHex(get_word_H(tmp_base_address)), 2, false );
      addAsm( str_STA + "$03", 2, false );

      addAsm( str_JSR + "POP", 3, false ); // pop X from XA off of our stack
      addAsm( str_STA + "($02),Y", 2, false );
      addAsm( str_DEY );
      addAsm( str_JSR + "POP", 3, false ); // pop A from XA off of our stack
      addAsm( str_STA + "($02),Y", 2, false );

      // restore $02 and $03
      addAsm( str_PLA );
      addAsm( str_STA + "$03" );

      addAsm( str_PLA );
      addAsm( str_STA + "$02" );

    }
    else
      {
	addCompilerMessage( "Unable to initialise WORD ARRAY", 3 );
      }
    
  // $1.name     $3.name    $5.name


};
| ID init 
{
  //  ASSIGNMENTS
  current_variable_type=getTypeOf($1.name);
  current_variable_base_address = getAddressOf($1.name);
  if(current_variable_base_address == -1)
    {
      addCompilerMessage( "ERROR: Undeclared Variable", 3 );
    }
  addParserComment( "RULE: statement: ID init" );

  if( (isIntID($1.name) || isUintID($1.name)) && isWordID($2.name) )
    {
      addComment("UintID = WordID" );
      addCompilerMessage( "Setting UINT = WORD, losing high byte", 0 );

      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($2.name);
      int instr_size = 3;
      if( addr2 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex( addr2 ) + commentmarker +  getNameOf(addr2), instr_size, false );
      instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex( addr1 ) + commentmarker +  getNameOf(addr1), instr_size, false );
    }
  else if( isUintID($1.name) && isNULL($2.name ) )
    {
      addCompilerMessage( "*** *** *** *** *** *** (2)", 3 );
    }
  else if( isUintID($1.name) && isUintID($2.name) )
    {
      addComment( "???? - Something is incorrect here. - 2023 08 08" );
      addComment( string( "$1.name = " ) + $1.name + "\t$2.name = " + $2.name ); 
      addComment("UintID = UintID" );
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($2.name);
      int instr_size = 3;
      if( addr2 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex( addr2 ) + commentmarker +  getNameOf(addr2), instr_size, false );
      instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex( addr1 ) + commentmarker +  getNameOf(addr1), instr_size, false );      
    }
  else if( isWordID($1.name) && isWordID($2.name) )
    {
      addComment("WordID = WordID" );
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($2.name);
      int instr_size = 3;
      if( addr2 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex(addr2) + commentmarker +  getNameOf(addr2) + string(" L"), instr_size, false );
      instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex(addr1) + commentmarker +  getNameOf(addr1) + string(" L"), instr_size, false );
      
      instr_size = 3;
      if( addr2+1 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex(addr2+1) + commentmarker +  getNameOf(addr2) + string(" H"), instr_size, false );
      instr_size = 3;
      if( addr1+1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex(addr1+1) + commentmarker +  getNameOf(addr1) + string(" H"), instr_size, false );
    }
  else if( isWordID($1.name) && (isUintID($2.name) || isIntID($2.name) ))
    {
      addComment("WordID = UintID||IntID" );
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($2.name);
      int instr_size = 3;
      if( addr2 < 256 ) instr_size = 2;
      addAsm( str_LDA + "$" + toHex( addr2 ) + commentmarker +  getNameOf(addr2), instr_size, false );
      instr_size = 3;
      if( addr1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( addr1 ) + commentmarker +  getNameOf(addr1) + " L", instr_size, false );

      // high byte
      addAsm( str_LDA + "#$00" , 2, false );
      instr_size = 3;
      if( addr1+1 < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex(addr1+1) + commentmarker +  getNameOf(addr1) + " H", instr_size, false );

    }
  else if( isWordID($1.name) && isA($2.name) )
    {
      addComment("WordID = A" );
      int addr = getAddressOf($1.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;

      // 2024 04 14 - mkpellegrino
      addAsm( str_STA + getNameOf(addr), instr_size, false);
      //addAsm( str_STA + "$" + toHex(addr) + commentmarker +  getNameOf(addr), instr_size, false);
      instr_size = 3;
      if( addr+1 < 256 ) instr_size = 2;
      addAsm( str_LDA + "#$00", 2, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_STA + getNameOf(addr) + "+1",  instr_size, false);
      //addAsm( str_STA + "$" + toHex(addr+1), instr_size, false);
      
    }
  else if( isWordID($1.name) && isXA($2.name) )
    {
      addComment("WordID = XA" );
      int addr = getAddressOf($1.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_STA + getNameOf(addr), instr_size, false);
      instr_size = 3;
      if( addr+1 < 256 ) instr_size = 2;
      addAsm( str_STX + getNameOf(addr) + "+1", instr_size, false);
    }
  else if(isARG($2.name))
    {
      addComment( "LINE 7198:  else if(isARG($2.name))" );
    }
  else if( isFAC($2.name))
    {
      addAsm( str_LDX + "#$" + toHex(get_word_L(current_variable_base_address) ), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(current_variable_base_address) ), 2, false );
      addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );
    }
  else if( isMOB($2.name) )
    {
      addComment( "ID init [else if( isMOB($2.name) )]" );
    }
  else if( isFloatIMM($2.name) )
    {
      addComment( string("FLOAT v. IMM FLOAT) [") + string($1.name) + string(":") + string($2.name) + string( "]" ) );
      int base_address = getAddressOf($1.name);
      if( base_address == -1 ) base_address = 105;
      inlineFloat($2.name, base_address );
    }
  else if( (current_variable_type==0||current_variable_type==1) && isUintIMM($2.name) )
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($2.name).c_str())) , 2, false );
    }
  else if( current_variable_type==2  && (isUintIMM($2.name)||isIntIMM($2.name)))
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($2.name).c_str())), 2, false );
      addAsm( str_LDX + "#$00", 2, false );
    }
  else if( isWordID($1.name) && isXA($2.name) )
    {
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size=2; 
      addAsm( str_STA + "$" + toHex(current_variable_base_address) + commentmarker +  getNameOf(current_variable_base_address), instr_size, false);
      if( (current_variable_base_address+1) < 256 )
	{
	  instr_size=2;
	}
      else
	{
	  instr_size=3;
	}
      addAsm( str_STX + "$" + toHex(current_variable_base_address+1), instr_size, false);
    }
  else if( (isUintID($1.name)||isIntID($1.name)) &&  isA($2.name) )
    {
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size=2; 
      addAsm( str_STA + getNameOf(current_variable_base_address) + commentmarker + toHex(current_variable_base_address), instr_size, false);
    }
  else if( (isUintID($1.name)||isIntID($1.name)) &&  isXA($2.name) )
    {
      addCompilerMessage("setting a 1 byte memory location to a 2 byte value... losing High Byte",0);
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size = 2;
      addAsm( str_STA + "$" + toHex( current_variable_base_address) + commentmarker + getNameOf(current_variable_base_address), instr_size, false );
  }
  else if( (isUintID($1.name)||isIntID($1.name) ) && (isIntIMM($2.name)||isUintIMM($2.name)))
    {
      addComment( string($1.name) + string( " = " ) + string($2.name) );
      //addAsm( str_LDA + "#$" + toHex( atoi($2.name) ), 2, false );
      int instr_size = 3;
      if( current_variable_base_address < 256 ) instr_size=2; 
      addAsm( str_STA + "$" + toHex(current_variable_base_address) + commentmarker +  getNameOf(current_variable_base_address), instr_size, false);
    }
  else
    {
      addCompilerMessage( "ID initialisation error - invalid initialiser", 3 );
    } 

};
| tSCREEN '(' expression ')'
{
  pushScope( "SCREEN" );
  // exp1 shl 4 times
  // or it with d011
  // sta d011
  addComment( "screen(exp); : set bit 4 of $D011 to LSB of expression" );
  //addAsm( str_SEI );
  if( isUintID( $3.name ) )
    {
      int v = getAddressOf( $3.name );
      addAsm( str_LDA + "$" + toHex(v), 3, false );

      addAsm( str_LDA + "#$EF", 2, false );  
      addAsm( str_AND + "$D011", 3, false );
      addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + commentmarker + "store A after the ORA instruction below", 3, false );
      addAsm( str_LDA + "$" + toHex(v), 3, false );
      addAsm( str_AND + "#$01", 2, false );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ORA + getLabel( label_vector[label_major]+1, false) + commentmarker + "OR the argument with the old value of D011", 3, false );
   
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$A9, $00" + commentmarker + "LDA IMM", 2, false );
      addAsm( str_STA + "$D011", 3, false );

      
    }
  else if( isUintIMM( $3.name ) )
    {
      
      int v = atoi( stripFirst($3.name).c_str());

      //addAsm( str_LDA + "#$" + toHex(v), 2, false );


      if( v == 0 )
	{
	  addAsm( str_LDA + "#$EF", 2, false );
	  addAsm( str_AND + "$D011", 3, false );
	  addAsm( str_STA + "$D011", 3, false );
	}
      else
	{
	  addAsm( str_LDA + "#$10", 2, false );
	  addAsm( str_ORA + "$D011", 3, false );
	  addAsm( str_STA + "$D011", 3, false );
	}
    }
  else if( isA( $3.name ) )
    {
      addAsm( str_PHA );
      // do nothing because the value is already in A
      addAsm( str_LDA + "#$EF", 2, false );  
      addAsm( str_AND + "$D011", 3, false );
      addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + commentmarker + "store A after the ORA instruction below", 3, false );
      addAsm( str_PLA );
      //addAsm( str_LDA + "$" + toHex(v), 3, false );
      addAsm( str_AND + "#$01", 2, false );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ORA + getLabel( label_vector[label_major]+1, false) + commentmarker + "OR the argument with the old value of D011", 3, false );
   
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$A9, $00" + commentmarker + "LDA IMM", 2, false );
      addAsm( str_STA + "$D011", 3, false );

    }
  else
    {
      addCompilerMessage( "incorrect type for blank must be UintID/IMM or A", 3 );
    }
  popScope();
};

| tFCLOSE '(' expression ')'
{
  addComment( "fclose" );
  if( isUintIMM( $3.name ) )
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else
    {
      addCompilerMessage( "for now Param1 (Logical#) must be a UintIMM", 3);
    }
  addAsm( str_JSR + "$FFC3", 3, false );
};
| tFOPEN '(' ')'
{
  addComment( "fopen" );
  addAsm( str_JSR + "$FFC0", 3, false );
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
      addAsm( str_LDA + $3.name, 3, false );
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
  else
    {
      addCompilerMessage( "for now Param1 (Logical#) must be a UintIMM", 3);
    }
  addAsm( str_JSR + "$FFC6", 3, false );
  
};
| tSETLFS '(' expression ',' expression ',' expression ')'
{
  addComment( "Set Logical File System" );
  //int A;
  //int X;
  //int Y;
  if( isUintIMM( $3.name ) )
    {
      addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else
    {
      addCompilerMessage( "for now Param1 (Logical#) must be a UintIMM", 3);
    }
  if( isUintIMM( $5.name ) )
    {
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($5.name).c_str())), 2, false );
      
    }
  else
    {
      addCompilerMessage( "for now Param2 (Device #) must be a UintIMM", 3);
    }
  if( isUintIMM( $7.name ) )
    {
      addAsm( str_LDY + "#$" + toHex(atoi(stripFirst($7.name).c_str())), 2, false );
    }
  else
    {
      addCompilerMessage( "for now Param3 (Secondary#) must be a UintIMM", 3);
    }
  addAsm( str_JSR + "$FFBA", 3, false );  
};
| tSAVE '(' STR ',' expression ',' expression ')'
{
  pushScope("SAVE");
  save_is_needed = true;
  addAsm( str_SEI );


  addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );


    int datasize;
  int memoryloc;
  if( isUintIMM($7.name) )
    {
      datasize = atoi(stripFirst($7.name).c_str());
    }
  else
    {
      addCompilerMessage( "Size must be a UintIMM", 3 );
    }
  if( isWordIMM($5.name) )
    {
      memoryloc = atoi(stripFirst($5.name).c_str());
      addAsm( str_LDA + "#>$" + toHex(memoryloc), 2, false );
      addAsm( str_PHA );
      
      addAsm( str_LDA + "#<$" + toHex(memoryloc), 2, false );
      addAsm( str_PHA );
    }
  else if( isWordID($5.name) )
    {
      memoryloc = atoi(stripFirst($5.name).c_str());
      addAsm( str_LDA + "$" + toHex(memoryloc), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$" + toHex(memoryloc+1), 3, false );
      addAsm( str_PHA );
    }
  else
    {
      addCompilerMessage( "Memory Location must be a WordIMM or WordID", 3 );
    }
  


  addAsm( str_LDA + "#$" + toHex( string($3.name).length()-2), 2, false );
  addAsm( str_PHA );
  
  addAsm( str_LDA + "#>STRLBL" + itos(string_number), 2, false );
  addAsm( str_PHA );

  addAsm( str_LDA + "#<STRLBL" + itos(string_number++), 2, false );
  addAsm( str_PHA );
  
  addAsm( str_LDA + "#$" + toHex(datasize), 2, false );
  addAsm( str_PHA );

  addAsm( str_JSR + "SAVE", 3, false );
  addAsm( str_CLI );

  popScope();
};
| tLOAD '(' STR ',' expression ',' expression ')'
{
  pushScope("LOAD");
  addAsm( str_SEI );

  //load16_is_needed = true;
  //load_is_needed = true;

  addString( string("STRLBL") + itos(string_number), string($3.name).substr(1,string($3.name).length()-2), asm_instr.size() );

  // attached Disk Filename, memorylocation, size (in bytes)
  int datasize;
  int memoryloc;
  
  if( isUintIMM($7.name) || isWordIMM($7.name) )
    {
      datasize = atoi(stripFirst($7.name).c_str());
    }
  else 
    {
      addCompilerMessage( "Size must be a UintIMM/WordIMM", 3 );
    }

  if( datasize > 255 )
    {
      load16_is_needed = true;
    }
  else
    {
      load_is_needed = true;
    }

  
  if( isWordIMM($5.name) )
    {
      memoryloc = atoi(stripFirst($5.name).c_str());
      addAsm( str_LDA + "#>$" + toHex(memoryloc), 2, false );
      addAsm( str_PHA );
      
      addAsm( str_LDA + "#<$" + toHex(memoryloc), 2, false );
      addAsm( str_PHA );
      
    }
  else if( isWordID($5.name) )
    {
      memoryloc = atoi(stripFirst($5.name).c_str());

      addAsm( str_LDA + "$" + toHex(memoryloc), 3, false );
      addAsm( str_PHA );
      
      addAsm( str_LDA + "$" + toHex(memoryloc+1), 3, false );
      addAsm( str_PHA );
    }
  else
    {
      addCompilerMessage( "Memory Location must be a WordIMM or WordID", 3 );
    }

  addComment( "push the address of the filename onto the stack" );
  addAsm( str_LDA + "#$" + toHex( string($3.name).length()-2), 2, false );
  addAsm( str_PHA );
  
  addAsm( str_LDA + "#>STRLBL" + itos(string_number), 2, false );
  addAsm( str_PHA );

  addAsm( str_LDA + "#<STRLBL" + itos(string_number++), 2, false );
  addAsm( str_PHA );

  addComment( "push the number of bytes onto the stack" );
  addAsm( str_LDA + "#$" + toHex(datasize), 2, false );
  addAsm( str_PHA );

  if( datasize > 255 )
    {
      addAsm( str_JSR + "LOAD16", 3, false );
    }
  else
    {
      addAsm( str_JSR + "LOAD", 3, false );
    }
  addAsm( str_CLI );
    
  popScope();
};
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

// here needs work
init: '=' expression
{
  addParserComment( string( "RULE: init: '=' expression" ) );
  //if( isFloatID( $$.name ) )
  //  {
  //    cerr << "initializing a float" << endl;
  // }
  
  int variable_type = getTypeOf( $$.name );
  //cerr << $$.name << " = " << $2.name << endl;
      
  //if( isWordID($$.name) && string($2.name) == string("") )
  //  {
  //    addAsm( str_LDX + "#$00", 2, false );
  //    addAsm( str_LDA + "#$00", 2, false );
  //    strcpy( $$.name, "_XA" );
  //  }
  if( isARG($2.name)  )
    {
      addComment( "initialising a float with ARG" );
      strcpy($$.name, "_ARG" );
    }
  else if( isXA($2.name)  )
    {
      addComment( "initialising a word with XA" );
      strcpy($$.name, "_XA" );
    }
  else if( isFAC($2.name)  )
    {
      addComment( "initialising a float with FAC" );
      strcpy($$.name, "_FAC" );
    }  
  else if( isMOB($2.name)  )
    {
      addComment( "initialising a sprite with MOB" );
      strcpy($$.name, "_MOB" );
    }  
  else if( isA($2.name) )
    {
      addComment( "initialising a byte with A" );
      strcpy($$.name, "_A" );
    }
  else if( isFloatIMM($2.name) )
    {
      addComment( "initialising FloatIMM" );
      strcpy($$.name, $2.name);
    }
  else if( isWordID( $2.name ) )
    {
      int tmp_addr = hexToDecimal($2.name);
      int instr_size = 3;
      if(tmp_addr < 256) instr_size = 2;
      addComment( "initialising WordID" );

      addAsm( str_LDA + getNameOf(tmp_addr) + commentmarker +  getNameOf(tmp_addr), instr_size, false );
      //addAsm( str_LDA + "$" + toHex(tmp_addr) + commentmarker +  getNameOf(tmp_addr), instr_size, false );
      instr_size = 3;
      if(tmp_addr < 255) instr_size = 2;
      addAsm( str_LDX + getNameOf(tmp_addr)+"+1", instr_size, false );
      //addAsm( str_LDX + "$" + toHex(tmp_addr+1), instr_size, false );
      strcpy($$.name, "_XA" );
    }
  else if( isUintID( $2.name ) )
    {
      int tmp_addr = hexToDecimal($2.name); 
      addComment( "initialising UintID" );
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(tmp_addr), 3, false );
      //addAsm( str_LDA + "$" + toHex(tmp_addr) + commentmarker +  getNameOf(tmp_addr), 3, false );
      strcpy($$.name, "_A" );
    }
  else if( isIntID( $2.name ) )
    {
      int tmp_addr = hexToDecimal($2.name); 
      addComment( "initialising IntID" );
      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(tmp_addr), 3, false );
      //addAsm( str_LDA + "$" + toHex(tmp_addr) +  commentmarker +  getNameOf(tmp_addr), 3, false );
      strcpy($$.name, "_A" );
    }
  else if( isUintIMM($2.name) )
    {
      addComment( "initialising UintIMM" );
      int v = atoi( stripFirst($2.name).c_str() );
      addAsm( str_LDA + "#$" + toHex(v), 2, false );
      strcpy( $$.name, "_A" );
    }
  else if( isIntIMM($2.name) )
    {
      addComment( string("initialising IntIMM: ") + string(stripFirst($2.name)) );
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

      addComment( string("initialising WordIMM: ") + string(stripFirst($2.name)) );

      int tmp_int = atoi( stripFirst($2.name).c_str() );
      if( get_word_L(tmp_int) ==  get_word_H(tmp_int) )
	{
	  //illegal_operations_are_needed = true;
	  
	  addAsm( str_LDA+"#$" + toHex( get_word_L(tmp_int)), 2, false );
	  addAsm( str_TAX );
	}
      else
	{
	  addAsm( str_LDA+"#$" + toHex( get_word_L(tmp_int) ), 2, false);
	  addAsm( str_LDX + "#$" + toHex( get_word_H(tmp_int) ), 2, false);
	}
      strcpy($$.name, "_XA" ); 
    }
  else if( isNULL($2.name) )
    {
      
      strcpy($$.name, "NULL" );
    }
   else
    {
      strcpy($$.name, $2.name );

    }
}
|
{
  //cerr << $$.name << endl;
  addParserComment( "RULE: init: nothing (not NULL)" );
  //sprintf($$.type, "null");
  //$$.nd = mknode(NULL, NULL, "0");
  //strcpy($$.name, "w0" );
  //strcpy($$.name, "_A");
  strcpy($$.name, "Slipstream");
};

// 2023 03 21
// Need XA operation A support
// if( isXA($1.name) && isA($1.name) )
expression: expression
{
  if(isA($1.name))
    {addComment("OP1 (byte)");addAsm( str_PHA );}
  else if(isXA($1.name))
    {addComment("OP1 (word)");addAsm( str_PHA );addAsm( str_TXA );addAsm( str_PHA );}
}
arithmetic expression
{   /*if(isA($1.name) && isA($4.name)){addAsm( str_PHA );}*/addComment("OP2");}
{
  //addNode( string($3.name) ); nl++;
  //addNode( string($1.name) );
  //addNode( string($4.name) ); nl--;

  
  if( isXA($1.name) && (!isXA($4.name) && !isA($4.name) ) )
    {
      // 2024 04 15 - ??????  I deleted the first delete
      // but this needs to be verified.
      if( arg_asm_comments ) deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "Deleted previous 3 instructions" );
    }

  // 
  /* if( isA($1.name)  && (!isXA($4.name) && !isA($4.name) ) ) */
  /*   { */
  /*     deletePreviousAsm(); */
  /*     deletePreviousAsm(); */
  /*     addComment( "Deleted previous 2 LOC" ); */
  /*   } */

  addParserComment( "RULE: expression: expression arithmetic expression" );
  
  string op = string($3.name);
  addComment( string($1.name) + string( " " ) + op + string( " " ) + string($4.name) );
  
  // here is where we should check to see if the
  // variable ($$.name) is already in use (in _this_ scope).
  // .. but we don't yet
  int FAC=0;
  int type1 = getTypeOf($1.name);
  int type2 = getTypeOf($4.name);
  addComment( string($1.name) + string(" (") + string(itos(getTypeOf($1.name))) + ") " + op + " "  + $4.name + " (" + itos( getTypeOf($4.name) )  + ")"  );


  if( op == string( "-" ))
    {
      addAsm( str_SEC );
    }
  else if( op == string("+") )
    {
      addAsm( str_CLC );
    }

  
  if( isWordID($1.name) && isXA($4.name) )
    {
      if( op == string("-") )
	{
	  
	  int tmp_op1 = getAddressOf( $1.name );
	  addAsm( str_TAY );

	  preserve0203();
	  addAsm( str_STY + "$02", 2, false );
	  addAsm( str_STX + "$03", 2, false );

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1), 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1) + commentmarker + $1.name, 3, false  );

	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_TAY );

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1) + "+1", 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1), 3, false  );

	  addAsm( str_SBC + "$03", 2, false );
	  addAsm( str_TAX );

	  restore0203();
	  addAsm( str_TYA );
	  
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("+") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  //addAsm( str_CLC );
	  addAsm( str_TAY );

	  preserve0203();

	  addAsm( str_STY + "$02", 2, false );
	  addAsm( str_STX + "$03", 2, false );
	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1), 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1) + commentmarker +  string($1.name), 3, false  );
	  addAsm( str_ADC + "$02", 2, false );
	  addAsm( str_TAY );

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1)+"+1", 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1), 3, false  );
	  addAsm( str_ADC + "$03", 2, false );
	  addAsm( str_TAX );

	  restore0203();
	  
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  mul16_is_needed = true;
	  //addAsm( str_STA + "$FD", 2, false);
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  
	  //addAsm( str_STX + "$FE", 2, false);
	  addAsm( str_STA + "_MUL16_FE", 3, false);


	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1) + "+1", 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1) + commentmarker +  string($1.name), 3, false  );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1), 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1), 3, false  );
	  
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1), 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1) + commentmarker +  string($1.name), 3, false  );
	  addAsm( str_STA + "_DIV16_FB", 3, false );

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(tmp_op1)+"+1", 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1), 3, false  );
	  
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( string("WordID ")  + op + string(" XA"), 0 );
	  addCompilerMessage( "Math operation not implemented... yet.", 3 );
	}
	
    }
  else if( isUintID($1.name) && isWordIMM($4.name) )
    {
      // TODO: Not fully implemented yet!
      int OP1_addr = getAddressOf($1.name);
      int OP2 = atoi(stripFirst($4.name).c_str());
      if( op == string("+") )
	{
	  addComment( "UintID + WordIMM" );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(OP2)), 2, false );
	  addAsm( str_ADC + "$" + toHex(OP1_addr), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$" + toHex(get_word_H(OP2)), 2, false );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("-") )
	{
	  addComment( "UintID - WordIMM" );
	  addCompilerMessage( "Math Operation not implemented for UintID - WordIMM (yet)", 3 );

	  //strcpy($$.name, "_XA" );

	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "UintID * WordIMM" );
	  
	  addAsm( str_LDA + "$" + toHex(OP1_addr), 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  //addAsm( str_STA + "$FD", 2, false );

	  addAsm( str_LDA + "#$00", 2, false );
	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_LDA + "#$" + toHex(get_word_L(OP2)), 2, false );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_LDA + "#$" + toHex(get_word_H(OP2)), 2, false );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );	  
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("/") )
	{
	  addComment( "UintID / WordIMM" );
	  addCompilerMessage( "Math Operation not implemented for UintID / WordIMM (yet)", 3 );

	  //strcpy($$.name, "_XA" );

	}
      else
	{
	  addCompilerMessage( string("Unknown Math Operation: ") + op, 3 );
	}
    }
  else if( isUintID($1.name) && isXA($4.name) )
    {
      addComment( "UintID arith XA" );
      int tmp_addr = getAddressOf($1.name);
      string tmp_name = getNameOf(tmp_addr);
      if( op == string("-") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_LDA + "$03", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_STY + "$02", 2, false );
	  addAsm( str_STX + "$03", 2, false );
	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + tmp_name, 3, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1) + commentmarker +  tmp_name, 3, false  );
	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false  );
	  addAsm( str_SBC + "$03", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("+") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  //addAsm( str_CLC );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_LDA + "$03", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_STY + "$02", 2, false );
	  addAsm( str_STX + "$03", 2, false );

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + tmp_name, 3, false  );

	  //addAsm( str_LDA + "$" + toHex(tmp_op1) + commentmarker +  tmp_name, 3, false  );
	  addAsm( str_ADC + "$02", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1), 3, false  );
	  addAsm( str_ADC + "$03", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  mul16_is_needed = true;
	  
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  //addAsm( str_STA + "$FD", 2, false);

	  //addAsm( str_STX + "$FE", 2, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);

	  addAsm( str_LDA + "#$00", 2, false  );
	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1), 3, false  );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + tmp_name, 3, false  );

 	  //addAsm( str_LDA + "$" + toHex(tmp_op1) + commentmarker +  tmp_name, 3, false  );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);

	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  div16_is_needed = true;
	  addAsm( str_STA + "_DIV16_FD", 3, false);
	  addAsm( str_STX + "_DIV16_FE", 3, false);
	  addAsm( str_LDA + "#$00", 2, false  );

	  //addAsm( str_LDA + "$" + toHex(tmp_op1), 3, false  );
	  addAsm( str_STA + "_DIV16_FB", 3, false );

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + tmp_name, 3, false  );

	  //addAsm( str_LDA + "$" + toHex(tmp_op1+1) + commentmarker +  tmp_name, 3, false  );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( string("UintID ")  + op + string(" XA"), 0 );
	  addCompilerMessage( "Math operation not implemented... yet.", 3 );
	}
	
    }
  else if( isXA($1.name) && isA($4.name) )
    {
      // XA is on stack
      // A is in A
      if( op == string( "+" ) )
	{
	  addComment( "XA + A" );
	  addAsm( str_LDX + "$02", 2, false );
	  addAsm( str_LDY + "$03", 2, false );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false ); // X1
	  addAsm( str_PLA );
	  //addAsm( str_CLC );
	  addAsm( str_ADC + "$02", 2, false );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + "$03", 2, false );
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_STX + "$02", 2, false );
	  addAsm( str_LDX + "$03", 2, false );      
	  addAsm( str_STY + "$03", 2, false );
	  addAsm( str_PLA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("-") )
	{
	  addComment( "XA - A" );
	  addAsm( str_LDX + "$02", 2, false );
	  addAsm( str_LDY + "$03", 2, false );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false ); // X1
	  addAsm( str_PLA );
	  //addAsm( str_SEC );
	  addAsm( str_SBC + "$02", 2, false );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_SBC + "$03", 2, false );
	  addAsm( str_LDA + "$02", 2, false );
	  addAsm( str_PHA );
	  addAsm( str_STX + "$02", 2, false );
	  addAsm( str_LDX + "$03", 2, false );      
	  addAsm( str_STY + "$03", 2, false );
	  addAsm( str_PLA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * A" );
	  
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  //addAsm( str_STA + "$FD", 2, false);

	  
	  addAsm( str_LDA + "#$00", 2, false );
	  //addAsm( str_STA + "$FE", 2, false);
	  addAsm( str_STA + "_MUL16_FE", 3, false);

	  addAsm( str_PLA );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  
	  addAsm( str_PLA );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / A" );
	  
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
      
      else
	{
	  addCompilerMessage( string("XA ")  + op + string(" A"), 0 );

	  addCompilerMessage( "Math operation not implemented yet.", 3 );
	}

    }
  else if( isUintID($1.name) && isXA($4.name) )
    {
      addComment( "isUintID($1.name) && isXA($4.name) -- 2" );
      if( op == string("+") )
	{
	  int addr = getAddressOf( $1.name );
	  int instr_size = 3;
	  if( addr < 256 ) instr_size = 2;
	  addComment( "UintID + XA" );
	  addAsm( str_ADC + "$" + toHex(addr) + commentmarker +  string($1.name), instr_size, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
     else if( op == string("-") )
	{
	  int addr = getAddressOf( $1.name );
	  int instr_size = 3;
	  if( addr < 256 ) instr_size = 2;
	  addComment( "UintID - XA" );
	  addCompilerMessage( "UintID - XA not yet supported", 3 );
	}
      else
	{
	  addCompilerMessage( string("Uint ")  + op + string(" XA"), 0 );

	  addCompilerMessage( "Math operation not implemented yet.", 3 );

	}

    }
  else if( isXA($1.name) && isWordID($4.name) )
    {
      if( op == string("-") )
	{
	  addComment( "XA - Word" );
	  int tmp_base = getAddressOf( $4.name );
	  //addCompilerMessage( "XA - WordID", 0 );
	  //addAsm( str_SEC );
	  addAsm( str_SBC + "$" + toHex( tmp_base ) + commentmarker +  string($4.name), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "$" + toHex( tmp_base + 1 ), 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("+") )
	{
	  addComment( "XA + WordID" );
	  int tmp_base = getAddressOf( $4.name );
	  //addCompilerMessage( "XA + WordID", 0 );
	  //addAsm( str_CLC );
	  addAsm( str_ADC + "$" + toHex( tmp_base ) + commentmarker +  string($4.name), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "$" + toHex( tmp_base + 1 ), 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}

      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * WordID" );

	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  addAsm( str_STX + "_MUL16_FC", 3, false);
	  
	  int tmp_base = getAddressOf( $4.name );
	  int instr_size;

	  if( tmp_base > 255 )
	    {
	      instr_size = 3;
	    }
	  else
	    {
	      instr_size = 2;
	    }
	  addAsm( str_LDA + toHex( tmp_base ) + commentmarker +  string($4.name), instr_size, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  //addAsm( str_STA + "$FD", 2, false);
	  
	  if( tmp_base+1 > 255 )
	    {
	      instr_size = 3;
	    }
	  else
	    {
	      instr_size = 2;
	    }
	  addAsm( str_LDA + toHex( tmp_base +1 ), instr_size, false );
	  //addAsm( str_STA + "$FE", 2, false);
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
       else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / WordID" );
	  addAsm( str_TAY );
	  int tmp_base = getAddressOf( $4.name );
	  int instr_size;

	  if( tmp_base > 255 )
	    {
	      instr_size = 3;
	    }
	  else
	    {
	      instr_size = 2;
	    }
	  addAsm( str_LDA + toHex( tmp_base ) + commentmarker +  string($4.name), instr_size, false );
	  
	  addAsm( str_STA + "$FD", 2, false);
	  if( tmp_base+1 > 255 )
	    {
	      instr_size = 3;
	    }
	  else
	    {
	      instr_size = 2;
	    }
	  addAsm( str_LDA + toHex( tmp_base +1 ), instr_size, false );
	  
	  addAsm( str_STA + "_DIV16_FE", 3, false);
	  addAsm( str_TYA );
	  addAsm( str_STX + "_DIV16_FC", 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );

	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( string("XA ") + op + string(" WordID"), 0 );
	  addCompilerMessage( "Math operation not implemented yet.", 3 );
	}
    }
  else if( isXA($1.name) && isUintIMM($4.name) )
    {
      if( op == string("-") )
	{
	  addComment( "XA - UintIMM" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  //addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_v) + commentmarker + $4.name, 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("+") )
	{
	  addComment( "XA + UintIMM" );

	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  //addAsm( str_CLC );
	  addAsm( str_ADC + "#$" + toHex(tmp_v) + commentmarker +  $4.name, 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*" ) )
	{

	  addComment( "XA * UintIMM" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  switch(tmp_v)
	    {
	    case 0:
	      //illegal_operations_are_needed = true;
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_TAX );
	      strcpy($$.name, "_XA");
	      break;
	    case 1:
	      strcpy($$.name, "_XA");
	      break;
	    case 256:
	      addAsm( str_TAX );
	      addAsm( str_LDA + "#$00", 2, false );
	      break;
	    case 128:
	    case 64:
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_STX + "$03", 2, false );

	      addAsm( str_LDX + "#$" + toHex(log2(tmp_v)), 2, false );

	      // L1
	      addComment( "top-of-loop" );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_DEX );
	      
	      addAsm( str_BYTE + "$D0, $F9" + commentmarker + "BNE ^^ top-of-loop ^^", 2, false );

	      addAsm( str_LDY + "$02", 2, false );
	      addAsm( str_LDX + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$03", 2, false );
	      addAsm( str_PLA );
	      addAsm( str_STA + "$02", 2, false );
	      addAsm( str_TYA );
		      
		      
	      break;
	    case 32:
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
	      addComment( "2023 03 21 - Multiply XA by WordIMM (5)" );
	      // save $02 and $03
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      // store the original number
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      // multiply the word by 4
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
	      addComment( "2023 03 21 - Multiply XA bye UintIMM (3)" );
	      // save $02 and $03
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );


	      // store the original number
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );

	      // multiply the word by 2
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
	      addComment( "2023 03 21 - Multiply XA by UintIMM (10)" );
	      // save $02 and $03
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );


	      // store the original number
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );

	      // multiply the word by 2
	      addAsm( str_TYA );
	     addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      // multiply the word by 2 (again)
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

	      // multiply the result by 2
	      //addAsm( str_TYA );
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
	      addComment( "XA * UintIMM" );


	      //addAsm( str_STX + "$FC", 2, false );
	      addAsm( str_STX + "_MUL16_FC", 3, false);
	      
	      //addAsm( str_STA + "$FB", 2, false );
	      addAsm( str_STA + "_MUL16_FB", 3, false);

	      addAsm( str_LDA+"#$" + toHex(tmp_v), 2, false );
	      //addAsm( str_STA + "$FD", 2, false);
	      addAsm( str_STA + "_MUL16_FD", 3, false);

	      addAsm( str_LDA + "#$00", 2, false );
	      //addAsm( str_STA + "$FE", 2, false);
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	      strcpy($$.name, "_XA" );
	      
	      //addCompilerMessage( "Math operation not implemented yet. [XA arith UintIMM]", 3 );
	    }		
	}
      else if( op == string("/" ) )
	{
	  addComment( "XA / UintIMM" );
	  addCompilerMessage( "Math operation not implemented yet. [XA arith UintIMM]", 3 );

	}
      else
	{
	  addCompilerMessage( "Math operation not implemented yet. [XA arith UintIMM]", 3 );
	}
    }
  else if( isXA($1.name) && isWordIMM($4.name) )
    {
      addComment( "XA arith WordIMM" );
      if( op == string("-") )
	{
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  //addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(get_word_L(tmp_v)), 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "#$" + toHex(get_word_H(tmp_v)), 2, false  );
	  //addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("+") )
	{
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  //cerr << tmp_v << endl;
	  //addAsm( str_CLC );
	  addAsm( str_ADC + "#$" + toHex(get_word_L(tmp_v)), 2, false  );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$" + toHex(get_word_H(tmp_v)), 2, false  );
	  //addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA");
	}
      else if( op == string("*") )
	{
	  addComment( "XA * WordIMM" );
	  int tmp_v = atoi(stripFirst($4.name).c_str());
	  switch(tmp_v)
	    {
	    case 0:
	      illegal_operations_are_needed = true;
	      addAsm( str_LDA + "#$00", 2, false );
	      addAsm( str_TAX );
	    case 1:
	      strcpy($$.name, "_XA");
	      break;
	    case 32768:
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
	    case 64:
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_STY + "$02", 2, false );
	      addAsm( str_STX + "$03", 2, false );

	      addAsm( str_LDX + "#$" + toHex(log2(tmp_v)), 2, false );

	      addComment( "top-of-loop                vv ***-**-**** vv" );
	      addAsm( str_ASL + "$02", 2, false );
	      addAsm( str_ROL + "$03", 2, false );
	      addAsm( str_DEX );	      
	      addAsm( str_BYTE + "$D0, $F9" + commentmarker + "BNE ^^ top-of-loop ^^", 2, false );

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
	      addComment( "2023 03 21 - Multiply XA by WordIMM (5)" );
	      // save $02 and $03
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      // store the original number
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      // multiply the word by 4
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
	      addComment( "2023 03 21 - Multiply XA bye WordIMM (3)" );
	      // save $02 and $03
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );
	      // store the original number
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );
	      // multiply the word by 2
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
	      addComment( "2023 03 21 - Multiply XA bye WordIMM (10)" );
	      // save $02 and $03
	      addAsm( str_TAY );
	      addAsm( str_LDA + "$02", 2, false );
	      addAsm( str_PHA );
	      addAsm( str_LDA + "$03", 2, false );
	      addAsm( str_PHA );


	      // store the original number
	      addAsm( str_STX + "$03", 2, false );
	      addAsm( str_STY + "$02", 2, false );

	      // multiply the word by 2
	      addAsm( str_TYA );
	     addAsm( str_ASL );
	      addAsm( str_TAY );
	      addAsm( str_TXA );
	      addAsm( str_ROL );
	      addAsm( str_TAX );
	      // multiply the word by 2 (again)
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

	      // multiply the result by 2
	      //addAsm( str_TYA );
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
	      addComment( "XA * WordIMM" );


	      //addAsm( str_STX + "$FC", 2, false );
	      addAsm( str_STX + "_MUL16_FC", 3, false);
	      
	      //addAsm( str_STA + "$FB", 2, false );
	      addAsm( str_STA + "_MUL16_FB", 3, false);
	      
	      addAsm( str_LDA + "#$" + toHex(get_word_L(tmp_v)), 2, false );
	      //addAsm( str_STA + "$FD", 2, false);
	      addAsm( str_STA + "_MUL16_FD", 3, false);

	      addAsm( str_LDA + "#$" + toHex(get_word_H(tmp_v)), 2, false );
	      //addAsm( str_STA + "$FE", 2, false);
	      addAsm( str_STA + "_MUL16_FE", 3, false);
	      
	      addAsm( str_JSR + "MUL16", 3, false );
	      addAsm( str_LDA + "MUL16R", 3, false );
	      addAsm( str_LDX + "MUL16R+1", 3, false );
	      strcpy($$.name, "_XA" );
	    }		
	}
			    
      else
	{
	  addCompilerMessage( "Math operation not implemented yet. [XA ? WordIMM]", 3 );
	}
	
    }
  else if( isXA($1.name) && isXA($4.name) )
    {
      if( op == string("+") )
	{
	  addComment( "XA + XA" );
	  addAsm( str_STA + "$FB", 2, false ); // the A in 
	  addAsm( str_STX + "$FC", 2, false );
	  addAsm( str_PLA ); // the X in XA
	  addAsm( str_TAX );
	  addAsm( str_PLA ); // the A in XA
	  addAsm( str_ADC + "$FB", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "$FC", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	}
      else if( op == string("-") )
	{
	  addComment( "XA - XA" );
	  addAsm( str_STA + "$FB", 2, false ); // the A in 
	  addAsm( str_STX + "$FC", 2, false );
	  addAsm( str_PLA ); // the X in XA
	  addAsm( str_TAX );
	  addAsm( str_PLA ); // the A in XA
	  addAsm( str_SBC + "$FB", 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_SBC + "$FC", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	}
      else if( op == string("*") )
	{
	  mul16_is_needed = true;
	  addComment( "XA * XA" );
	  //addAsm( str_STA + "$FD", 2, false);
	  addAsm( str_STA + "_MUL16_FD", 3, false);

	  //addAsm( str_STX + "$FE", 2, false);
	  addAsm( str_STX + "_MUL16_FE", 3, false);
	  
	  addAsm( str_PLA );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  addAsm( str_PLA );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  div16_is_needed = true;
	  addComment( "XA / XA" );
	  
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


      else
	{
	  addCompilerMessage("Math operation not implemented yet. (XA arith XA)", 0);
	}
      
    }
  else if( isA($1.name) && isUintIMM($4.name) )
    {
      int tmp_v = atoi(stripFirst( $4.name ).c_str());
      addComment( "A arith UintIMM" );
      addAsm( str_PLA );
      if( op == string( "-" ))
	{
	  //addAsm( str_SEC );
	  addAsm( str_SBC + "#$" + toHex(tmp_v), 2, false );
	  strcpy($$.name, "_A");

	}
      else if( op == string("+") )
	{
	  //addAsm( str_CLC );
	  addAsm( str_ADC + "#$" + toHex(tmp_v), 2, false );
	  strcpy($$.name, "_A");

	}
      else
	{
	  addCompilerMessage("Math operation not implemented yet. (A arith UintIMM)", 3);
	}
    }
  else if( isA($1.name) && isUintID($4.name) )
    {
      addComment( "A arithmetic UintID" );
      addAsm( str_PLA );
      int tmp_addr = getAddressOf($4.name);
      
      string tmp_name = getNameOf(tmp_addr);
      //addComment( toHex(tmp_addr) + string(": ") + tmp_name );
      // THIS IS BROKEN
      if( op == string("+"))
	{
	  //addAsm( str_CLC );
	  addAsm( str_ADC + $4.name + commentmarker +  tmp_name, 3, false );
	}
      else if( op == string("-"))
	{
	  //addAsm( str_SEC );
	  addAsm( str_SBC + $4.name  + commentmarker +  tmp_name, 3, false );
	}
      else if( op == string("*"))
	{
	  addComment( "A * UintID" );

	  umul_is_needed = true;

	  //addAsm( str_TAX );
	  // Save $02 and $03
	  //addAsm( str_LDA + "$02", 2, false );
	  //addAsm( str_PHA );
	  //addAsm( str_LDA + "$03", 2, false );
	  //addAsm( str_PHA );

	  //addAsm( str_TXA );
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + $4.name + commentmarker +  tmp_name, 3, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	  //addAsm( str_TAX );

	  // Restore $03 and $02
	  //addAsm( str_PLA );
	  //addAsm( str_STA + "$03", 2, false );
	  //addAsm( str_PLA );
	  //addAsm( str_STA + "$02", 2, false );

	  //addAsm( str_TXA );
	}
      else if( op == string("/") )
	{
	  //int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  addComment( "A / UintID" );
	  div16_is_needed = true;
	  
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "$" + toHex(addr_op2) + commentmarker +  tmp_name, 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	}

      strcpy($$.name, "_A" );
    }

  else if( isUintID($4.name) && isA($1.name) )
    {
      addComment( "UintID arithmetic A" );
      // THIS IS BROKEN
      if( op == string("+"))
	{
	  addAsm( str_CLC );
	  addAsm( str_ADC + string($4.name), 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_SEC );
	  addAsm( str_SBC + $4.name, 3, false );
	}
      else if( op == string("*"))
	{
	  addComment( "A * UintID" );

	  umul_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + string($4.name), 3, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/") )
	{
	  //int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  addComment( "A / UintID" );
	  div16_is_needed = true;
	  
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "$" + toHex(addr_op2), 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	}

      strcpy($$.name, "_A" );


    }
  else if( isA($1.name) && isA($4.name) )
    {
      // BROKEN (i think)
      addComment( "A arithmetic A" );
      //addAsm( str_PLA );
      if( op == string("+"))
	{
	  addAsm( str_STA + "$FB", 2, false ); // temporaily store OP2 in zp
	  addAsm( str_PLA ); 
 	  //addAsm( str_CLC );
	  addAsm( str_ADC + "$FB", 2, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_STA + "$FB", 2, false ); // temporaily store OP2 in zp
	  addAsm( str_PLA ); 
 	  //addAsm( str_SEC );
	  addAsm( str_SBC + "$FB", 2, false );
	}
      else if( op == string("*"))
	{
	  addComment( "A * A" );
	  umul_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_PLA );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/") )
	{
	  //int addr_op1 = hexToDecimal($1.name);
	  //int addr_op2 = hexToDecimal($4.name);

	  addComment( "A / A" );
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
	}

      strcpy($$.name, "_A" );

      
    }
  else if( isFloatID($1.name) && isFloatID( $4.name ))
    {
      addComment( "FloatID arithmetic FloatID" );

      int base_address_op1 = hexToDecimal($1.name);
      int base_address_op2 = hexToDecimal($4.name);

      // put op1 into fac
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );
      addAsm( str_JSR + "$BBA2", 3, false );
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op1)), 2, false );
      if( op == string("*"))
	{
	  addAsm( str_JSR + "$BA28" + commentmarker + "FMULT", 3, false );
	}
      else if( op == string("+"))
	{
	  addAsm( str_JSR + "$B867" + commentmarker + "FADD", 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_JSR + "$B850" + commentmarker + "FSUB", 3, false );
	}
      else if( op == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( str_JSR + "$BB0F" + commentmarker + "FDIV", 3, false );
	}
      FAC=1;
    }
  else if( isFloatID($1.name) && isFloatIMM($4.name) )
    {
      addComment( "FloatID arithmetic FloatIMM" );

      inlineFloat($4.name);
      
      int base_address_op1 = hexToDecimal($1.name);
 
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op1)), 2, false );
     
      if( op == string("*"))
	{
	  addAsm( str_JSR + "$BA28" + commentmarker + "RAM * FAC", 3, false );
	}
      else if( op == string("+"))
	{
	  addAsm( str_JSR + "$B867" + commentmarker + "RAM + FAC", 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_JSR + "$B850" + commentmarker + "RAM - FAC", 3, false );
	}
      else if( op == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  float f = atof( stripFirst($4.name).c_str() );
	  if( f == 0 ) addCompilerMessage( "error - division by 0", 3 );
	  addAsm( str_JSR + "$BB0F" + commentmarker + "RAM/FAC", 3, false );
	}
      FAC = 1;
    }
    else if( isFloatIMM($1.name) && isFloatID($4.name))
    {
      addComment( "FloatIMM arithmetic FloatID" );
      inlineFloat($1.name);

      int base_address_op1 = 105;
      int base_address_op2 = hexToDecimal($4.name);

      // put op1 into fac
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );
      addAsm( str_JSR + "$BBA2", 3, false );
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op1)), 2, false );

      // SWITCH ORDER OF OP1 and OP2 HERE
      addDebugComment( "FLOAT_IMM arithmetic FLOAT_MEM" );
           
      if( op == string("*"))
	{
	  addAsm( str_JSR + "$BA28" + commentmarker + "RAM * FAC", 3, false );
	}
      else if( op == string("+"))
	{
	  addAsm( str_JSR + "$B867" + commentmarker + "RAM + FAC", 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_JSR + "$B850" + commentmarker + "RAM - FAC", 3, false );
	}
      else if( op == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( str_JSR + "$BB0F" + commentmarker + "RAM/FAC", 3, false );
	}
      FAC = 1;
    }
  else if( isFloatIMM($1.name) && isFloatIMM($4.name) )
    {
      addComment( "FloatIMM arithmetic FloatIMM" );
      
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
      
      inlineFloat( string( "f" ) + to_string(result), 105);
      FAC = 1;
    }
  else if( isWordIMM($1.name) && isXA($4.name) )
    {
      int OP1 = atoi( stripFirst($1.name).c_str() );
      int OP1H = get_word_H( OP1 );
      int OP1L = get_word_L( OP1 );
      if( op == string("+") )
	{
	  addComment( "WordIMM + XA" );
	  addAsm( str_CLC );
	  addAsm( str_ADC + "#$" + toHex(OP1L), 2, false );
	  addAsm( str_TAY );
	  addAsm( str_TXA );
	  addAsm( str_ADC + "#$" + toHex(OP1H), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy( $$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "- * / not yet implemented for WordIMM and XA", 3 );

	}
    }
  else if( isWordID($1.name) && isWordIMM($4.name) )
    {
      int addr_op1 = getAddressOf( $1.name );
      string OP1 = getNameOf(addr_op1);
      int OP2 = atoi( stripFirst($4.name).c_str() );

      
      if( op == string("+"))
	{
	  addComment( "WordID + WordIMM -> XA" );

	  //addAsm( str_CLC );

	  addAsm( str_LDA + OP1, 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_L( OP2 )), 2, false );	  
	  addAsm( str_TAY );

	  
	  addAsm( str_LDA + OP1 + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_ADC + "#$" + toHex(get_word_H( OP2 )), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );

	  strcpy($$.name, "_XA" );

	}
      else if( op == string("-"))
	{
	  addComment( "WordID - WordIMM -> XA" );
	  //addAsm( str_SEC );
	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_SBC + "#$" + toHex(get_word_L( OP2 )), 2, false );	  
	  addAsm( str_TAY );
	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1)+"+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_SBC + "#$" + toHex(get_word_H( OP2 )), 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );
	}
      else if( op == string("/") )
	{
	  addAsm( str_SEI );
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());
	  addComment( "WordID / WordIMM --> XA" );
	  
	  div16_is_needed = true;

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1) + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
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

	  addAsm( str_LDA+"#$" + toHex(get_word_L(op2)), 2, false  );      
	  //addAsm( str_STA + "$FD", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);

	  addAsm( str_LDA+"#$" + toHex(get_word_H(op2)), 2, false  );      
	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);

	  mul16_is_needed = true;
	  //addAsm( str_STA + "$FD", 2, false);
	  //addAsm( str_STX + "$FE", 2, false);

	  
	  addAsm( str_LDA + "$" + toHex(tmp_op1+1) + commentmarker +  string($1.name), 3, false  );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  
	  addAsm( str_LDA + "$" + toHex(tmp_op1), 3, false  );
	  // addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "That specific math operation is not supported yet.", 3);
	}
    }
  else if( isWordID($1.name) && isA($4.name) )
    {
      addComment( "WordID + Accumulator" );
      
      int addr_op1 = hexToDecimal($1.name);
      //int addr_op2 = hexToDecimal($4.name);
      if( op == string("+") )
	{  
	  addComment( "WordID + A" );      
	  addAsm( str_ADC + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA+"#$00", 2, false );
	  addAsm( str_ADC + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("-") )
	{  
	  addComment( "WordID - A" );      
	  addAsm( str_SBC + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA+"#$00", 2, false );
	  addAsm( str_SBC + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("*") )
	{
	  int tmp_op1 = getAddressOf( $1.name );
	  addComment( "WordID * A --> XA" );

	  //addAsm( str_STA + "$FD", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);

	  addAsm( str_LDA + "#$00", 2, false  );      
	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);

	  mul16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(tmp_op1+1) + commentmarker +  string($1.name), 3, false  );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  
	  addAsm( str_LDA + "$" + toHex(tmp_op1), 3, false  );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("/") )
	{
	  addCompilerMessage( "That specific math operation is not supported yet.", 3);
	  // TODO: implement division here!  4/22/23
	}
      else
	{
	  addCompilerMessage( "That specific math operation is not supported yet.", 3);
	}

    }
  else if( isWordID($1.name) && (isIntID($4.name) || isUintID($4.name)) )
    {

      if( op == string("*") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  
	  addComment( "WordID * IntID|UintID --> XA" );
	  mul16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  
	  addAsm( str_LDA + "$" + toHex(addr_op2), 3, false );
	  //addAsm( str_STA + "$FD", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);

	  addAsm( str_LDA + "#$00", 2, false );
	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);

	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  
      strcpy($$.name, "_XA" );

	}
      else if( op == string("/") )
	{
	  addComment( "WordID / IntID|UintID --> XA" );
	  addAsm( str_SEI );
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  div16_is_needed = true;

	  addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($1.name).c_str())), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($1.name).c_str())) + "+1", 3, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA+"#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );
	  
	  addAsm( str_LDA +  getNameOf(hexToDecimal(stripFirst($4.name).c_str())), 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_CLI );
	  
      strcpy($$.name, "_XA" );

	}
      else if( op == string("+") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  addComment( "WordID + IntID|UintID --> XA" );

	  addAsm( str_LDA +  getNameOf(hexToDecimal(stripFirst($4.name).c_str())), 3, false );
	  // FLA
	  addComment( "FLA" );
	  //addAsm( str_ADC+"$"+ toHex(addr_op1), 3, false );
	  addAsm( str_ADC +  getNameOf(hexToDecimal(stripFirst($1.name).c_str())), 3, false );
	  //  atoi(stripFirst($4.name).c_str());
	  addAsm( str_TAY );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_ADC + getNameOf(hexToDecimal(stripFirst($1.name).c_str())) + "+1", 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	  
      strcpy($$.name, "_XA" );

	}
      else if( op == string("-") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  addComment( "WordID - IntID|UintID --> XA" );

	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_SBC + "$" + toHex(addr_op2), 3, false );
	  addAsm( str_TAY );
	  addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );

	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage(string( "`") + op + string("' is not yet implemented for these types."), 3 );
	}


    }
  else if( isWordID($1.name) && (isIntIMM($4.name)||isUintIMM($4.name)) )
    {
      // it would be possible to add some specific optimizations here.
      // if the IMM is a power of 2 then just add lsr's until it's divided out
      int a = getAddressOf($1.name);
      int IMMvalue = atoi(stripFirst($4.name).c_str());
      if( op == string( "+" ) )
	{
	  addComment( "WordID + (IntIMM || UintIMM)" );      
	  int size_of_instruction = 3;
	  if( a < 256 ) size_of_instruction = 2;
	  //addAsm( str_CLC );
	  addAsm( str_LDA + "#$" + toHex(IMMvalue), 2, false );

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_ADC + getNameOf(a), size_of_instruction, false );
	  //addAsm( str_ADC + "$" + toHex(a), size_of_instruction, false );

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
	  addAsm( str_LDA + "#$00", 2, false );

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_ADC + getNameOf(a-1) + "+1", size_of_instruction, false );
	  //addAsm( str_ADC + "$" + toHex(a), size_of_instruction, false );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordID - (IntIMM || UintIMM)" );      
	  int size_of_instruction = 3;
	  if( a < 256 ) size_of_instruction = 2;
	  // addAsm( str_SEC );
	  addAsm( str_LDA + "$" + toHex(a), size_of_instruction, false );
	  addAsm( str_SBC + "#$" + toHex(IMMvalue), 2, false );
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
	  addAsm( str_LDA + "$" + toHex(a), size_of_instruction, false );
	  addAsm( str_SBC + "#$00", 2, false );
	  addAsm( str_TAX );
	  addAsm( str_PLA );
	}
      else if( op == string("*") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  
	  addComment( "WordID * (IntIMM || UintIMM)" );
	  mul16_is_needed = true;
	  addAsm( str_SEI );

	  // 2024 04 14 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  // addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  addAsm( str_LDA + getNameOf(addr_op1)+"+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);

	  addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	  //addAsm( str_STA + "$FD", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);

	  addAsm( str_LDA + "#$00", 2, false );
	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  addAsm( str_CLI );
	}
      else if( op == string("/") )
	{
	  addComment( "WordID / (IntIMM || UintIMM)" );
	  int addr_op1 = getAddressOf($1.name);
		 
	  div16_is_needed = true;
	  addAsm( str_SEI );

	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + getNameOf(addr_op1) + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );

	  addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_CLI );
	  //
	}
      else 
	{
	  addCompilerMessage( "That specific math operation is not supported yet.", 3);
	}
      strcpy($$.name, "_XA" );
    }
  else if( isWordID($1.name) && isWordID($4.name) )
    {
      addComment( "WordID arith WordID" );

      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($4.name);

      string OP1 = getNameOf(addr1);
      string OP2 = getNameOf(addr2);

      if( op == string( "+" ) )
	{
	  addComment( "WordID + WordID" );

	  addAsm( str_LDA + OP1, 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr1), 3, false );

	  addAsm( str_ADC + OP2, 3, false );
	  //addAsm( str_ADC + "$" + toHex(addr2), 3, false );
	  
	  addAsm( str_TAY );

	  addAsm( str_LDA + OP1 + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr1 + 1), 3, false );
	  
	  addAsm( str_ADC + OP2 + "+1", 3, false );
	  //addAsm( str_ADC + "$" + toHex(addr2 + 1), 3, false );
	  
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	}
      else if( op == string( "-" ) )
	{
	  addComment( "WordID - WordID" );

	  addAsm( str_LDA + OP1, 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr1), 3, false );

	  addAsm( str_SBC + OP2, 3, false );
	  //addAsm( str_SBC + "$" + toHex(addr2), 3, false );
	  addAsm( str_TAY );

	  addAsm( str_LDA + OP1 + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr1 + 1), 3, false );

	  addAsm( str_SBC + OP2 + "+1", 3, false );
	  //addAsm( str_SBC + "$" + toHex(addr2 + 1), 3, false );
	  addAsm( str_TAX );
	  addAsm( str_TYA );
	}
      else if( op == string("*") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);
	  
	  addComment( "WordID * WordID" );
	  mul16_is_needed = true;
	  
	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );


	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op1) + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );

	  
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);


	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op2), 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op2), 3, false );


	  //addAsm( str_STA + "$FD", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false);

	  // 2024 04 15 - mkpellegrino
	  addAsm( str_LDA + getNameOf(addr_op2) + "+1", 3, false );
	  //addAsm( str_LDA + "$" + toHex(addr_op2+1), 3, false );


	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
 
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  
	}
      else if( op == string("/") )
	{
	  addAsm( str_SEI );
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  addComment( "WordID / WordID" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "$" + toHex(addr_op1+1), 3, false );
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "$" + toHex(addr_op2), 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "$" + toHex(addr_op2+1), 3, false );
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  addAsm( str_CLI );

	}
      strcpy($$.name, "_XA" );
    }
  else if( isUintID( $1.name ) && isUintID( $4.name ) )
    {
      if( !previousAsm( str_STA + $1.name) )
	{
	  addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))), 3, false); // 
	}
      else
	{
	  addAsm( commentmarker + string( "commented out by optimizer"), 0, false); // 
	  addAsm( commentmarker + str_LDA + getNameOf(hexToDecimal(stripFirst($1.name))), 0, false); // 
	}

      
      if( op == string("+"))
	{
	  // addAsm( str_CLC );
	  addComment( "UintID + UintID --> A" );

	  addAsm( str_ADC + $4.name, 3, false );
	}
      else if( op == string("-"))
	{
	  //addAsm( str_SEC );
	  addComment( "UintID - UintID --> A" );

	  addAsm( str_SBC + $4.name, 3, false );
	}
      else if( op == string("*"))
	{
	  addComment( "UintID * UintID --> A" );
	  umul_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA +  getNameOf(hexToDecimal(stripFirst($4.name))), 3, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  addComment( "UintID / UintID --> A" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "$" + toHex(addr_op2), 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	}
      else
	{
	  addCompilerMessage( "Unknown Math Operation: UintID ? UintID --> A", 3 );
	}
      
      strcpy($$.name, "_A" );
    }
  else if( isUintID($1.name) && isA($4.name) )
    {
      addComment( "isUintID($1.name) && isA($4.name)" );
      int addr_op1 = getAddressOf( $1.name );

      if( op == string("+"))
	{
	  addComment( "UintID + A --> A" );
	  addAsm( str_CLC );
	  addAsm( str_ADC + getNameOf(addr_op1), 3, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("-"))
	{
	  addComment( "UintID - A --> A" );
	  addAsm( str_SEC );
	  addAsm( str_SBC + getNameOf(addr_op1), 3, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == string("*"))
	{
	  // 2023 06 19
	  addComment( "UintID * A --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_STA + "_MUL16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false );

	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_LDA + getNameOf(addr_op1), 3, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );
	  
	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addCompilerMessage( "Unknown Math Operation: UintID ? A --> A", 3 );
	}
    }
  else if( isUintID($1.name) && isIntIMM($4.name) )
    {
      addComment( "UintID arith IntIMM --> A (type mismatch)" );
      
      addAsm( str_LDA +  string($1.name), 3, false); // 
      if( op == string("+"))
	{
	  //addAsm( str_CLC );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	}
      else if( op == string("-"))
       	{
	  //addAsm( str_SEC );

	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	}
      else if( op == string("*"))
	{
	  addCompilerMessage( "UINT * INT may produce unexpected result", 0 );
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA+ "#$" + toHex( tmp_int ) , 2, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());

	  addComment( "UintID / IntIMM" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );

	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	}

      strcpy($$.name, "_A" );
    }
  else if( isIntID( $1.name ) && isIntID( $4.name ) )
    {
      addComment( "IntID arith IntID" );
      addAsm( str_LDA + $1.name, 3, false); // 
      if( op == string("+"))
	{
	  // addAsm( str_CLC );
	  addAsm( str_ADC + $4.name, 3, false );
	}
      else if( op == string("-"))
	{
	  //addAsm( str_SEC );
	  addAsm( str_SBC + $4.name, 3, false );
	}
      else if( op == string("*"))
	{
	  umul_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + $4.name, 3, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else
	{
	  
	  addCompilerMessage( "Unknown math operation for IntID ? IntID", 3 );
	}
      strcpy($$.name, "_A" );
    }
  else if( isUintIMM($1.name) && isIntID($4.name) )
    {
      addComment( "UntIMM arith IntID (type mismatch)" );
      addAsm( str_LDA +  string($4.name), 3, false); //
      
      if( op == string("+"))
	{
	  //addAsm( str_CLC );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	}
      else if( op == string("-"))
	{
	  //addAsm( str_SEC );

	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_SBC + "#$" +  toHex(tmp_int), 2, false );
	}
      else if( op == string("*"))
	{
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  umul_is_needed = true;
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA + "#$" + toHex( tmp_int ), 2, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/"))
	{
	  addComment("SIGNED integer division (UintIMM / IntID) not yet implemented");
	}
      else
	{
	  addCompilerMessage( "Unknown math operation for UintIMM ? IntID", 3 );

	}
      strcpy($$.name, "_A" );
    }
  else if( isIntID($1.name) && isIntIMM($4.name) )     // MEM vs. IMM
    {
      addComment( "IntID arith IntIMM" );
      addAsm( str_LDA +  string($1.name), 3, false); // 
      if( op == string("+"))
	{
	  //addAsm( str_CLC );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_ADC + "#$" + toHex(tmp_int), 2, false );
	}
      else if( op == string("-"))
	{
	  //addAsm( str_SEC );

	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_SBC + "#$" +  toHex(tmp_int), 2, false );
	}
      else if( op == string("*"))
	{
	  addCompilerMessage( "SIGNED integer multiplication (IntID * IntIMM) not yet implemented (try re-ordering)", 3 );
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA+"#$" + toHex( tmp_int ) , 2, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());

	  addComment( "UintID / IntIMM" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	}
      else
	{
	  addCompilerMessage( "math operation not yet implemented for UintID ? IntIMM", 3 );
	}
      strcpy($$.name, "_A" );
    }
  else if( isIntID($1.name) && isUintIMM($4.name) )     // MEM vs. IMM
    {
      addComment( "IntID arith IntIMM" );
      addAsm( str_LDA +  string($1.name), 3, false); // 
      if( op == string("+"))
	{
	  //addAsm( str_CLC );
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	}
      else if( op == string("-"))
	{
	  //addAsm( str_SEC );

	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	}
      else if( op == string("*"))
	{
	  addCompilerMessage( "SIGNED integer multiplication (IntID * UintIMM) not yet implemented (try re-ordering)", 3 );
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA+"#$" + toHex( tmp_int ) , 2, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());

	  addComment( "IntID / UintIMM" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	}
      else
	{
	  addCompilerMessage( "math operation not yet implemented for IntID ? UintIMM", 3 );
	}

      strcpy($$.name, "_A" );
    }

  else if( isUintID($1.name) && isUintIMM($4.name) )     // UintID vs. UintIMM
    {
      addComment( "UintID arith UintIMM" );
      int addr = getAddressOf($1.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;

      string n = getNameOf(addr);
      /// 2024 04 14 - mkpellegrino
      
      //addAsm( str_LDA +  string($1.name), instr_size, false); //
      addAsm( str_LDA +  n, instr_size, false); //
      
      if( op == string("+"))
	{
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_ADC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );

	}
      else if( op == string("-"))
	{
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	  strcpy($$.name, "_A" );

	}
      else if( op == string("*"))
	{
	  addComment( "UintID * UintIMM (Using 16 bit operation)" );
	  //addAsm( str_SEI );
	  

	  int addr_op1 = getAddressOf( $1.name );
	  mul16_is_needed = true;

	  //addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false );

	  addAsm( str_LDA + "#$00", 2, false );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false );

	  addAsm( str_LDA + "#$" + toHex(atoi(stripFirst($4.name).c_str())), 2, false );
	  //addAsm( str_STA + "$FD", 2, false );
	  addAsm( str_STA + "_MUL16_FD", 3, false );

	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );

	  
	  //addAsm( str_CLI );
	  strcpy($$.name, "_XA" );

	}
      else if( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int op2 = atoi(stripFirst($4.name).c_str());

	  addComment( "UintID / UintIMM" );
	  div16_is_needed = true;

	  //if( addr_op1 < 256 ) instr_size = 2;
	  addAsm( str_LDA + "$" + toHex(addr_op1), instr_size, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "#$" + toHex(op2), 2, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  strcpy($$.name, "_A" );
	}
      else
	{

	  addCompilerMessage( "math operation not yet implemented for UintID ? UintIMM", 3 );
	}

    }
  else if( isUintIMM($1.name) && isUintID($4.name) )     // MEM vs. IMM
    {
      addComment( "UintIMM arith UintID" );
      addAsm( str_LDA +  $4.name, 3, false); // 
      if( op == string("+"))
	{
	  //20230402 addAsm( str_CLC );
	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_ADC + "#$"  + toHex(tmp_int), 2, false );
	}
      else if( op == string("-"))
	{
	  //20230402 addAsm( str_SEC );

	  int tmp_int = atoi(stripFirst($1.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_SBC + "#$" + toHex(tmp_int), 2, false );
	}
      else if( op == string("*"))
	{
	  addCompilerMessage( "SIGNED integer multiplication (UintIMM * UintID) not yet implemented (try re-ordering)", 3 );
	  umul_is_needed = true;
	  int tmp_int = atoi(stripFirst($4.name).c_str());
	  if( tmp_int < 0 )
	    {
	      tmp_int = twos_complement( tmp_int );
	    }
	  addAsm( str_STA + "$02", 2, false );
	  addAsm( str_LDA+"#$" + toHex( tmp_int ) , 2, false );
	  addAsm( str_STA + "$03", 2, false );
	  addAsm( str_JSR + "UMUL", 3, false );
	  addAsm( str_LDA + "$03", 2, false );
	}
      else if( op == string("/"))
	{
	  addAsm( commentmarker + "SIGNED integer division (UintIMM / UintID) not yet implemented", 3, false );
	}
      else
	{

	  addCompilerMessage( "math operation not yet implemented for UintIMM ? UintID", 3 );

	}

      strcpy($$.name, "_A" );
    }
  else if( isWordID( $1.name ) && isFloatID( $4.name ) )
    {
      addComment( "WordID arith FloatID" );
      int base_address_op1 = hexToDecimal($1.name);      
      int base_address_op2 = hexToDecimal($4.name);
      
      if( op == string("*"))
	{
	  int inst_size = 3;
	  if( base_address_op1 < 255 ) inst_size--;
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), inst_size, false );
	  if( base_address_op2 >= 255 ) inst_size++;
	  addAsm( str_LDA + "$" + toHex( ( base_address_op1+1 )), inst_size, false );
	  addAsm( str_JSR + "$B391; INT16 -> FAC", 3, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );

	  addCompilerMessage( "This can be optimized by putting the WORD after the FLOAT", 1);
	  addAsm( str_JSR + "$BA28; FMULT RAM * FAC", 3, false );
	}
      else if( op == string("+"))
	{
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), 3, false );
	  addAsm( str_LDA + "$" + toHex( ( base_address_op1+1 )), 3, false );
	  addAsm( str_JSR + "$B391; INT16 -> FAC", 3, false );
	  addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );
	  addCompilerMessage( "This can be optimized by putting the WORD after the FLOAT", 1);
	  addAsm( str_JSR + "$B867; FADD RAM + FAC", 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), 3, false );
	  addAsm( str_LDA + "$" + toHex( ( base_address_op1+1 )), 3, false );
	  addAsm( str_JSR + "$B391; INT16 -> FAC", 3, false );

	  addAsm( str_LDX + "#$69", 2, false );
	  addAsm( str_LDY + "#$00", 2, false );
	  addAsm( str_JSR + "$BBD4" + commentmarker + "FAC -> MEM", 3, false );

	  addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );
	  addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false );

	  addAsm( str_LDA + "#$69", 2, false );
	  addAsm( str_LDY + "#$00", 2, false );

	  addAsm( string("JSR $B850") + commentmarker + string(" FSUB RAM - FAC"), 3, false );
	}
      else if( op == string("/"))
	{
	  addAsm( string("LDY $") + toHex( ( base_address_op1 )), 3, false );
	  addAsm( str_LDA + "$" + toHex( ( base_address_op1+1 )), 3, false );
	  addAsm( string("JSR $B391") + commentmarker + "INT16 -> FAC", 3, false );

	  addAsm( str_LDX + "#$69", 2, false );
	  addAsm( str_LDY + "#$00", 2, false );
	  addAsm( string("JSR $BBD4") + commentmarker + string("FAC -> MEM"), 3, false );

	  addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
	  addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );
	  addAsm( string("JSR $BBA2") + commentmarker + "MEM -> FAC", 3, false );

	  addAsm( str_LDA + "#$69", 2, false );
	  addAsm( str_LDY + "#$00", 2, false );

	  addAsm( string("JSR $BB0F") + commentmarker + "FDIV RAM/FAC", 3, false );
	}
      else
	{
	  addCompilerMessage( "math operation not yet implemented for WordID ? FloatID", 3 );
	}
      FAC=1;      
    }
  else if( isFloatID( $1.name ) && isWordID( $4.name ) )
    {
      addComment( "FloatID arith WordID" );
      int base_address_op1 = hexToDecimal($1.name);      
      int base_address_op2 = hexToDecimal($4.name);

      addAsm( string("LDY $") + toHex( ( base_address_op2 )), 3, false );
      addAsm( str_LDA + "$" + toHex( ( base_address_op2+1 )), 3, false );
      addAsm( str_JSR + "$B391" + commentmarker + "INT16 -> FAC", 3, false );

      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op1)), 2, false );
      
      if( op == string("*"))
	{
	  addAsm( str_JSR + "$BA28" + commentmarker + "FMULT RAM * FAC", 3, false );
	}
      else if( op == string("+"))
	{
	  addAsm( str_JSR + "$B867" + commentmarker + "FADD RAM + FAC", 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_JSR + "$B850" + commentmarker + "FSUB RAM - FAC", 3, false );
	}
      else if( op == string("/"))
	{
	  addAsm( str_JSR + "$BB0F" + commentmarker + "FDIV RAM/FAC", 3, false );
	}
      else
	{
	  addCompilerMessage( "math operation not yet implemented for FloatID ? WordID", 3 );
	}

      FAC=1;      
      
    }
  else if( isFloatID($1.name) && isFloatID($4.name ) )
    {
      addComment( "FloatID arithmetic FloatID" );

      int base_address_op1 = hexToDecimal($1.name);
      int base_address_op2 = hexToDecimal($4.name);

      // put op1 into fac
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op2)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op2)), 2, false );
      addAsm( str_JSR + "$BBA2", 3, false );
      addAsm( str_LDA + "#$" + toHex(get_word_L(base_address_op1)), 2, false );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address_op1)), 2, false );
      if( op == string("*"))
	{
	  addAsm( str_JSR + "$BA28" + commentmarker + "FMULT", 3, false );
	}
      else if( op == string("+"))
	{
	  addAsm( str_JSR + "$B867" + commentmarker + "FADD", 3, false );
	}
      else if( op == string("-"))
	{
	  addAsm( str_JSR + "$B850" + commentmarker + "FSUB", 3, false );
	}
      else if( op == string("/"))
	{
	  addComment( "If Y is ZERO at this point, we'll be dividing by 0 (or at least attempting to)" );
	  addAsm( str_JSR + "$BB0F" + commentmarker + "FDIV", 3, false );
	}
      else
	{
	  addCompilerMessage( "math operation not yet implemented for FloatID ? FloatID", 3 );
	}

      FAC=1;
    }
  /* if they're BOTH Int or Uint IMM's */
  else if( (isIntIMM($1.name) && isIntIMM($4.name)) ||
	   (isUintIMM($1.name) && isUintIMM($4.name)) )
    {
      addComment( string( "(U)IntIMM" ) + op + string( "(U)IntIMM") );
      
      int tmp_int1 = atoi( stripFirst($1.name).c_str() );
      int tmp_int2 = atoi( stripFirst($4.name).c_str() );
      int tmp_int3;
     
      /* then this is a compile-time arithetic operation */
      if( op == "+"  )
        {
	  //addAsm( str_CLC );
	  tmp_int3 = tmp_int1 + tmp_int2;
	  if( tmp_int3 < 0 || tmp_int3 > 127)
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }
	  addAsm( str_LDA+"#$" + toHex ( tmp_int3  ), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == "-" )
	{
	  //addAsm( str_SEC );
	  tmp_int3 = tmp_int1 - tmp_int2;
	  if( tmp_int3 < 0 || tmp_int3 > 127)
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }
	  addAsm( str_LDA+"#$" + toHex ( tmp_int3  ), 2, false );
	  strcpy($$.name, "_A" );
	}
      else if( op == "*" )
	{
	  tmp_int3 = tmp_int1 * tmp_int2;

	  // mkpellegrino 2023 03 23 
	  //if( tmp_int3 < 0 || tmp_int3 > 127 )
	  //  {
	  //    tmp_int3 = twos_complement( tmp_int3);
	  //  }
	  // if the result is > 255, return an XA
	  if( tmp_int3 > 255 )
	    {
	      addAsm( str_LDA+"#$" + toHex(get_word_L(tmp_int3)) + commentmarker , 2, false );
	      addAsm( str_LDX + "#$" + toHex(get_word_H(tmp_int3)) + commentmarker , 2, false );
	      strcpy($$.name, "_XA" );
	    }
	  else
	    {
	      addAsm( str_LDA+"#$" + toHex ( tmp_int3  ), 2, false );
	      strcpy($$.name, "_A" );
	    }
	}
      else if( op == "/" )
	{
	  //addAsm( str_LDA + "#$" + toHex( tmp_int1 / tmp_int2 ), 2, false );
	  tmp_int3 = tmp_int1 / tmp_int2;
	  if( tmp_int3 < 0 )
	    {
	      tmp_int3 = twos_complement( tmp_int3);
	    }

	  addAsm( str_LDA+"#$" + toHex ( tmp_int3  ), 2, false );
	  //strcpy($$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	  strcpy($$.name, "_A" );

	  //strcpy($$.name, toString( tmp_int1 / tmp_int2 ).c_str() );
	}
      else
	{
	  addParserComment( string( "I am unable to recognize [") + op + string("]" ));
	  strcpy($$.name, "unknown" );
	}
    }
  else if( isIntIMM($1.name) && isUintIMM($4.name) )
    {
      addComment( "IntIMM arith UintIMM" );
      int OP1 = atoi( stripFirst($1.name).c_str() );
      int OP2 = atoi( stripFirst($4.name).c_str() );
      int result;
      if( op == string("+") )
	{
	  result = OP1 + OP2;
	}
      else if( op == string("-") )
	{
	  result = OP1 - OP2;
	}
      else if( op == string("*") )
	{
	  result = OP1 * OP2;
	}
      else if( op == string("/") )
	{
	  result = OP1 / OP2;
	}
      else
	{
	  addCompilerMessage( "IntIMM ?? UintIMM", 0 );
	  addCompilerMessage( "Math operation not implemented yet.", 3 );
	}
      if( result < 0 )
	{
	  result = twos_complement( result );
	}

      if( result > 255 )
	{
	  addAsm( str_LDA+"#$" + toHex(get_word_L(result)) + commentmarker , 2, false );
	  addAsm( str_LDX + "#$" + toHex(get_word_H(result)) + commentmarker , 2, false );
	  strcpy($$.name, "_XA" );
	}
      else
	{
	  addAsm( str_LDA+"#$" + toHex (result ) + commentmarker, 2, false );
	  strcpy($$.name, "_A" );
	}
      
    }
  else if( isByte($1.name) && isByte($4.name) )
    {
      addComment( "ByteIMM arith ByteIMM" );
      int tmp_int1;
      int tmp_int2;

      std::stringstream ss;
      ss << std::hex <<  string($1.name).substr( 2, 2 );
      ss >> tmp_int1;
      ss << std::hex <<  string($4.name).substr( 2, 2 );
      ss >> tmp_int2;
      
      /* then this is a compile-time arithetic operation */
      if( op == "+"  )
        {
	  addAsm( str_LDA + "#$" + toHex( tmp_int1 + tmp_int2 ), 2, false ); 
	  strcpy($$.name, toString( tmp_int1 + tmp_int2 ).c_str() );
	}
      else if( op == "-" )
	{
	  addAsm( str_LDA + "#$" + toHex( tmp_int1 - tmp_int2 ), 2, false ); 
	  strcpy($$.name, toString( tmp_int1 - tmp_int2 ).c_str() );
	}
      else if( op == "*" )
	{
	  addAsm( str_LDA + "#$" + toHex( tmp_int1 * tmp_int2 ), 2, false ); 
	  strcpy($$.name, toString( tmp_int1 * tmp_int2 ).c_str() );
	}
      else if( op == "/" )
	{
	  addAsm( str_LDA + "#$" + toHex( tmp_int1 / tmp_int2 ), 2, false ); 
	  strcpy($$.name, toString( tmp_int1 / tmp_int2 ).c_str() );
	}
      else
	{
	  addParserComment( string( "I am unable to recognize [") + op + string("]" ));
	  strcpy($$.name, string("unknown").c_str() );
	}
    }
  else if( isByte($1.name) && isUintID($4.name))
    {
      addComment( "ByteIMM arith UintID (Byte" );
     
      int tmp_int1;
      
      std::stringstream ss;
      ss << std::hex <<  string($1.name).substr( 2, 2 );
      ss >> tmp_int1;

      int tmp_size = 2;
      tmp_size = 3;
      addAsm( str_LDA + string($4.name), tmp_size, false);
      
      if( op == "+" )
	{
	  //addAsm( str_CLC );
	  addAsm( str_ADC + $1.name,2, false);
	}
      else if ( op == "-" )
	{
	  //addAsm( str_SEC );
	  addAsm( str_SBC + string($1.name),2, false);
	}
      else
	{
	  addCompilerMessage( "Byte ?? Uint", 0 );
	  addCompilerMessage( "Math operation not implemented yet.", 3 );

	}
      addAsm( string("STA ") + string($4.name), 3, false );
      strcpy($$.name, "_A" );
    }
  else if( isUintID($1.name) && isIntID($4.name) )
    {
      addCompilerMessage( "UINTID arith INTID NOT FULLY IMPLEMENTED!!!", 0 );
      addComment( "UintID arith IntID NOT FULLY IMPLEMENTED" );
      int instr_size1;
      int instr_size2;

      if( getAddressOf( $1.name ) > 255 )
	{
	  instr_size1 = 3;
	}
      else
	{
	  instr_size1 = 2;
	}

      if( getAddressOf( $4.name ) > 255 )
	{
	  instr_size2 = 3;
	}
      else
	{
	  instr_size2 = 2;
	}
      
      addAsm( str_LDA + string($1.name), instr_size1, false );
      if( op == string("+") )
	{
	  //addAsm( str_CLC );
	  addAsm( str_ADC + $4.name, instr_size2, false);
	  strcpy($$.name, "_A" );

	}
      else if ( op == string("-") )
	{
	  //addAsm( str_SEC );
	  addAsm( str_SBC + string($4.name), instr_size2, false);
	  strcpy($$.name, "_A" );

	}
      else if ( op == string("/") )
	{
	  int addr_op1 = hexToDecimal($1.name);
	  int addr_op2 = hexToDecimal($4.name);

	  addComment( "UintID / IntID --> XA" );
	  div16_is_needed = true;
	  
	  addAsm( str_LDA + "$" + toHex(addr_op1), 3, false );
	  addAsm( str_STA + "_DIV16_FB", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FC", 3, false );
	  
	  addAsm( str_LDA + "$" + toHex(addr_op2), 3, false );
	  addAsm( str_STA + "_DIV16_FD", 3, false );
	  addAsm( str_LDA + "#$00", 2, false ); 
	  addAsm( str_STA + "_DIV16_FE", 3, false );

	  addAsm( str_JSR + "DIV16", 3, false );
	  addAsm( str_LDA + "_DIV16_FB", 3, false );
	  addAsm( str_LDX + "_DIV16_FC", 3, false );
	  strcpy($$.name, "_XA" );
      
	}
      else if ( op == string("*") )
	{
	  int addr_op1 = getAddressOf( $1.name );
	  int addr_op2 = getAddressOf( $4.name );

	  // TODO: Fix This or Take out the UintID * IntID functionality.
	  // it's not clear what the result should be.  XA or just A
	  addComment( "THIS ISN'T WORKING CORRECTLY!" );
	  addComment( "UintID * IntID --> XA" );
	  mul16_is_needed = true;
	  addAsm( str_LDA + "$" + toHex( addr_op1 ), 3, false );
	  //addAsm( str_STA + "$FB", 2, false );
	  addAsm( str_STA + "_MUL16_FB", 3, false);
	  
	  //addAsm( str_LDA + "$" + toHex( addr_op1+1 ), 3, false );
	  addAsm( str_LDA + "#$00", 2, false );
	  //addAsm( str_STA + "$FC", 2, false );
	  addAsm( str_STA + "_MUL16_FC", 3, false);
	  
	  //addAsm( str_STA + "$FE", 2, false );
	  addAsm( str_STA + "_MUL16_FE", 3, false);
	  
	  addAsm( str_LDA + "$" + toHex( addr_op2 ), 3, false );

	  // TODO: FIX THIS!  Make it so that if the resulting number is
	  // negative, then make the result negative
	  // make it positive
	  addAsm( str_AND + "#$7F", 2, false );

	  addAsm( str_STA + "_MUL16_FD", 3, false);
	  //addAsm( str_STA + "$FD", 2, false );

	  //addAsm( str_LDA + "$" + toHex( addr_op2+1 ), 3, false );
	  //addAsm( str_STA + "$FE", 2, false );

	  addAsm( str_JSR + "MUL16", 3, false );
	  addAsm( str_LDA + "MUL16R", 3, false );
	  addAsm( str_LDX + "MUL16R+1", 3, false );
	  strcpy($$.name, "_XA" );

	  
	  /* addComment( "UintID * IntID --> A" ); */
	  /* umul_is_needed = true; */
	  /* addAsm( str_STA + "$02", 2, false ); */
	  /* addAsm( str_LDA + string($4.name), 3, false ); */
	  /* addAsm( str_STA + "$03", 2, false ); */
	  /* addAsm( str_JSR + "UMUL", 3, false ); */
	  /* addAsm( str_LDA + "$03", 2, false ); */
	  /* strcpy($$.name, "_A" ); */
	}
      
      else
	{
	  addCompilerMessage( string("UintID") + op +  string("IntID"), 0 );
	  addCompilerMessage( "Math operation not implemented yet.", 3 );
	}
    }
  else
    {
      string tmpstr = string( $1.name ) + string( $3.name ) + string( $4.name );
      addCompilerMessage( tmpstr, 0 );
      addCompilerMessage( "Unknown Math Operation (for the indicated types)", 3 );
      addComment( "?   arith   ? : 7505" );
      if( getTypeOf($1.name) == 8 && getTypeOf($4.name) == 8 )
	{
	  addComment( "both Identifiers point to floats" );
	}
      else if( op == "+" )
	{
	  // 2023 08 08 - TODO: Remove this because I haveno Idea what I was trying to do here.
	  if( isByte($1.name) && isAddress($4.name))
	    {
	      addAsm( str_LDA + $4.name, 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + $1.name ,2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($4.name), 3, false );
		}

	      strcpy($$.name, string(string("_A") + string($4.name)).c_str() );
	    }
	  else if( isIntID($1.name) && isIntID($4.name) )
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      addAsm( str_ADC + $4.name , 3, false );
	      strcpy($$.name, "_A" );
	    }
	  else if( isUintID($1.name) && isIntID($4.name) )
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      addAsm( str_ADC + $4.name, 3, false );
	      strcpy($$.name, "_A" );
	    }
	  else if( isIntID($1.name) && isUintID($4.name) )
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      addAsm( str_ADC + $4.name, 3, false );
	      strcpy($$.name, "_A" );
	    }
	  else if( isUintIMM($1.name) && isUintID($4.name) )
	    {
	      int OP1 = atoi( stripFirst($1.name).c_str() );
	      addAsm( str_LDA + "#$" + toHex(OP1), 2, false );
	      addAsm( str_ADC + $4.name, 3, false );
	      strcpy($$.name, "_A" );
	    }
	  else if( isUintIMM($1.name) && isIntID($4.name) )
	    {
	      int OP1 = atoi( stripFirst($1.name).c_str() );
	      addAsm( str_LDA + "#$" + toHex(OP1), 2, false );
	      addAsm( str_ADC + $4.name, 3, false );
	      strcpy($$.name, "_A" );
	    }
	  else if( isIntIMM($1.name) && isIntIMM($4.name) )
	    {
	      int OP1 = atoi( stripFirst($1.name).c_str() );
	      int OP2 = atoi( stripFirst($4.name).c_str() );
	      int result = OP1 + OP2;
	      if( (result>127) || (result<-127) )
		{
		  addCompilerMessage("type overflow: int must be between -127 and 127", 2 );
		}
	      if( result<0 )
		{
		  result = twos_complement(result);
		}
	      
	      addAsm( str_LDA + "#$" + toHex(result) );
	      strcpy($$.name, "_A" );
	    }
	  else if( isUintIMM($1.name) && isUintIMM($4.name) )
	    {
	      int OP1 = atoi( stripFirst($1.name).c_str() );
	      int OP2 = atoi( stripFirst($4.name).c_str() );
	      int result = OP1 + OP2;
	      if( result>255 || result<0)
		{
		  addCompilerMessage("type overflow: uint must be between 0 and 255", 2 );
		}
	      addAsm( str_LDA + "#$" + toHex(result), 2, false);
	      strcpy($$.name, "_A" );
	    }
	  else if( isUintIMM($1.name) && isIntIMM($4.name) )
	    {
	      int OP1 = atoi( stripFirst($1.name).c_str() );
	      int OP2 = atoi( stripFirst($4.name).c_str() );
	      int result = OP1 + OP2;
	      
	      if( result < 0 ) result=twos_complement(result);
	      
	      addAsm( str_LDA + "#$" + toHex(result) );
	      strcpy($$.name, "_A" );
	    }
	  else if( isIntIMM($1.name) && isAddress($4.name))
	    {
	      addAsm( str_LDA + string($4.name), 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + "#$" + toHex(atoi($1.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($4.name), 3, false );
		}
	      // 2023 08 08 - TODO: Remove this because I haveno Idea what I was trying to do here.
	      strcpy($$.name, string(string("A") + string($4.name)).c_str() );
	    }
	  else if(  isAddress($1.name) && isByte($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + $4.name ,2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($1.name), 3, false );
		}
	      
	      strcpy($$.name, "_A" );
	    }
	  else if(isAddress($1.name) && isIntIMM($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + "#$" + toHex(atoi($4.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($1.name), 3, false );
		}

	      strcpy($$.name, "_A" );
	    }
	  else if(isIntID($1.name) && isIntIMM($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + "#$" + toHex(atoi(stripFirst($4.name).c_str())),2, false);
	      strcpy($$.name, "_A" );
	    }
	  else if(isIntID($1.name) && isUintIMM($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + "#$" + toHex(atoi(stripFirst($4.name).c_str())),2, false);
	      strcpy($$.name, "_A" );
	    }
	  else if(isUintID($1.name) && isUintIMM($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_CLC );
	      addAsm( str_ADC + "#$" + toHex(atoi(stripFirst($4.name).c_str())),2, false);
	      strcpy($$.name, "_A" );
	    }
	  else
	    {
	      addCompilerMessage( "math error", 3);
	    }
	}
      else if( op == "-" )
	{
	  if( isByte($1.name) && isAddress($4.name))
	    {
	      addAsm( str_LDA + string($4.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + string($1.name),3, false);
	      // 2023 08 08 - TODO: Remove this because I haveno Idea what I was trying to do here.
	      strcpy($$.name, string(string("A") + string($4.name)).c_str() );
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($4.name), 3, false );
		}
	    }
	  else if( isIntIMM($1.name) && isAddress($4.name))
	    {
	      addAsm( str_LDA + string($4.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + "#$" + toHex(atoi($1.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($4.name), 3, false );
		}
	      // 2023 08 08 - TODO: Remove this because I haveno Idea what I was trying to do here.
	      strcpy($$.name, string(string("A") + string($4.name)).c_str() );
	    }
	  else if(  isAddress($1.name) && isByte($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + string($4.name),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($4.name), 3, false );
		}
	      strcpy($$.name, "_A" );
	    }
	  else if(  isAddress($1.name) && isIntIMM($4.name))
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + "#$" + toHex(atoi($4.name)),2, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($1.name), 3, false );
		}
	      
	      strcpy($$.name, "_A" );
	    }
	  else if( isAddress($1.name) && isAddress($4.name) )
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + string($4.name),3, false);
	      if( scope_stack.top() == string("FOR") )
		{
		  addAsm( str_STA + string($1.name), 3, false );
		}
	      strcpy($$.name, "_A" );
	    }
	  else if( isAddress($1.name) && isUintIMM($4.name) )
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + "#$" + toHex(atoi(stripFirst($4.name).c_str())),2, false);
	      strcpy($$.name, "_A" );
	    }
	  else if( isAddress($1.name) && isIntIMM($4.name) )
	    {
	      addAsm( str_LDA + string($1.name), 3, false );
	      //addAsm( str_SEC );
	      addAsm( str_SBC + "#$" + toHex(atoi(stripFirst($4.name).c_str())),2, false);
	      strcpy($$.name, "_A" );
	    }
	  else
	    {
	      addCompilerMessage( "math error", 3);
	    }
	}
    }
  if( FAC == 1 )
    {
      strcpy($$.name, "_FAC" );
    }
	
};
| '{' expression '}'
{
  strcpy( $$.name, $2.name );
};
| tNULL
{
  //addNode( string($1.name) );

  addComment( "NULL expression" );
  strcpy( $$.name, "NULL" );
};
| tPOP '(' ')'
{
  //addNode( string($1.name) );

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


    }
  else if( isWordID( $3.name ) )
    {
      string msg = string( "Only using the Low byte of Word: ") + $3.name + " to get sprite pointer.";
      addCompilerMessage( msg, 0);
    }
  else if( isA( $3.name ) )
    {

    }
  else if( isXA( $3.name ))
    {
      string msg = string( "Only using the A register (not the X): ") + $3.name + " to get sprite pointer.";
      addCompilerMessage( msg, 0);
    }

  strcpy( $$.name, "_XA" );
}
| tASL '(' expression ')'
{
  //addNode( string($1.name) );

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
  else if( isWordID($3.name ))
    {
      addComment( "asl( WordID ) -> XA" );
      int addr = getAddressOf($3.name);

      // 2024 04 14 - mkpellegrino
      addAsm( str_ASL + getNameOf(addr), 3, false );
      addAsm( str_ROL + getNameOf(addr) + "+1", 3, false );
      addAsm( str_LDA + getNameOf(addr), 3, false );
      addAsm( str_LDX + getNameOf(addr) + "+1", 3, false );
      //      addAsm( str_ASL + "$" + toHex(addr), 3, false );
      //addAsm( str_ROL + "$" + toHex(addr+1), 3, false );
      //addAsm( str_LDA + "$" + toHex(addr), 3, false );
      //addAsm( str_LDX + "$" + toHex(addr+1), 3, false );
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID($3.name ))
    {
      addComment( "asl( UintID ) -> A" );

      int addr = getAddressOf($3.name);
      
      addAsm( str_ASL + getNameOf(addr), 3, false );
      addAsm( str_LDA + getNameOf(addr), 3, false );
      //addAsm( str_ASL + "$" + toHex(addr), 3, false );
      //addAsm( str_LDA + "$" + toHex(addr), 3, false );
      strcpy( $$.name, "_A" );
    }
  else
    {
      addCompilerMessage("some kind of error occurred.  look at the ASL instructions", 3 );
    }
};
| tLSR '(' expression ')'
{
  addNode( string($1.name) );
  nl++;
  addNode( string($3.name) );
  nl--;

  if( isA( $3.name ) )
    {
      addComment( "lsr( A ) -> A" );
      addAsm( str_LSR, 1, false );
      strcpy( $$.name, "_A" );
    }
  else if( isXA( $3.name ) )
    {
      addComment( "LSR( XA ) -> XA" );
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
      addComment( "lsr( WordID ) -> XA" );
      int addr = getAddressOf($3.name);
      addAsm( str_LSR + "$" + toHex(addr+1), 3, false );
      addAsm( str_ROL + "$" + toHex(addr), 3, false );
      addAsm( str_LDA + "$" + toHex(addr), 3, false );
      addAsm( str_LDX + "$" + toHex(addr+1), 3, false );
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID($3.name ))
    {
      addComment( "lsr( UintID ) -> A" );

      int addr = getAddressOf($3.name);
      addAsm( str_LSR + "$" + toHex(addr), 3, false );
      addAsm( str_LDA + "$" + toHex(addr), 3, false );
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
      addComment( string("Indirect: ") + $2.name  );
      addAsm( str_LDA + "$" + toHex( addr ), 3, false );
      addAsm( str_STA + getLabel( label_vector[label_major], false), 3, false );
      addAsm( str_LDA + "$" + toHex( addr +1 ), 3, false );
      addAsm( str_STA + getLabel( label_vector[label_major], false) + "+1", 3, false );
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($5.name).c_str())), 2, false );
      addAsm( str_BYTE + "$BD\t\t"+ commentmarker + str_LDA + "ABS,X", 1, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );
      //addAsm( ".byte #$00", 1, false );
      //addAsm( ".byte #$00", 1, false );
    }
  else if( isUintID( $5.name ) || isIntID( $5.name ))
    {
      int addr = getAddressOf( $2.name );
      int index_addr = getAddressOf( $5.name );
      addComment( string("Dereference: ") + $2.name  );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf( addr ), 3, false );
      //addAsm( str_LDA + "$" + toHex( addr ), 3, false );
      
      addAsm( str_STA + getLabel( label_vector[label_major], false), 3, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr) + "+1", 3, false );      
      //addAsm( str_LDA + "$" + toHex( addr +1 ), 3, false );
      
      addAsm( str_STA + getLabel( label_vector[label_major], false) + "+1", 3, false );   

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDX + getNameOf(index_addr), 3, false );
      //addAsm( str_LDX + $5.name, 3, false );

      
      addAsm( str_BYTE + "$BD\t\t"+ commentmarker + str_LDA + "ABS,X", 1, false );

      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );
      //addAsm( ".byte #$00", 1, false );
      //addAsm( ".byte #$00", 1, false );
    }
  else if( isA( $5.name ) )
    {
      int addr = getAddressOf( $2.name );
      int index_addr = getAddressOf( $5.name );
     
      addComment( string("Dereference: ") + $2.name );
      addAsm( str_TAX );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + "$" + getNameOf(addr), 3, false );
      //addAsm( str_LDA + "$" + toHex( addr ), 3, false );
      
      addAsm( str_STA + getLabel( label_vector[label_major], false), 3, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr)+"+1", 3, false );
      //addAsm( str_LDA + "$" + toHex( addr +1 ), 3, false );

      addAsm( str_STA + getLabel( label_vector[label_major], false) + "+1", 3, false );   
      //addAsm( string("LDX ") + string( $5.name ), 3, false );
      addAsm( str_BYTE + "$BD\t\t"+ commentmarker + str_LDA + "ABS,X", 1, false );
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_BYTE + "$00, $00", 2, false );

      //addAsm( ".byte #$00", 1, false );
      //addAsm( ".byte #$00", 1, false );
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
  //int type_of_variable = getTypeOf($1.name);

  if( (isUintID($1.name)||isIntID($1.name))  && (isUintID($3.name) || isIntID($3.name)))
    {
      addComment( "(U)IntID '[' (U)IntID ']' -> A" );
      // 2024 04 14 - mkpellegrino
      int addr = hexToDecimal( stripFirst($3.name).c_str());
      addAsm( str_LDX + getNameOf(addr), 3, false );
      //addAsm( str_LDX + $3.name, 3, false );
      
      addAsm( str_LDA + getNameOf(getAddressOf($1.name)) + ",X", 3, false );
      //addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      strcpy($$.name, "_A" );
  
    }
  else if((isUintID($1.name)||isIntID($1.name))  && isA($3.name))
    {
      addComment( "(U)IntID '[' A ']' -> A" );
      addAsm( str_TAX );
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      strcpy($$.name, "_A" );

    }
  else if( (isUintID($1.name)||isIntID($1.name))  && (isIntIMM($3.name) || isUintIMM($3.name)) )
    {
       addComment( "(U)IntID '[' (U)IntIMM ']' -> A" );
 
      if( atoi($3.name) > 255 || atoi($3.name) < 0 ) addCompilerMessage( "Index Out of Range", 3 );
      addAsm( str_LDX + "#$" + toHex( atoi( stripFirst($3.name).c_str() ) ), 2, false );
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      strcpy($$.name, "_A" );
    }

    else if(isWordID($1.name) && isA($3.name))
    {
      addComment( "WordID '[' A ']' -> XA" );
      addAsm( str_ASL ); //  because a word is twice as long as a byte!
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_PHA );
      addAsm( str_INX );
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_TAX );
      addAsm( str_PLA );

      strcpy($$.name, "_XA" );

    }

  else if( isWordID( $1.name ) && (isUintIMM($3.name)||isIntIMM($3.name))  )
    {
       addComment( "WordID '[' (U)IntIMM ']' -> XA" );
 
      int tmp_i = atoi( stripFirst($3.name).c_str() );
      tmp_i*=2; // *2 because a word is twice as long as a byte!
      addAsm( str_LDX + "#$" + toHex(tmp_i), 2, false);
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_PHA );
      addAsm( str_INX );
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy($$.name, "_XA" );
    }
  else if( isWordID( $1.name )  && (isUintID($3.name)||isIntID($3.name)))
    {
 addComment( "WordID '[' (U)IntID ']' -> XA" );
 
      int tmp_i = getAddressOf( $3.name );

      addAsm( str_LDA + "$" + toHex(tmp_i), 3, false );
     addAsm( str_ASL );
      addAsm( str_TAX );
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_PHA );
      addAsm( str_INX );
      addAsm( str_LDA + "$" + toHex(getAddressOf($1.name)) + ",X", 3, false );
      addAsm( str_TAX );
      addAsm( str_PLA );

      strcpy($$.name, "_XA" );
      
    }
  else
    {
      addCompilerMessage( "Unhandled word array", 3 );
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
| expression tbwNOT expression
{
  addComment( "expression tbwNOT expression" );
  if( isWordID($1.name) && isWordID($3.name) )
    {
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_EOR + "$" + $3.name, 3, false );
      addAsm( str_AND + $1.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_EOR + "$" + $3.name + "+1", 3, false );
      addAsm( str_AND + $1.name + "+1", 3, false );
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isWordIMM($3.name) )
    {
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_EOR + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_AND + $1.name, 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_EOR + "#$" + toHex(atoi(stripFirst($3.name).c_str()))+"+1", 3, false );
      addAsm( str_AND + $1.name + "+1", 3, false );
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
    }
  else if( isUintID($1.name) && isUintID($3.name) )
    {
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_EOR + "$" + $3.name, 3, false );
      addAsm( str_AND + $1.name, 3, false );
      strcpy($$.name, "_A" );
    }
  else if( isUintID($1.name) && isUintIMM($3.name) )
    {
      addAsm( str_LDA + "#$FF", 2, false );
      addAsm( str_EOR + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 3, false );
      addAsm( str_AND + $1.name, 3, false );
      strcpy($$.name, "_A" );
    }
  else
    {
      addCompilerMessage( "Bitwise Not (~) not implemented for type yet.", 3 );
    }
};
| expression tbwOR expression
{
  addComment( "expression tbwOR expression" );
  if( isWordID($1.name) && isWordID($3.name) )
    {
      addComment( "WordID | WordID" );
      // preserve one of the operands
      addAsm( str_LDA + $1.name, 3, false);
      addAsm( str_ORA +$3.name, 3, false);
      addAsm( str_PHA );
      addAsm( str_LDA + $1.name + "+1", 3, false);
      addAsm( str_ORA + $3.name + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isWordIMM($3.name) )
    {
      addComment( "WordID | WordIMM" );
      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(get_word_L(addr)), 2, false  );      
      addAsm( str_ORA + "$" + stripFirst($1.name), 3, false);
      addAsm( str_PHA );
      addAsm( str_LDA+"#$" + toHex(get_word_H(addr)), 2, false  );      
      addAsm( str_ORA + "$" + stripFirst($1.name) + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );      
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintID($3.name) )
    {
      addComment( "UintID | UIntID" );
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);

      // 2024 04 14 - mkpellegrino
      
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_ORA + getNameOf(addr2), 3, false);
      //addAsm( str_LDA + $1.name, 3, false);
      //addAsm( str_ORA + $3.name, 3, false);
      strcpy( $$.name, "_A" );
    }
  else if(  (isUintID($1.name)||isIntID($1.name)) && isUintIMM($3.name) )
    {
      int OP1_addr = getAddressOf($1.name);
      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(addr), 2, false  );      
      addAsm( str_ORA + "$" + toHex(OP1_addr), 3, false);
      strcpy( $$.name, "_A" );
    }
  else if(  (isUintID($1.name)||isIntID($1.name)) && isA($3.name) )
    {
      // value is already in Accumulator
      addAsm( str_ORA + "$" + stripFirst($1.name), 3, false);
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
      // preserve one of the operands
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);
      
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_AND + getNameOf(addr2), 3, false);
      addAsm( str_PHA );
      addAsm( str_LDA + getNameOf(addr1)+ "+1", 3, false);
      addAsm( str_AND + getNameOf(addr2) + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
    }
  else if( isWordID($1.name) && isXA($3.name) )
    {
      int addr = getAddressOf($1.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_AND + "$"  + toHex(addr), instr_size, true );
      addAsm( str_PHA );
      addAsm( str_TXA );
      if( addr + 1 > 255 ) instr_size = 3;
      addAsm( str_AND + "$" + toHex(addr+1), instr_size, true );
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );
      //addCompilerMessage( "TBD bitwise and of WordID & XA", 3 );
      
    }
  else if( isWordID($1.name) && isWordIMM($3.name) )
    {
      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(get_word_L(addr)), 2, false  );      
      addAsm( str_AND + "$" + stripFirst($1.name), 3, false);
      addAsm( str_PHA );
      addAsm( str_LDA+"#$" + toHex(get_word_H(addr)), 2, false  );      
      addAsm( str_AND + "$" + stripFirst($1.name) + "+1", 3, false);
      addAsm( str_TAX );
      addAsm( str_PLA );
      strcpy( $$.name, "_XA" );      
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintID($3.name) )
    {
      int addr1 = getAddressOf($1.name);
      int addr2 = getAddressOf($3.name);
      
      addAsm( str_LDA + getNameOf(addr1), 3, false);
      addAsm( str_AND + getNameOf(addr2), 3, false);

      strcpy( $$.name, "_A" );
    }
  else if( (isUintID($1.name)||isIntID($1.name)) && isUintIMM($3.name) )
    {
      int addr1 = getAddressOf($1.name);

      
      int addr = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(addr), 2, false  );      
      addAsm( str_AND + getNameOf(addr1), 3, false);
      //addAsm( str_AND + "$" + stripFirst($1.name), 3, false);
      strcpy( $$.name, "_A" );
    }
  else if( isUintID($1.name) && isA($3.name) )
    {
      int addr = getAddressOf($1.name);
      if( addr > 255 )
	{
	  addAsm( str_AND + "$" + toHex(addr), 3, false);

	}
      else
	{
	  addAsm( str_AND + "$" + toHex(addr), 1, false);

	}
      strcpy( $$.name, "_A" );
    }
  else if( isA( $1.name) && isUintID($3.name) )
    {
      int addr = getAddressOf($3.name);
      if( addr > 255 )
	{
	  addAsm( str_AND + "$" + toHex(addr), 3, false);
	}
      else
	{
	  addAsm( str_AND + "$" + toHex(addr), 2, false);
	}
      strcpy( $$.name, "_A" );


    }
  else if( (isUintIMM($1.name)||isIntIMM($1.name))  && isA($3.name) )
    {
      int OP1 = atoi(stripFirst($1.name).c_str());
      addAsm( str_AND + "#$" + toHex(OP1), 2, false );
      strcpy( $$.name, "_A" );
    }
  else if( isA($1.name) && (isUintIMM($3.name)|isIntIMM($3.name)) )
    {
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
  addAsm( str_CLC );
  addAsm( str_ASL );
  addAsm( str_ASL );      
  
  addAsm( str_STA + "$FF", 2, false );

  // get BNK
  addAsm( str_LDA + "$DD00", 3, false );
  addAsm(str_EOR + "#$FF", 2, false );
  addAsm( str_AND + "#$03", 2, false );
  addAsm( str_CLC );
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
      addAsm( str_LDA+"#$00", 2, false );
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
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "$" + toHex(x_addr+1), 3, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
    }
  else if(isUintID($3.name) && (isUintID($6.name)||isIntID($6.name)) )
    {
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$FB", 2, false );
      addAsm( str_LDA + "$" + toHex(y_addr), 3, false );
      addAsm( str_STA + "$FC", 2, false );
    }
  else if(isUintID($3.name) && isA($6.name))
    {
      addAsm( str_STA + "$FC", 2, false );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$FB", 2, false );
    }
  else if(isWordID($3.name) && isA($6.name))
    {
      addAsm( str_STA + "$FC", 2, false );
      int x_addr = getAddressOf($3.name);
      int y_addr = getAddressOf($6.name);
      addAsm( str_LDA + "$" + toHex(x_addr), 3, false );
      addAsm( str_STA + "$FA", 2, false );
      addAsm( str_LDA + "$" + toHex(x_addr+1), 3, false );
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

  addAsm( str_PHA );

  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$5d", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$5c", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$03", 2, false );
  addAsm( str_JSR + "POP", 3, false );
  addAsm( str_STA + "$02", 2, false );

  addAsm( str_PLA );
  strcpy( $$.name, "_A" );  
}
| tBANK '(' ')'
{
  addComment( "bank();" );
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
      addComment( "top-of-loop" );
      addAsm( str_ROL );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );  
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      addAsm( str_LDX + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addComment( "top-of-loop" );
      addAsm( str_ROL );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );  
    }
  else if( isA( $3.name) )
    {
      addAsm( str_TAX );
      addAsm( str_INX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_SEC );
      addComment( "top-of-loop" );
      addAsm( str_ROL );
      addAsm( str_DEX );
      addAsm( str_BYTE + "$D0, $FC" + commentmarker + "BNE top-of-loop", 2, false );  

    }
  else
    {
      addCompilerMessage( "incorrect type for operation tobit(exp)", 3 );
    }
  strcpy( $$.name, "_A" );   
};
| tTOUINT '(' expression ')'
{
  int t = getTypeOf($3.name);
  if( isFloatID($3.name))
    {
      // move it from memory to FAC
      // then call the function
      // result in A and Y
      int base_address = hexToDecimal( string($3.name) );
      
      addAsm( str_LDA+"#$" + toHex(get_word_L(base_address)), 2, false  );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // MEM ->FAC
      addAsm( str_JSR + "$B1AA" + commentmarker + "FAC -> AY (int)", 3, false ); // FAC -> INT
      addAsm( str_TYA );
    }
  else if( isWordID($3.name) || isUintID($3.name) || isIntID($3.name) )
    {
      int base_address =  getAddressOf($3.name);
      int inst_size = 3;
      if( base_address < 256 ) inst_size = 2;
      addAsm( str_LDA + "$" + toHex(base_address), inst_size, false  );
    }
  else if( isXA($3.name) || isA($3.name) )
    {
      // do nothing - low byte is in A already
    }
  else
    {
      addCompilerMessage( "type Not Yet Implemented for touint(exp)", 3);
    }
  strcpy($$.name, "_A" );
};
| tFCHRIN '(' ')'
{
  addComment( "fchrin -> A" );
  addAsm( str_JSR + "$FFCF", 3, false );
  strcpy( $$.name, "_A");
};
| tFREADST '(' ')'
{
  addComment( "freadst -> A" );
  addAsm( str_JSR + "$FFB7", 3, false );
  strcpy( $$.name, "_A");
};
| tPOINTER '(' ID ')'
{
  string s = string( "ptr(" ) + string( $3.name ) + string( ")" );
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
      addAsm( str_JSR + "$B1AA", 3, false );
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
      addAsm( str_LDA+"#$" + toHex(get_word_L(addr)), 2, false  );
      addAsm( str_STA + "$7A", 2, false );
      addAsm( str_LDA+"#$" + toHex(get_word_H(addr)), 2, false  );
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
      
      //addAsm( str_JSR + "$AABC" + commentmarker + "FAC -> CRT (for debugging purposes)", 3, false );
    }
  else
    {
      addCompilerMessage( "only UINT buffers can be strings", 3 );
    }
  strcpy($$.name, "_FAC" );
};
| tTOFLOAT '(' expression ')'
{
  int t = getTypeOf($3.name);
  if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDY + string($3.name), 3, false ); 
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391", 3, false );
    }
  else if(isWordID($3.name) )
    {
      addAsm( str_LDY + string($3.name), 3, false ); 
      addAsm( str_LDA + string($3.name) + "+1", 3, false ); 
      addAsm( str_JSR + "$B391", 3, false );
    }
  else if( isXA($3.name) )
    {
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_JSR + "$B391", 3, false );
    }
  else if( isA($3.name) )
    {

      addAsm( str_TAY );
      //addAsm( str_LDX + "#$00", 2, false);
      addAsm( str_LDA + "#$00", 2, false);
      addAsm( str_JSR + "$B391", 3, false );
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      int v = atoi( stripFirst($3.name).c_str() );
      addAsm( str_LDY + "#$" + toHex(v), 2, false );
      addAsm( str_LDA + "#$00", 2, false);
      addAsm( str_JSR + "$B391", 3, false );
    }
  else if( isWordIMM($3.name) )
    {
      int L = get_word_L(atoi( stripFirst($3.name).c_str() ));
      int H = get_word_H(atoi( stripFirst($3.name).c_str() ));
      //cerr << toHex(H) << toHex(L) << endl;
      addAsm( str_LDY + "#$" + toHex(L), 2, false );
      addAsm( str_LDA + "#$" + toHex(H), 2, false );
      addAsm( str_JSR + "$B391", 3, false );
    }
  else
    {
      addCompilerMessage( "Unable to convert as float", 3 );
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
  //addAsm( str_JSR + "$FFE4", 3, false );
  strcpy($$.name, "_A" );
};
| tGETCHAR '(' ')'
{
  addComment( "=========================================================");  
  addComment( string("                 getchar()" ));
  addComment( "=========================================================");
  //addAsm( str_LDA + "$CB", 2, false );
  addAsm( str_JSR + "$FFE4", 3, false );
  strcpy($$.name, "_A" );
};
| tTWOS '(' expression ')'
{
  //twos_complement_is_needed = true;
  addComment( "=========================================================");  
  addComment( string("                 twos(") + string($3.name) + string(")"));
  addComment( "=========================================================");

  if( isUintID( $3.name ) || isIntID( $3.name ))
    {
      
      //addAsm( str_LDA + "$" + toHex(getAddressOf( string($3.name))), 3, false );
      //addAsm( str_PHA );
      //addAsm( str_JSR + "TWOS", 3, false );
      //addAsm( str_PLA );
      addAsm( str_CLC );
      addAsm( str_LDA + "$" + toHex(getAddressOf( string($3.name))), 3, false );
      addAsm( str_EOR + "#$FF" );
      addAsm( str_ADC + "#$01" );
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
      //addAsm( str_PHA );
      //addAsm( str_JSR + "TWOS", 3, false );
      //addAsm( str_PLA );
      strcpy($$.name, "_A");

    }
  else if( isWordID( $3.name ) )
    {
      int tmp_addr = getAddressOf( $3.name );

      addAsm( str_CLC );
      addAsm( str_LDA + "#$FF", 2, false );
      // 2024 04 15 - mkpellegrino
      addAsm( str_EOR + getNameOf( tmp_addr ) + "+1", 3, false ); // 4 cycles
      //addAsm( str_EOR + "$" + toHex( tmp_addr + 1 ), 3, false ); // 4 cycles
      addAsm( str_PHA );
      addAsm( str_LDA + "#$FF", 2, false );

      // 2024 04 15 - mkpellegrino
      addAsm( str_EOR + getNameOf( tmp_addr ), 3, false );
      //addAsm( str_EOR + "$" + toHex( tmp_addr ), 3, false );
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
| tSIN '(' expression ')'
{
  addComment( "=========================================================");  
  addComment( "                 sine");
  addComment( "=========================================================");
  addParserComment( "RULE: expression: sin( expression );" );
  if( isFloatIMM($3.name) )
    {
      // IMM float
      inlineFloat($3.name);
      // calculate the sine of it
      addAsm( str_JSR + "$E26B" + commentmarker + "SIN(FAC) -> FAC", 3, false ); 
      // result is in FAC
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($3.name) )
    {
      // float
      int base_address = getAddressOf($3.name);
      addAsm( str_LDA+"#$" + toHex(get_word_L(base_address)), 2, false  );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // FP ->FAC
      addAsm( str_JSR + "$E26B" + commentmarker + "SIN(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
    else if( isWordID($3.name) )
    {
      addAsm( str_LDY + $3.name , 3, false ); 
      addAsm( str_LDA + $3.name + "+1", 3, false ); 
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "SIN(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDY + $3.name, 3, false ); 
      addAsm( str_LDA+"#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "SIN(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
    else if( isXA($3.name) )
    {
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "SIN(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addAsm( str_TAX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E26B" + commentmarker + "SIN(FAC) -> FAC", 3, false ); // sine
      strcpy($$.name, "_FAC");
    }
  else
    {
      addCompilerMessage( "trying to calculate sine of unknown type", 3);
    }
};
| tCOS '(' expression ')'
{
  addComment( "=========================================================");  
  addComment( "                 cosine");
  addComment( "=========================================================");
  addParserComment( "RULE: expression: cos( expression );" );
  if( isFloatIMM($3.name) )
    {
      inlineFloat($3.name);
      addAsm( str_JSR + "$E264" + commentmarker + "COS(FAC) -> FAC", 3, false ); 
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($3.name) )
    {
      int base_address = getAddressOf($3.name);
      addAsm( str_LDA+"#$" + toHex(get_word_L(base_address)), 2, false  );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // FP ->FAC
      addAsm( str_JSR + "$E264" + commentmarker + "COS(FAC) -> FAC", 3, false ); // cos
      strcpy($$.name, "_FAC");
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDY + $3.name, 3, false ); 
      addAsm( str_LDA + $3.name + "+1", 3, false ); 
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "COS(FAC) -> FAC", 3, false ); // cos
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDY + $3.name, 3, false ); 
      addAsm( str_LDA+"#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "COS(FAC) -> FAC", 3, false ); // cos
      strcpy($$.name, "_FAC");
    }
    else if( isXA($3.name) )
    {
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "COS(FAC) -> FAC", 3, false ); // cos
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addAsm( str_TAX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E264" + commentmarker + "COS(FAC) -> FAC", 3, false ); // cos
      strcpy($$.name, "_FAC");
    }
  else
    {
      addCompilerMessage( "trying to calculate cosine of unknown type" );
    }
};
| tTAN '(' expression ')'
{
  addComment( "=========================================================");  
  addComment( "                 tangent");
  addComment( "=========================================================");
  addParserComment( "RULE: expression: tan( expression );" );
  if( isFloatIMM($3.name) )
    {
      // IMM float
      inlineFloat($3.name);
      // calculate the sine of it
      addAsm( str_JSR + "$E2B4" + commentmarker + "TAN(FAC) -> FAC", 3, false ); 
      // result is in FAC
      strcpy($$.name, "_FAC");
    }
  else if( isFloatID($3.name)  )
    {
      // float
      int base_address = getAddressOf($3.name);
      addAsm( str_LDA+"#$" + toHex(get_word_L(base_address)), 2, false  );
      addAsm( str_LDY + "#$" + toHex(get_word_H(base_address)), 2, false  );
      addAsm( str_JSR + "$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // FP ->FAC
      // calculate the cosine of it
      addAsm( str_JSR + "$E2B4" + commentmarker + "TAN(FAC) -> FAC", 3, false ); // tan
      strcpy($$.name, "_FAC");
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDY + $3.name, 3, false ); 
      addAsm( str_LDA + $3.name + "+1", 3, false ); 
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "TAN(FAC) -> FAC", 3, false ); // tan
      strcpy($$.name, "_FAC");
    }
  else if( isUintID($3.name)||isIntID($3.name) )
    {
      addAsm( str_LDY + $3.name, 3, false ); 
      addAsm( str_LDA+"#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "TAN(FAC) -> FAC", 3, false ); // tan
      strcpy($$.name, "_FAC");
    }
  else if( isXA($3.name) )
    {
      addAsm( str_PHA );
      addAsm( str_TXA );
      addAsm( str_TAY );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addAsm( str_TYA );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "TAN(FAC) -> FAC", 3, false ); // tan
      strcpy($$.name, "_FAC");
    }
  else if( isA($3.name) )
    {
      addAsm( str_TAX );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_JSR + "$B391" + commentmarker + "Word -> FAC", 3, false );
      addAsm( str_JSR + "$E2B4" + commentmarker + "TAN(FAC) -> FAC", 3, false ); // tan
      strcpy($$.name, "_FAC");
    }
  else
    {
      addCompilerMessage( "trying to calculate tangent of unknown type" );
    }
};
| value
{
  addParserComment( string("RULE: expression: value: (") + $1.name + ")" );
  addParserComment( string($1.name) );
  strcpy($$.name, $1.name);
};
// 2024 04 09 - mkpellegrino 
/* | stringtype */
/* { */
/*   addParserComment( string("RULE: expression: string: (") + $1.name + ")" ); */
/*   addParserComment( string($1.name) ); */
/*   strcpy($$.name, $1.name); */
/* }; */
| ID
{
  addParserComment(string( "RULE: expression: ID : ") + $1.name);
  int base_address = getAddressOf($1.name);
  int t = getTypeOf($1.name);
  strcpy($$.name, (string( "$" ) + toHex(getAddressOf($1.name))).c_str() );
};
| tSPRITECOLLISION '(' ')'
{
  addAsm( str_LDA + "$D01E" + commentmarker + "MOB-MOB Collision Register", 3, false );
  strcpy($$.name, "_A" );
};
| tSPRITECOLLISION '(' expression ')'
{
  addComment( "Sprite Collision - Argument is bit# b7654321" );
  addComment( "as in ( 0x08 ) would test sprite #4" );
  
    if( isUintID($3.name) )
    {
      addAsm( str_LDA + "$D01E\t\t\t" + commentmarker + "MOB-MOB Collision Register", 3, false );
      addAsm( str_AND + "$" + toHex(getAddressOf($3.name)), 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addAsm( str_LDA + "$D01E\t\t\t" + commentmarker + "MOB-MOB Collision Register", 3, false );
      addAsm( str_AND + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isA( $3.name ) )
    {
      addCompilerMessage( "Slowest possible method... could you use an ID or IMM instead of A?", 0 );
      addAsm( str_LDY + "$02", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "$D01E\t\t\t" + commentmarker + "MOB-MOB Collision Register", 3, false );
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
      addAsm( str_LDA + "$D01F\t\t\t" + commentmarker + "MOB-Background Collision Register", 3, false );
      addAsm( str_AND + "$" + toHex(getAddressOf($3.name)), 3, false );
    }
  else if( isUintIMM($3.name) )
    {
      addAsm( str_LDA + "$D01F\t\t\t" + commentmarker + "MOB-Background Collision Register", 3, false );
      addAsm( str_AND + "#$" + toHex(atoi(stripFirst($3.name).c_str())), 2, false );
    }
  else if( isA( $3.name ) )
    {
      addCompilerMessage( "Slowest possible method... could you use an ID or IMM instead of A?", 0 );
      addAsm( str_LDY + "$02", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_LDA + "$D01F\t\t\t" + commentmarker + "MOB-Background Collision Register", 3, false );
      addAsm( str_AND + "$02", 2, false );
      addAsm( str_STY + "$02", 2, false );      
    }

  else
    {
      addCompilerMessage( "invalid argument for mobbkgcollision( UintID / UintIMM )", 3 );
    }
  //addAsm( str_PHA );
  //addAsm( str_LDA + "#$00", 2, false );
  //addAsm( str_STA + "$D01F", 3, false );
  //addAsm( str_PLA );
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
      addAsm( str_LDA + getNameOf(hexToDecimal(stripFirst($3.name))) + "+1", inst_size, false );
    }
  else if( isXA( $3.name ))
    {
      addAsm( str_TXA );
    }
  else if( isWordIMM( $3.name ) )
    {
      int v = (atoi(stripFirst($3.name).c_str()) & 0xFF00)/255;
      addAsm( str_LDA+"#$" + toHex(v), 2, false );

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
      // do nothing because Lo-Byte is in accumulator
    }
  else if( isWordIMM( $3.name ) )
    {
      int v = atoi(stripFirst($3.name).c_str()) & 0xFF;
      addAsm( str_LDA+"#$" + toHex(v), 2, false );
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
      addAsm( str_LDA+"#$"+toHex(get_word_L(addr)), 2, false  );
      addAsm( str_LDY+"#$"+toHex(get_word_H(addr)), 2, false  );
      addAsm( str_JSR+"$BBA2" + commentmarker + "MEM -> FAC", 3, false ); // FP ->FAC
      addAsm( str_JSR+"$BF71" + commentmarker + "SQRT(FAC) -> FAC", 3, false ); // sqrt
    }
  else
    {
      addCompilerMessage( "sqrt takes a float as its argument", 3 );
    }
  strcpy($$.name, "_FAC");
};
| ID '(' parameterlist ')' 
{
  addComment( "Call a function as an expression - Line 12521" );
  proposed_ids_vector.push_back( new id_and_line( $1.name, countn+1 ));

  
  addAsm( str_JSR + $1.name, 3, false );


  // move to ID init and datatype ID init
  addComment( "Pop Return Value off of Processor Stack - 2023 04 02" );
  //illegal_operations_are_needed = true;


  //cerr << "return type: " << getTypeOfFunction( string($1.name) ) << endl;
  //cerr << "ID: " << $1.name << endl;
  //cerr << "OTHER: " << $$.name << endl << endl;
  
  pushScope( "POPRTN" );

  // TODO: This seems...  fishy - 2023 08 05
  
  // at this point the compiler will need to know what type the function returns
  // it _could_ search through the rest of the source code until it finds it.
  // 
  
  // THIS DOES NOT ACCOUNT FOR RETURNING ANYTHING OVER 2 BYTES
  // Like Doubles, Floats, or MOBs
  addAsm( str_PLA ); // the number of bytes in the stack

  //  addAsm( str_CMP + "#$05", 2, false );
  //addAsm( str_BEQ + getLabel( label_vector[label_major]+1,false), 2, false ); // branch to ***
  
  addAsm( str_TAY );

  addAsm( str_LDA + "#$00", 2, false );
  addAsm( str_LDX + "#$00", 2, false );
  
  addAsm( str_CPY + "#$00", 2, false );
  addAsm( str_BEQ + getLabel( label_vector[label_major]+1,false), 2, false ); // branch to ***
  addAsm( str_CPY + "#$01", 2, false );
  addAsm( str_BEQ + getLabel( label_vector[label_major],false), 2, false ); // branch to %%%
  // get 1 value and put it in X
  addAsm( str_PLA );
  addAsm( str_TAX );
  addAsm( generateNewLabel(), 0, true );  // if 1                            %%%
  // get 1 value and put it in A
  addAsm( str_PLA );
  //addAsm( generateNewLabel(), 0, true );  // if  0                           ***

  //addAsm( str_JMP + getLabel( label_vector[label_major]+1,false), 3, false ); 


  addAsm( generateNewLabel(), 0, true );  // if  0                           ***
  //addAsm( str_TSX );

  //addAsm( str_PLA );
  //addAsm( str_PLA );
  //addAsm( str_PLA );
  //addAsm( str_PLA );
  //addAsm( str_PLA );
  
  //addAsm( str_TXA );
  //addAsm( str_LDX + "#$01", 2, false ); // where the stack is
  //addAsm( generateNewLabel(), 0, true );  // if  0                           ***

  popScope();

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
      addComment( "peek( Word );" );

      int addr = hexToDecimal($3.name);
      int instr_size = 3;
      if( addr < 256 ) instr_size = 2;
      addAsm( str_LDY + "#$00", 2, false );

      // 2024 04 14 - mkpellegrino
      addAsm( str_LDA + getNameOf(addr), instr_size, false );
      //addAsm( str_LDA + "$" + toHex(addr), instr_size, false );

      instr_size = 3;
      if( addr+1 < 256 ) instr_size = 2;

      // 2024 04 14 - mkpellegrno
      addAsm( str_LDX + getNameOf(addr) + "+1", instr_size, false );
      //addAsm( str_LDX + "$" + toHex(addr+1), instr_size, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STX + "$03", 2, false );
      addAsm( str_LDA + "($02),Y", 2, false );	
    }
  else if( isXA($3.name) )
    {
      addComment( "peek( XA );" );
      addAsm( str_TAY );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_PHA );

      addAsm( str_STY + "$02", 2, false );
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( str_STX + "$03", 2, false );      
      addAsm( str_LDA + "($02),Y", 2, false );
      addAsm( str_TAX );

      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_TXA );
      
    }
  else if( isIntID($3.name) || isUintID($3.name) )
    {
      addComment( "peek( (U)IntID );" );
      //addAsm( str_LDA + "$" + string($3.name), 2, false );
      addAsm( str_LDX + $3.name, 3, false );
      addAsm( str_LDA + "$00,X", 2, false );
    }
  else if( isIntIMM($3.name) || isUintIMM($3.name) )
    {
      int v = atoi( stripFirst($3.name).c_str() );
      int instr_size = 3;
      if( v < 256 ) instr_size = 2;
      if( v < 0 || v > 65535 )
	{
	  addCompilerMessage( "memory location out of range", 2 );
	}
      addAsm(str_LDA + "$" + toHex(v), instr_size, false );
    }
  else if( isWordIMM($3.name ) )
    {
      int addr = atoi( stripFirst($3.name).c_str() );
      int instr_size =3;
      if( addr < 256 ) instr_size = 2;
      addAsm(str_LDA + "$"  + toHex(addr), instr_size, false );
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
|
DIVIDE
{
  addParserComment( "RULE: arithmetic DIVIDE" );
  current_state = string("/");
  strcpy($$.name, "/" );
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
  //addComment(string("RULE: value: HEX_NUM: (") + string($1.name) + string(")") );
  /* determine if it's a byte or a word */
  /* convert the hex number to decimal */
  string N = string($1.name);
  if( N.length() > 4 )
    {
      N.erase(0,2);
      int val = hexToDecimal(N);
      string return_value = string("w") + toString(val);
      strcpy( $$.name, return_value.c_str() );
      //addComment(string("RULE: value: HEX_NUM: (") + string($1.name) + string(")->(") + return_value + string(")") );
    }
  else
    {
      N.erase(0,2);
      int val = hexToDecimal(N);
      string return_value = string("u") + toString(val);
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
  // TODO: Must fix this! 2023 04 11
  //addComment(string("RULE: value: NUMBER: (") + string($1.name) + string(")") );
  int v = atoi($1.name);

  if( getTypeOf($1.name) != -1 )
    {
      current_variable_type = getTypeOf($1.name);
    }
  //else
  //  {
  //    addCompilerMessage( "Unknown Type", 0);
  //  }			

  if( atoi($1.name) > 255 ) current_variable_type = 2;
  /* else if( atoi($1.name) < -127 ) */
  /*   { */
  /*     current_variable_type = 2; */
  /*     v = twos_complement(0 - atoi($1.name)); */
  /*   } */
  else if( atoi($1.name) < 0 ) current_variable_type = 1;
  else current_variable_type = 0;
  
  if( current_variable_type == 0 )
    {
      if( atoi($1.name) > 255 || atoi($1.name) < 0 ) addCompilerMessage( "uint out of range (0-255)", 3 );
      strcpy($$.name, string( string("u") + string($1.name)).c_str());
    }
  else if( current_variable_type == 1 )
    {
      if( atoi($1.name) > 127 || atoi($1.name) < -128 ) addCompilerMessage( "int out of range (-128 to +127)", 3 );
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

  //addDebugComment(string("RULE: value: WORD :") +  string($1.name));
  strcpy($$.name, $1.name);
}
| CHARACTER
{
  //addComment( $1.name );
  string my_char = string("");
  my_char += string( $1.name )[1];
  switch( string( $1.name )[1] )
    {
    case 'A':
      strcpy( $$.name, "u65" );
      break;
    case 'B':
      strcpy( $$.name, "u66" );
      break;
    case 'C':
      strcpy( $$.name, "u67" );
      break;
    case 'D':
      strcpy( $$.name, "u68" );
      break;
    case 'E':
      strcpy( $$.name, "u69" );
      break;
    case 'F':
      strcpy( $$.name, "u70" );
      break;
    case 'G':
      strcpy( $$.name, "u71" );
      break;
    case 'H':
      strcpy( $$.name, "u72" );
      break;
    case 'I':
      strcpy( $$.name, "u73" );
      break;
    case 'J':
      strcpy( $$.name, "u74" );
      break;
    case 'K':
      strcpy( $$.name, "u75" );
      break;
    case 'L':
      strcpy( $$.name, "u76" );
      break;
    case 'M':
      strcpy( $$.name, "u77" );
      break;
    case 'N':
      strcpy( $$.name, "u78" );
      break;
    case 'O':
      strcpy( $$.name, "u79" );
      break;
    case 'P':
      strcpy( $$.name, "u80" );
      break;
    case 'Q':
      strcpy( $$.name, "u81" );
      break;
    case 'R':
      strcpy( $$.name, "u82" );
      break;
    case 'S':
      strcpy( $$.name, "u83" );
      break;
    case 'T':
      strcpy( $$.name, "u84" );
      break;
    case 'U':
      strcpy( $$.name, "u85" );
      break;
    case 'V':
      strcpy( $$.name, "u86" );
      break;
    case 'W':
      strcpy( $$.name, "u87" );
      break;
    case 'X':
      strcpy( $$.name, "u88" );
      break;
    case 'Y':
      strcpy( $$.name, "u89" );
      break;
    case 'Z':
      strcpy( $$.name, "u90" );
      break;
    case ' ':
      strcpy( $$.name, "u32" );
      break;
    case '\n':
      strcpy( $$.name, "u13" );
      break;
    case ':':
      strcpy( $$.name, "u58" );
      break;
    case '!':
      strcpy( $$.name, "u33" );
      break;
    case '#':
      strcpy( $$.name, "u35" );
      break;
    default:
      strcpy( $$.name, "u0" );
      break;
    }
  //cerr << my_char << endl;
  //string my_char_uint =  string( itos(my_char)[0] );
  //addComment( my_char_uint.c_str );
  //strcpy($$.name, my_char.c_str() );
  //$$.nd = mknode(NULL, NULL, $1.name);
}
| STR
{
  addComment( $1.name );
  addComment( "Not Yet Implemented" );
  
}
;

return: RETURN ';'
  {
    addAsm( str_RTS );
  }
| RETURN {stack_is_needed = true;addAsm(str_TAY);addAsm(str_TXA);addAsm( str_JSR+"PUSH",3,false);addAsm(str_TYA);addAsm(str_JSR+"PUSH",3,false);} expression  ';'
{
  // if $3.name is NOT an XA ... remove the previous 5 lines
  if( !isXA($3.name) )
    {
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      deletePreviousAsm();
      addComment( "Deleted previous 5 Mnemonics" );

    }
  addComment( "return from function" );
  addAsm( str_PLA );
  addAsm( str_TAX );
  addAsm( str_PLA );
  addAsm( str_TAY );

  int v = getAddressOf($3.name);
  if( isUintID($3.name) || isIntID($3.name) )
    {
      addAsm( str_LDA+"$"+toHex(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$01", 2, false );
      addAsm( str_PHA );
    }
  else if( isWordID($3.name) )
    {
      addAsm( str_LDA+"$"+toHex(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"$"+toHex(v+1), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isUintIMM($3.name) || isIntIMM($3.name) )
    {
      v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"#$" + toHex(v), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$01", 2, false );
      addAsm( str_PHA );
    }
  else if( isWordIMM($3.name) )
    {
      v = atoi(stripFirst($3.name).c_str());
      int a_register = get_word_L( v );
      int x_register = get_word_H( v );
      addAsm( str_LDA+"#$" + toHex(a_register), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$"+toHex(x_register), 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isWordID($3.name) )
    {
      v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"$"+toHex(v+1), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"$"+toHex(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isXA($3.name) )
    {
      stack_is_needed = true;
      addAsm( str_JSR+"POP", 3, false );
      addAsm( str_PHA );
      addAsm( str_JSR+"POP", 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$02", 2, false );
      addAsm( str_PHA );
    }
  else if( isFloatID($3.name) )
    {
      v = atoi(stripFirst($3.name).c_str());
      addAsm( str_LDA+"$"+toHex(v+1), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"$"+toHex(v), 3, false );
      addAsm( str_PHA );
      addAsm( str_LDA+"#$05", 2, false );
      addAsm( str_PHA );
    }
  else
    {
      addCompilerMessage( "invalid return type", 3 );
    }

  addAsm( str_TYA );;
  addAsm( str_PHA );
  addAsm( str_TXA );
  addAsm( str_PHA );
  addAsm(str_RTS);
  addComment( "Returning a value via the stack" );
	     
  //  strcpy( $$.name, "STACK" );
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
      if( a == "--no-asm-comments" ) arg_asm_comments = false;
      if( a == "--parser-comments" ) arg_parser_comments = true;
      //if( a == "--symbol-table" ) symbol_table_is_needed = true;
      if( a == "--no-labels" ) arg_show_labels = false;
      if( a == "--short-branches" ) long_branches = false;
      if( a == "--debug" ) { debug_flag_is_on = true; debug_comments_are_needed = true; }
      if( a == "--basic" || a == "--basicupstart" ) basic_upstart = true;
      /* if( a == "--???" ) */
      /* 	{ */

      /* 	} */
      if( a == "--unsafeifs" )
	{
	  arg_unsafe_ifs = true;
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
	       << "\t--no-labels\t\twill supress the labels (and turn them into memory addresses)\n" 
	       << "\t--no-asm-comments\twill supress most comments pertaining to flow of control\n" 
	       << "\t--parser-comments\twill show the comments intended to help debug the parser\n"
	       << "\t--kick\t\t\tcreate .asm file that is compatible with Kick Assembler\n"
	       << "\t--basic\t\t\tput BASIC Upstart code at $0801\n"
	       << "\t--help\t\t\tthis message\n" 
	       << "\t--code-segment address\tsets the start of code segment to a memory addres (default is 49152)\n"
	       << "\t--data-segment address\tsets the start of data segment to a memory addres (default is 828)\n\n" << endl;
	  exit(-1);
	}
    }

  //  FILE* file_pointer = fopen(input_file_name.c_str(), "a");
 
  current_state = string("unknown" );
  current_code_location = code_start;
  
  if( scanf_is_needed)
    {
      //addAsmVariable( "buffer_tmp_l", 0 );
      //addAsmVariable( "buffer_tmp_h", 0 );
    }
  if( return_addresses_needed )
    {
      //addAsmVariable( "return_address_1", 0 );
      //addAsmVariable( "return_address_2", 0 );
    }
      
  yyparse(); 
  
  int i=0;
  for(i=0;i<count;i++){free(symbol_table[i].id_name);free(symbol_table[i].type);}
  
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

  if( save_is_needed )
    {
      addAsm( "SAVE:", 0, true );
      saveReturnAddress();
      
      // save $02/$03 in software stack (pretty slow!)
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_JSR + "PUSH", 3, false );
      
      addAsm( str_PLA );
      addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + "+1", 3, false );
	      
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
      
      addComment( "CHKOUT" );
      addAsm( str_LDX + "#$03", 2, false );
      addAsm( str_JSR + "$FFC9", 3, false );


      addAsm( str_PLA );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      //
      addAsm( str_LDY + "#$00", 2, false );
      addAsm( generateNewLabel(), 0, true );

      addAsm( str_LDA + "($02),Y", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_INY );      
      // ???
      addAsm( generateNewLabel(), 0, true );
      addAsm( str_CPY + "#$00", 2, false );
      // ???
      addAsm( str_BNE + getLabel( label_vector[label_major]-2, false), 2, false );


      ////
      
      
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
      addAsm( str_STA + getLabel( label_vector[label_major]+1, false) + "+1", 3, false );

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
      addAsm( str_CLC );

      
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
      addAsm( str_CLC );

      addComment( "add #$01 to LOAD16I/LOAD16I+1 (the index)" );
      addAsm( str_CLC );
      addAsm( str_LDA + "#$01", 2, false );
      addAsm( str_ADC + "LOAD16I", 3, false );
      addAsm( str_STA + "LOAD16I", 3, false );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_ADC + "LOAD16I+1", 2, false );
      addAsm( str_STA + "LOAD16I+1", 2, false );
      addAsm( str_CLC );
      
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
      //addAsm( str_JSR + "$1003", 3, false );
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
      addAsm( string("SIGNEDCMP: ") + commentmarker + string(" Signed Comarison"), 0, true );
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
      addAsm( str_BYTE + "$B0, $0A" + commentmarker + "BCS SGNCMPSKIP", 2, false );
      //addAsm( "BCS SGNCMPSKIP", 2, false );
      addAsm( str_LDA + "$02", 2, false );
      addAsm( str_PHA );
      addAsm( str_LDA + "$03", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_PLA );
      addAsm( str_STA + "$03", 2, false );
      //addAsm( "SGNCMPSKIP:", 0, true );
      addAsm( str_LDA + "$02" + commentmarker + " <== SGNCMPSKIP", 2, false );
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
      stack_is_needed = true;
      addAsm( str_JSR + "PUSH", 3, false );
      
      // BNE: #$D0   BEQ: #$F0   BCC: #$B0   BCS: #$90
      addAsm( str_PLA ); // pull the signed value off the stack
      addAsm( str_STA + "$05", 2,false ); // save the signed byte in Zeropage ($0005)
      addAsm( str_AND + "#$80", 2, false );          // SIGNED INT: F3 -> 80 (it's negative)
      addAsm( str_CMP + "#$80", 2, false );          // IF IT's NEGATIVE
      addAsm( str_PLA ); // get the unsigned byte
      addAsm( str_BYTE + "$B0, $0A" + commentmarker + "BCS +10", 2, false );  // JumpRel 16 bytes fwd   -> (***)
      addAsm( str_CMP + "$05", 2, false );           // A = UINT
      addAsm( str_BYTE + "$B0, $06" + commentmarker + "BCS +6", 2, false );  // JumpRel +6             -> (+++)
      addAsm( str_BYTE + "$90, $04" + commentmarker + "BCC +4", 2, false );  // JumpRel +4             -> (+++)
      addAsm( str_LDA + string("#$01"), 2, false );          // A=1                       (***)
      addAsm( str_CMP + "#$00", 2, false );          // CMP A with 0
      addAsm( str_PHP );

      addAsm( str_JSR + "POP", 3, false );
      addAsm( str_STA + "$05", 2, false );
      // ==================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );

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
      
      addAsm( str_SEI );
      // Save $02 and $03
      /* addAsm( str_LDA + "$02", 2, false ); */
      /* addAsm( str_PHA ); */
      /* addAsm( str_LDA + "$03", 2, false ); */
      /* addAsm( str_PHA ); */
      
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_LDX + "#$10", 2, false );
      // Label 1
      addAsm( "_DIV16_L1:", 0, true );
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
      addAsm( str_BCC + "_DIV16_L2", 2, false );
      addAsm( str_STA + "$03", 2, false );
      addAsm( str_STY + "$02", 2, false );
      addAsm( str_INC + "_DIV16_FB", 3, false );
      // Label 2
      addAsm( "_DIV16_L2:", 0, true );
      addAsm( str_DEX );
      //addAsm( str_BYTE + "$D0, $E3", 2, false ); // BNE Label 1
      addAsm( str_BNE + "_DIV16_L1", 2, false );

      // Restore $03 and $02
      /* addAsm( str_PLA ); */
      /* addAsm( str_STA + "$03", 2, false ); */
      /* addAsm( str_PLA ); */
      /* addAsm( str_STA + "$02", 2, false ); */
      addAsm( str_CLI );
      
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
      addAsm( commentmarker, 0, true );
      addAsm( commentmarker + "x = $FA, y = $FC, colour = $FD", 0, true );
      addAsm( commentmarker + "STORE is at $FE(l), $FF(h)", 0, true);
      addAsm( commentmarker + "LOC is at $02(l), $03(h)", 0, true);
      addAsm( "MCPLOT:", 0, true );

      /* // Save $02 and $03 */
      /* addAsm( str_LDA + "$02", 2, false ); */
      /* addAsm( str_PHA ); */
      /* addAsm( str_LDA + "$03", 2, false ); */
      /* addAsm( str_PHA ); */

      addAsm( str_SEI );

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
      addAsm( str_ROR );
      addAsm( str_ROR );
      addAsm( str_DEC + "$FE" + commentmarker + "store", 2, false );
      addAsm( str_BYTE +"$10, $FA", 2, false );  // BPL "loop here"
      addAsm( str_STA + "$50" + commentmarker + "mask", 2, false );
      addAsm( str_LDA + "$FA" + commentmarker + "xcoord", 2, false );  // 3 cycles
      //addAsm( str_LDA + "$FA; xcoord", 2, false );
      addAsm( str_AND + "#$FC", 2, false );
      addAsm( str_ASL );
      addAsm( str_ROL + "$FF" + commentmarker + "store + 1", 2, false );
      addAsm( str_STA + "$FE" + commentmarker + "store", 2, false );
      addAsm( str_LDA + "$FC" + commentmarker + "ycoord", 2, false );  // 3 cycles
      //addAsm( str_LDA + "$FC; ycoord", 2, false );
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
      //addAsm( str_LDA + "$FC; ycoord", 2, false );
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
      addAsm( str_CLI );


      // Restore $03 and $02
      /* addAsm( str_PLA ); */
      /* addAsm( str_STA + "$03", 2, false ); */
      /* addAsm( str_PLA ); */
      /* addAsm( str_STA + "$02", 2, false ); */

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


      // Save $02 and $03
      /* addAsm( str_LDA + "$02", 2, false ); */
      /* addAsm( str_PHA ); */
      /* addAsm( str_LDA + "$03", 2, false ); */
      /* addAsm( str_PHA ); */

      addAsm( str_SEI );
      addAsm( str_LDA + string("$FA"), 2, false ); 

      //addAsm( str_LDA + "$FA", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_STA + "$5C", 2, false );

      
      addAsm( str_LDA + string(" #$00"), 2, false ); 
      //addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "$02", 2, false );
      addAsm( str_STA + "$5D", 2, false );
      addAsm( str_LDA + "$FD", 2, false ); 

      //addAsm( str_LDA + "$FD", 2, false );
      addAsm( str_CLC );
      addAsm( str_ROR );
      // loop here
      addAsm( str_ROR );
      addAsm( str_ROR );
      addAsm( str_DEC + "$5C", 2, false );
      addAsm( str_BYTE + "$10, $FA", 2, false );  // BPL "loop here"

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
      addAsm( str_JSR + "BNKMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00, #$40, #$80, #$C0 based on Bank #
      addAsm( str_CLC ); 
      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );
      bmpmem_is_needed = true;
      addAsm( str_JSR + "BMPMEM", 3, false );
      addAsm( str_PLA ); // <<- A should now be #$00 or a #$20
      addAsm( str_CLC );      

      addAsm( str_ADC + "$03", 2, false );
      addAsm( str_STA + "$03", 2, false );
      
      addAsm( str_CLI );
      // -----------------------------------

      // Restore $03 and $02
      /* addAsm( str_PLA ); */
      /* addAsm( str_STA + "$03", 2, false ); */
      /* addAsm( str_PLA ); */
      /* addAsm( str_STA + "$02", 2, false ); */

      
      addAsm( str_RTS );
      addComment( "^^^------------------------------------^^^" );
      addComment( "^^^ from p164 of Advanced Machine Code ^^^" );
      addComment( "^^^  Programming for the Commodore 64  ^^^" );
      addComment( "^^^ w/ some changes to deal with banks ^^^" );
      addComment( "^^^------------------------------------^^^" );

    }
 
  if( mul16_is_needed )
    {
      // 16-bit multiplication
      // NUM1  * NUM2  = RESULT
      // L  H    L  H    L  H
      // FB/FC * FD/FE = 02/03

      /* 2023 06 19 */
      addComment( "2023 06 19:" );
      addComment( "This will slow down the MUL16 routine, but" );
      addComment( "it's safer because it doesn't use ZP" );
      addAsm( "_MUL16_FB:", 0, true );
      addAsm( str_BYTE + "$00", 1, false );
      addAsm( "_MUL16_FC:", 0, true );
      addAsm( str_BYTE + "$00", 1, false);
      addAsm( "_MUL16_FD:", 0, true );
      addAsm( str_BYTE + "$00", 1, false);
      addAsm( "_MUL16_FE:", 0, true );
      addAsm( str_BYTE + "$00", 1, false);

      
      /* ^^^^^^^^^^ */
      addAsm( "MUL16R:", 0, true );
      addAsm( str_BYTE + "$00, $00, $00, $00", 4, false);
      addAsm( "MUL16:", 0, true );

      addComment( "zero out the mul16 bytes" );
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_STA + "MUL16R", 3, false );
      addAsm( str_STA + "MUL16R+1", 3, false );
      addAsm( str_STA + "MUL16R+2", 3, false );
      addAsm( str_STA + "MUL16R+3", 3, false );
      
      addAsm( str_LDX + "#$10", 2, false );
      addAsm( "_MUL16_L1:", 0, true );
      // label 1

      //addAsm( str_LSR + "$FE", 2, false );
      addAsm( str_LSR + "_MUL16_FE", 3, false );
      
      //addAsm( str_ROR + "$FD", 2, false );
      addAsm( str_ROR + "_MUL16_FD", 3, false );
      
      addAsm( str_BCC + "_MUL16_L2", 2, false );
      //addAsm( str_BYTE + "$90, $0D", 2, false ); // BCC Label 2

      addAsm( str_TAY );
      addAsm( str_CLC );

      //addAsm( str_LDA + "$FB", 2, false ); 
      addAsm( str_LDA + "_MUL16_FB", 3, false ); 
      //addAsm( str_LDA + "$FB", 2, false );
      
      addAsm( str_ADC + "MUL16R+2", 3, false );
      addAsm( str_STA + "MUL16R+2", 3, false );
      addAsm( str_TYA );
      addAsm( str_ADC + "_MUL16_FC", 3, false );
      /////addAsm( str_ADC + "$FC", 2, false );
      // label 2
      addAsm( "_MUL16_L2:", 0, true );
      addAsm( str_ROR , 1, false );
      addAsm( str_ROR + "MUL16R+2", 3, false );
      addAsm( str_ROR + "MUL16R+1", 3, false );
      addAsm( str_ROR + "MUL16R", 3, false );
      addAsm( str_DEX );
      
      addAsm( str_BNE + "_MUL16_L1", 2, false );
      //addAsm( str_BYTE + "$D0, $E0", 2, false ); // BNE Label 1
      
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
      addAsm( "_UMULTOP:", 0, true );
      addAsm( str_LSR + "$03", 2, false );
      addAsm( str_BCC + "_UMULSKIP", 2, false );
      addAsm( str_CLC );
      addAsm( str_ADC + "$02", 2, false );
      addAsm( "_UMULSKIP:", 0, true );
      addAsm( str_ASL + "$02", 2, false );
      addAsm( str_CLC );
      addAsm( str_DEX );
      addAsm( str_BNE + "_UMULTOP", 2, false );
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
      addAsm( "BMPMEM:\t\t" + commentmarker + "Get the bitmap mem location from the vic II", 0, true );
      saveReturnAddress();
      // =================================================================================
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$08", 2, false );
      addAsm( str_CLC );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_PHA );
      // =================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }

  if( chrmem_is_needed )
    {
      addAsm( "CHRMEM:\t\t" + commentmarker + "Get the character mem location from the vic II", 0, true );
      saveReturnAddress();
      // =================================================================================
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$0E", 2, false );
      addAsm( str_CLC );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_PHA );
      // =================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }

  if( scrmem_is_needed )
    {
      stack_is_needed = true;
      addAsm( string("SCRMEM:\t\t") + commentmarker + "Get the screen mem location from the vic II", 0, true );

      saveReturnAddress();
      // =================================================================================
      addAsm( str_LDA + "$D018", 3, false );
      addAsm( str_AND + "#$F0", 2, false );
      addAsm( str_CLC );
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_PHA );
      // =================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
    }
  if( bnkmem_is_needed )
    {
      addAsm( string("BNKMEM:\t\t") + commentmarker + "Get the bank memory from the vic II", 0, true );
      saveReturnAddress();
      // =================================================================================
      addAsm( str_LDA + "$DD00", 3, false );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_AND + "#$03", 2, false );
      addAsm( str_CLC );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_ASL );	
      addAsm( str_ASL );
      addAsm( str_ASL );
      addAsm( str_PHA );
      // =================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );


    }
  if( byte2hex_is_needed )
    {
      addAsm( string("BYTE2HEX:\t\t") + commentmarker + string("Display a Hexadecimal Byte"), 0, true );
      saveReturnAddress();
      // =================================================================================
      addAsm( str_CLD );
      addAsm( str_PLA );
      addAsm( str_TAX );
      addComment( string("\t") + str_AND + "#$F0" );
      addComment( string("\t") + str_LSR );
      addAsm( str_ALR + string("#$F0") + commentmarker + "Undocumented Opcode (replaces the two lines above)", 2, false );
      illegal_operations_are_needed = true;
      addAsm( str_LSR );
      addAsm( str_LSR );
      addAsm( str_LSR );

      addAsm( str_CMP + "#$0A", 2, false);
      addAsm( str_BYTE + "$90, $03", 2, false);
      addAsm( str_CLC );
      addAsm( str_ADC + "#$07", 2, false );
      addAsm( str_ADC + "#$30", 2, false);
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_TXA );
      
      addAsm( str_AND + "#$0F", 2, false);
      addAsm( str_CMP + "#$0A", 2, false);

      addAsm( str_BYTE + "$90, $03", 2, false);
      addAsm( str_CLC );
      addAsm( str_ADC + "#$07", 2, false );
      addAsm( str_ADC + "#$30", 2, false);
      addAsm( str_JSR + "$FFD2", 3, false );

      // =================================================================================
      restoreReturnAddress();
      addAsm( str_RTS );
      
    }
  if( byt2str_is_needed  )
    {
      return_addresses_needed = true;
      addAsm( string("BYT2STR:\t\t") + commentmarker + "Turns a 1 byte value into 3 PETSCII chars on stack", 0, true );

      saveReturnAddress();
      //==================================================================================
      addAsm( str_PLA ); // the value to be put into the string

      addAsm( str_LDX + "#$00", 2, false );
      addAsm( "B2SL1:", 0, true );
      
      addAsm( str_SEC );
      addAsm( str_SBC + "#$64", 2, false );
      addAsm( str_BCC + "B2SL2", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "B2SL1", 3, false );
      addAsm( "B2SL2:", 0, true );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$64", 2, false );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$30", 2, false );
      addAsm( str_PHA );
      addAsm( str_TYA );
      addAsm( str_LDX + "#$00", 2, false );


      addAsm( "B2SL3:", 0, true );
      addAsm( str_SEC );
      addAsm( str_SBC + "#$0A", 2, false );
      addAsm( str_BCC + "B2SL4", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "B2SL3", 3, false );
      addAsm( "B2SL4:", 0, true );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$0A", 2, false );
      addAsm( str_TAY );
      addAsm( str_TXA );
      addAsm( str_CLC );
      addAsm( str_ADC + "#$30", 2, false );
      addAsm( str_PHA );
      addAsm( str_TYA );
      addAsm( str_LDX + "#$00", 2, false );

      addAsm( str_TYA );
      addAsm( str_ADC + "#$30", 2, false );
      addAsm( str_PHA );
      
      
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

      // this is the template to use for a built-in function
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

      // this is the template to use for a built-in function
      addAsm( string("DECDIG:\t\t") + commentmarker + "Turn number on stack into a decimal", 0, true );

      // put return address on the stack
      saveReturnAddress();
      //==================================================================================
      addAsm( str_PLA );

      addAsm( str_TAX );
      addAsm( str_DEX );
      addAsm( str_BMI + "DECDIGBK", 2, false);
      addAsm( str_LDA + "#$00", 2, false );
      addAsm( str_CLC );
      addAsm( str_PHP );
      addAsm( str_SED );
      addAsm( "DECDIGLP:", 0, true );
      addAsm( str_ADC + "#$01", 2, false );
      addAsm( str_DEX );
      addAsm( str_BPL + "DECDIGLP", 2, false );
      addAsm( str_PLP );
      addAsm( "DECDIGBK:", 0, true );

      addAsm( str_PHA );
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
      //addAsm( "CLSLOOP:", 0, true );
      addComment( "top-of-loop" );
      addAsm( str_STA + "$0400,X", 3, false );
      addAsm( str_STA + "$0500,X", 3, false );
      addAsm( str_STA + "$0600,X", 3, false );
      addAsm( str_STA + "$06E8,X", 3, false );
      addAsm( str_DEX );
      //addAsm( "BNE CLSLOOP", 2, false );
      addAsm( str_BYTE + "$D0, $F1", 2, false ); // BNE top-of-loop
      addAsm( str_RTS );

    }
  if( mobcpy_is_needed  )
    {
      // a QUICK and DIRTY MEMCPY of 63 BYTES
      addAsm( string("MOBCPY:\t\t") + commentmarker + "Copy 63 bytes from $FB/$FC to $FD/$FE", 0, true );
      addAsm( str_SEI );
      addAsm( str_CLC );
      /* addAsm( str_LDA + "#$01", 2, false ); */
      /* addAsm( str_ADC + "$FB", 2, false ); */
      /* addAsm( str_STA + "$FB", 2, false ); */
      /* addAsm( str_LDA + "#$00", 2, false ); */
      /* addAsm( str_ADC + "$FC", 2, false ); */
      /* addAsm( str_STA + "$FC", 2, false ); */

      addAsm( str_LDY + "#$3F", 2, false );
      addComment( "top-of-loop" );
      addAsm( "MOBCPTOP:", 0, true );
      addAsm( str_CPY + "#$FF", 2, false );
      addAsm( str_BYTE + "$F0, $08" + commentmarker + "BEQ +8", 2, false ); // BEQ bottom-of-loop
      addAsm( str_LDA + "($FB),Y", 2, false );
      addAsm( str_STA + "($FD),Y", 2, false );
      addAsm( str_DEY  );
      addAsm( str_JMP + "MOBCPTOP", 3, false );
      addComment( "bottom-of-loop" );
      addAsm( str_CLI );
      addAsm( str_RTS );

    }
  if( memcpy_is_needed )
    {
      return_addresses_needed = true;

      // this is the template to use for a built-in function
      addAsm( string("MEMCPY:\t\t") + commentmarker + "Copy STACK[0] bytes from $FB/$FC to $FD/$FE", 0, true );
      // save return address from the stack
      saveReturnAddress();
      //==================================================================================
      addAsm( str_PLA );
      addAsm( str_TAY );
      addAsm( "MEMCPL1:", 0, true );
      addAsm( str_CPY + "#$00", 2, false );
      addAsm( str_BEQ + "MEMCPL2", 2, false );
      addAsm( str_LDA + "($FB),Y", 2, false );
      addAsm( str_STA + "($FD),Y", 2, false );
      addAsm( str_DEY, 1, false );
      addAsm( str_JMP + string("MEMCPL1"), 3, false );
      addAsm( "MEMCPL2:", 0, true );
      //==================================================================================
      restoreReturnAddress();
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
      addAsm( str_CLC );
      addAsm( str_EOR + "#$FF", 2, false );
      addAsm( str_ADC + "#$01", 2, false );

      addComment( "The return value is put on the stack here" );
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
      addAsm( "PRN_LOOP:", 0, true );
      addAsm( str_LDA + "($02),Y", 2, false);
      //addAsm( str_CMP + "#$00", 2, false );
      addAsm( str_BEQ + "PRN_END", 2, false );
      addAsm( str_JSR + "$FFD2", 3, false );
      addAsm( str_INY );
      addAsm( str_JMP + "PRN_LOOP", 3, false );
      addAsm( "PRN_END:", 0, true );
      addAsm( str_RTS, 1, false );
    }
  
  if( scanf_is_needed )
    {
      addAsm( string("SCANF:\t\t\t\t") + commentmarker + "Robust Scanf", 0, true );
      //addAsm( "SCANF:\t\t" + commentmarker + "Robust Scanf", 0, true );
      addAsm( commentmarker + "Taken from: https://codebase64.org/doku.php?id=base:robust_string_input", 0, true );
      addAsm( commentmarker + "Code by: Schema", 0, true );
      addAsm( commentmarker + "I modified it _slightly_ to make the naming conventions of the labels", 0, true );
      addAsm( commentmarker + "consistent with the rest of the code.", 0, true );
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
      addAsm( str_BYTE + "$F0, $04" + commentmarker + "BEQ 4", 2, false );
      addAsm( str_INX );
      addAsm( str_JMP + "CHECKALLOWED", 3, false );

      addAsm("INPUTOK:", 0, true );
      addAsm( str_LDA + "LASTCHAR" + commentmarker + "Get the char back", 3, false );
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
      
      if( kick )
	{
	  addAsm( str_BYTE + "$20, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $31, $32, $33, $34, $35, $36, $37, $38, $39, $30, $2E, $2C, $2D, $2B, $21, $23, $24, $25, $26, $28, $29, $2A" + commentmarker + "acceptable PETSCII characters for input", 49, false );
	}
      else
	{
	  addAsm( str_BYTE + "\" ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.,-+!#$%&()*\""+ commentmarker + "acceptable PETSCII characters for input", 49, false );
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
	  addAsm( str_BYTE + "$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00", 16, false );
	}
      else
	{
	  addAsm(str_BYTE + "\"                \"", 16, false );
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
      addComment( "my rendition of a software stack at $CF00" );
      addComment( "Y is not destroyed" );
      addAsm( "STACKTMP:", 0, true );
      addAsm( str_BYTE + string("$00"), 1, false );
      addAsm( "PUSH:", 0, true );
      addAsm( str_STX + "STACKTMP", 3, false );
      addAsm( str_LDX + "$CF00", 3, false );
      addAsm( str_INX );
      addAsm( str_STA + "$CF00,X", 3, false );
      addAsm( str_STX + "$CF00", 3, false );
      addAsm( str_LDX + "STACKTMP", 3, false );
      addAsm( str_RTS );
      addAsm( "POP:", 0, true );
      addAsm( str_STX + "STACKTMP", 3, false );
      addAsm( str_LDX + "$CF00", 3, false );
      addAsm( str_LDA + string("$CF00,X"), 3, false );
      addAsm( str_DEX );
      addAsm( str_STX + "$CF00", 3, false );
      addAsm( str_LDX + "STACKTMP", 3, false );
      addAsm( str_RTS );
    }

  if( illegal_operations_are_needed )
    {
      if( !kick ) cout << ".OPT ILLEGALS" << endl;
    }
  Optimize();
  ProcessComments();
  ProcessVariables();
  ProcessFunctions();
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

/* multicolout hi-res screen  */

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
