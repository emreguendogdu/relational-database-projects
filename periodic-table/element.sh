#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if arg exists
if [[ -n $1 ]]
then
  # check if arg is symbol
  if [[ -n $($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'") ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    WHERE_VALUE="atomic_number=$ATOMIC_NUMBER"
  # check if arg is name
  elif [[ -n $($PSQL "SELECT atomic_number FROM elements WHERE name='$1'") ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    WHERE_VALUE="atomic_number=$ATOMIC_NUMBER"
  # check if arg is atomic number
  elif [[ -n $($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1") ]]
  then
    WHERE_VALUE="atomic_number=$1"
  else
    echo "I could not find that element in the database."
    exit
  fi
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE $WHERE_VALUE")
  NAME=$($PSQL "SELECT name FROM elements WHERE $WHERE_VALUE")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE $WHERE_VALUE")
  METALLIC_TYPE=$($PSQL "SELECT type FROM types JOIN properties USING (type_id) WHERE $WHERE_VALUE")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE $WHERE_VALUE")
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE $WHERE_VALUE")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE $WHERE_VALUE")
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METALLIC_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
else
  echo 'Please provide an element as an argument.'
fi