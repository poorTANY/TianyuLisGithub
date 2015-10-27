public class Solution {
    public List<String> summaryRanges(int[] nums) {
        
        List<String> ret=new ArrayList<String>();
        if(nums.length==0)return ret;
        
        int a=nums[0],b=nums[0];
        for (int i=0;i<nums.length-1;i++) {
            if (nums[i+1]==nums[i]+1) b++;
            else {
                add(ret,a,b);
                a=nums[i + 1];
                b=a;
            }
        }
        add(ret,a,b);
        return ret;
    }
    
    private void add(List<String> list, int i, int j) {
        if (i==j) list.add(String.valueOf(i));
        else list.add(i+"->"+j);
    }
    
}