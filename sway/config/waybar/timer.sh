#!/bin/bash

### AUTHOR:         Johann Birnick (github: jbirnick)
### PROJECT REPO:   https://github.com/jbirnick/waytimer

## FUNCTIONS

now () { date --utc +%s; }

killTimer () { rm -rf /tmp/waytimer ; }
timerSet () { [ -e /tmp/waytimer/ ] ; }
timerPaused () { [ -f /tmp/waytimer/paused ] ; }

timerExpiry () { cat /tmp/waytimer/expiry ; }
timerLabelRunning () { cat /tmp/waytimer/label_running ; }
timerLabelPaused () { cat /tmp/waytimer/label_paused ; }
timerAction () { cat /tmp/waytimer/action ; }

secondsLeftWhenPaused () { cat /tmp/waytimer/paused ; }
minutesLeftWhenPaused () {  echo $(( ( $(secondsLeftWhenPaused)  + 59 ) / 60 )) ; }
secondsLeft () { echo $(( $(timerExpiry) - $(now) )) ; }
minutesLeft () { echo $(( ( $(secondsLeft)  + 59 ) / 60 )) ; }

printExpiryTime () { dunstify -u low -r -12345 "Timer expires at $( date -d "$(secondsLeft) sec" +%H:%M)" ;}
printPaused () { dunstify -u low -r -12345 "Timer paused" ; }
removePrinting () { dunstify -C -12345 ; }

updateTail () {
  # check whether timer is expired
  if timerSet
  then
    if { timerPaused && [ $(minutesLeftWhenPaused) -le 0 ] ; } || { ! timerPaused && [ $(minutesLeft) -le 0 ] ; }
    then
      eval $(timerAction)
      killTimer
      removePrinting
    fi
  fi

  # update output
  if timerSet
  then
    if timerPaused
    then
      echo "$(timerLabelPaused) $(minutesLeftWhenPaused)"
    else
      echo "$(timerLabelRunning) $(minutesLeft)"
    fi
  else
    echo "${STANDBY_LABEL}"
  fi
}

## MAIN CODE

case $1 in
  tail)
    STANDBY_LABEL=$2

    trap updateTail USR1

    while true
     do
     updateTail
     sleep ${3} &
     wait
    done
    ;;
  update)
    kill -USR1 $(pgrep --oldest --parent ${2})
    ;;
  new)
    killTimer
    mkdir /tmp/waytimer
    echo "$(( $(now) + 60*${2} ))" > /tmp/waytimer/expiry
    echo "${3}" > /tmp/waytimer/label_running
    echo "${4}" > /tmp/waytimer/label_paused
    echo "${5}" > /tmp/waytimer/action
    printExpiryTime
    ;;
  increase)
    if timerSet
    then
      if timerPaused
      then
        echo "$(( $(secondsLeftWhenPaused) + ${2} ))" > /tmp/waytimer/paused
      else
        echo "$(( $(timerExpiry) + ${2} ))" > /tmp/waytimer/expiry
        printExpiryTime
      fi
    else
      exit 1
    fi
    ;;
  cancel)
    killTimer
    removePrinting
    ;;
  togglepause)
    if timerSet
    then
      if timerPaused
      then
        echo "$(( $(now) + $(secondsLeftWhenPaused) ))" > /tmp/waytimer/expiry
        rm -f /tmp/waytimer/paused
        printExpiryTime
      else
        secondsLeft > /tmp/waytimer/paused
        rm -f /tmp/waytimer/expiry
        printPaused
      fi
    else
      exit 1
    fi
    ;;
  *)
    echo "Please read the manual at https://github.com/jbirnick/polybar-timer."
    ;;
esac
