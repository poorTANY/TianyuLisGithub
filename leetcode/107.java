// Binary Tree Level Order Traversal II

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
    List<List<Integer>> ret,ans;
    Stack<List<Integer>> v;
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        
        ret=new ArrayList<List<Integer>>();
        ans=new ArrayList<List<Integer>>();
        v=new Stack<List<Integer>>();
        if(root==null)return ret;
        search(root,0);
        while(ret.size()>0){
            v.push(ret.get(0));
            ret.remove(0);
        }
        while(v.size()>0){
            ans.add(v.pop());
        }
        
        return ans;
    }
    public void search(TreeNode root,int i) {
        if(ret.size()<=i) {
            List<Integer> tmp=new ArrayList<Integer>();
            ret.add(tmp);
        }
        
        if(root.left!=null)
            search(root.left,i+1);
        if(root.right!=null)
            search(root.right,i+1);
        ret.get(i).add(root.val);
    }
}