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
    List<String> list;
    public void search(String str,TreeNode node){
        if(node==null)return;
        str=str+node.val;
        if(node.left!=null){search(str+"->",node.left);}
        if(node.right!=null){search(str+"->",node.right);}
        if(node.left==null && node.right==null)list.add(str);
    }
    
    public List<String> binaryTreePaths(TreeNode root) {
        list=new ArrayList<String>();
        search("",root);
        return list;
    }
}