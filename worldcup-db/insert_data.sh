#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "~~~~~~\n
$($PSQL "TRUNCATE teams, games")
$($PSQL "ALTER SEQUENCE teams_team_id_seq restart")
$($PSQL "ALTER SEQUENCE games_game_id_seq restart")
\n~~~~~~"

 cat games.csv | while IFS=$',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # if value is not winner or opponent
  if [[ $WINNER != 'winner' || $OPPONENT != 'opponent' ]]
  then
    # get opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if opponent not exists
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT DO NOTHING")
      # if opponent completely inserted
      if [[ $INSERT_OPPONENT == 'INSERT 0 1' ]]
      then
        echo Inserted $OPPONENT
      fi
    fi
    # get WINNER id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if WINNER not exists
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT DO NOTHING")
      # if WINNER completely inserted
      if [[ $INSERT_WINNER == 'INSERT 0 1' ]]
      then
        echo Inserted $WINNER
      fi
    fi
  fi
  # if values are not the info ones
  if [[ $ROUND != "round" ]]
  then
    # update winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # update opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  # insert games
     INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
    # if inserted games correctly
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then
      echo Inserted $YEAR $WINNER vs $OPPONENT game successfully.
    fi
  fi
done

echo "$($PSQL "SELECT * FROM teams")"
echo "$($PSQL "SELECT * FROM games")"
