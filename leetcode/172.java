// Given an integer n, return the number of trailing zeroes in n!.
public class Solution {
    public int trailingZeroes(int n) {
        if(n<5)
            return 0;
        
        int x =5;
        int zero =0;
        while(x <= n/5){
            zero += n/x;
            x = x*5;
        }
        zero += n/x;
        return zero;
    }
}