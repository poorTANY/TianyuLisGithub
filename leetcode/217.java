public class Solution {
    public boolean containsDuplicate(int[] nums) {
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        int[] a;
        a=new int[nums.length];
        for(int i=0;i<nums.length;i++) {
            if(map.get(nums[i])!=null)return true;
            map.put(nums[i],1);
        }
        return false;
        
    }
}