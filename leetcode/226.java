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
    
    public TreeNode invertTree(TreeNode root)
    {
        if(root==null)return null;
        
        
        TreeNode temp=root.right;
        root.right=root.left;
        root.left=temp;
        invertTree(root.left);
        invertTree(root.right);
        
        return root;
    }
}