#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo 'Please provide an element as an argument.'

if [[ $1 =~ ^[0-9]+$ ]]
then
ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")

fi
# if [[ -n $($PSQL "SELECT atomic_number") ]]
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METALLIC_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

