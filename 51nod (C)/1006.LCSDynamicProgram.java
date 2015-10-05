/** 51nod 1006
 *  
 *  @author  Tianyu Li
 *  @email   405815927@qq.com
 *  @date    2015-10-5
 *  @github  http://github.com/poorTANY/TianyuLisGithub
 */

import java.util.Scanner;
import java.util.Arrays;
import java.math.*;
public class Untitled {

	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		Untitled untitled=new Untitled();
		String a=in.nextLine();
		String b=in.nextLine();
		System.out.println(untitled.solve(a,b));
	}
		
	String solve(String a,String b){
		int[][] dp=new int[a.length()][b.length()];
		int[][] tmp=new int[a.length()][b.length()];
		
		for(int i=0,j=0;j<b.length();j++)
			if(a.charAt(i)==b.charAt(j)) {
				dp[i][j]=1;
				tmp[i][j]=1;
			}
			else {
				dp[i][j]=0;
			}
		for(int i=1,j=0;i<a.length();i++)
			if(a.charAt(i)==b.charAt(j)) {
				dp[i][j]=1;
				tmp[i][j]=1;
			}
			else {
				dp[i][j]=0;
				tmp[i][j]=2;
			}
		
		for(int i=1;i<a.length();i++)
			for(int j=1;j<b.length();j++){
				if(a.charAt(i)==b.charAt(j)){
					tmp[i][j]=1;
					dp[i][j]=dp[i-1][j-1]+1;
				}
				else if(dp[i-1][j]>dp[i][j-1]){
						dp[i][j]=dp[i-1][j];
						tmp[i][j]=2;
					}
					else{
						dp[i][j]=dp[i][j-1];
					}
			}
		
		int i=a.length()-1,j=b.length()-1,mark=0;
		char[] ans=new char[dp[i][j]+1];
		while(!(i<0 || j<0)) {
			if(tmp[i][j]==1) {
				ans[mark++]=a.charAt(i);
				i--;
				j--;
				continue;
			}
			if(tmp[i][j]==2) {
				i--;
			}
			else j--;
		}
		
		String ret="";
		for(i=mark-1;i>=0;i--)ret+=ans[i];
		return ret;
	}
}