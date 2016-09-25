/*
 * O(n^2)
 */

#include <iostream>
#include <string.h>
#include <stdio.h>

using namespace std;
const int N = 1000;
const int K = 100;

int n;//number of nodes
int m;//number of edges
int h[N],l[N][N];//number of lines in each node
int v[N][N],w[N][N];//metrics of edges

void readFile();
void init();
int solve();
bool evaluate(int, int);

int main()
{
    memset(h, 0, sizeof(h));
    memset(l, 0, sizeof(l));
    memset(v, 0, sizeof(v));
    memset(w, 0, sizeof(w));
    
    readFile();
    init();
    cout<<endl<<"number of long jump:"<<solve()<<endl;
    return 0;
}

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


void init()
{
    for(int i = 0;i < n;i++)
        for(int j = i + 1;j < n;j++)
        {
            if (j == i + 1)
                l[i][j] = 0;
            else
                l[i][j] = l[i][j-1] + h[j-1];
            cout<<i<<' '<<j<<';'<<l[i][j]<<endl;
        }
}

int solve()
{
    int ret = 0;
    for(int i = 0;i < n;i++)
        for(int j = i + 1;j < n;j++)
        {
            if(evaluate(v[i][j] + (w[i][j] * l[i][j]), w[i][j]))
                ret += w[i][j];
        }
    return ret;
}

bool evaluate(int value, int weight)
{
    if(value > K * weight) return weight;
	return 0;
}