/************************************************************
 
 FileName: 1.calc_line_of_jumpings.cpp
 Author: Tianyu Li
 Description: calculate overall number of jumpings in given math model
 Function List:
 1.readFile() //read graph data from script
 2.init() // pre-calculate and initialise data
 3.solve() // calculate overall cost of jumps
 History:
 Tianyu Li build this moudle
 
 ***********************************************************/

#include <iostream>
#include <string.h>
#include <stdio.h>

using namespace std;
const int N = 1000;

int n;//number of nodes
int m;//number of edges
int h[N],l[N][N];//number of lines in each node
int v[N][N],w[N][N];//metrics of edges

void readFile();
void init();
int solve();

int main()
{
    memset(h, 0, sizeof(h));
    memset(l, 0, sizeof(l));
    memset(v, 0, sizeof(v));
    memset(w, 0, sizeof(w));
    
    readFile();
    init();
    cout<<endl<<"total line number of jumping:"<<solve()<<endl;
    return 0;
}


/*************************************************
 Function: readFile()
 Description: read graph data from script sample.in
 Calls: -
 Called By: main()
 Table Accessed: v[N][N],w[N][N],h[N],l[N][N]
 Table Updated: v[N][N],w[N][N],h[N],l[N][N]
 Input: file - sample.in
 Output: -
 Return: -
 *************************************************/
void readFile()
{
    freopen("sample.in", "r", stdin);
    cin>>n;
    cout<<"number of nodes:"<<n<<endl;
    for(int i = 0;i < n;i++)
    {
        cin>>h[i];
        cout<<h[i]<<' ';
    }
    cout<<endl<<"nodes got"<<endl;
    // metrics of nodes
    
    cin>>m;
    cout<<endl<<"number of edges:"<<m<<endl;
    for(int i=0;i<m;i++)
    {
        int a,b,u1,w1;
        cin>>a>>b>>u1>>w1;
        cout<<a<<' '<<b<<' '<<u1<<' '<<w1<<' '<<endl;
        w[a][b]++;
        w[b][a]++;
        v[a][b] += h[a] - u1 + w1;
        v[b][a] = w[a][b] * (h[a] + h[b]) - v[a][b];
    }
    cout<<"edges got"<<endl;
    fclose(stdin);
}

/*************************************************
 Function: init()
 Description: pre-calculate and initialise data
 Calls: -
 Called By: main()
 Table Accessed: v[N][N],w[N][N],h[N],l[N][N]
 Table Updated: v[N][N],w[N][N],h[N],l[N][N]
 Input: -
 Output: -
 Return: -
 *************************************************/
void init()
{
    for(int i = 0;i < n;i++)
        for(int j = i + 1;j < n;j++)
        {
            if (j == i + 1)
                l[i][j] = 0;
            else
                l[i][j] = l[i][j-1] + h[j-1];
        }
}

/*************************************************
 Function: solve()
 Description: calculate overall cost of jumps
 Calls: -
 Called By: main()
 Table Accessed: v[N][N],w[N][N],h[N],l[N][N]
 Table Updated: v[N][N],w[N][N],h[N],l[N][N]
 Input: -
 Output: the overall cost of jumps
 Return: the value of jumping cost
 *************************************************/
int solve()
{
    //for calculating cost of jumps
    int ret = 0;
    for(int i = 0;i < n;i++)
        for(int j = i + 1;j < n;j++)
        {
            ret += v[i][j] + (w[i][j] * l[i][j]);
        }
    return ret;
}