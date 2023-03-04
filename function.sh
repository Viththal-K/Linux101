#!/bin/bash

myFunc() {
	local num1=$1
	local num2=$2
	let result=$1+$2
	echo $result
}

myFunc 10 20
