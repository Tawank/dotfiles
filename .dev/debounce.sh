#! /usr/bin/env bash
set -Ceuo pipefail

readonly DEBOUNCE_PROGRAM="${1}"
readonly DEBOUNCE_INTERVAL_SECONDS="${2}"
readonly DEBOUNCE_ACTION="${*:3}"
debounce_action_pid=""

debounce_action() {
    # echo "Waiting debounce interval to perform debounce action: ${DEBOUNCE_ACTION}"
    sleep $((DEBOUNCE_INTERVAL_SECONDS))
    # echo "Running debounce action"
    bash -c "${DEBOUNCE_ACTION}"
}

debounce () {
    while
        "${DEBOUNCE_PROGRAM}"
    do
        # echo "DEBOUNCE PROGRAM RAN AT ${SECONDS} SECONDS"
        if test -n "${debounce_action_pid}" && ps -p "${debounce_action_pid}" > /dev/null; then
            # echo "Killing debounce_action with PID: ${debounce_action_pid}"
            kill "${debounce_action_pid}"
        fi
        debounce_action &
        debounce_action_pid="${!}"
    done
}

debounce
