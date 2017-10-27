/*
Grammar:

E->TE'
E'->+TE'|epsilon
T->FT'
T'->*FT'|epsilon
F->(E) | id
*/



#include<iostream>
#include<string.h>
#include<ctype.h>

using namespace std;

//define all the functions else create class
char input[10];
int i,error;
void E();
void T();
void Edash();
void Tdash();
void F();

int main()
{
	i = 0;
	error = 0;
	
	cout<<"Enter the Expression to evaluate- "<<endl;
	cin>>input;

	//start parsing
	E();
	if(strlen(input)==i &&(error==0))
		cout<<input<<" String is Accpeted"<<endl;
	else 
		cout<<input<<" String in Not Accepted"<<endl;

	return 0;
}


// First Rule - E->TE' calls Functions T and E'
void E()
{
	T();
	Edash();
}

//Edash has two operations, E'->+TE'|epsilon;  either +TE' or 'nothing'. 
//differentiate bw two operations by checking current input symbol with '+'
void Edash()
{
	if(input[i] == '+')
	{
		i++;
		T();
		Edash();
	}
}

//same as E, calls other functions
void T()
{
	F();
	Tdash();
}

//Same as Edash, checks for '*'
void Tdash()
{
	if(input[i] == '*')
	{
		i++;
		F();
		Tdash();	
	}
}

//isalnum - function from ctype.h checks if thing in parameter is alphanumeric or not
//isalnum checks for 'id'
//other part checks for (E), error = 1 indicates expression is not as per the grammer rules
void F()
{
	if(isalnum(input[i]))
		i++;
	else if(input[i] == '(')
	{
		i++;
		E();
		if(input[i] == ')')
			i++;
		else 
			error = 1;		
	}
	else 	
		error = 1;

}


/*


to change grammer, 
	create different functions for each symbol in grammer.
	function with terminators or whatever it is called, should have validators to check what part of rule is matched

vimp ->> decalre functions before defination
*/
