#!/bin/bash
while read -r skip_list
do
    if test "${skip_list}_ok_tests"; then rm "${skip_list}_ok_tests"; fi
    while read -r test
    do
        if [ -n "${test}" ] && [ "${test}" != "---" ] && [ "${test}" != "..." ]; then
            echo "Testing '${test}'..."
            csc_rally verify start --pattern "${test}" | grep 'Success: 1'
            return_code=$?
            echo "Result: ${return_code}"
            if [ $return_code == 0 ]; then
                echo "${test}" >> "${skip_list}_ok_tests"
            fi
        fi
    done <<< "$(sed 's/\[.*//' "${skip_list}"| sed 's/:.*$//')"
done <<< "$(find /home/rally/deployments -type f -name \*skip-list.yml)"
