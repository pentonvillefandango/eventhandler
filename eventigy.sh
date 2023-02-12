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
    exit 0
}

delete_days() {
echo "days"
}

delete_hours() {
echo "hours"

}

delete_minutes() {
echo "minutes"

}

delete_resolved() {
echo "resolved"

}

delete_text() {
echo "text"

}

unresolve() {
echo "unresolved"

}

help() {
echo "
This script assists in handling events.
Usage is as follows:

eventigy.sh -D          Delete ALL events
eventigy.sh -d value    Delete all events older than (value) days
eventigy.sh -h value    Delete all events older than (value) hours
eventigy.sh -m value    Delete all events older than (value) minutes  
eventigy.sh -c text     Delete all events containing (text)
eventigy.sh -r          Delete all events in 'Resolved' state
eventigy.sh -u          Change state of all events to 'Not Resolved'
eventigy.sh -e          Show this help
"
}

while getopts Dd:h:m:ruc:e SCRIPT_OPTIONS
do
    case $SCRIPT_OPTIONS in
        D)  
            delete_all
            exit 1
            ;;
        d)  
            DEL_DAYS=${OPTARGS}
            delete_days
            exit 1
            ;;
        h)  
           DEL_HOURS=${OPTARGS}
           delete_hours
           exit 1
           ;;
        m)  
           DEL_MINUTES=${OPTARGS}
           delete_minutes
           exit 1
           ;;
        r)  
           delete_resolved
           exit 1
           ;;
        u)  
           unresolve
           exit 1
           ;;
        c)  
           DEL_TEXT=${OPTARGS}
           delete_text
           exit 1
           ;;
        e)  
           help
           exit 1
           ;;
   esac
done



