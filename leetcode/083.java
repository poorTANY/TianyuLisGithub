/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */

// Remove Duplicates from Sorted List
public class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        if(head==null) return null;
        
        if(head.next==null) return head;
        
        while(head.next!=null && head.val == head.next.val){
            head = head.next;
        }
        
        head.next = deleteDuplicates(head.next);
        return head;
        
    }
}