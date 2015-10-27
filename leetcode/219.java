public class Solution {
    
    
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        int[] a;
        a=new int[nums.length];
        for(int i=0;i<nums.length;i++) {
            if(map.get(nums[i])!=null)return true;
            map.put(nums[i],1);
            if(i-k>=0)map.remove(nums[i-k],1);
        }
        return false;
    }
}