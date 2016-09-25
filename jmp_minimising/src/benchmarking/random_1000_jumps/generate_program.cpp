
/************************************************************
 
 FileName: generate_program.cpp
 Author: Tianyu Li
 Description: generate different order assembly code
 Function List:
 1.generate() //decide the order
 2.writeFile() //writing the assembly code
 History:
 Tianyu Li build this moudle
 
 ***********************************************************/

#include <iostream>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <algorithm>

using namespace std;

// array record the order of list in graph
int order[100001];
// array for marking the vertices
bool mark[100001];

void writeFile();//for writing assembly code
void generate();//generate the order of list

int main()
{
    
    generate();
	writeFile();
    return 0;
}

/*************************************************
 Function: writeFile()
 Description: writing assembly code into .s file
 Calls: -
 Called By: main()
 Table Accessed: oeder[]
 Table Updated: -
 Input: -
 Output: assembly code into .s file
 Return: -
 *************************************************/
void writeFile()
{
    freopen("code", "w", stdout);
    for(int i=1;i<=9999;i++)
	{
		cout<<"LBB0_"<<i<<":\n";
		cout<<"	cmpl	$10000, -4(%rbp)\n";
		cout<<"	jge	LBB0_10000\n";
		cout<<"	movl	-4(%rbp), %eax\n";
		cout<<"	addl	$1, %eax\n";
		cout<<"	movl	%eax, -4(%rbp)\n";
		cout<<"	jmp	LBB0_"<<i+1<<"\n";
	}
    fclose(stdout);
}

/*************************************************
 Function: generate
 Description: gernerate sequence for 1000 vertices
 Calls: Math.rand()
 Called By: main()
 Table Accessed: order[], mark[]
 Table Updated: order[]
 Input: -
 Output: -
 Return: -
 *************************************************/
void generate()
{
    memset(mark,0,sizeof(mark));
	
	mark[1]=1;
	int before=1;
	
	for(int i=1;i<=9998;i++)
	{
		int imp=rand()%(9999-i),k=1,j=1;
		//cout<<imp<<' ';
		while(mark[j])j++;
		
		while (imp!=0) {
			if(mark[j]==0){
				imp--;
				if(imp==0)continue;
			}
			j++;
		}
		
		//cout<<j<<endl;
		order[before]=j;
		mark[j]=1;
		before=j;
	}
	
	int j=1;
	while(mark[j])j++;
	order[before]=j;
	//cout<<j<<endl;
}