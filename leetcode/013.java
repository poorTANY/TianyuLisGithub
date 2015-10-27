// Roman to Integer

public class Solution {
    public int romanToInt(String s) {
        //I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1,000
        //In this system, a letter placed after another of greater value adds (thus XVI or xvi is 16)
        //whereas a letter placed before another of greater value subtracts (thus XC or xc is 90).
        int result = 0;
        char[] sChar = s.toCharArray();
        HashMap<Character, Integer> map = new HashMap<Character, Integer>();
        map.put('I',1);
        map.put('V',5);
        map.put('X',10);
        map.put('L',50);
        map.put('C',100);
        map.put('D',500);
        map.put('M',1000);
        if(sChar.length == 1) return map.get(sChar[0]);
        for(int i = 0; i < sChar.length-1; i++){
            if( map.get(sChar[i]) >= map.get(sChar[i+1]) )
                result += map.get(sChar[i]);
            else
                result -= map.get(sChar[i]);
        }
        result += map.get(sChar[sChar.length-1]);
        return result;
    }
}