// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

class MinStack {
    StackNode root;
    
    private class StackNode {
        int val;
        int min;
        StackNode next;
        StackNode(int v) { val = v; };
    }
    
    public void push(int x) {
        StackNode xNode = new StackNode(x);
        if (this.root != null) {
            xNode.min = (x < this.root.min) ? x : this.root.min;
        }
        else {
            xNode.min = x;
        }
        xNode.next = this.root;
        this.root = xNode;
    }
    
    public void pop() {
        if (this.root != null) this.root = this.root.next;
    }
    
    public int top() {
        if (this.root != null) return root.val;
        return -1;
    }
    
    public int getMin() {
        if (this.root != null) return this.root.min;
        return -1;
    }
}
