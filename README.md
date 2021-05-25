# BitcoinExchanger
Hungarian:
OOHQ3E OS I. gyakorlatra készült beadandó.
Script, ami megmondja, hogy 1 Bitcoin bizonyos valutákban mennyit ér.
CoinDesk API-t használva kiírtam egy ideiglenes result fájlba a supported-currencies-t (használható valuták), amit később lehet használni a scriptnek. -l kapcsolóval le lehet kérni a használható valutákat -h használatával a bizonyos információkat lehet lekérni. (jq-t használ a script, ezért a használata előtt azt telepíteni kell 'sudo apt install jq')
-e kapcsoló segítségével majd egy valuta kód beírásával lefut a script és ha szerepel a használható valuták listában, akkor kiírja, hogy mennyit is ér. (pl.: ./script -e CAD kiírja hány kanadai dollár jelenleg egy BitCoin)

English:
OOHQ3E assignment for OS I. practice.
It's a script which tells you how much is 1 bitcoin in other currencies.
I used CoinDesk API, and made a temporary result file, which stores the supported currencies, which the script can use later. -l gives you a list of the useable currencies, -h gives you some information about the script (it uses jq, so if you want to use it, that must be instaled with 'sudo apt install jq')
With -e and a given currency code the script gives you how much is one bitcoin in the desired currency, but only if it is in the list of supported currencies. (eg.: ./script.sh -e CAD gives you how much canadian dollars is 1 BitCoin)
