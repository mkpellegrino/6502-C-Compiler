#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector <string> lines_of_code;
vector <string> labels;

string delim = ":";

bool isin(string s)
{
  bool return_value = false;
  int count = 0;
  
  for( int k = lines_of_code.size(); k >= 0; k-- )
    {
      std::size_t l = lines_of_code[k].find( s );
      if( l !=std::string::npos )
	{
	  //cerr << "[" << l << "] found " << s << " in " << lines_of_code[k] << " on line " << k << endl;
	  count++;
	}
    }
  if( count > 1 )
    {
      return_value = true;
    }
  return return_value;
}


int main(int argc, char** argv)
{
  for( string line; getline( cin, line ); )
    {      
      lines_of_code.push_back( line );
    }

  // now everything is in a vector



  for( int i = 0; i < lines_of_code.size(); i++ )
    {
      string line = lines_of_code[i];
      //if( line[0] == 'L' && line[1] == 'B' && line[2] == 'L' )
      //	{
      //  std::size_t j = line.find(delim);
      //  line.resize(j);
      //  labels.push_back( line );
      //}

      if( line[0] == 'L' && line[1] == 'B' && line[2] == 'L' )
	{
	  std::size_t j = line.find(delim);
	  string line2 = line;
	  
	  line2.resize(j);

	  // if it's a label then look for that label throughout
	  // all of the lines of code
	  // if found... cout it.
	  if( isin(line2) != 0 )
	    {
	      cout << line << endl;
	    }	  
	}
      else if( line[0] == '/' && line[1] == '/' )
	{
	  // iuf it's a comment, don't do anything
	}
      else if( line[0] == ' ' && line[1] == '/' && line[2] == '/' )
	{
	  // iuf it's a comment, don't do anything
	}
      else
	{
	  cout << line << endl;
	}
    }

  for( int i = 0; i < labels.size(); i++ )
    {
      cout << labels[i] << endl;
    }
  
  return 0;
}
