#!/bin/bash

# Define MySQL credentials
DB_USER="root"
DB_NAME="HikuCraft"

# Define MySQL DDL script
DDL_SCRIPT="ddl.sql"

# Function to run SQL query
function run_sql_query() {
	local DB_PASS
	read -s -p "Enter MySQL password: " DB_PASS
	mysql -u "$DB_USER" -p"$DB_PASS" -e "$1" "$DB_NAME"
}

# Function to start MySQL service
function start() {
	sudo service mysql start
}

# Function to stop MySQL service
function stop() {
	sudo service mysql stop
}

# Function to restart MySQL service
function restart() {
	sudo service mysql restart
}

# Function to check MySQL service status
function status() {
	sudo service mysql status
}

# Function to reset database
function reset() {
	clear
	fill
}

# Function to clear database
function clear() {
	run_sql_query "DROP DATABASE IF EXISTS $DB_NAME;"
}

# Function to fill database
function fill() {
	run_sql_query "source $DDL_SCRIPT;"
}

# Main script
case "$1" in
"run") echo "Not implemented yet" ;;
"start") start ;;
"stop") stop ;;
"restart") restart ;;
"status") status ;;
"reset") reset ;;
"clear") clear ;;
"fill") fill ;;
*)
	echo "Usage: $0 {run|start|stop|restart|status|reset|clear|fill}"
	exit 1
	;;
esac

exit 0
