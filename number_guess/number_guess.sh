#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# $PSQL "TRUNCATE users"

echo -e "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  if [[ $INSERT_USER == "INSERT 0 1" ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  fi
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id='$USER_ID'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id='$USER_ID'")

  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESS_COUNT=0
SECRET_NUM=$(($RANDOM%1000))
echo -e "\nGuess the secret number between 1 and 1000:"
while true; do
  read GUESSED_NUM
    ((GUESS_COUNT++))
  if ! (( $GUESSED_NUM ))
  then
    echo "That is not an integer, guess again:"
  elif (( $GUESSED_NUM > $SECRET_NUM ))
  then
    echo "It's lower than that, guess again:"
  elif (( $GUESSED_NUM < $SECRET_NUM ))
  then
    echo "It's higher than that, guess again:"
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$(( $GAMES_PLAYED + 1 )) WHERE user_id=$USER_ID")
    if (( $BEST_GAME == 0 ))
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT")
    elif (( $GUESS_COUNT < $BEST_GAME ))
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT")
    fi
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUM. Nice job!"
    break
  fi
done