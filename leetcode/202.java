public class Solution {
    Set<Integer> set=new HashSet<Integer>();
    public boolean isHappy(int n) {
        if(n==1)return true;
        if(squre(n)==1)return true;
        return false;
    }
    public int squre(int n){
        int sum=0,i=0;
        if (!set.add(n))return -1;
        if(n<4)return n;
        while (n/10!=0){
            i=n%10;
            sum+=i*i;
            n=n/10;
        }
        sum+=n*n;
        return squre(sum);
    }
}