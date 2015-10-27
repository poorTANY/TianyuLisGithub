public class Solution {
    public String convertToTitle(int n) {
        String res="";
        while(n>0) {
            n--;
            res = (char)(n%26+65) + res;
            n=(n/26);
        }
        return res;
    }
}