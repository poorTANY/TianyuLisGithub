public class Solution {
    public void moveZeroes(int[] nums) {
        int r=0;
        for(int l=0;l<nums.length;l++) {
            if(nums[l]!=0) nums[r++]=nums[l];
        }
        for(;r<nums.length;r++)nums[r]=0;
    }
}