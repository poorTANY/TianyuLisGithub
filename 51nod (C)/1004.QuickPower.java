/** 51nod 1004
 *  
 *  @author  Tianyu Li
 *  @email   405815927@qq.com
 *  @date    2015-10-5
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

import java.util.Scanner;
public class Main{
	
	//quick power
 	public static int pow(int a,int b,int mod){
     	int ret=1;
     	a=a%mod;
     	while(b!=0) {
       		if((b&1)==1)ret=(ret*a)%mod;
         	a=(a*a)%mod;
         	b>>=1;
     	}
     	return ret;
 	}
 
 	public static void main(String[] args){
  		Scanner in=new Scanner(System.in);
  		int n=in.nextInt();
  
  		System.out.println(pow(n,n,10));  
 	}
}