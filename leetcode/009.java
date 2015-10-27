//Determine whether an integer is a palindrome without extra space.

public class Solution {
    public boolean isPalindrome(int x) {
        if(x<0) {
            return false;
        }
        
        int k = 1;
        while(x/k>9){
            k = k * 10;
        }
        
        int y = x;
        while(y != 0) {
            if(x/k != y%10) {
                return false;
            }
            x = x - (x/k)*k;
            y = y/10;
            k = k/10;
        }
        
        return true;
    }
}