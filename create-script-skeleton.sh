#!/bin/bash

cat << 'EOF'
#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Inspired by: http://robertmuth.blogspot.com/2012/08/better-bash-scripting-in-15-minutes.html

display_usage() {
    echo -e "This script does something."
    echo -e "\nUsage:"
    echo -e "\t`basename $0` </path/to/input/file> </path/to/output-dir> <batch-size>"
}

if [[ $1 == "--help" ]]
then
    display_usage
    exit 0
fi


set -o nounset
set -o errexit

# tput setaf uses these colors: https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
log_error() {
    tput setaf 1
    echo -e "$1"
    tput sgr0
}

if ! [[ $# -eq 1 ]]
then 
    log_error "This script requires only one argument\n"
    display_usage
    exit 1
fi

# Parsing --key=value arguments
ARGUMENT_A=""
FLAG="not_set"

for key in "$@"
do
	case $key in
        -a=*|--arg-a=*)
		ARGUMENT_A="${key#*=}"
		shift
		;;
		--a-flag|-af)
		FLAG="set"
		shift
        ;;
		*)
			# unknown option
		;;
	esac
done

echo "ARGUMENT_A=${ARGUMENT_A}"
echo "FLAG=${FLAG}"

EOF
