#!/bin/bash
echo -e "Usage: ./update_git_remote_url.sh 5492438 glpat-MwgFxYid6xxxxxxx"
if [ -z $1 ]; then
	echo -e "[ERROR]첫번째 인자에 gitlab ID(사번)을 입력하세요"
	exit 1 
fi
if [ -z $2 ]; then
	echo -e "[ERROR]두번째 인자에 git token을 입력하세요"
	exit 1 
fi
BASE_DIR=$PWD
for file in `find . -name ".git"`
do
	cd $file
	URL_COUNT=`git remote -v | grep "10.150.17.37:4000/kb-fsw" | wc -l`
	if [ ${URL_COUNT} -ge 1 ]; then
		GIT_PROJECT=`git remote -v | head -1 | cut -f 2 | cut -d " " -f 1 | rev | cut -d "/" -f 1 | rev`
		NEW_URL=https://${1}:${2}@gitlab.kbpsandbox.com/kb-fsw/${GIT_PROJECT}
		git remote set-url origin ${NEW_URL}
		git push
		echo -e "########### ${NEW_URL} 설정완료"
	else 
		echo -e "########### ${file} 변경할 대상이 없습니다."	
	fi
	cd $BASE_DIR
done
