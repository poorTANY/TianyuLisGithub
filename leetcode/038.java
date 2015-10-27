public class Solution {
    public String countAndSay(int n) {
        String start = "1";
        if (n == 1) {
            return start;
        }
        int counter = 1;
        while(counter < n) {
            start = helper(start);
            counter++;
        }
        
        return start;
    }
    
    public String helper(String s) {
        char curr =  s.charAt(0);
        int counter = 0;
        StringBuffer sb = new StringBuffer();
        for(int i=0; i<s.length(); i++) {
            if(s.charAt(i) == curr) {
                counter++;
            } else {
                sb.append(counter);
                sb.append(s.charAt(i-1));
                counter = 1;
                curr = s.charAt(i);
            }
            
        }
        sb.append(counter);
        sb.append(curr);
        return sb.toString(); 
    }
}