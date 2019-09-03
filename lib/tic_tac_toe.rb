# Helper Method
def position_taken?(board, index)
        !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [2, 4, 6],
        [0, 4, 8]
]

def won?(board)
        WIN_COMBINATIONS.detect do |win_combination|
                board[win_combination[0]] == board[win_combination[1]] &&
                board[win_combination[1]] == board[win_combination[2]] &&
                position_taken?(board, win_combination.first)
        end
end

def full?(board)
        return board.all? {|index| index != " "}
end

def draw?(board)
        return !won?(board) && full?(board)
end

def over?(board)
        return won?(board) || full?(board)
end

def winner(board)
        win_comb = won?(board)
        if win_comb
                return board[win_comb[0]]
        else
                return nil
        end
end
