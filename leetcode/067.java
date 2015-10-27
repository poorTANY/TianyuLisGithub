public class Solution {
    public String addBinary(String a, String b) {
        StringBuilder sb = new StringBuilder();
        int ai = a.length() - 1;
        int bi = b.length() - 1;
        int carry = 0;
        int sum = 0;
        
        while (ai >= 0 || bi >= 0){
            int x = ai >= 0 ? a.charAt(ai) - '0' : 0;
            int y = bi >= 0 ? b.charAt(bi) - '0' : 0;
            sum = x ^ y ^ carry;
            carry = x + y + carry > 1 ? 1 : 0;
            sb.insert(0, sum);
            ai--;
            bi--;
        }
        
        if (carry == 1) sb.insert(0, 1);
        return sb.toString();
    }
}