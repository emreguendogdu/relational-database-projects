#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

: '
$PSQL "TRUNCATE customers, appointments"
$PSQL "ALTER SEQUENCE customers_customer_id_seq restart"
$PSQL "ALTER SEQUENCE appointments_appointment_id_seq restart"
'

echo -e "----------------------\nWelcome to the Gentlemen's Saloon.\n----------------------"

SELECT_SERVICE_TEXT="echo -e Select a service by ID:\n1) Cut\n2) Cut and Wash\n3) Cut Wash and Line"

while true; do
   $SELECT_SERVICE_TEXT
   read SERVICE_ID_SELECTED
   if [[ $SERVICE_ID_SELECTED -ge 1 && $SERVICE_ID_SELECTED -le 3 ]]; then
        SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
       echo -e "\nYou've selected $SERVICE_SELECTED."
       break
   fi
done

echo -e "\nEnter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  if [[ $INSERT_CUSTOMER == "INSERT 0 1" ]]
  then
    echo -e "\nWelcome, $CUSTOMER_NAME. You're now registered."
  fi
else
  echo -e "\nWelcome back, $CUSTOMER_NAME."
fi

echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME? (e.g: 1am or 01:15):"
read SERVICE_TIME

# update customer id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")

if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
then
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
fi


