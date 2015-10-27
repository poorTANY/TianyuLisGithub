/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */

//Merge Two Sorted Lists
public class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode tmp, p1 = new ListNode(-1);
        p1.next = l1; l1 = p1;
        while(p1.next != null && l2 != null){
            if(p1.next.val > l2.val){
                tmp = l2.next;
                l2.next = p1.next;
                p1.next = l2;
                l2 = tmp;
            }else p1 = p1.next;
        }
        if(p1.next == null && l2 != null)
            p1.next = l2;
        return l1.next;
    }
}