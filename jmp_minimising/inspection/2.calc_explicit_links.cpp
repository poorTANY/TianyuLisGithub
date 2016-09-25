/*
 * O(n^3)
 */

#include <iostream>
#include <string.h>
#include <stdio.h>
#include <algorithm>

using namespace std;
const int N = 1000;

int n;//number of nodes
int m;//number of edges
int dp[N];// dynamic prigramming value

struct Node
{
    int id;
    int h;
	int v[N];
	int w[N];
};
Node node[N];

void readFile();
void init();
int solve();

int main()
{
    memset(node, 0, sizeof(node));
    memset(dp, 0, sizeof(dp));
    
    readFile();
    init();
    cout<<endl<<"the number of explicit links:\n"<<solve()<<endl;
    return 0;
}

void readFile()
{
    freopen("sample.in", "r", stdin);
    cin>>n;
    cout<<"number of nodes:"<<n<<endl;
    for(int i = 0;i < n;i++)
    {
        node[i].id=i;
        cin>>node[i].h;
        cout<<node[i].h<<' ';
    }
    cout<<endl<<"nodes got"<<endl;
    // metrics of nodes
    
    cin>>m;
    cout<<endl<<"number of edges:"<<m<<endl;
    for(int i=0;i<m;i++)
    {
        int a,b,u1,w1;
        cin>>a>>b>>u1>>w1;
        //cout<<a<<' '<<b<<' '<<u1<<' '<<w1<<' '<<endl;
        node[a].w[b]++;
        node[b].w[a]++;
        node[a].v[b] += node[a].h - u1 + w1;
        node[b].v[a] = node[a].w[b] * (node[a].h + node[b].h) - node[a].v[b];
		//if(node[a].v[b]<0 || node[b].v[a]<0 )cout<<a<<' '<<b<<endl;
    }
    cout<<"edges got"<<endl;
    fclose(stdin);
}


void init()
{
    //sort(node, node + n, cmp);
}

int solve()
{
	int ret=0;
    for(int i=1;i<n;i++)
	{
		ret+=node[i-1].w[i];
	}
	return ret;
}