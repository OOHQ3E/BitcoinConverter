#!/bin/bash

#this code writes the supported currencies in a file for later use with jq
curl https://api.coindesk.com/v1/bpi/supported-currencies.json --silent -o result
#this function lists out the supported currencies that the user can use
listing(){
last=`cat result | jq .[-1].currency`
x=1
while [ `cat result | jq .[$x].currency` != $last ]
do
echo `cat result | jq .[$x].currency | tr -d "\""` - `cat result | jq .[$x].country | tr -d "\""`
x=$((x+1))
done
echo `cat result | jq .[-1].currency | tr -d "\""` - `cat result | jq .[-1].country | tr -d "\""`
}
#--------------------------------------------------------------------------------------------------
#this code does the exchanging and writes out the result if correct
exchange(){
cat result | grep -q $currency
if [[ "$?" -eq 1 ]] ; then
echo "Invalid code for currenies, please check './script -l' for the supported currencies and try again"
exit 5
else
curl http://api.coindesk.com/v1/bpi/currentprice/$currency.json --silent -o exc
echo "At this time, 1 Bitcoin is: " `cat exc | jq .bpi.$currency.rate | tr -d "\""` $currency
fi
rm exc
}
#getopts
while getopts ":hle:" opt; do
case ${opt} in
h )
echo "This script lets you check what 1Bitcoin is in other currencies"
echo "This script uses jq, so if you don't have it installed, it won't function"
echo "To install jq, write: 'sudo apt install jq' in the terminal"
echo "-----------------------------------------------------------------------------------------------"
echo "-l lists out the supported currencies"
echo "-e uses the code of the desired currency (eg.: -e USD will write out how much $ is 1 bitcoin)"
;;
l )
listing
;;
e )
if [[ ${#OPTARG} -eq 3 ]] ; then
currency=$OPTARG
exchange
else
echo "A currency code is 3 digits long, yours wasn't 3 digits, please try again"
fi
;;
\? )
echo "Invalid argument, valid arguments: [-h] [-l] [-e]"
;;
esac
done
#removes the result file
rm result
