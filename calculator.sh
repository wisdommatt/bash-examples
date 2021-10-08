#! /bin/sh

echo "Welcome to my basic calculator";

# COLOURS
RED_COLOUR='\033[0;31m';
ORANGE_COLOUR='\033[0;33m';
GREEN_COLOUR='\033[0;32m';
NO_COLOUR='\033[0m';

# FUNCTIONS
println() {
    if [ "$1" = "error" ];
    then
        echo "${RED_COLOUR}$2${NO_COLOUR}\n"
    elif [ "$1" = "warn" ];
    then
        echo "${ORANGE_COLOUR}$2${NO_COLOUR}\n"
    elif [ "$1" = "success" ];
    then
        echo "${GREEN_COLOUR}$2${NO_COLOUR}\n"
    else
        echo "$2\n"
    fi
}

addition() {
    SUM=$(($1 + $2));
    println "success" "$1 + $2 = $SUM";
}

askOption() {
    echo "\nWhat would you like to do:\n 1. Addition\n 2.Subtraction\n";
    read -p "" OPTION;
    
    case $OPTION in
        1)
            read -p "First value: " FIRST_VALUE;
            read -p "Second value: " SECOND_VALUE;
            addition $FIRST_VALUE $SECOND_VALUE;
        ;;
        hello)
            echo "Hello World";
        ;;
        *)
            println "error" "You must select a valid option, try again !"
            askOption;
        ;;
    esac
}

askOption;