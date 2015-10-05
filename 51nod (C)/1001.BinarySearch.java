/** 51nod 1001
 *  
 *  @author  Tianyu Li
 *  @email   405815927@qq.com
 *  @date    2015-10-5
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

import java.util.Scanner;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.HashMap;
import java.util.*;
import java.math.*;
public class Untitled {
	long[] a;
	long k;
	int n;
	public static void main(String[] args){
		Untitled o=new Untitled();
		o.in();
		o.solve();
	}
	
	void in() {
		Scanner in=new Scanner(System.in);
		k=in.nextLong();
		n=in.nextInt();
		a=new long[n];
		for(int i=0;i<n;i++) {
			a[i]=in.nextLong();
		}
		Arrays.sort(a);
	}
	
	void solve() {
		int v=0;
		for(int i=0;i<n;i++) {
			if(a[i]*2>=k)break;
			if(search(k-a[i])){
				System.out.println(""+a[i]+' '+(k-a[i]));
				v=1;
			}
		}
		if(v==0)System.out.println("No Solution");
	}
	
	boolean search(long target) {
		int l=0,r=a.length-1;
		while(l<=r) {
			long tm=a[(l+r)/2];
			if(tm==target)return true;
			if(tm>target)r=(l+r)/2-1;
	        else l=(l+r)/2+1;
	        }
	    return false;
	 }
		
}