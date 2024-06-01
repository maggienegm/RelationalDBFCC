#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_ELEMENT_INFO() {
  ELEMENT_INPUT=$1
  if [[ $ELEMENT_INPUT =~ ^[0-9]+$ ]]
  then
    CONDITION="elements.atomic_number = $ELEMENT_INPUT"
  else
    CONDITION="symbol = '$ELEMENT_INPUT' OR name = '$ELEMENT_INPUT'"
  fi

  ELEMENT_INFO=$($PSQL "SELECT elements.atomic_number, symbol, elements.name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE $CONDITION;")
  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_INFO" | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
}

ELEMENT_INPUT=$1
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  GET_ELEMENT_INFO $ELEMENT_INPUT
fi
