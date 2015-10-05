/** 51nod 1019
 *  
 *  @author  Tianyu Li
 *  @email   405815927@qq.com
 *  @date    2015-10-5
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

import java.util.Scanner;
import java.util.Arrays;

class struct implements Comparable<struct>{
	int x,n;
	public int compareTo(struct A) {
		return this.x-A.x;
	}
}

public class Untitled {
	static int[] tree;
	static int n;
	
	static int lowbit(int i) {return i&(-i);}
	static int sum(int i) {
		int ret=0;
		while(i>0){
			ret+=tree[i];
			i-=lowbit(i);
		}
		return ret;
	}
	static void add(int i) {
		while(i<=n) {
			tree[i]++;
			i+=lowbit(i);
		}
	}
	
	public static void main(String[] args) {
		Scanner in=new Scanner(System.in);
		n=in.nextInt();
		struct[] a=new struct[n];
		tree=new int[n+1];
		for(int i=0;i<n;i++) {
			a[i]=new struct();
			a[i].x=in.nextInt();
			a[i].n=i;
		}
		
		Arrays.sort(a);
		int ans=0;
		for(int i=n-1;i>=0;i--) {
			ans+=sum(a[i].n);
			add(a[i].n+1);
		}
		System.out.println(ans);
	}
}