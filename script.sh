#!/bin/bash

function press_enter {
	printf "\n"
	printf "Press Enter to continue..."
	read
	clear
}

selection=
until [ "$selection" = "0" ]; do
	printf "\nSelect from the menu: \n\n" 
	printf "  1) VM Connection Test\n"
	printf "  2) Check Boto version\n"
	printf "  3) Create a queue\n"
	printf "  4) List all the queues\n"
	printf "  5) Delete a queue\n"
	printf "  6) Write a message to a queue\n"
	printf "  7) Read the message from the queue\n"
	printf "  8) Count the messages\n"
	printf "  9) Consume the message\n"
	printf " \n 99) Exit\n"

	printf "\nSelection: "
	read selection

	case $selection in
		1  ) 	telnet snf-35216.vm.okeanos-global.grnet.gr 8080 
			press_enter
			;;
		2  )   	curl -s -X GET localhost:8080/version
			press_enter
			;;
		3  ) 	curl -X POST -H 'Content-Type: application/json' http://localhost:8080/queues -d '{"name": "C13470112"}'
			press_enter
			;;
		4  ) 	curl -s -X GET -H 'Accept: application /json' http://localhost:8080/queues | python -mjson.tool
			press_enter
			;;
		5  ) 	curl -X DELETE -H 'Accept: application/json' http://localhost:8080/queues/C13470112
			press_enter
			;;
		6  ) 	curl -s -X POST -H 'Accept: application/json' http://localhost:8080/queues/C13470112/msgs -d '{"content": "this is the message I want to put on the queue"}'
			press_enter
			;;
		7  ) 	curl -X GET -H 'Accept: application/json' http://localhost:8080/queues/C13470112/msgs
			press_enter
			;;
		8  )	curl -X GET -H 'Accept: application/json' http://localhost:8080/queues/C13470112/msgs/count
			press_enter
			;;
		9  ) 	curl -X DELETE -H 'Accept: application/json' http://localhost:8080/queues/C13470112/msgs
			press_enter
			;;
		99) exit
			;;
		* ) printf "You did not choose a valid option!\n"
	esac
done

printf "\n"
