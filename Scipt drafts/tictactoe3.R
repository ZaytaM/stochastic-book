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
  
  # Function to find available moves
  available_moves <- function(board) {
    which(board == "", arr.ind = TRUE)
  }
  
  # Function to implement the first policy
  first_policy <- function(board, player) {
    opponent <- if (player == "X") "O" else "X"
    moves <- available_moves(board)
    
    # Check if the player can win in the next move
    for (move in 1:nrow(moves)) {
      temp_board <- board
      temp_board[moves[move, "row"], moves[move, "col"]] <- player
      if (!is.null(check_winner(temp_board)) && check_winner(temp_board) == player) {
        return(moves[move, ])
      }
    }
    # Check if the opponent can win in the next move (block them)
    for (move in 1:nrow(moves)) {
      temp_board <- board
      temp_board[moves[move, "row"], moves[move, "col"]] <- opponent
      if (!is.null(check_winner(temp_board)) && check_winner(temp_board) == opponent) {
        return(moves[move, ])
      }
    }
    # Prefer the center square
    if (board[2, 2] == "") {
      return(c(2, 2))
    }
    # Fallback to a random move
    return(moves[sample(1:nrow(moves), 1), ])
  }
  
  # Play the game
  current_player <- 1
  winner <- NULL
  
  while (TRUE) {
    # Find available moves
    moves <- available_moves(board)
    if (nrow(moves) == 0) break  # No moves left, it's a draw
    
    # Choose a move based on the parametric policy
    chosen_move <- first_policy(board, players[current_player])
    
    # Update the board
    board[chosen_move[1], chosen_move[2]] <- players[current_player]
    
    # Check for a winner
    winner <- check_winner(board)
    if (!is.null(winner)) break
    
    # Switch players
    current_player <- 3 - current_player
  }
  
  # Return the winner
  return(winner)
}

# Simulation loop
simulate_multiple_games <- function(num_games) {
  player1_wins <- 0
  player2_wins <- 0
  draws <- 0
  
  for (i in 1:num_games) {
    winner <- simulate_tic_tac_toe()
    if (!is.null(winner)) {
      if (winner == "X") {
        player1_wins <- player1_wins + 1
      } else if (winner == "O") {
        player2_wins <- player2_wins + 1
      }
    } else {
      draws <- draws + 1
    }
  }
  
  # Return the results
  return(list(player1_wins = player1_wins, player2_wins = player2_wins, draws = draws))
}

# Run the simulation for 1000 games
set.seed(42)  # For reproducibility
num_games <- 1000
results <- simulate_multiple_games(num_games)

# Print the results
cat("After", num_games, "games:\n")
cat("Player 1 (X) wins:", results$player1_wins, "\n")
cat("Player 2 (O) wins:", results$player2_wins, "\n")
cat("Draws:", results$draws, "\n")
