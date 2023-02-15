#!/bin/bash
# Verson 0.1
#Script to manage events

# Create Functions

delete_all() {
    echo "You are about to delete ALL events"
    read -p "Are you sure you want to do this? enter Y to confirm: " DEL_CONFIRM
    if [[ $DEL_CONFIRM = 'Y' ]] 
    then
        echo "Deleting All events"
    else
        echo "Operation Cancelled"
    fi
}

delete_days() {
    echo "Deleting all Events that are older than  ${DEL_DAYS} days"

}

delete_hours() {
    echo "Deleting all Events that are older than  ${DEL_HOURS} days"

}

delete_minutes() {
    echo "Deleting all Events that are older than  ${DEL_MINUTES} days"

}

delete_resolved() {
    echo "Deleting all Resolved events"

}

delete_text() {
    echo "Deleting all Events that contain the following text in the comments: ${DEL_TEXT}"

}

unresolve() {
    echo "Changing status of all Resolved Events to Not Resolved"

}

help() {
echo "
This script assists in handling events.
Usage is as follows:

eventigy.sh -D          Delete ALL Events
eventigy.sh -d value    Delete all Events older than (value) days
eventigy.sh -h value    Delete all Events older than (value) hours
eventigy.sh -m value    Delete all Events older than (value) minutes  
eventigy.sh -c text     Delete all Events containing (text)
eventigy.sh -r          Delete all Events in 'Resolved' state
eventigy.sh -u          Change state of all Events to 'Not Resolved'
eventigy.sh -e          Show this help
"
}

while getopts Dd:h:m:ruc:e SCRIPT_OPTIONS
do
    case $SCRIPT_OPTIONS in
        D)  
            delete_all
            exit 0
            ;;
        d)  
            DEL_DAYS=${OPTARGS}
            delete_days
            exit 0
            ;;
        h)  
           DEL_HOURS=${OPTARGS}
           delete_hours
           exit 0
           ;;
        m)  
           DEL_MINUTES=${OPTARGS}
           delete_minutes
           exit 0
           ;;
        r)  
           delete_resolved
           exit 0
           ;;
        u)  
           unresolve
           exit 0
           ;;
        c)  
           DEL_TEXT=${OPTARGS}
           delete_text
           exit 0
           ;;
        e)  
           help
           exit 0
           ;;
   esac
done



