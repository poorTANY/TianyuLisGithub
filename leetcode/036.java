// Valid Sudoku
public class Solution {
    public boolean isValidSudoku(char[][] board) {
        
        boolean[][] row = new boolean[9][9];
        boolean[][] column = new boolean[9][9];
        boolean[][] block = new boolean[9][9];
        
        for(int i = 0;i<9;i++){
            for(int j=0;j<9;j++){
                int c = board[i][j] - '1';
                if(board[i][j]=='.'){
                    continue;
                }
                if(row[i][c]||column[j][c]||block[i - i % 3 + j / 3][c]){
                    return false;
                }
                row[i][c] = column[j][c] = block[i - i % 3 + j / 3][c] = true;
            }
        }
        return true;
    }
}