/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

// Symmetric Tree
public class Solution {
    public boolean IsSymmetric(TreeNode a,TreeNode b) {
        if(a==null && b==null)return true;
        if(a==null)return false;
        if(b==null)return false;
        if(a.val != b.val)return false;
        if(a.left==null && b.right==null)return IsSymmetric(a.right,b.left);
        if(b.left==null && a.right==null)return IsSymmetric(b.right,a.left);
        return (IsSymmetric(a.left,b.right) && IsSymmetric(a.right,b.left));
    }
    public boolean isSymmetric(TreeNode root) {
        if(root==null)return true;
        if(root.left==null &&root.right==null)return true;
        return IsSymmetric(root.left,root.right);
    }
}