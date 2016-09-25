/*
 * O(n^3)
 */

#include <iostream>
#include <string.h>
#include <stdio.h>
#include <algorithm>

using namespace std;
const int N = 100;

int top;
int n;//number of nodes
int m;//number of edges
int dp[N],databack[N];// dynamic prigramming value

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
	top=0;
	for(int i=0;i<n;i++)databack[i]=-1;
	
	int tmp=0;
	for(int i=1;i<n;i++)
	{
		int k=top,temp=-1;
		int insert=top;
		do 
		{
			int a,b,c;
			if(databack[k]==-1)
			{
				a=node[k].w[i];
				b=0;
				c=0;
			}
			else
			{
				a=node[k].w[i];
				b=node[i].w[databack[k]];
				c=node[k].w[databack[k]];
			}
			if(temp==-1 || tmp+a+b-c>temp)
			{
				insert=k;
				temp=tmp+a+b-c;
			}
			k=databack[k];
		} while (k!=-1);
		cout<<":"<<insert<<'-'<<i<<endl;
		
		databack[i]=databack[insert];
		databack[insert]=i;
		tmp=temp;
	}
	cout<<"implicit links:"<<tmp;
}

void output()
{
	cout<<endl<<top;
	int k=databack[top];
	for(int i=1;i<n;i++)
	{
		cout<<"->"<<k;
		k=databack[k];
	}
}