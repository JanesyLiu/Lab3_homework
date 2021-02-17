#!/bin/bash
count_lines(){ 
    echo 'the number of lines in the file is '
    grep -c "" $1
}

count_words(){
    echo -e '\nthe lines containing the specific word "Lorem" are:'
    grep -n -A0 -B0 "Lorem" $1
    echo -e '\nthe lines containing the specific word "model" are:'
    grep -n -A0 -B0 "model" $1
    echo -e '\nthe lines containing the specific word "Ipsum" are:'
    grep -n -A0 -B0 "Ipsum" $1
    echo -e '\nthe lines containing the specific word "will" are:'
    grep -n -A0 -B0 "will" $1 
}

add_text(){
    echo "Please input the text you want to add:"
    read text
    echo $text >> sample_text.txt
}

copy_and_exit(){
    mkdir solution
    cp sample_text.txt ./solution/sample_text.txt
}

if test $# -eq 1
then
    while :
        do
            echo -e '\nPlease input a number from 1 to 4: \n1.count lines\n2.count words\n3.add text\n4.copy and exit'
            read input
            case $input in
                1) count_lines $1
                ;;
                2) count_words $1
                ;;
                3) add_text
                ;;
                4) copy_and_exit $1
                ;;
                *) echo "illegal input!"
                ;;
            esac
        done
else
    echo 'Please input correct arguments' 
    exit
fi