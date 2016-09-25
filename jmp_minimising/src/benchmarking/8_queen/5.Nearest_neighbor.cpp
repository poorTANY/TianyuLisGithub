/*
 * O(n^3)
 */

#include <iostream>
#include <string.h>
#include <stdio.h>
#include <algorithm>

using namespace std;
const int N = 100;

int n;//number of nodes
int m;//number of edges
int dp[N],databack[N][N];// dynamic prigramming value

struct Node
{
    int id;
    int h;
	int v[N];
	int w[N];
	bool mark[N];
};
Node node[N],dpNode[N][N];

bool cmp (Node a, Node b)
{
    return a.h > b.h;
}

void readFile();
void init();
void output();
void solve();
int leftJoint(Node a, Node b);
int rightJoint(Node a,Node b);
Node merge(Node a,Node b);

int main()
{
    memset(node, 0, sizeof(node));
    memset(dpNode, 0, sizeof(dpNode));
    memset(dp, 0, sizeof(dp));
    
    readFile();
    init();
	solve();
	output();
    return 0;
}

void readFile()
{
    freopen("8queen.in", "r", stdin);
    cin>>n;
    cout<<"number of nodes:"<<n<<endl;
    for(int i = 0;i < n;i++)
    {
        node[i].id=i;
		node[i].mark[i]=1;
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
        //node[b].w[a]++;
        node[a].v[b] += node[a].h - u1 + w1;
        //node[b].v[a] = node[a].w[b] * (node[a].h + node[b].h) - node[a].v[b];
		//if(node[a].v[b]<0 || node[b].v[a]<0 )cout<<a<<' '<<b<<endl;
    }
    cout<<"edges got"<<endl;
    fclose(stdin);
}


void init()
{
    //sort(node, node + n, cmp);
}

void solve()
{	
	bool mark[n];
	for(int i=0;i<n;i++)
	{
		databack[i][0]=i;
		memset(mark,0,sizeof(mark));
		mark[i]=1;
		int k=1,now=i,tmp=-1,next;
		while(k++<n)
		{
			tmp=-1;
			mark[now]=1;
			for(int j=0;j<n;j++)
			{
				if(mark[j]==0 && (tmp==-1 || node[now].w[j]>tmp))
				{
					
					tmp=node[now].w[j];
					next=j;
				}
			}
			cout<<next<<' ';
			dp[i]+=tmp;
			databack[i][k-1]=next;
			mark[next]=1;
			now=next;
		}cout<<':'<<dp[i]<<endl;
	}
}

void output()
{
	int k=-1,m=0;
	for(int i=0;i<n;i++)
	{
		if(k==-1 || dp[i]>k)
		{
			k=dp[i];
			m=i;
		}
	}
	cout<<endl<<"lines:"<<dp[m]<<endl<<m;
	for(int i=1;i<n;i++)
	{
		cout<<"->"<<databack[m][i];
	}
}