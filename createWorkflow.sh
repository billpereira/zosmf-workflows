#Take the workflow name
echo "Uploading workflow $1 from directory $2"

#Upload to the lpar
set -x
zowe files ul ftu "$2/$1" "/u/A028356/stg-workflows/$1" --binary true  

#Delete previous workflow with same name
set +x
echo "Deleting workflow ${1%.xml}"
zowe wf del aw --workflow-name "${1%.xml}"

#create new workflow
set -x
zowe wf cre wfuf "${1%.xml}" --uss-file "/u/A028356/stg-workflows/$1" --system-name LBI9 --owner "A028356" --overwrite