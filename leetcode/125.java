// Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.


public class Solution {
    public boolean isPalindrome(String s) {
        if(s == null) return true;
        for(int i = 0, j = s.length() - 1; i < j ; i++,j--){
            while(!isLegal(s.charAt(i)) && i < j)i++;
            while(!isLegal(s.charAt(j)) && i < j)j--;
            int temp = s.charAt(i) - s.charAt(j);
            if(temp != 0 && temp != 32 && temp != -32) return false;
        }
        return true;
    }
    public boolean isLegal(char c){
        return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z' || (c >= '0' && c <= '9'));
    }
}