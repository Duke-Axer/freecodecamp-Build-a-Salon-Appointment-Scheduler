#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# No arg
if [[ -z $1 ]];
  then
  echo "Please provide an element as an argument."
  exit 0
fi

# IF input is atomic_number
if [[ $1 =~ ^[0-9]+$ ]];
then
ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM properties WHERE atomic_number=$1;")
  if [[ -z $ATOMIC_NUMBER ]]; then
    echo "I could not find that element in the database."
    exit 0
  fi
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
else
  if [[ ${#1} -lt 3 ]]; then
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1';")
  if [[ -z $SYMBOL ]]; then
    echo "I could not find that element in the database."
    exit 0
  fi
  ATOMIC_NUMBER=$($PSQL "SELECT properties.atomic_number FROM properties LEFT JOIN elements ON properties.atomic_number=elements.atomic_number WHERE symbol='$SYMBOL';")
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
  else
  NAME=$($PSQL "SELECT name FROM elements WHERE name='$1';")
  if [[ -z $NAME ]]; then
    echo "I could not find that element in the database."
    exit 0
  fi
  ATOMIC_NUMBER=$($PSQL "SELECT properties.atomic_number FROM properties LEFT JOIN elements ON properties.atomic_number=elements.atomic_number WHERE name='$NAME';")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$NAME';")
  fi

fi


TYPE=$($PSQL "SELECT types.type FROM types LEFT JOIN properties ON types.type_id=properties.type_id WHERE atomic_number=$ATOMIC_NUMBER;")
MELT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."