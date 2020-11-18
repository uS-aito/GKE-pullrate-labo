#!/bin/bash

# for i in `seq 1 150`
# do
#     echo "$i th commit."
#     sed "s/NUMBER/$i/" main.sh.tmp > main.sh
#     git add .
#     git commit -m "$i th commit."
#     git push
# done

for i in `seq 1 150`
do
    echo "${i}th apply."
    kubectl apply -f pod.yaml
    sleep 3
    kubectl get pod | grep Running
    if [[ $? -ne 0 ]] ; then
        exit 1
    fi
    kubectl delete -f pod.yaml
done