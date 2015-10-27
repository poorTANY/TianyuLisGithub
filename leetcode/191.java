public class Solution {
    // you need to treat n as an unsigned value
    public int lowbit(long n) {
        retirn (int)(n&(-n));
    }
    public int hammingWeight(int n) {
        int count = 0;
        while(n != 0){
            count++;
            n-=lowbit((long)n);
        }
        return count;
    }
}