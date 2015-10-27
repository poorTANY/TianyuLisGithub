public class Solution {
    public int climbStairs(int n) {
        if(n == 0)  return 0;
        if(n == 1 ) return 1;
        if(n == 2) return 2;
        int step1 = 1, step2 = 2;
        int temp;
        for(int i=3; i<=n; i++){
            temp = step1;
            step1 = step2;
            step2 += temp;
        }
        return step2;
    }
}