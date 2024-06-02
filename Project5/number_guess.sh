#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guesses_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

EXISTING_USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")
if [[ -z $EXISTING_USER ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  GAMES_COUNT=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID';")
  BEST_GAME_GUESS_COUNT=$($PSQL "SELECT COALESCE(MIN(guess_count), 0) FROM games WHERE user_id=$USER_ID;")

  echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_GAME_GUESS_COUNT guesses."
fi

RANDOM_NUMBER=$((RANDOM % 1000 + 1))
echo "Guess the secret number between 1 and 1000:"
read NUMBER_GUESSED
GUESS_COUNT=1

until [ $NUMBER_GUESSED == $RANDOM_NUMBER ]
do
  if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read NUMBER_GUESSED
  else
    (( GUESS_COUNT++ ))
    if [[ $NUMBER_GUESSED -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read NUMBER_GUESSED
    elif [[ $NUMBER_GUESSED -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      read NUMBER_GUESSED
    fi
  fi
done

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guess_count) VALUES('$USER_ID', $GUESS_COUNT);")
echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
