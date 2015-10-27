// binary search
public class Solution {
    public int[] twoSum(int[] nums, int target) {
        int [] ans=new int[2];
        Map<Integer,List<Integer>> map=new HashMap<Integer,List<Integer>>();
        for(int i=0;i<nums.length;i++) {
            if(map.get(nums[i])==null) {
                List<Integer> list=new ArrayList<Integer>();
                list.add(i);
                map.put(nums[i],list);
            } else map.get(nums[i]).add(i);
        }
        if(target%2==0 && map.get(target/2)!=null && map.get(target/2).size()>=2) {
            ans[0]=map.get(target/2).get(0)+1;
            ans[1]=map.get(target/2).get(1)+1;
            Arrays.sort(ans);
            return ans;
        }
        for(int i:map.keySet()) {
            if(i*2==target)continue;
            if(map.get(target-i)!=null) {
                ans[0]=map.get(i).get(0)+1;
                ans[1]=map.get(target-i).get(0)+1;
                Arrays.sort(ans);
                return ans;
            }
        }
        
        return ans;
    }
}