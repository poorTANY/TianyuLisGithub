/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    
    public int maxDepth(TreeNode root) {
        if(root==null)return 0;
        if(root.left==null && root.right==null)return 1;
        if(root.left==null)return maxDepth(root.right)+1;
        if(root.right==null)return maxDepth(root.left)+1;
        return Math.max(maxDepth(root.left),maxDepth(root.right))+1;
    }
    public boolean isBalanced(TreeNode root) {
        if(root==null)return true;
        return Math.abs(maxDepth(root.right)-maxDepth(root.left))<=1 && isBalanced(root.left) && isBalanced(root.right);
    }
}