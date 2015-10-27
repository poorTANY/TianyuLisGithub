// binary search
public class Solution {
    public int searchInsert(int[] nums, int target) {
        int l=0,r=nums.length;
        while(r!=l){
            int tm=nums[(l+r)/2];
            if(tm==target)return (l+r)/2;
            if(tm>target)r=(l+r)/2;
            else l=(l+r)/2+1;
        }
    return r;
    }
}