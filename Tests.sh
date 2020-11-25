#!/bin/bash

passedTests=0
failedTests=0
numberOfTests=0

function test() {

    let numberOfTests++
    
    argumnet=$1
    expected=$2
    actual=$?
    
    ./.build/debug/LocalizationHelper "$argument"
    
    if [ $actual == $expected]; then
        let passedTests++
        tput setaf 2
        echo "$argumnet 'passed' with code $actual (expected code: $expected)"
        tput setaf 0

    else
        let failedTests++
        tput setaf 1
        echo "$argumnet 'failed' with code $actual (expected code: $expected)"
            tput setaf 0
    fi
}

echo "Тест help"
test "-h" 0

echo "Passed тест поиска"
test "search" 0
test "search -h" 0
test "search -k day" 0
test "search -l ru" 0
test "search -k day -l ru" 0

echo "Passed тест обновления/добавления"
test "update день -k day -l ru" 0
test "update -h" 0

echo "Passed тесты удаления"
test "delete -k день -l ru" 0
test "delete -l ru" 0
test "delete -k day" 0
test "delete -h" 0

echo "Failed тесты поиска"
test "search -k" 1
test "search -l" 1
test "search -k day -l" 1
test "search -l en -k day" 1

echo "Failed тесты обновления/добавления"
test "update -k day -l en" 1
test "update -k day" 1
test "update -l en" 1

echo "Failed тесты удаления"
test "delete -k день -l" 1
test "delete -t ru" 1
test "delete -k" 1

echo "-----------"
echo "Number of tests:$numberOfTests"
echo "Passed tests:$passedTests"
echo "Failed tests: $failedTests"
