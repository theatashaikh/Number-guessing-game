#!/bin/bash

GAME () {
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
    ((TRIES++))
    read USER_GUESS
    GAME
  elif [[ $USER_GUESS < $RANDOM_NUMBER ]]
  then
    echo -e "It's higher than that, guess again:"
    ((TRIES++))
    read USER_GUESS
    GAME
  elif [[ $USER_GUESS > $RANDOM_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
    ((TRIES++))
    read USER_GUESS
    GAME
  else
    echo -e "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME';")
    if [[ -z $BEST_GAME || $BEST_GAME > $TRIES ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $TRIES WHERE username='$USERNAME' AND (best_game is null OR best_game > $TRIES);")
    fi
  fi
}

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( 1 + $RANDOM % 1000 ))

echo -e "Enter your username:"
read USERNAME

# check if username exists or not
USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username ='$USERNAME';")

# If the user does not exists
if [[ -z $USERNAME_RESULT ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username, games_played) VALUES ('$USERNAME', 0)")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."

  
  echo -e "Guess the secret number between 1 and 1000:"
  read USER_GUESS
  TRIES=1

  GAME
  
# If the user does exists
else
  IFS="|" read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$USERNAME_RESULT"
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  
  echo -e "Guess the secret number between 1 and 1000:"
  read USER_GUESS
  TRIES=1

  GAME
fi


