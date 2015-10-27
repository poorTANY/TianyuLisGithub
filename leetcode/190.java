public class Solution {
    // you need treat n as an unsigned value
    public int reverseBits(int n) {
        int res = 0;
        int count = 31;
        while (n != 0) {
            if ((n & 1) == 1) {
                res = res + (1 << count);
            }
            n >>>= 1;
            count--;
        }
        
        return res;
    }
}