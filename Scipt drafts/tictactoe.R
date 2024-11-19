# Tic Tac Toe simulation using a random Markov policy
simulate_tic_tac_toe <- function() {
  # Initialize the empty board
  board <- matrix(rep("", 9), nrow = 3, byrow = TRUE)
  players <- c("X", "O")
  # Function to check for a winner
  check_winner <- function(board) {
    lines <- list(
      # Rows
      board[1, ], board[2, ], board[3, ],
      # Columns
      board[, 1], board[, 2], board[, 3],
      # Diagonals
      c(board[1, 1], board[2, 2], board[3, 3]),
      c(board[1, 3], board[2, 2], board[3, 1])
    )
    for (line in lines) {
      if (all(line == "X")) return("X")
      if (all(line == "O")) return("O")
    }
    return(NULL)
  }
  
  # Function to determine available moves
  available_moves <- function(board) {
    which(board == "", arr.ind = TRUE)
  }
  
  # Play the game
  current_player <- 1
  winner <- NULL
  
  while (TRUE) {
    # Print Current Board for vizualization
    print(board)
    # Find available moves
    moves <- available_moves(board)
    if (nrow(moves) == 0) break  # No moves left, it's a draw
    
    # Choose a random move (random Markov policy)
    chosen_move <- moves[sample(1:nrow(moves), 1), ]
    
    # Update the board
    board[chosen_move[1], chosen_move[2]] <- players[current_player]
    
    # Check for a winner
    winner <- check_winner(board)
    if (!is.null(winner)) break
    
    # Switch players
    current_player <- 3 - current_player
  }
  
  # Return the result
  list(board = board, winner = winner)
}

# Run the simulation and print the results
result <- simulate_tic_tac_toe()
cat("Final Board:\n")
print(result$board)
if (is.null(result$winner)) {
  cat("The game is a draw.\n")
} else {
  cat("Winner: ", result$winner, "\n")
}
