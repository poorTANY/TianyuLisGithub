public class Solution {
    public int lengthOfLastWord(String s) {
        if (s.length() == 0 || s.split("\\ ").length == 0) return 0;
        return s.split("\\ ")[s.split("\\ ").length - 1].length();
    }
}