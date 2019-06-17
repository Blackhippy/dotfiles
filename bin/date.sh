#!/bin/bash

h=$(TZ=America/Chicago’ date +"%l")
m=$(date +"%M")
d=$(date +"%a")
mm=$((60-m))


hours=(zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve)
mins=(zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen Twenty Twentyone Twentytwo Twentythree Twentyfour Twentyfive Twentysix Twentyseven Twentyeight Twentynine Thirty Thirtyone Thirtytwo Thirtythree Thirtyfour Thirtyfive Thirtysix Thirtyseven Thirtyeight Thirtynine Fourty Fourtyone Fourtytwo Fourtythree Fourtyfive Fourtysix Fourtyseven Fourtyeight Fourtynine Fifty Fiftyone Fiftytwo Fiftythree Fiftyfour Fiftyfive Fiftysix Fiftyseven Fiftyeight Fiftynine Sixty)


if [ "$m" -eq 15 ]
	then
		echo "$d" "Quarter Past" "${hours[$h]}"
elif [ "$m" -gt 0 ] && [ "$m" -lt 30 ]
	then
		echo "$d" "${mins[$m]}" "Past"  "${hours[$h]}"
elif [ "$m" -eq 30 ]
	then
        echo "$d" "Half Past" "${hours[$h]}"
elif [ "$m" -eq 45 ]
	then
		echo "$d" "Quarter Til" "${hours[$h+1]}"
elif [ "$m" -gt 30 ] && [ "$m" -lt 60 ]
	then
		echo "$d" "${mins[$mm]}" "Mins Til" "${hours[$h+1]}"
fi