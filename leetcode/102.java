//Binary Tree Level Order Traversal

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
    List<List<Integer>> ret;
    public List<List<Integer>> levelOrder(TreeNode root) {
        
        ret=new ArrayList<List<Integer>>();
        if(root==null)return ret;
        search(root,0);
        return ret;
    }
    public void search(TreeNode root,int i) {
        if(ret.size()<=i) {
            List<Integer> tmp=new ArrayList<Integer>();
            ret.add(tmp);
        }
        
        ret.get(i).add(root.val);
        
        if(root.left!=null)
            search(root.left,i+1);
        if(root.right!=null)
            search(root.right,i+1);
    }
}