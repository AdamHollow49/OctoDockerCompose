#!/bin/bash 

 cmd="up"
 octopus=0
 project_name="dockerProject"
 while getopts ":n:c:o" opt; do
  case $opt in
    o) octopus=1
    ;;
    n) project_name="$OPTARG"
    ;;
    c) cmd="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [[ $cmd = "up" ]]; then
    #docker-compose pushes non errors onto stderr. Redirect to stdout
    docker-compose --project-name $project_name --env-file octopus.env up -d 2>&1
else
    docker-compose --project-name $project_name --env-file octopus.env $cmd 2>&1
fi
