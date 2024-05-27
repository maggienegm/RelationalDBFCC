#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"
  # display available services
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim\n6) exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SCHEDULE_APPOINTMENT 1 ;;
    2) SCHEDULE_APPOINTMENT 2 ;;
    3) SCHEDULE_APPOINTMENT 3 ;;
    4) SCHEDULE_APPOINTMENT 4 ;;
    5) SCHEDULE_APPOINTMENT 5 ;;
    6) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

SCHEDULE_APPOINTMENT() {
  SERVICE_ID_SELECTED=$1

  # gather customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # create new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # schedule appointment
  CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME_FORMATTED?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # return appointment info
  SERVICE_INFO=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE_INFO_FORMATTED=$(echo $SERVICE_INFO | sed 's/ |/"/')
  EXIT "I have put you down for a $SERVICE_INFO_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
}

EXIT() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU
