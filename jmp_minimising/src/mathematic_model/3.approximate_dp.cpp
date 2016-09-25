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
int dp[N][N],databack[N][N];// dynamic prigramming value

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
    freopen("sample.in", "r", stdin);
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

void solve()
{	
	for(int i=0;i<n;i++)
		for(int j=0;j<n;j++)
		{
			dp[i][j]=-1;
			databack[i][j]=-1;
		}
		
	for(int i=0;i<n;i++)
	{
		dpNode[0][i]=node[i];
		dp[0][i]=0;
	}
	
	for(int i=1;i<n;i++)
	{
		for(int j=0;j<n;j++)
		{
			for(int k=0;k<n;k++)
			{
				if(dpNode[i-1][k].mark[j] == 0 && dp[i-1][k]!=-1 &&
				   (dp[i][j] == -1 ||
				   leftJoint(node[j],dpNode[i-1][k])>dp[i][j] ))
				{
					databack[i][j]=k;
					dp[i][j]=leftJoint(node[j],dpNode[i-1][k])+dp[i-1][k];
					dpNode[i][j]=merge(node[j],dpNode[i-1][k]);
				}
			}
			//cout<<databack[i][j]<<' ';
		}
		//cout<<endl;
	}
}

int leftJoint(Node a, Node b)
{
	return b.w[a.id]*(a.h+b.h)-b.v[a.id];
}


Node merge(Node a, Node b)
{
	Node ret=a;
	ret.h = a.h + b.h;
	ret.mark[a.id]=1;
	ret.mark[b.id]=1;
	for(int i=0;i<n;i++)
	{
		ret.mark[i]=a.mark[i]||b.mark[i];
		ret.v[i]=a.v[i]+b.v[i]+b.h*a.w[i];
		ret.w[i]=a.w[i]+b.w[i];
	}
	ret.w[a.id]=0;
	ret.w[b.id]=0;
	ret.v[a.id]=0;
	ret.v[b.id]=0;
	return ret;
}

void output()
{
	int k=0,m=0;
	for(int i=0;i<n;i++)
	{
		if(dp[n-1][i]!=-1 && dp[n-1][i]>k)
		{
			k=dp[n-1][i];
			m=i;
		}
	}
	cout<<endl<<"lines:"<<k<<endl<<m+1;
	for(int i=n-1;i>0;i--)
	{
		cout<<"->"<<databack[i][m]+1;
		m=databack[i][m];
	}
}