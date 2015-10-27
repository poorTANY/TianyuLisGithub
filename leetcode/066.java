public class Solution {
    public int[] plusOne(int[] digits) {
        if(digits == null) return null;
        return plusOneHelper(digits, digits.length - 1);
    }
    
    public int[] plusOneHelper(int []d, int digit){
        if(digit == -1){
            int [] nd = new int[d.length + 1];
            nd[0] = 1;
            return nd;
        }else{
            d[digit] = (d[digit] + 1) % 10;
            if(d[digit] > 0)
                return d;
            else return plusOneHelper(d, digit - 1);
        }
    }
}