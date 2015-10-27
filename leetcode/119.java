// Given an index k, return the kth row of the Pascal's triangle.

public class Solution {
    public List<Integer> getRow(int rowIndex) {
        List<List<Integer>> list = new ArrayList<List<Integer>>();
        
        
        List<Integer> row0= new ArrayList<Integer>();
        row0.add(1);
        list.add(row0);
        if (rowIndex < 1)  return row0;
        
        List<Integer> row1= new ArrayList<Integer>();
        row1.add(1); row1.add(1);
        list.add(row1);
        if (rowIndex == 1)  return row1;
        
        for (int i = 2; i <= rowIndex; i++)  {
            List<Integer> newRow= new ArrayList<Integer>();
            newRow.add(1);
            for (int j = 1; j< i; j++)
                newRow.add(list.get(i-1).get(j-1) +list.get(i-1).get(j));
            newRow.add(1);
            list.add(newRow);
        }
        
        return list.get(rowIndex);
    }
}