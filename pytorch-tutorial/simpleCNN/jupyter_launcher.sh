#!/bin/bash
# Parse options to the `jupyter` command
if [ "$#" -eq 0]
then
    /dors/meilerlab/apps/Linux2/x86_64/python/2.7.6/bin/jupyter notebook
    exit 0
fi

while getopts 'he:' opt; do
    case ${opt} in
	h)
	    echo "Usage:"
	    echo "    jupyter -h                  Display this help message."
	    echo "    jupyter -e <conda env>         open jupyter from certain conda env"
	    conda env list
	    exit 0
	    ;;
	e)
	    conda_env="$OPTARG"
	    /home/vuot2/anaconda2/envs/${conda_env}/bin/jupyter notebook
	    exit
	    ;;
	?)
	    echo "Invalid option: $OPTARG" 1>&2
	    exit 1
	    ;;
    esac
done
shift "$(($OPTIND -1))"
echo "Invalid option: $OPTARG" 1>&2
