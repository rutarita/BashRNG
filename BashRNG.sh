#! /bin/bash
#technical variables
input=0 #current input, simple as it is
curroll=0 #current rolled rarity
tohcho=0 #colour that is offered to player to choose
cursf=0 #current savefile
luckBonus=0 # the luck bonus that increases success chance
boosts=0 # amount of boosts the player has

#savefile order: BashRNGsavefile, current rarity, current colour, amount of rolls, BashRNGsavefile

#player stats
rolls=0 #amount of rolls
currrar='none' #current rarity that the player has
inventory=() #inventory for rarities
cinventory=( ) #inventory for colours
cc='\033[0;10m' # Current colour

# presets ig
NC='\033[0m' # No Color
readonly NC



echo -e "welcome to \033[0;33m bash rng${NC}"
while [[ "$input" != "x" ]]; do
    input="foobar"
    echo -e "\n \n \nPlayer: ${cc}$(whoami)${NC}"
    echo -e "Current rarity: $currrar"
    echo -e "Rolls: $rolls"
    echo -e "\nMain menu"
    echo "Commands:"
    echo "r - roll"
    echo "b - use boost. You currently have $boosts"
    echo "i - open inventory(not fully  implemented yet)"
    echo "s - save"
    echo "l - load"
    echo "x - exit(no saving)"
    read -r input
    #echo "$input"

    case "$input" in
        "r")

            # ranval=$(( RANDOM % 1000 + 1 ))
            tohcho='\033[0;90m'
            curroll="${tohcho}Winbloat (common)${NC}"

            if [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho='\033[0m'
                curroll="${tohcho}Unix-likeal (uncommon)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;42m"
                curroll="${tohcho}Minted (rare)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;33m"
                curroll="${tohcho}Ubunted (super rare)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;31m"
                curroll="${tohcho}FreeBSDical (hella rare)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;102m"
                curroll="${tohcho}Cinnamonical (mega rare)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;1m"
                curroll="${tohcho}Archistic (ultra rare)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;7m"
                curroll="${tohcho}Nomehic (epic)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;53m"
                curroll="${tohcho}Fossical (mythic)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;35m"
                curroll="${tohcho}Minixial (balladirical)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;104m"
                curroll="${tohcho}Nyarchd (untold)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;5m"
                curroll="${tohcho}Gentoostic (uncovered)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;103m"
                curroll="${tohcho}TempleOStical (legendary)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;43m"
                curroll="${tohcho}Canonicalistical (catastrophical)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;100m"
                curroll="${tohcho}Tuxaful (masterful)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;102m"
                curroll="${tohcho}Emacsed (maxxed)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then #HHJHYY

                tohcho="\033[0;101m"
                curroll="${tohcho}RHELiqious (reliqious)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;41m"
                curroll="${tohcho}Winematical (abominatical)${NC}"

            elif [[ $(( RANDOM % 1000 + 1 + luckBonus)) -ge 500 ]]; then

                tohcho="\033[0;105m"
                curroll="${tohcho}GNUniversal (universal)${NC}"

            fi
            rolls=$(( rolls + 1))
            luckBonus=0
            echo "Luck boost has been used!"
            echo -e "\nYou rolled $curroll !\n"
            progressToBoost=$(( progressToBoost + 1 ))
            if [[ progressToBoost -eq 10 ]]; then
            progressToBoost=0
            boosts=$(( boosts + 1 ))
            echo "+1 boost! You now have $boosts boosts."
            fi
            echo "Progress to a luck boost:"
            echo -n "["
            for prgb in 1 2 3 4 5 6 7 8 9 10; do
            if [[ $prgb -le $progressToBoost ]]; then
            echo -n "%"
            else
            echo -n " "
            fi
            done
            echo "]"
            input="foobar"
            while [[ "$input" != "e" && "$input" != "d" && "$input" != "i" ]]; do
                echo -e "Your current rarity is $currrar\n"
                echo "Do you wish to"
                echo -e "e - equip it\nd - dismiss it\ni - put it in the inventory\n"
                read -r input
                echo
                if [[ "$input" = "e" ]]; then
                    echo -e "Do you want to put $currrar in the inventory or not(dispose it) (y/n)"
                    read -r input
                    if [[ "$input" = "y" ]]; then
                    inventory+=("$currrar")
                    cinventory+=("$currrar")
                    echo -e "$currrar has been added into inventory!"
                    fi
                    cc=$tohcho
                    currrar=$curroll
                    echo -e "$curroll has been \033[0;4m equipped${NC}"
                    input="i"

                elif [[ "$input" = "i" ]]; then

                    inventory+=("$curroll")
                    cinventory+=("$tohcho")
                    echo -e "$curroll has been added into inventory!"

                elif [[ "$input" = "d" ]]; then
                    echo -e "You \033[0;21mdismissed${NC} $curroll "
                fi
                echo
                echo
            done
        ;;
        "b")
        echo "Current boosts: $boosts"
        echo -e "u - use a boost and exit boost menu\nm - use multiple boosts\nb - buy a boost (not implemented yet)\nx - exit boosts menu"
        read -r input
        case "$input" in
            "u")
            if [[ boosts -ge 1 ]]; then
            luckBonus=$(( luckBonus + 10))
            echo "Boost used succesfully, your current luck boost is +$luckBonus"
            else
            echo "Not enough boosts!"
            fi
            ;;
            "m")
            echo "Input amount of boosts you want to use. (Any amount greater then current boosts will be assumed as maximum)"
            read -r input
            if [[ $input -gt $boosts ]]; then
            echo "$input will be maxxed out to $boosts."
            input=$boosts
            fi
            luckBonus=$(( luckBonus + 10 * input))
            echo -e "$input boosts used!\nCurrent luck boost is +$luckBonus"
            input="foobar"
            ;;

        esac
        ;;
        "i")
            echo "Current items:"
            echo -e "${inventory[@]}"
            echo "What do you wish to do here?"
            echo "e - equip (then you will be prompted to input the number)"
            echo "d - discard an item(then you will be prompted to input the number)"
            echo "x - exit the inventory"
            read -r input
            case "$input" in
                "e")
                    echo "What would you like to equip? [1-${#inventory[@]}]"
                    read -r input
                    if [ "$input" -ge 1 ] && [ "$input" -le "${#inventory[@]}" ]; then
                    input=$(( input - 1 ))
                    curroll=${inventory[$input]}
                    tohcho=${cinventory[$input]}
                    inventory[input]=$currrar
                    cinventory[input]=$cc
                    currrar=$curroll
                    cc=$tohcho
                    echo -e "$currrar successfully equipped!"
                    else
                    echo "Not a valid input range, exiting the inventory"
                    fi
                ;;
                "d")
                    echo "What would you like to discard? [1-${#inventory[@]}]"
                    read -r input
                    if [ "$input" -ge 1 ] && [ "$input" -le "${#inventory[@]}" ]; then
                    input=$(( input - 1 ))
                    echo -e "${inventory[$input]} successfully discarded!"
                    unset 'inventory[input]'
                    unset 'cinventory[input]'
                    else
                    echo "Not a valid input range, exiting the inventory"
                    fi
                ;;

                "x")
                ;;

        esac
        ;;
        "s")
            echo "Choose in which file do you want to store your savefile"
            read -r cursf
            touch ".$cursf"
            if [ "$(head -n 1 ".$cursf")" = "BashRNGsavefile" ] && [ "$(tail -n 1 ".$cursf")" = "BashRNGsavefile" ] || [ ! -s ".$cursf" ]; then
                if [ ! -s ".$cursf" ]; then
                    echo "This will be a new file, create? (y/n)"
                else
                    echo "Existing file found, overwrite? (y/n)"
                fi
                read -r input
                    case "$input" in
                        "y")
                            echo -e "BashRNGsavefile\n$currrar\n$cc\n$rolls\n${inventory[*]}\n${cinventory[*]}\nBashRNGsavefile" > ".$cursf"
                            if [ ! -s ".$cursf" ]; then
                                echo "Save file created succesfully!"
                            else
                                echo "File  succesfully!"
                            fi

                            ;;
                        "n")
                            echo "Okay, halting the saving"
                            ;;
                        *)
                            echo "whar!?"
                            echo "Halting the saving"
                            ;;
                    esac
            #fi
            #echo -e "BashRNGsavefile\n$currrar\n$cc\n$rolls\nBashRNGsavefile" : this is write template ig
            else
                echo "Error creating/rewriting, are you sure this is a BashRNG savefile?"
            fi
        ;;
        "l")
            echo "Choose what file to load from"
            read -r cursf
            if [ "$(head -n 1 ".$cursf")" = "BashRNGsavefile" ] && [ "$(tail -n 1 ".$cursf")" = "BashRNGsavefile" ]; then
                echo -e "Savefile found with $(head -n 2 ".$cursf" | tail -n 1 ) current rarity and $(head -n 4 ".$cursf" | tail -n 1 ) rolls, load it?"
                read -r input
                case "$input" in
                    "y")
                        currrar=$(head -n 2 ".$cursf" | tail -n 1 )
                        cc=$(head -n 3 ".$cursf" | tail -n 1 )
                        rolls=$(head -n 4 ".$cursf" | tail -n 1 )
                        inventory=("$(head -n 5 ".$cursf" | tail -n 1 )")
                        cinventory=("$(head -n 6 ".$cursf" | tail -n 1 )")
                        echo
                        echo "Savefile loaded succesfully!"
                        ;;
                    "n")
                        echo "Save not loaded, cancelled"
                        ;;
                    *)
                        echo "whar!?"
                        echo "Save not loaded, input not clear"
                        ;;
                        esac
            fi
        ;;
        "x")
            echo
            echo
            echo "Thanks for playing, come back later! Or maybe not."
            exit 1
        ;;
        "rick")
            xdg-open "https://youtu.be/E9de-cmycx8"
        ;;
        *)
            echo "Not a valid option, at least right now, try another!"
        ;;
    esac
input="foobar"

done

exit 2
