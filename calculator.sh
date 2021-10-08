#! /bin/sh

echo "Welcome to my basic calculator\n";

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

subtraction() {
    RESULT=$(($1 - $2))
    println "success" "$1 - $2 = $RESULT";
}

multiplication() {
    RESULT=$(($1 * $2))
    println "success" "$1 * $2 = $RESULT";
}

division() {
    RESULT=$(($1 / $2))
    println "success" "$1 / $2 = $RESULT";
}

getOptionValues() {
    local __firstValue=$1;
    local __secondValue=$2;
    read -p "First value: " FIRST_VALUE;
    read -p "Second value: " SECOND_VALUE;
    eval $__firstValue="$FIRST_VALUE";
    eval $__secondValue="$SECOND_VALUE";
}

askOption() {
    echo "What would you like to do:";
    echo "1.Addition";
    echo "2.Subtraction";
    echo "3.Multiplication";
    echo "4.Division";
    echo "";
    read -p "" OPTION;
    
    case $OPTION in
        1)
            getOptionValues FIRST_VALUE SECOND_VALUE;
            addition $FIRST_VALUE $SECOND_VALUE;
        ;;
        2)
            getOptionValues FIRST_VALUE SECOND_VALUE;
            subtraction $FIRST_VALUE $SECOND_VALUE;
        ;;
        3)
            getOptionValues FIRST_VALUE SECOND_VALUE;
            multiplication $FIRST_VALUE $SECOND_VALUE;
        ;;
        4)
            getOptionValues FIRST_VALUE SECOND_VALUE;
            division $FIRST_VALUE $SECOND_VALUE;
        ;;
        *)
            println "error" "You must select a valid option, try again !"
            askOption;
        ;;
    esac
    
    askOption;
}

askOption;