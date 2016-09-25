#include <iostream>
#include <string.h>
#include <stdio.h>

using namespace std;
const int N = 100000;

bool visit[N];
int head[N],degree[N];
int Q[N],cnt,num;

struct EdgeNode
{
    int from;
    int to;
};
EdgeNode Edge[N];

void init()
{
    cnt = 0;
    memset(visit, false, sizeof(visit));
    memset(head, -1, sizeof(head));
    memset(degree, 0, sizeof(degree));
}

void add(int u,int v)
{
    degree[v]++;
    Edge[cnt].from = v;
    Edge[cnt].to = head[u];
    head[u] = cnt++;
}

void TopSort(int n)
{
    num = 0;
    for(int i=1;i<=n;i++) //find an unvisited node
        if(!degree[i] && visit[i])
            Q[num++] = i;
    for(int i=0;i<num;i++)
    {
        //refresh degree
        for(int k = head[Q[i]];k != -1;k = Edge[k].to)
        {
            degree[Edge[k].from]--;
            //add the nodes with degree 0
            if(!degree[Edge[k].from])
                Q[num++] = Edge[k].from;
        }
    }
}

int main()
{
    int n,m;
    while(cin>>n>>m)
    {
        cout<<"n:"<<n<<" m:"<<m<<endl;
        init();
        while(m--)
        {
            int x,y;
            cin>>x>>y;
            visit[x] = true;
            visit[y] = true;
            add(x,y);
        }
        TopSort(n);
        
        cout<<"ans:"<<endl;
        for(int i=0;i<num;i++)
            cout<<Q[i]<<" ";
        cout<<endl;
    }
    return 0;
}