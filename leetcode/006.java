public class Solution {
    public String convert(String s, int numRows) {
        if (s == null || s.length() == 0 || s.length() <= numRows || numRows == 1) return s;
        List<List<Character>> resList = new ArrayList<List<Character>>();
        for (int i = 0; i < numRows; i++) {
            resList.add(new ArrayList<Character>());
        }
        for (int i = 0; i < s.length(); i++) {
            int indexInGroup = i % (2 * numRows - 2);
            int indexInList = indexInGroup < numRows ? indexInGroup : 2 * numRows - 2 - indexInGroup;
            resList.get(indexInList).add(s.charAt(i));
        }
        StringBuilder sb = new StringBuilder();
        for (List<Character> list : resList) {
            for (Character c : list) {
                sb.append(c);
            }
        }
        return sb.toString();
    }
}