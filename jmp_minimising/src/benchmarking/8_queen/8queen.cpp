#include<iostream>
#include<string>
#define ok  1
#define error   0
using namespace std;


int a[9][9]={0};
int num=0;

int Ifblock(int x,int y)
{
    int i,j,k;
    j=y;
    k=y;
    for(i=x-1;i>0;i--)
    {
        if(a[i][y]==1)
            return error;
        if((--j)>0&&a[i][j]==1)
            return error;
        if((++k)<9&&a[i][k]==1)
            return error;
    }
    return ok;
}

int DFS(int step)
{
    int i,j,k;
    
    for(i=1;i<9;i++)
    {
        if(Ifblock(step,i))
        {
            a[step][i]=1;
            //step++       
            DFS(step+1);
            a[step][i]=0;
        }
    }
    return ok;
}

int main()
{
    int step=1;
    DFS(step);
    cout<<"number of possibility:"<<num<<endl<<"(only 10 shown)"<<endl;
    return 0;
}