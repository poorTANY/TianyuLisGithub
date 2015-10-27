/* The isBadVersion API is defined in the parent class VersionControl.
 boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        if(n==0)return 0;
        int l=1,r=n;
        while(l!=r) {
            int m=l+((r-l)>>1);
            if(isBadVersion(m))r=m;
            else l=m+1;
        }
        return l;
    }
}