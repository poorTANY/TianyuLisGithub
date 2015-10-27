// Longest Substring Without Repeating Characters
public class Solution {
    public int lengthOfLongestSubstring(String s) {
        boolean[] visited = new boolean[256];
        int first = 0, last = 0, max = 0, length = s.length();
        while(last < length) {
            if(!visited[s.charAt(last)]) {
                visited[s.charAt(last)] = true;
                max = Math.max(max, last++ - first + 1);
            } else {
                while(visited[s.charAt(last)])
                    visited[s.charAt(first++)] = false;
                visited[s.charAt(last++)] = true;
            }
        }
        return max;
    }
}