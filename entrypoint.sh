#!/bin/sh

set -e

is_git_dir() {
	[ -d "$1" ] || return 1
	if [ -f "$1/config" ] && [ -f "$1/HEAD" ]; then
		return 0
	fi
	return 1
}

if is_git_dir . || is_git_dir .git; then
	echo "You cannot run this from inside the git directory."
	echo "Recommend you to run this from 1 directory higher than your repo"
	echo "Please reference the documentation: https://rtyley.github.io/bfg-repo-cleaner/"
	exit 1
fi

java -jar /app.jar $@
