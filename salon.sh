#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

P_SERVICE() {
  $PSQL "SELECT service_id, name FROM services" | while IFS=' | ' read SERVICE_ID SERVICE
  do
  if [[ -z $SERVICE ]]
  then
  continue
  fi
  echo "$SERVICE_ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED=$(( $SERVICE_ID_SELECTED +0 ))
  SERVICE_P=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_P ]]
  then
  echo -e "\nI could not find that service. What would you like today?"
  P_SERVICE
  fi
}

P_P_N() {
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
}

P_TIME() {
  echo "What time would you like your $SERVICE_P, $CUSTOMER_NAME?"
  read SERVICE_TIME

  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"
  echo "I have put you down for a $SERVICE_P at $SERVICE_TIME, $CUSTOMER_NAME."
}

echo "Welcome to My Salon, how can I help you?"

P_SERVICE
P_P_N
P_TIME