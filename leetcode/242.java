public class Solution {
    public boolean isAnagram(String s, String t) {
        char[] as=s.toCharArray(),at=t.toCharArray();
        Arrays.sort(as);
        Arrays.sort(at);
        s=String.valueOf(as);
        t=String.valueOf(at);
        return String.valueOf(as).equals(String.valueOf(at));
    }
    
}