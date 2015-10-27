// Intersection of Two Linked Lists

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        int lenA = 0, lenB = 0;
        ListNode currA = headA, currB = headB;
        while(currA != null) {
            lenA++;
            currA = currA.next;
        }
        while(currB != null) {
            lenB++;
            currB = currB.next;
        }
        currA = headA;
        currB = headB;
        if(lenA > lenB) {
            for(int i=0; i<lenA-lenB; i++)
                currA = currA.next;
        } else {
            for(int i=0; i<lenB-lenA; i++)
                currB = currB.next;
        }
        while(currA != currB) {
            currA = currA.next;
            currB = currB.next;
        }
        return currA;
    }
}