#!/bin/bash
BASE_DIR=$PWD
for file in `find . -name ".git"`
do
	cd $file
	git checkout main > /dev/null > 2&>1
	git checkout master > /dev/null > 2&>1
	
	ACRONYUM=`echo $file | rev | cut -d "/" -f 2 | rev`
	CURRENT_BRANCH=`git branch | grep "*" | cut -d "*" -f 2`	
	LAST_COMMIT_DATE=`git log -1 | grep "Date" | cut -d ":" -f 2-`
	#BRANCH_COUNT=`git branch | wc -l`
	
	echo -e "$ACRONYUM\t$CURRENT_BRANCH\t$LAST_COMMIT_DATE\t$file\t$BRANCH_COUNT"
	cd $BASE_DIR
done
