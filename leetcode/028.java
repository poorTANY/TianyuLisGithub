// KMP
public class Solution {
    public int strStr(String haystack, String needle) {
        //KMP
        int n = needle.length(), m = haystack.length();
        int[] key = new int[n];
        for(int i = 1;i < n;i++) {
            int j = key[i-1];
            while(j != 0 && (needle.charAt(i) != needle.charAt(j))) {
                j = key[j-1];
            }
            key[i] = j + (needle.charAt(i) == needle.charAt(j)?1:0);
        }
        
        int i = 0, j = 0;
        while(i < n && j < m) {
            if(i > 0 && needle.charAt(i) != haystack.charAt(j)) i = key[i-1];
            else {
                i += (needle.charAt(i) == haystack.charAt(j)?1:0);
                j++;
            }
        }
        return (i == n?j-n:-1);
    }
}