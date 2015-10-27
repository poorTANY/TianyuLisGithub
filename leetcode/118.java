// Given numRows, generate the first numRows of Pascal's triangle.

public class Solution {
    public List<List<Integer>> generate(int numRows) {
        List<List<Integer>> list = new ArrayList<List<Integer>>();
        if (numRows <1) return list;
        
        List<Integer> row0= new ArrayList<Integer>();
        row0.add(1);
        list.add(row0);
        if (numRows == 1)  return list;
        
        List<Integer> row1= new ArrayList<Integer>();
        row1.add(1); row1.add(1);
        list.add(row1);
        if (numRows == 2)  return list;
        
        for (int i = 2; i < numRows; i++)  {
            List<Integer> newRow= new ArrayList<Integer>();
            newRow.add(1);
            for (int j = 1; j< i; j++)
                newRow.add(list.get(i-1).get(j-1) +list.get(i-1).get(j));
            newRow.add(1);
            list.add(newRow);
        }
        
        return list;
    }
}