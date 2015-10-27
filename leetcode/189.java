public class Solution {
    public void rotate(int[] nums, int k) {
        k %= nums.length;
        if(k<=0) return;
        int index = k, loopHead = 0, curr = nums[0];
        for(int count=0;count<nums.length;count++){
            if(index==loopHead){ //loop detected
                nums[index] = curr; //set the value of loopHead.
                loopHead++; //move 1 step further to jump out of loop
                curr = nums[++index]; //This is the head of new loop
                index = (index+k)%nums.length;
            }
            else{ //each time go k steps further
                int tmp = nums[index];
                nums[index] = curr;
                curr = tmp;
                index = (index+k)%nums.length;
            }
        }
    }
}