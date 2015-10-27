/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

// same tree
public class Solution {
    public boolean isSameTree(TreeNode a, TreeNode b) {
        if(a==null && b==null)return true;
        if(a==null)return false;
        if(b==null)return false;
        if(a.val != b.val)return false;
        if(a.left==null && b.left==null)return isSameTree(a.right,b.right);
        if(b.right==null && a.right==null)return isSameTree(b.left,a.left);
        return (isSameTree(a.left,b.left) && isSameTree(a.right,b.right));
    }
}