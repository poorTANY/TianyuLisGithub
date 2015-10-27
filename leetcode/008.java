public class Solution {
    public int myAtoi(String str) {
        str=str.trim();
        
        long[] p10 = new long[20];
        long ans=0;
        int sign=0, le = str.length();
        char c=' ';
        
        //checks if the string is empty after trimming
        if(le==0) return 0;
        
        //check if there is a sign
        if(str.charAt(0) == '-' || str.charAt(0)=='+'){
            sign = 1;
            c=str.charAt(0);
        }
        
        //powers of 10
        p10[0]=1;
        for(int i=1; i<20; i++)
            p10[i]=p10[i-1]*10;
        
        
        
        boolean sal=true, fp=false;
        int j;
        int ini=sign;
        
        //this loop stores the initial valid nonzero digit and
        //the length of the valid string to be converted
        for( j=sign; sal && j<le; j++){
            if(str.charAt(j)<'0' || str.charAt(j)>'9'){
                sal=false;
                break;
            }
            if(str.charAt(j)=='0' && !fp) ini=j;
            if(str.charAt(j)>'0')  fp=true;
        }
        
        if(!sal) le=j;
        
        //if the string is too long, return MAX or MIN Integer value
        if(le-ini>10){
            if(sign==0) return 2147483647;
            else if(c=='-') return -2147483648;
            else return 2147483647;
        }
        
        
        //convert the number
        for(int i=le-1 ; i>=ini; i--)
            ans += (str.charAt(i)-'0')*p10[le-1-i];
        
        
        //validates again if the converted number is in the Integer range
        if(sign==0) return (int)Math.min(ans, (long)2147483647);
        else if(c=='-') return (int)Math.max(-ans, (long)-2147483648);
        else return (int)Math.min(ans, (long)2147483647);
        
        
    }
}